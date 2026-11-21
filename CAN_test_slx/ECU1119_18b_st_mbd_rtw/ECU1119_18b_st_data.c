/*
 * File: ECU1119_18b_st_data.c
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

#include "ECU1119_18b_st.h"
#include "ECU1119_18b_st_private.h"

/* Invariant block signals (default storage) */
const ConstB_ECU1119_18b_st_T ECU1119_18b_st_ConstB = {
  1.7999999999999998,                  /* '<S12>/Gain2' */
  0.89999999999999991,                 /* '<S12>/Gain1' */
  0.0,                                 /* '<S301>/Data Type Conversion1' */
  0.0,                                 /* '<S232>/Gain5' */
  0.0,                                 /* '<S232>/Gain4' */
  0.0,                                 /* '<S232>/Gain1' */
  0U,                                  /* '<S217>/Data Type Conversion' */
  0U,                                  /* '<S216>/Data Type Conversion' */
  0U,                                  /* '<S215>/Data Type Conversion' */
  2U,                                  /* '<S237>/Data Type Conversion3' */
  7U,                                  /* '<S237>/Data Type Conversion2' */

  { 2U, 7U },                          /* '<S237>/Vector Concatenate2' */
  1U,                                  /* '<S234>/Data Type Conversion' */
  128U,                                /* '<S229>/Data Type Conversion' */
  128U,                                /* '<S228>/Data Type Conversion' */
  1,                                   /* '<S5>/Data Type Conversion' */
  1                                    /* '<S4>/Data Type Conversion1' */
};

/* Constant parameters (default storage) */
const ConstP_ECU1119_18b_st_T ECU1119_18b_st_ConstP = {
  /* Expression: EngineSpdTgt
   * Referenced by: '<S13>/EngineSpdTgt'
   */
  { 700.0, 850.0, 1000.0, 1150.0, 1300.0, 1450.0, 1600.0, 1750.0, 1900.0, 2050.0,
    2200.0 },

  /* Expression: EngineSpdTgt_x
   * Referenced by: '<S13>/EngineSpdTgt'
   */
  { 0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0 },

  /* Expression: EGRTgt
   * Referenced by: '<S12>/EGRTgt'
   */
  { 0.25, 0.22, 0.2, 0.18, 0.16, 0.12, 0.1, 0.2, 0.18, 0.15, 0.14, 0.12, 0.1,
    0.08, 0.12, 0.13, 0.1, 0.09, 0.08, 0.06, 0.04, 0.08, 0.09, 0.07, 0.06, 0.05,
    0.03, 0.02, 0.05, 0.06, 0.04, 0.03, 0.02, 0.01, 0.0 },

  /* Expression: EGRTgt_x
   * Referenced by: '<S12>/EGRTgt'
   */
  { 700.0, 1200.0, 1400.0, 1600.0, 1800.0, 2000.0, 2200.0 },

  /* Expression: EGRTgt_y
   * Referenced by: '<S12>/EGRTgt'
   */
  { 20.0, 60.0, 100.0, 140.0, 160.0 },

  /* Computed Parameter: EGRTgt_maxIndex
   * Referenced by: '<S12>/EGRTgt'
   */
  { 6U, 4U }
};

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
