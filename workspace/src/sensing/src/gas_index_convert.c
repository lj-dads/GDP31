#include "sensirion_gas_index_algorithm.h"
#include <stdio.h>  // printf

int gas_index(int sraw_voc){
    int voc_index_value = 0;
    // initialize gas index parameters
    GasIndexAlgorithmParams voc_params;
    GasIndexAlgorithm_init(&voc_params, GasIndexAlgorithm_ALGORITHM_TYPE_VOC);
	//Process raw signals by Gas Index Algorithm to get the VOC and NOx
        // index values

            GasIndexAlgorithm_process(&voc_params, sraw_voc, &voc_index_value);
            printf("VOC Raw: %i\tVOC Index: %i\n", sraw_voc, voc_index_value);
	return voc_index_value;
}

