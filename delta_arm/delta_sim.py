# -*- coding: utf-8 -*-
"""
Created on Sun Nov 14 16:53:14 2021

@author: Matteo Trombini
"""

# Original code from
# http://forums.trossenrobotics.com/tutorials/introduction-129/delta-robot-kinematics-3276/
# License: MIT

import matplotlib.pyplot as plt
import math
import numpy as np
import os
from mpl_toolkits.mplot3d import Axes3D 

desktop = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop') 

# Specific geometry for delta arm:
f = 25.0  # servo base triangle
e = 7.0  # effector triangle
rf = 20.0  # upper rod length
re = 35.0  # lower rod length


# Forward kinematics: (theta1, theta2, theta3) -> (x0, y0, z0)
def forward(theta1, theta2, theta3):
    x0 = 0.0
    y0 = 0.0
    z0 = 0.0

    t = (f-e) * math.tan(math.radians(30)) / 2.0
    dtr = math.pi / 180.0

    theta1 *= dtr
    theta2 *= dtr
    theta3 *= dtr

    x1 = 0
    y1 = -(t + rf*math.cos(theta1))
    z1 = -rf * math.sin(theta1)

    y2 = (t + rf*math.cos(theta2)) * math.sin(math.radians(30))
    x2 = y2 * math.tan(math.radians(60))
    z2 = -rf * math.sin(theta2)

    y3 = (t + rf*math.cos(theta3)) * math.sin(math.radians(30))
    x3 = -y3 * math.tan(math.radians(60))
    z3 = -rf * math.sin(theta3)

    dnm = (y2-y1)*x3 - (y3-y1)*x2

    w1 = y1*y1 + z1*z1
    w2 = x2*x2 + y2*y2 + z2*z2
    w3 = x3*x3 + y3*y3 + z3*z3

    # x = (a1*z + b1)/dnm
    a1 = (z2-z1)*(y3-y1) - (z3-z1)*(y2-y1)
    b1 = -((w2-w1)*(y3-y1) - (w3-w1)*(y2-y1)) / 2.0

    # y = (a2*z + b2)/dnm
    a2 = -(z2-z1)*x3 + (z3-z1)*x2
    b2 = ((w2-w1)*x3 - (w3-w1)*x2) / 2.0

    # a*z^2 + b*z + c = 0
    a = a1*a1 + a2*a2 + dnm*dnm
    b = 2.0 * (a1*b1 + a2*(b2 - y1*dnm) - z1*dnm*dnm)
    c = (b2 - y1*dnm)*(b2 - y1*dnm) + b1*b1 + dnm*dnm*(z1*z1 - re*re)

    # discriminant
    d = b*b - 4.0*a*c
    if d < 0.0:
        return [1, 0, 0, 0]  # non-existing povar. return error,x,y,z

    z0 = -0.5*(b + math.sqrt(d)) / a
    x0 = (a1*z0 + b1) / dnm
    y0 = (a2*z0 + b2) / dnm

    return [[x1, y1, z1], [x2, y2, z2], [x3, y3, z3], [x0, y0, z0]]


# Inverse kinematics
# Helper functions, calculates angle theta1 (for YZ-pane)
def angle_yz(x0, y0, z0, theta=None):
    y1 = -0.5*0.57735*f  # f/2 * tg 30
    y0 -= 0.5*0.57735*e  # shift center to edge
    # z = a + b*y
    
    a = (x0*x0 + y0*y0 + z0*z0 + rf*rf - re*re - y1*y1) / (2.0*z0)
    b = (y1-y0) / z0
    
    # print(a)
    # print(b)
    # print("-----")
    # discriminant
    d = -(a + b*y1)*(a + b*y1) + rf*(b*b*rf + rf)
    if d < 0:
        return [1, 0]  # non-existing povar.  return error, theta

    yj = (y1 - a*b - math.sqrt(d)) / (b*b + 1)  # choosing outer povar
    zj = a + b*yj
    theta = math.atan(-zj / (y1-yj)) * 180.0 / math.pi + (180.0 if yj > y1 else 0.0)

    return [0, theta]  # return error, theta


