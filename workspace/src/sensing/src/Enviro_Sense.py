#!/usr/bin/python
# -*- coding:utf-8 -*-
import time
import SH1106 #OLED
import ICM20948 #Gyroscope/Acceleration/Magnetometer
import BME280   #Atmospheric Pressure/Temperature and humidity
import SI1145   #UV
import TSL2591  #LIGHT
import ADS1015  #ad
import SGP40 #VOC
import rospy
from PIL import Image,ImageDraw,ImageFont
import math
import csv
f = open("envi_data.csv","w", newline="") #csv file
wc = csv.writer(f) #csv function


bme280 = BME280.BME280()
bme280.get_calib_param()
light = TSL2591.TSL2591()
si1145 = SI1145.SI1145()
ad = ADS1015.ADS1015()
sgp40 = SGP40.SGP40()
oled = SH1106.SH1106()
icm20948 = ICM20948.ICM20948()

class Environment:
	image = Image.new('1', (oled.width, oled.height), "BLACK")
	draw = ImageDraw.Draw(image)
	x = 0
	font = ImageFont.truetype('Font.ttc', 10)

	def timer_callback(self, boo):
		bme = []
		bme = bme280.readData()
		pressure = round(bme[0], 2) 
		temp = round(bme[1], 2) 
		hum = round(bme[2], 2)
		lux = round(light.Lux(), 2)
		uv = round(si1145.readdata()[0], 2) 
		ir = round(si1145.readdata()[1], 2)
		voc = round(sgp40.readata(), 2)
		wc.writerow(pressure,temp,hum, lux, uv, ir, voc) #write data into csv

	def screen(self):
		icm = []
		icm = icm20948.getdata()
		roll = round(icm[0], 2)
		pitch = round(icm[1], 2)
		yaw = round(icm[2], 2)
		f.close()
		x += 1
		if(x < 20):
			SoundAD = []
			Sound_normal = 3300 / 2 #1.65v
			for i in range(10):
				SoundAD.append(abs(ad.ADS1015_SINGLE_READ(3) * 2 - Sound_normal))
				time.sleep(0.02)
			SoundAD.sort()
			SoundAD = SoundAD[1:-1]
			Sound_ave = sum(SoundAD)/len(SoundAD)
			Sound = Sound_ave / 50
			
			self.draw.rectangle((0, 0, 128, 64), fill = 0)
			
			self.draw.text((0, 0), str(self.pressure), font = self.font, fill = 1)
			self.draw.text((40, 0), 'hPa', font = self.font, fill = 1)
			self.draw.text((0, 15), str(self.temp), font = self.font, fill = 1)
			self.draw.text((40, 15), 'C', font = self.font, fill = 1)
			self.draw.text((0, 30), str(self.hum), font = self.font, fill = 1)
			self.draw.text((40, 30), '%RH', font = self.font, fill = 1)
			
			self.draw.text((0, 45), str(self.lux), font = self.font, fill = 1)
			self.draw.text((40, 45), 'Lux', font = self.font, fill = 1)
			
			self.draw.text((65, 0), str(self.uv), font = self.font, fill = 1)
			self.draw.text((105, 0), 'UV', font = self.font, fill = 1)
			self.draw.text((65, 15), str(self.ir), font = self.font, fill = 1)
			self.draw.text((105, 15), 'IR', font = self.font, fill = 1)
			
			self.draw.text((85, 45), str(Sound), font = self.font, fill = 1)
			self.draw.text((70, 30), 'Sound', font = self.font, fill = 1)

			oled.display(self.image)
		elif(x>20 & x<40):
			
			
			self.draw.rectangle((0, 0, 128, 64), fill = 0)
			font8 = ImageFont.truetype('Font.ttc', 9)
			
			self.draw.text((0, 0), 'RPY', font = font8, fill = 1)
			self.draw.text((20, 0), str(roll), font = font8, fill = 1)
			self.draw.text((50, 0), str(pitch), font = font8, fill = 1)
			self.draw.text((90, 0), str(yaw), font = font8, fill = 1)
			
			self.draw.text((0, 15), 'Acc', font = font8, fill = 1)
			self.draw.text((20, 15), str(icm[3]), font = font8, fill = 1)
			self.draw.text((50, 15), str(icm[4]), font = font8, fill = 1)
			self.draw.text((90, 15), str(icm[5]), font = font8, fill = 1)

			self.draw.text((0, 30), 'Gyr', font = font8, fill = 1)
			self.draw.text((20, 30), str(icm[6]), font = font8, fill = 1)
			self.draw.text((50, 30), str(icm[7]), font = font8, fill = 1)
			self.draw.text((90, 30), str(icm[8]), font = font8, fill = 1)

			self.draw.text((0, 45), 'Mag', font = font8, fill = 1)
			self.draw.text((20, 45), str(icm[9]), font = font8, fill = 1)
			self.draw.text((50, 45), str(icm[10]), font = font8, fill = 1)
			self.draw.text((90, 45), str(icm[11]), font = font8, fill = 1)
			
			oled.display(self.image)

		elif(x == 40):
			x = 0

		rospy.spin()
			

		

if __name__ == '__main__':
       
    try:
        Environment.timer = rospy.Timer(rospy.Duration(1), Environment.timer_callback)
        Environment.screen()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass