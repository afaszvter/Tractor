/*
 * File: ECU1119_18b_st_types.h
 *
 * Code generated for Simulink model 'ECU1119_18b_st'.
 *
 * Model version                   : 1.20
 * Simulink Coder version          : 9.0 (R2018b) 24-May-2018
 * MBDT for MPC57xx Series Version : 3.2.0 (R2016a-R2020a) 14-Apr-2020
 * C/C++ source code generated on  : Thu Nov 19 11:13:34 2026
 *
 * Target selection: mbd_mpc574x.tlc
 * Embedded hardware selection: Motorola PowerPC
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_ECU1119_18b_st_types_h_
#define RTW_HEADER_ECU1119_18b_st_types_h_
#include "rtwtypes.h"
#ifndef DEFINED_TYPEDEF_FOR_CAN_MESSAGE_BUS_
#define DEFINED_TYPEDEF_FOR_CAN_MESSAGE_BUS_

typedef struct {
  uint8_T Extended;
  uint8_T Length;
  uint8_T Remote;
  uint8_T Error;
  uint32_T ID;
  real_T Timestamp;
  uint8_T Data[8];
} CAN_MESSAGE_BUS;

#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM_ECU1119_18b_st_T RT_MODEL_ECU1119_18b_st_T;

#endif                                 /* RTW_HEADER_ECU1119_18b_st_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