def inverse(x0, y0, z0):
    theta1 = 0
    theta2 = 0
    theta3 = 0
    status = angle_yz(x0, y0, z0)

    if status[0] == 0:
        theta1 = status[1]
        status = angle_yz(x0*math.cos(math.radians(120)) + y0*math.sin(math.radians(120)),
                          y0*math.cos(math.radians(120))-x0*math.sin(math.radians(120)),
                          z0, theta2)
    if status[0] == 0:
        theta2 = status[1]
        status = angle_yz(x0*math.cos(math.radians(120)) - y0*math.sin(math.radians(120)),
                          y0*math.cos(math.radians(120)) + x0*math.sin(math.radians(120)),
                          z0, theta3)
    theta3 = status[1]

    return [status[0], theta1, theta2, theta3]


def image_forward(theta1=0, theta2=0, theta3=0, plot_num=None):
    forward_output = forward(theta1, theta2, theta3)
    plot_num = plot_num

    F_centre = [0, 0, 0]

    a = (f/2)*math.tan(math.radians(30))
    e2 = a*math.cos(math.radians(60))
    g = (f/2)*math.sin(math.radians(30))
    b = f/(2*math.cos(math.radians(30)))

    J1 = forward_output[0]
    J2 = forward_output[1]
    J3 = forward_output[2]

    E_centre = forward_output[3]

    # print(F_centre, J1, J2, J3, E_centre)
    ax = plt.axes(projection='3d')

    ax.set_xlabel('$X$')
    ax.set_ylabel('$Y$')
    ax.set_zlabel('$Z$')

    ax.set_xlim3d(-25, 25)
    ax.set_ylim3d(-25, 25)
    ax.set_zlim3d(-25, 25)

    # Plot F triangle
    T = [(f/2), -a, 0]
    U = [(-f/2), -a, 0]
    V = [0, b, 0]

    F_triangle = [[T[0], U[0], V[0], T[0]], [T[1], U[1], V[1], T[1]], [T[2], U[2], V[2], T[2]]]


    # Plot E triangle
    a_e = (e/2) * math.tan(math.radians(30))
    b_e = e/(2*math.cos(math.radians(30)))
    e_e = a_e * math.cos(math.radians(60))
    g_e = (e/2) * math.sin(math.radians(30))

    L = [E_centre[0]-(e/2), E_centre[1]-a_e, E_centre[2]]
    M = [E_centre[0]+(e/2), E_centre[1]-a_e, E_centre[2]]
    N = [E_centre[0], E_centre[1]+b_e, E_centre[2]]

    E_triangle = [[L[0], M[0], N[0], L[0]], [L[1], M[1], N[1], L[1]], [L[2], M[2], N[2], L[2]]]
    plt.plot(E_triangle[0], E_triangle[1], E_triangle[2], 'c-')  # E triangle plot

    # Calculate rod start and end point coordinates
    RodFJ1 = [[F_centre[0], J1[0]], [-a, J1[1]], [F_centre[2], J1[2]]]
    RodJ1E = [[J1[0], E_centre[0]], [J1[1], E_centre[1]-a_e], [J1[2], E_centre[2]]]

    RodFJ2 = [[g, J2[0]], [e2, J2[1]], [F_centre[2], J2[2]]]
    RodJ2E = [[J2[0], E_centre[0]+g_e], [J2[1], E_centre[1]+e_e], [J2[2], E_centre[2]]]

    RodFJ3 = [[-g, J3[0]], [e2, J3[1]], [F_centre[2], J3[2]]]
    RodJ3E = [[J3[0], E_centre[0]-g_e], [J3[1], E_centre[1]+e_e], [J3[2], E_centre[2]]]

    # Plot rods
    plt.plot(RodJ1E[0], RodJ1E[1], RodJ1E[2], 'r-', linewidth=2.0)
    plt.plot(RodJ2E[0], RodJ2E[1], RodJ2E[2], 'g-', linewidth=2.0)
    plt.plot(RodJ3E[0], RodJ3E[1], RodJ3E[2], 'b-', linewidth=2.0)
    
    plt.plot(RodFJ1[0], RodFJ1[1], RodFJ1[2], 'r-', linewidth=4.0)
    plt.plot(RodFJ2[0], RodFJ2[1], RodFJ2[2], 'g-', linewidth=4.0)
    plt.plot(RodFJ3[0], RodFJ3[1], RodFJ3[2], 'b-', linewidth=4.0)

    plt.plot(F_triangle[0], F_triangle[1], F_triangle[2], 'c-')  # F triangle plot

    
    if plot_num != None:
        plt.ioff()
        path = desktop + '\\GIF\\{}.png'.format(plot_num)
        plt.savefig(path)
        
    else:
        plt.ion()
        plt.show()

def image_inverse(x=0, y=0, z=-20):
    error, t1, t2, t3 = inverse(x, y, z)
    if error == 1:
        return "out of bounds"
        
    else:
        print(t1, t2, t3)
        image_forward(t1, t2, t3)

def delta_arm_params(min_theta=-45, max_theta=50):
    upper_h = forward(min_theta, min_theta, min_theta)[3][2]
    lower_h = forward(max_theta, max_theta, max_theta)[3][2]

    a = (f/2)*math.tan(math.radians(30))
    b_c = (a+rf)*math.cos(math.radians(60))
    d = (a+rf)*math.sin(math.radians(60))

    min_width = rf + a + b_c
    max_width = 2*d

    stowed_f_e_height = -upper_h
    stowed_total_height = forward(min_theta, min_theta, min_theta)[0][2] + stowed_f_e_height

    print("actuator rod length: {} cm".format(rf))
    print("bottom/effector rod length: {} cm".format(re))
    print("top platform triangle leg length: {} cm".format(f))
    print("effector platform triangle leg length: {} cm \n".format(e))
    
    print("maximum width when asymmetrically placed: {:.2f} cm".format(min_width))
    print("maximum width when arms alligned with CoG: {:.2f} cm \n".format(max_width))
    
    print("end effector vertical range of motion: {:.2f} cm".format(upper_h-lower_h))
    print("height from base to effector in stowed config: {:.2f} cm".format(stowed_f_e_height))
    print("total stowed height: {:.2f} cm".format(stowed_total_height))

def circle(y, radius):
    r = radius
    x = math.sqrt(r**2 - y**2)
    return x


def path(radius):
    r = radius
    
    c1 = []
    for y in np.arange(0, r, 0.1):
        c1.append([circle(y, r), y])
    
    c = np.asarray(c1)
    c9 = np.asarray(c1)
    c10 = np.asarray(c1) 
    c1 = np.asarray(c1)
    c2 = np.asarray(c)
    c2[:,0] *= -1
    c2 = c2[::-1]
    c3 = np.asarray(c9)
    c3[:,0] *= -1
    c3[:,1] *= -1
    c4 = np.asarray(c10)
    c4 = c4[::-1]
    c4[:,1] *= -1
    
    
    output = np.concatenate((c1, c2, c3, c4), axis=0)
    output = output.tolist()
    
    for o in output:
        o.append(-35)
    
    
    theta_values = []
    
    for w in output:
        give = []
        a = inverse(w[0], w[1], w[2])
        # print(a)
        give.extend([a[1], a[2], a[3]])
        theta_values.append(give)
                
    return theta_values

def fancy_GIF(radius):
    radius = radius
    p = path(radius)
    
    count = 1
    
    for a in p:
        image_forward(a[0], a[1], a[2], count)
        count += 1
        
def workspace(min_theta=-50, max_theta=50, points=1000, GIF=False):
    GIF = GIF
    step = (max_theta-min_theta)/((points)**(1./3))
    
    # Creating figure
    ax = plt.axes(projection="3d")

    x = []
    y = []
    z = []
    
    count = 1
    
    if GIF != False:
        try:
            os.makedirs(desktop + '\\GIF')
        except:
            pass
    
    for theta_a in np.arange(min_theta, max_theta, step):
        for theta_b in np.arange(min_theta, max_theta, step):
            for theta_c in np.arange(min_theta, max_theta, step):
                point = forward(theta_a, theta_b, theta_c)[3]
                if GIF != False:
                    image_forward(theta_a, theta_b, theta_c, count)
                x.append(point[0])
                y.append(point[1])
                z.append(point[2])
                count += 1

    ax.scatter3D(x, y, z, color="blue")
    plt.title("Delta arm 3D workspace")

    # show plot
    plt.show()
