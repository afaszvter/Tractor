/*
 * File: ECU1119_18b_st.c
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

/* Named constants for Chart: '<S11>/Chart' */
#define ECU1119_18b__IN_NO_ACTIVE_CHILD ((uint8_T)0U)
#define ECU1119_18b_st_IN_Idle         ((uint8_T)1U)
#define ECU1119_18b_st_IN_Regen        ((uint8_T)2U)
#define ECU1119_18b_st_IN_Wait         ((uint8_T)3U)

/* Named constants for Chart: '<S234>/Chart' */
#define ECU1119_18b_st_IN_POWER_HOLD   ((uint8_T)1U)
#define ECU1119_18b_st_IN_POWER_OFF    ((uint8_T)2U)
#define ECU1119_18b_st_IN_POWER_ON     ((uint8_T)3U)

/* Named constants for Chart: '<S4>/Chart' */
#define ECU1119_18b_st_IN_Initialize   ((uint8_T)2U)
#define ECU1119_18b_st_IN_Normal       ((uint8_T)3U)

/* Named constants for Chart: '<S4>/Chart1' */
#define ECU1119_18b_st_IN_CS1          ((uint8_T)1U)
#define ECU1119_18b_st_IN_CS5          ((uint8_T)2U)
#define ECU1119_18b_st_IN_Done         ((uint8_T)3U)
#define ECU1119_18b_st_IN_IDLE         ((uint8_T)4U)

/* Named constants for Chart: '<S4>/Chart2' */
#define ECU1119_18b_st_IN_CS2          ((uint8_T)1U)
#define ECU1119_18b_st_IN_CS3          ((uint8_T)2U)

/* Named constants for Chart: '<S236>/Chart' */
#define ECU1119_18b_st_IN_clear        ((uint8_T)1U)
#define ECU1119_18b_st_IN_config       ((uint8_T)2U)
#define ECU1119_18b_st_IN_en           ((uint8_T)3U)

/* Named constants for Chart: '<S238>/Chart' */
#define ECU1119_18b_st_IN_ConfigA      ((uint8_T)1U)
#define ECU1119_18b_st_IN_en_i         ((uint8_T)2U)

dspi_state_t spiMasterState3;
void spi_master_transfer_callback3(void *driverState, spi_event_t event, void
  *userData) __attribute__((weak));
dspi_state_t spiMasterState0;
void spi_master_transfer_callback0(void *driverState, spi_event_t event, void
  *userData) __attribute__((weak));

/* Exported block signals */
real_T ThrottleCmd_pct;                /* '<S273>/Data Type Conversion4' */

/* Exported block states */
uint8_T Cnt_SLOW2;                     /* '<Root>/Data Store Memory1' */
uint8_T Cnt_TEMP1;                     /* '<Root>/Data Store Memory12' */
uint8_T VCU_Mode;                      /* '<Root>/Data Store Memory125' */
uint8_T Cnt_TEMP2;                     /* '<Root>/Data Store Memory13' */
uint8_T Cnt_SLOW1;                     /* '<Root>/Data Store Memory14' */
uint8_T Cnt_FAST_OUT;                  /* '<Root>/Data Store Memory62' */
uint8_T Cnt_SLOW_OUT;                  /* '<Root>/Data Store Memory63' */
uint8_T ResetFlg;                      /* '<Root>/Data Store Memory72' */
uint8_T Cnt_FAST1;                     /* '<Root>/Data Store Memory8' */
uint8_T Cnt_FAST2;                     /* '<Root>/Data Store Memory9' */
uint8_T Init_flg_SPI;                  /* '<Root>/Data Store Memory98' */
boolean_T KeyOn;                       /* '<Root>/Data Store Memory' */
boolean_T LS007;                       /* '<Root>/Data Store Memory100' */
boolean_T LS012;                       /* '<Root>/Data Store Memory101' */
boolean_T LS013;                       /* '<Root>/Data Store Memory103' */
boolean_T LS018;                       /* '<Root>/Data Store Memory11' */
boolean_T LS019;                       /* '<Root>/Data Store Memory116' */
boolean_T LS003;                       /* '<Root>/Data Store Memory34' */
boolean_T LS017;                       /* '<Root>/Data Store Memory45' */
boolean_T LS014;                       /* '<Root>/Data Store Memory86' */
boolean_T LS015;                       /* '<Root>/Data Store Memory87' */
boolean_T LS009;                       /* '<Root>/Data Store Memory88' */
boolean_T LS016;                       /* '<Root>/Data Store Memory89' */
boolean_T LS004;                       /* '<Root>/Data Store Memory91' */
boolean_T LS011;                       /* '<Root>/Data Store Memory92' */
boolean_T LS001;                       /* '<Root>/Data Store Memory93' */
boolean_T LS002;                       /* '<Root>/Data Store Memory95' */
boolean_T LS010;                       /* '<Root>/Data Store Memory96' */
boolean_T LS008;                       /* '<Root>/Data Store Memory97' */
boolean_T LS006;                       /* '<Root>/Data Store Memory99' */

/* Exported data definition */

/* Volatile memory section */
/* Definition for custom storage class: Volatile */
volatile real32_T AI03;
volatile real32_T AI04;
volatile real32_T AI05;
volatile real32_T AI06;
volatile real32_T AI07;
volatile real32_T AI08;
volatile real32_T AI09;
volatile real32_T AI11;
volatile real32_T AI12;
volatile real32_T AI15;
volatile real32_T AI16;
volatile real32_T AI17;
volatile real32_T AI18;
volatile real32_T AI19;
volatile real32_T AI20;
volatile boolean_T DI01;
volatile boolean_T DI02;
volatile boolean_T DI03;
volatile boolean_T DI04;
volatile boolean_T DI07;
volatile boolean_T DI08;
volatile boolean_T DI09;
volatile boolean_T DI10;
volatile boolean_T DI12;
volatile boolean_T DI13;
volatile boolean_T DI15;
volatile boolean_T DI16;
volatile boolean_T DI17;
volatile boolean_T DI18;
volatile boolean_T DI31;
volatile real32_T DI31_PWM_DC;
volatile real32_T DI31_PWM_FRQ;
volatile boolean_T DI32;
volatile real32_T DI32_PWM_DC;
volatile real32_T DI32_PWM_FRQ;
volatile boolean_T DI33;
volatile real32_T DI33_PWM_DC;
volatile real32_T DI33_PWM_FRQ;
volatile boolean_T DI34;
volatile real32_T DI34_PWM_DC;
volatile real32_T DI34_PWM_FRQ;
volatile boolean_T HS001;
volatile boolean_T HS002;
volatile boolean_T HS003;
volatile boolean_T HS004;
volatile boolean_T HS005;
volatile boolean_T HS006;
volatile boolean_T HS007;
volatile boolean_T HS008;
volatile real32_T HS008_ETC_DC;
volatile real32_T HS008_ETC_FRQ;
volatile boolean_T HS010;
volatile boolean_T HS014;
volatile real32_T HS014_ETC_DC;
volatile real32_T HSO08_PWM_DC;
volatile real32_T HSO08_PWM_FRQ;
volatile real32_T HSO14_ETC_FRQ;
volatile real32_T HSO14_PWM_DC;
volatile real32_T HSO14_PWM_FRQ;
volatile real32_T LSO17_ETC_DC;
volatile real32_T LSO17_ETC_FRQ;
volatile real32_T LSO18_ETC_DC;
volatile real32_T LSO18_ETC_FRQ;
volatile real32_T LSO19_ETC_DC;
volatile real32_T LSO19_ETC_FRQ;
volatile real32_T LSO19_PWM_DC;
volatile real32_T LSO19_PWM_FRQ;
volatile real32_T LSO3_ETC_DC;
volatile real32_T LSO3_ETC_FRQ;

/* Block signals (default storage) */
B_ECU1119_18b_st_T ECU1119_18b_st_B;

/* Block states (default storage) */
DW_ECU1119_18b_st_T ECU1119_18b_st_DW;

/* Previous zero-crossings (trigger) states */
PrevZCX_ECU1119_18b_st_T ECU1119_18b_st_PrevZCX;

/* Real-time model */
RT_MODEL_ECU1119_18b_st_T ECU1119_18b_st_M_;
RT_MODEL_ECU1119_18b_st_T *const ECU1119_18b_st_M = &ECU1119_18b_st_M_;
flexcan_state_t canCom1_State;
flexcan_state_t canCom2_State;
flexcan_msgbuff_t canCom2_recvBuff0;
flexcan_msgbuff_t canCom2_recvBuff1;
flexcan_msgbuff_t canCom2_recvBuff4;
flexcan_msgbuff_t canCom2_recvBuff5;
flexcan_msgbuff_t canCom2_recvBuff2;
flexcan_msgbuff_t canCom2_recvBuff3;
real_T look1_binlcpw(real_T u0, const real_T bp0[], const real_T table[],
                     uint32_T maxIndex)
{
  real_T frac;
  uint32_T iRght;
  uint32_T iLeft;
  uint32_T bpIdx;

  /* Column-major Lookup 1-D
     Search method: 'binary'
     Use previous index: 'off'
     Interpolation method: 'Linear point-slope'
     Extrapolation method: 'Clip'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  /* Prelookup - Index and Fraction
     Index Search method: 'binary'
     Extrapolation method: 'Clip'
     Use previous index: 'off'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  if (u0 <= bp0[0U]) {
    iLeft = 0U;
    frac = 0.0;
  } else if (u0 < bp0[maxIndex]) {
    /* Binary Search */
    bpIdx = maxIndex >> 1U;
    iLeft = 0U;
    iRght = maxIndex;
    while (iRght - iLeft > 1U) {
      if (u0 < bp0[bpIdx]) {
        iRght = bpIdx;
      } else {
        iLeft = bpIdx;
      }

      bpIdx = (iRght + iLeft) >> 1U;
    }

    frac = (u0 - bp0[iLeft]) / (bp0[iLeft + 1U] - bp0[iLeft]);
  } else {
    iLeft = maxIndex - 1U;
    frac = 1.0;
  }

  /* Column-major Interpolation 1-D
     Interpolation method: 'Linear point-slope'
     Use last breakpoint for index at or above upper limit: 'off'
     Overflow mode: 'portable wrapping'
   */
  return (table[iLeft + 1U] - table[iLeft]) * frac + table[iLeft];
}

real_T look2_binlcpw(real_T u0, real_T u1, const real_T bp0[], const real_T bp1[],
                     const real_T table[], const uint32_T maxIndex[], uint32_T
                     stride)
{
  real_T frac;
  uint32_T bpIndices[2];
  real_T fractions[2];
  real_T yL_1d;
  uint32_T iRght;
  uint32_T bpIdx;
  uint32_T iLeft;

  /* Column-major Lookup 2-D
     Search method: 'binary'
     Use previous index: 'off'
     Interpolation method: 'Linear point-slope'
     Extrapolation method: 'Clip'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  /* Prelookup - Index and Fraction
     Index Search method: 'binary'
     Extrapolation method: 'Clip'
     Use previous index: 'off'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  if (u0 <= bp0[0U]) {
    iLeft = 0U;
    frac = 0.0;
  } else if (u0 < bp0[maxIndex[0U]]) {
    /* Binary Search */
    bpIdx = maxIndex[0U] >> 1U;
    iLeft = 0U;
    iRght = maxIndex[0U];
    while (iRght - iLeft > 1U) {
      if (u0 < bp0[bpIdx]) {
        iRght = bpIdx;
      } else {
        iLeft = bpIdx;
      }

      bpIdx = (iRght + iLeft) >> 1U;
    }

    frac = (u0 - bp0[iLeft]) / (bp0[iLeft + 1U] - bp0[iLeft]);
  } else {
    iLeft = maxIndex[0U] - 1U;
    frac = 1.0;
  }

  fractions[0U] = frac;
  bpIndices[0U] = iLeft;

  /* Prelookup - Index and Fraction
     Index Search method: 'binary'
     Extrapolation method: 'Clip'
     Use previous index: 'off'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  if (u1 <= bp1[0U]) {
    iLeft = 0U;
    frac = 0.0;
  } else if (u1 < bp1[maxIndex[1U]]) {
    /* Binary Search */
    bpIdx = maxIndex[1U] >> 1U;
    iLeft = 0U;
    iRght = maxIndex[1U];
    while (iRght - iLeft > 1U) {
      if (u1 < bp1[bpIdx]) {
        iRght = bpIdx;
      } else {
        iLeft = bpIdx;
      }

      bpIdx = (iRght + iLeft) >> 1U;
    }

    frac = (u1 - bp1[iLeft]) / (bp1[iLeft + 1U] - bp1[iLeft]);
  } else {
    iLeft = maxIndex[1U] - 1U;
    frac = 1.0;
  }

  /* Column-major Interpolation 2-D
     Interpolation method: 'Linear point-slope'
     Use last breakpoint for index at or above upper limit: 'off'
     Overflow mode: 'portable wrapping'
   */
  bpIdx = iLeft * stride + bpIndices[0U];
  yL_1d = (table[bpIdx + 1U] - table[bpIdx]) * fractions[0U] + table[bpIdx];
  bpIdx += stride;
  return (((table[bpIdx + 1U] - table[bpIdx]) * fractions[0U] + table[bpIdx]) -
          yL_1d) * frac + yL_1d;
}

/* Start for function-call system: '<S7>/CAN2' */
void ECU1119_18b_st_CAN2_Start(void)
{
  /* Start for IfAction SubSystem: '<S267>/UNPACK' */

  /* Start for S-Function (scanunpack): '<S273>/CAN Unpack6' */

  /*-----------S-Function Block: <S273>/CAN Unpack6 -----------------*/

  /* End of Start for SubSystem: '<S267>/UNPACK' */

  /* Start for IfAction SubSystem: '<S269>/UNPACK' */

  /* Start for S-Function (scanunpack): '<S275>/CAN Unpack6' */

  /*-----------S-Function Block: <S275>/CAN Unpack6 -----------------*/

  /* End of Start for SubSystem: '<S269>/UNPACK' */

  /* Start for IfAction SubSystem: '<S271>/UNPACK' */

  /* Start for S-Function (scanunpack): '<S277>/CAN Unpack6' */

  /*-----------S-Function Block: <S277>/CAN Unpack6 -----------------*/

  /* End of Start for SubSystem: '<S271>/UNPACK' */
}

/* Output and update for function-call system: '<S7>/CAN2' */
void ECU1119_18b_st_CAN2(void)
{
  int32_T i;

  /* SwitchCase: '<S267>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 257) {
    /* Outputs for IfAction SubSystem: '<S267>/UNPACK' incorporates:
     *  ActionPort: '<S273>/Action Port'
     */
    /* DataStoreWrite: '<S273>/Data Store Write' incorporates:
     *  Constant: '<S273>/Constant'
     *  DataStoreRead: '<S273>/Data Store Read'
     *  Sum: '<S273>/Add'
     */
    Cnt_FAST1++;

    /* BusCreator: '<S273>/Bus Creator' incorporates:
     *  Constant: '<S273>/Constant1'
     *  Constant: '<S273>/Constant4'
     *  Constant: '<S273>/Constant5'
     *  DataTypeConversion: '<S273>/Data Type Conversion19'
     */
    ECU1119_18b_st_B.CAN_Msg_In_h.Extended = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_h.Length = ECU1119_18b_st_B.CAN0_Rx_500_o5;
    ECU1119_18b_st_B.CAN_Msg_In_h.Remote = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_h.Error = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_h.ID = ECU1119_18b_st_B.CAN0_Rx_500_o3;
    ECU1119_18b_st_B.CAN_Msg_In_h.Timestamp = ECU1119_18b_st_B.CAN0_Rx_500_o6;
    for (i = 0; i < 8; i++) {
      ECU1119_18b_st_B.CAN_Msg_In_h.Data[i] = ECU1119_18b_st_B.CAN0_Rx_500_o4[i];
    }

    /* End of BusCreator: '<S273>/Bus Creator' */

    /* S-Function (scanunpack): '<S273>/CAN Unpack6' */
    {
      /* S-Function (scanunpack): '<S273>/CAN Unpack6' */
      if ((8 == ECU1119_18b_st_B.CAN_Msg_In_h.Length) &&
          (ECU1119_18b_st_B.CAN_Msg_In_h.ID != INVALID_CAN_ID) ) {
        if ((257 == ECU1119_18b_st_B.CAN_Msg_In_h.ID) && (0U ==
             ECU1119_18b_st_B.CAN_Msg_In_h.Extended) ) {
          {
            /* --------------- START Unpacking signal 0 ------------------
             *  startBit                = 32
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.001
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[4]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[5]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.001;
                ECU1119_18b_st_B.CANUnpack6_o1_p = result;
              }
            }

            /* --------------- START Unpacking signal 1 ------------------
             *  startBit                = 0
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[0]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[1]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o2_f = result;
              }
            }

            /* --------------- START Unpacking signal 2 ------------------
             *  startBit                = 16
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.005
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[2]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[3]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.005;
                ECU1119_18b_st_B.CANUnpack6_o3_l = result;
              }
            }

            /* --------------- START Unpacking signal 3 ------------------
             *  startBit                = 48
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.01
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[6]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_h.Data[7]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.01;
                ECU1119_18b_st_B.CANUnpack6_o4_n = result;
              }
            }
          }
        }
      }
    }

    /* DataTypeConversion: '<S273>/Data Type Conversion1' */
    ECU1119_18b_st_B.EGR_Ratio_Act = ECU1119_18b_st_B.CANUnpack6_o1_p;

    /* DataTypeConversion: '<S273>/Data Type Conversion2' */
    ECU1119_18b_st_B.EngSpeed_rpm = ECU1119_18b_st_B.CANUnpack6_o2_f;

    /* DataTypeConversion: '<S273>/Data Type Conversion3' */
    ECU1119_18b_st_B.FuelCycle_Act_mg = ECU1119_18b_st_B.CANUnpack6_o3_l;

    /* DataTypeConversion: '<S273>/Data Type Conversion4' */
    ThrottleCmd_pct = ECU1119_18b_st_B.CANUnpack6_o4_n;

    /* End of Outputs for SubSystem: '<S267>/UNPACK' */
  }

  /* End of SwitchCase: '<S267>/Switch Case' */

  /* SwitchCase: '<S268>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 258) {
    /* Outputs for IfAction SubSystem: '<S268>/UNPACK' incorporates:
     *  ActionPort: '<S274>/Action Port'
     */
    /* DataStoreWrite: '<S274>/Data Store Write' incorporates:
     *  Constant: '<S274>/Constant'
     *  DataStoreRead: '<S274>/Data Store Read'
     *  Sum: '<S274>/Add'
     */
    Cnt_FAST2++;

    /* End of Outputs for SubSystem: '<S268>/UNPACK' */
  }

  /* End of SwitchCase: '<S268>/Switch Case' */

  /* SwitchCase: '<S269>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 261) {
    /* Outputs for IfAction SubSystem: '<S269>/UNPACK' incorporates:
     *  ActionPort: '<S275>/Action Port'
     */
    /* DataStoreWrite: '<S275>/Data Store Write' incorporates:
     *  Constant: '<S275>/Constant'
     *  DataStoreRead: '<S275>/Data Store Read'
     *  Sum: '<S275>/Add'
     */
    Cnt_SLOW1++;

    /* BusCreator: '<S275>/Bus Creator' incorporates:
     *  Constant: '<S275>/Constant1'
     *  Constant: '<S275>/Constant4'
     *  Constant: '<S275>/Constant5'
     *  DataTypeConversion: '<S275>/Data Type Conversion19'
     */
    ECU1119_18b_st_B.CAN_Msg_In_i.Extended = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_i.Length = ECU1119_18b_st_B.CAN0_Rx_500_o5;
    ECU1119_18b_st_B.CAN_Msg_In_i.Remote = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_i.Error = 0U;
    ECU1119_18b_st_B.CAN_Msg_In_i.ID = ECU1119_18b_st_B.CAN0_Rx_500_o3;
    ECU1119_18b_st_B.CAN_Msg_In_i.Timestamp = ECU1119_18b_st_B.CAN0_Rx_500_o6;
    for (i = 0; i < 8; i++) {
      ECU1119_18b_st_B.CAN_Msg_In_i.Data[i] = ECU1119_18b_st_B.CAN0_Rx_500_o4[i];
    }

    /* End of BusCreator: '<S275>/Bus Creator' */

    /* S-Function (scanunpack): '<S275>/CAN Unpack6' */
    {
      /* S-Function (scanunpack): '<S275>/CAN Unpack6' */
      if ((8 == ECU1119_18b_st_B.CAN_Msg_In_i.Length) &&
          (ECU1119_18b_st_B.CAN_Msg_In_i.ID != INVALID_CAN_ID) ) {
        if ((261 == ECU1119_18b_st_B.CAN_Msg_In_i.ID) && (0U ==
             ECU1119_18b_st_B.CAN_Msg_In_i.Extended) ) {
          {
            /* --------------- START Unpacking signal 0 ------------------
             *  startBit                = 16
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.01
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[2]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[3]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.01;
                ECU1119_18b_st_B.CANUnpack6_o1_l = result;
              }
            }

            /* --------------- START Unpacking signal 1 ------------------
             *  startBit                = 32
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[4]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[5]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o2_k = result;
              }
            }

            /* --------------- START Unpacking signal 2 ------------------
             *  startBit                = 48
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[6]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[7]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o3_e = result;
              }
            }

            /* --------------- START Unpacking signal 3 ------------------
             *  startBit                = 0
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.01
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[0]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In_i.Data[1]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.01;
                ECU1119_18b_st_B.CANUnpack6_o4_j = result;
              }
            }
          }
        }
      }
    }

    /* DataTypeConversion: '<S275>/Data Type Conversion1' */
    ECU1119_18b_st_B.NOx_SCR_In_gph = ECU1119_18b_st_B.CANUnpack6_o2_k;

    /* DataTypeConversion: '<S275>/Data Type Conversion3' */
    ECU1119_18b_st_B.SootLoad_g = ECU1119_18b_st_B.CANUnpack6_o4_j;

    /* End of Outputs for SubSystem: '<S269>/UNPACK' */
  }

  /* End of SwitchCase: '<S269>/Switch Case' */

  /* SwitchCase: '<S270>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 262) {
    /* Outputs for IfAction SubSystem: '<S270>/UNPACK' incorporates:
     *  ActionPort: '<S276>/Action Port'
     */
    /* DataStoreWrite: '<S276>/Data Store Write' incorporates:
     *  Constant: '<S276>/Constant'
     *  DataStoreRead: '<S276>/Data Store Read'
     *  Sum: '<S276>/Add'
     */
    Cnt_SLOW2++;

    /* End of Outputs for SubSystem: '<S270>/UNPACK' */
  }

  /* End of SwitchCase: '<S270>/Switch Case' */

  /* SwitchCase: '<S271>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 259) {
    /* Outputs for IfAction SubSystem: '<S271>/UNPACK' incorporates:
     *  ActionPort: '<S277>/Action Port'
     */
    /* DataStoreWrite: '<S277>/Data Store Write' incorporates:
     *  Constant: '<S277>/Constant'
     *  DataStoreRead: '<S277>/Data Store Read'
     *  Sum: '<S277>/Add'
     */
    Cnt_TEMP1++;

    /* BusCreator: '<S277>/Bus Creator' incorporates:
     *  Constant: '<S277>/Constant1'
     *  Constant: '<S277>/Constant4'
     *  Constant: '<S277>/Constant5'
     *  DataTypeConversion: '<S277>/Data Type Conversion19'
     */
    ECU1119_18b_st_B.CAN_Msg_In.Extended = 0U;
    ECU1119_18b_st_B.CAN_Msg_In.Length = ECU1119_18b_st_B.CAN0_Rx_500_o5;
    ECU1119_18b_st_B.CAN_Msg_In.Remote = 0U;
    ECU1119_18b_st_B.CAN_Msg_In.Error = 0U;
    ECU1119_18b_st_B.CAN_Msg_In.ID = ECU1119_18b_st_B.CAN0_Rx_500_o3;
    ECU1119_18b_st_B.CAN_Msg_In.Timestamp = ECU1119_18b_st_B.CAN0_Rx_500_o6;
    for (i = 0; i < 8; i++) {
      ECU1119_18b_st_B.CAN_Msg_In.Data[i] = ECU1119_18b_st_B.CAN0_Rx_500_o4[i];
    }

    /* End of BusCreator: '<S277>/Bus Creator' */

    /* S-Function (scanunpack): '<S277>/CAN Unpack6' */
    {
      /* S-Function (scanunpack): '<S277>/CAN Unpack6' */
      if ((8 == ECU1119_18b_st_B.CAN_Msg_In.Length) &&
          (ECU1119_18b_st_B.CAN_Msg_In.ID != INVALID_CAN_ID) ) {
        if ((259 == ECU1119_18b_st_B.CAN_Msg_In.ID) && (0U ==
             ECU1119_18b_st_B.CAN_Msg_In.Extended) ) {
          {
            /* --------------- START Unpacking signal 0 ------------------
             *  startBit                = 0
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[0]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[1]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o1 = result;
              }
            }

            /* --------------- START Unpacking signal 1 ------------------
             *  startBit                = 16
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[2]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[3]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o2 = result;
              }
            }

            /* --------------- START Unpacking signal 2 ------------------
             *  startBit                = 32
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[4]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[5]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o3 = result;
              }
            }

            /* --------------- START Unpacking signal 3 ------------------
             *  startBit                = 48
             *  length                  = 16
             *  desiredSignalByteLayout = LITTLEENDIAN
             *  dataType                = UNSIGNED
             *  factor                  = 0.1
             *  offset                  = 0.0
             * -----------------------------------------------------------------------*/
            {
              real64_T outValue = 0;

              {
                uint16_T unpackedValue = 0;

                {
                  uint16_T tempValue = (uint16_T) (0);

                  {
                    tempValue = tempValue | (uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[6]);
                    tempValue = tempValue | (uint16_T)((uint16_T)
                      (ECU1119_18b_st_B.CAN_Msg_In.Data[7]) << 8);
                  }

                  unpackedValue = tempValue;
                }

                outValue = (real64_T) (unpackedValue);
              }

              {
                real64_T result = (real64_T) outValue;
                result = result * 0.1;
                ECU1119_18b_st_B.CANUnpack6_o4 = result;
              }
            }
          }
        }
      }
    }

    /* DataTypeConversion: '<S277>/Data Type Conversion1' */
    ECU1119_18b_st_B.DPF_Out_Temp_C = ECU1119_18b_st_B.CANUnpack6_o3;

    /* DataTypeConversion: '<S277>/Data Type Conversion2' */
    ECU1119_18b_st_B.DOC_Out_Temp_C = ECU1119_18b_st_B.CANUnpack6_o2;

    /* End of Outputs for SubSystem: '<S271>/UNPACK' */
  }

  /* End of SwitchCase: '<S271>/Switch Case' */

  /* SwitchCase: '<S272>/Switch Case' */
  if ((int32_T)ECU1119_18b_st_B.CAN0_Rx_500_o3 == 260) {
    /* Outputs for IfAction SubSystem: '<S272>/UNPACK' incorporates:
     *  ActionPort: '<S278>/Action Port'
     */
    /* DataStoreWrite: '<S278>/Data Store Write' incorporates:
     *  Constant: '<S278>/Constant'
     *  DataStoreRead: '<S278>/Data Store Read'
     *  Sum: '<S278>/Add'
     */
    Cnt_TEMP2++;

    /* End of Outputs for SubSystem: '<S272>/UNPACK' */
  }

  /* End of SwitchCase: '<S272>/Switch Case' */
}

/* Model step function */
void ECU1119_18b_st_step(void)
{
  int32_T rtb_Flg_n;
  int32_T rtb_Flg;
  int32_T rtb_Flg_m;
  real_T rtb_Add_bs;
  boolean_T rtb_LogicalOperator;
  real_T rtb_NProdOut;
  real_T rtb_Sum;
  real_T rtb_EGRErr;
  real_T rtb_NProdOut_c;
  real_T rtb_Add3;
  real_T rtb_Divide2;
  ZCEventType zcEvent;
  real_T rtb_SumI2;
  int32_T rtb_low_k;
  int8_T rtAction;
  real_T tmp;
  uint8_T tmp_0;
  uint8_T tmp_1;
  uint8_T tmp_2;
  uint8_T tmp_3;

  /* Chart: '<S4>/Chart1' incorporates:
   *  DataStoreRead: '<S4>/Data Store Read'
   */
  if (ECU1119_18b_st_DW.is_active_c23_ECU1119_18b_st == 0U) {
    ECU1119_18b_st_DW.is_active_c23_ECU1119_18b_st = 1U;
    ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b_st_IN_IDLE;
    rtb_Flg_n = 0;
  } else {
    switch (ECU1119_18b_st_DW.is_c23_ECU1119_18b_st) {
     case ECU1119_18b_st_IN_CS1:
      rtb_Flg_n = 1;
      if (ECU1119_18b_st_DW.cnt_li > 20.0) {
        ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b_st_IN_CS5;
        rtb_Flg_n = 2;
        ECU1119_18b_st_DW.cnt_li = 0.0;
      } else {
        ECU1119_18b_st_DW.cnt_li++;
      }
      break;

     case ECU1119_18b_st_IN_CS5:
      rtb_Flg_n = 2;
      if (ECU1119_18b_st_DW.cnt_li > 20.0) {
        ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b_st_IN_Done;
        rtb_Flg_n = 9;
      } else {
        ECU1119_18b_st_DW.cnt_li++;
      }
      break;

     case ECU1119_18b_st_IN_Done:
      rtb_Flg_n = 9;
      if (VCU_Mode == 0) {
        ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b_st_IN_IDLE;
        rtb_Flg_n = 0;
      }
      break;

     default:
      rtb_Flg_n = 0;
      if (VCU_Mode == 1) {
        ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b_st_IN_CS1;
        rtb_Flg_n = 1;
        ECU1119_18b_st_DW.cnt_li = 0.0;
      }
      break;
    }
  }

  /* End of Chart: '<S4>/Chart1' */

  /* Chart: '<S4>/Chart2' incorporates:
   *  DataStoreRead: '<S4>/Data Store Read'
   */
  if (ECU1119_18b_st_DW.is_active_c24_ECU1119_18b_st == 0U) {
    ECU1119_18b_st_DW.is_active_c24_ECU1119_18b_st = 1U;
    ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b_st_IN_IDLE;
    rtb_Flg = 0;
  } else {
    switch (ECU1119_18b_st_DW.is_c24_ECU1119_18b_st) {
     case ECU1119_18b_st_IN_CS2:
      rtb_Flg = 1;
      if (ECU1119_18b_st_DW.cnt_lz > 20.0) {
        ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b_st_IN_CS3;
        rtb_Flg = 2;
        ECU1119_18b_st_DW.cnt_lz = 0.0;
      } else {
        ECU1119_18b_st_DW.cnt_lz++;
      }
      break;

     case ECU1119_18b_st_IN_CS3:
      rtb_Flg = 2;
      if (ECU1119_18b_st_DW.cnt_lz > 20.0) {
        ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b_st_IN_Done;
        rtb_Flg = 9;
      } else {
        ECU1119_18b_st_DW.cnt_lz++;
      }
      break;

     case ECU1119_18b_st_IN_Done:
      rtb_Flg = 9;
      if (VCU_Mode == 0) {
        ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b_st_IN_IDLE;
        rtb_Flg = 0;
      }
      break;

     default:
      rtb_Flg = 0;
      if (VCU_Mode == 1) {
        ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b_st_IN_CS2;
        rtb_Flg = 1;
        ECU1119_18b_st_DW.cnt_lz = 0.0;
      }
      break;
    }
  }

  /* End of Chart: '<S4>/Chart2' */

  /* DataTypeConversion: '<S4>/Data Type Conversion2' incorporates:
   *  Constant: '<S243>/Constant'
   *  Constant: '<S244>/Constant'
   *  DataStoreWrite: '<S4>/Data Store Write4'
   *  Logic: '<S4>/Logical Operator'
   *  RelationalOperator: '<S243>/Compare'
   *  RelationalOperator: '<S244>/Compare'
   */
  Init_flg_SPI = (uint8_T)((rtb_Flg_n == 9) && (rtb_Flg == 9));

  /* Chart: '<S4>/Chart' incorporates:
   *  DataStoreRead: '<S4>/Data Store Read1'
   *  DataStoreRead: '<S4>/Data Store Read2'
   */
  if (ECU1119_18b_st_DW.is_active_c22_ECU1119_18b_st == 0U) {
    ECU1119_18b_st_DW.is_active_c22_ECU1119_18b_st = 1U;
    ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b_st_IN_Idle;
    rtb_Flg_m = 0;
  } else {
    switch (ECU1119_18b_st_DW.is_c22_ECU1119_18b_st) {
     case ECU1119_18b_st_IN_Idle:
      rtb_Flg_m = 0;
      if (ResetFlg == 0) {
        ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b_st_IN_Initialize;
        rtb_Flg_m = 1;
      }
      break;

     case ECU1119_18b_st_IN_Initialize:
      rtb_Flg_m = 1;
      if (Init_flg_SPI > 0) {
        ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b_st_IN_Normal;
        rtb_Flg_m = 2;
      } else {
        if (ResetFlg == 1) {
          ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b_st_IN_Idle;
          rtb_Flg_m = 0;
        }
      }
      break;

     default:
      rtb_Flg_m = 2;
      if (ResetFlg == 1) {
        ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b_st_IN_Idle;
        rtb_Flg_m = 0;
      }
      break;
    }
  }

  /* End of Chart: '<S4>/Chart' */

  /* DataTypeConversion: '<S4>/Data Type Conversion3' incorporates:
   *  DataStoreWrite: '<S4>/Data Store Write'
   */
  VCU_Mode = (uint8_T)(int32_T)fmod(rtb_Flg_m, 256.0);

  /* DiscretePulseGenerator: '<S4>/Pulse Generator' */
  rtb_Add_bs = ((ECU1119_18b_st_DW.clockTickCounter < 1) &&
                (ECU1119_18b_st_DW.clockTickCounter >= 0));
  if (ECU1119_18b_st_DW.clockTickCounter >= 1) {
    ECU1119_18b_st_DW.clockTickCounter = 0;
  } else {
    ECU1119_18b_st_DW.clockTickCounter++;
  }

  /* End of DiscretePulseGenerator: '<S4>/Pulse Generator' */

  /* Logic: '<S213>/Logical Operator' incorporates:
   *  Constant: '<S225>/Constant'
   *  DataStoreRead: '<S213>/Data Store Read'
   *  DataTypeConversion: '<S4>/Data Type Conversion'
   *  RelationalOperator: '<S225>/Compare'
   */
  rtb_LogicalOperator = ((VCU_Mode == 2) && (rtb_Add_bs != 0.0));

  /* DataStoreRead: '<S211>/Data Store Read9' */
  ECU1119_18b_st_B.DataStoreRead9 = HS010;

  /* DataStoreRead: '<S211>/Data Store Read7' */
  ECU1119_18b_st_B.DataStoreRead7 = HS005;

  /* DataStoreRead: '<S211>/Data Store Read6' */
  ECU1119_18b_st_B.DataStoreRead6 = HS004;

  /* DataStoreRead: '<S211>/Data Store Read5' */
  ECU1119_18b_st_B.DataStoreRead5 = HS003;

  /* DataStoreRead: '<S211>/Data Store Read4' */
  ECU1119_18b_st_B.DataStoreRead4 = HS002;

  /* DataStoreRead: '<S211>/Data Store Read2' */
  ECU1119_18b_st_B.DataStoreRead2 = HS007;

  /* DataStoreRead: '<S211>/Data Store Read' */
  ECU1119_18b_st_B.DataStoreRead = HS001;

  /* If: '<S4>/If1' */
  if (rtb_Flg_n == 1) {
    /* Outputs for IfAction SubSystem: '<S4>/CS1 LS' incorporates:
     *  ActionPort: '<S236>/Action Port'
     */
    /* Chart: '<S236>/Chart' */
    if (ECU1119_18b_st_DW.is_active_c11_ECU1119_18b_st == 0U) {
      ECU1119_18b_st_DW.is_active_c11_ECU1119_18b_st = 1U;
      ECU1119_18b_st_DW.is_c11_ECU1119_18b_st = ECU1119_18b_st_IN_clear;
      rtb_Flg_m = 135;
      rtb_low_k = 1;
      ECU1119_18b_st_DW.cnt_b = 0.0;
    } else {
      switch (ECU1119_18b_st_DW.is_c11_ECU1119_18b_st) {
       case ECU1119_18b_st_IN_clear:
        rtb_Flg_m = 135;
        rtb_low_k = 1;
        if (ECU1119_18b_st_DW.cnt_b > 5.0) {
          ECU1119_18b_st_DW.is_c11_ECU1119_18b_st = ECU1119_18b_st_IN_en;
          rtb_Flg_m = 193;
          rtb_low_k = 0;
          ECU1119_18b_st_DW.cnt_b = 0.0;
        } else {
          ECU1119_18b_st_DW.cnt_b++;
        }
        break;

       case ECU1119_18b_st_IN_config:
        rtb_Flg_m = 199;
        rtb_low_k = 129;
        ECU1119_18b_st_DW.cnt_b++;
        break;

       default:
        rtb_Flg_m = 193;
        rtb_low_k = 0;
        if (ECU1119_18b_st_DW.cnt_b > 5.0) {
          ECU1119_18b_st_DW.is_c11_ECU1119_18b_st = ECU1119_18b_st_IN_config;
          rtb_Flg_m = 199;
          rtb_low_k = 129;
          ECU1119_18b_st_DW.cnt_b = 0.0;
        } else {
          ECU1119_18b_st_DW.cnt_b++;
        }
        break;
      }
    }

    /* End of Chart: '<S236>/Chart' */

    /* S-Function (spi_mpc_master_transfer): '<S236>/SPI_Master_Transfer_To1' */
    {
      DSPI_UpdateCS(0, 5);
      DSPI_MasterTransfer(0, &ECU1119_18b_st_B.VectorConcatenate1_j[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To1_b[0], 1);
    }

    /* DataTypeConversion: '<S236>/Data Type Conversion' */
    ECU1119_18b_st_B.VectorConcatenate1_j[0] = (uint8_T)(int32_T)fmod(rtb_Flg_m,
      256.0);

    /* DataTypeConversion: '<S236>/Data Type Conversion1' */
    ECU1119_18b_st_B.VectorConcatenate1_j[1] = (uint8_T)(int32_T)fmod(rtb_low_k,
      256.0);

    /* End of Outputs for SubSystem: '<S4>/CS1 LS' */
  }

  /* End of If: '<S4>/If1' */

  /* If: '<S4>/If' */
  if (rtb_Flg == 1) {
    /* Outputs for IfAction SubSystem: '<S4>/CS2 CANB' incorporates:
     *  ActionPort: '<S237>/Action Port'
     */
    /* S-Function (spi_mpc_master_transfer): '<S237>/SPI_Master_Transfer_To2' */
    {
      DSPI_UpdateCS(3, 2);
      DSPI_MasterTransfer(3, &ECU1119_18b_st_ConstB.VectorConcatenate2[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To2_b[0], 1);
    }

    /* End of Outputs for SubSystem: '<S4>/CS2 CANB' */
  }

  /* End of If: '<S4>/If' */

  /* If: '<S4>/If3' */
  if (rtb_Flg == 2) {
    /* Outputs for IfAction SubSystem: '<S4>/CS3 LS' incorporates:
     *  ActionPort: '<S238>/Action Port'
     */
    /* Chart: '<S238>/Chart' incorporates:
     *  Constant: '<S238>/PIN'
     */
    if (ECU1119_18b_st_DW.is_active_c14_ECU1119_18b_st == 0U) {
      ECU1119_18b_st_DW.is_active_c14_ECU1119_18b_st = 1U;
      ECU1119_18b_st_DW.is_c14_ECU1119_18b_st = ECU1119_18b_st_IN_ConfigA;
      ECU1119_18b_st_B.high = 90.0;
      ECU1119_18b_st_B.low = 10.0;
      ECU1119_18b_st_DW.cnt = 0.0;
    } else {
      if (ECU1119_18b_st_DW.is_c14_ECU1119_18b_st == ECU1119_18b_st_IN_ConfigA)
      {
        if (ECU1119_18b_st_DW.cnt > 4.0) {
          ECU1119_18b_st_DW.is_c14_ECU1119_18b_st = ECU1119_18b_st_IN_en_i;
          ECU1119_18b_st_B.high = 96.0;
          ECU1119_18b_st_B.low = 0.0;
          ECU1119_18b_st_DW.cnt = 0.0;
        } else {
          ECU1119_18b_st_DW.cnt++;
        }
      }
    }

    /* End of Chart: '<S238>/Chart' */

    /* S-Function (spi_mpc_master_transfer): '<S238>/SPI_Master_Transfer_To2' */
    {
      DSPI_UpdateCS(3, 3);
      DSPI_MasterTransfer(3, &ECU1119_18b_st_B.VectorConcatenate1[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To2[0], 1);
    }

    /* DataTypeConversion: '<S238>/Data Type Conversion2' */
    tmp = floor(ECU1119_18b_st_B.high);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 256.0);
    }

    ECU1119_18b_st_B.VectorConcatenate1[0] = (uint8_T)(tmp < 0.0 ? (int32_T)
      (uint8_T)-(int8_T)(uint8_T)-tmp : (int32_T)(uint8_T)tmp);

    /* End of DataTypeConversion: '<S238>/Data Type Conversion2' */

    /* DataTypeConversion: '<S238>/Data Type Conversion3' */
    tmp = floor(ECU1119_18b_st_B.low);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 256.0);
    }

    ECU1119_18b_st_B.VectorConcatenate1[1] = (uint8_T)(tmp < 0.0 ? (int32_T)
      (uint8_T)-(int8_T)(uint8_T)-tmp : (int32_T)(uint8_T)tmp);

    /* End of DataTypeConversion: '<S238>/Data Type Conversion3' */
    /* End of Outputs for SubSystem: '<S4>/CS3 LS' */
  }

  /* End of If: '<S4>/If3' */

  /* If: '<S4>/If2' */
  if (rtb_Flg_n == 2) {
    /* Outputs for IfAction SubSystem: '<S4>/CS5 LS' incorporates:
     *  ActionPort: '<S239>/Action Port'
     */
    /* Chart: '<S239>/Chart' */
    if (ECU1119_18b_st_DW.is_active_c21_ECU1119_18b_st == 0U) {
      ECU1119_18b_st_DW.is_active_c21_ECU1119_18b_st = 1U;
      ECU1119_18b_st_DW.is_c21_ECU1119_18b_st = ECU1119_18b_st_IN_clear;
      rtb_Flg_n = 135;
      rtb_Flg = 1;
      ECU1119_18b_st_DW.cnt_l = 0.0;
    } else {
      switch (ECU1119_18b_st_DW.is_c21_ECU1119_18b_st) {
       case ECU1119_18b_st_IN_clear:
        rtb_Flg_n = 135;
        rtb_Flg = 1;
        if (ECU1119_18b_st_DW.cnt_l > 5.0) {
          ECU1119_18b_st_DW.is_c21_ECU1119_18b_st = ECU1119_18b_st_IN_en;
          rtb_Flg_n = 193;
          rtb_Flg = 0;
          ECU1119_18b_st_DW.cnt_l = 0.0;
        } else {
          ECU1119_18b_st_DW.cnt_l++;
        }
        break;

       case ECU1119_18b_st_IN_config:
        rtb_Flg_n = 199;
        rtb_Flg = 129;
        break;

       default:
        rtb_Flg_n = 193;
        rtb_Flg = 0;
        if (ECU1119_18b_st_DW.cnt_l > 5.0) {
          ECU1119_18b_st_DW.is_c21_ECU1119_18b_st = ECU1119_18b_st_IN_config;
          rtb_Flg_n = 199;
          rtb_Flg = 129;
          ECU1119_18b_st_DW.cnt_l = 0.0;
        } else {
          ECU1119_18b_st_DW.cnt_l++;
        }
        break;
      }
    }

    /* End of Chart: '<S239>/Chart' */

    /* S-Function (spi_mpc_master_transfer): '<S239>/SPI_Master_Transfer_To1' */
    {
      DSPI_UpdateCS(0, 1);
      DSPI_MasterTransfer(0, &ECU1119_18b_st_B.VectorConcatenate1_o[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To1[0], 1);
    }

    /* DataTypeConversion: '<S239>/Data Type Conversion' */
    ECU1119_18b_st_B.VectorConcatenate1_o[0] = (uint8_T)(int32_T)fmod(rtb_Flg_n,
      256.0);

    /* DataTypeConversion: '<S239>/Data Type Conversion1' */
    ECU1119_18b_st_B.VectorConcatenate1_o[1] = (uint8_T)(int32_T)fmod(rtb_Flg,
      256.0);

    /* End of Outputs for SubSystem: '<S4>/CS5 LS' */
  }

  /* End of If: '<S4>/If2' */

  /* S-Function (gpio_mpc_output): '<S5>/HS1' */
  /* Data Signal Update */
  if (ECU1119_18b_st_ConstB.DataTypeConversion_b) {
    PINS_DRV_SetPins(PTF, (1 << 6));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 6));
  }

  /* S-Function (gpio_mpc_output): '<S5>/HS4' */
  /* Data Signal Update */
  if (ECU1119_18b_st_ConstB.DataTypeConversion_b) {
    PINS_DRV_SetPins(PTA, (1 << 13));
  } else {
    PINS_DRV_ClearPins(PTA, (1 << 13));
  }

  /* End of Outputs for S-Function (fcan_mpc_isr): '<S7>/CAN0_Rx_500' */

  /* Switch: '<S10>/Switch' incorporates:
   *  Constant: '<S10>/ANRtarget'
   *  Constant: '<S10>/zero2'
   *  Constant: '<S10>/µÍÎÂ'
   *  Constant: '<S10>/ÄòËØÅ¨¶È'
   *  Product: '<S10>/Divide'
   *  Product: '<S10>/Product'
   *  RelationalOperator: '<S10>/Relational Operator'
   */
  if (ECU1119_18b_st_B.DPF_Out_Temp_C <= 200.0) {
    ECU1119_18b_st_B.mUREA_target = 0.0;
  } else {
    ECU1119_18b_st_B.mUREA_target = 1.05 * ECU1119_18b_st_B.NOx_SCR_In_gph /
      0.325;
  }

  /* End of Switch: '<S10>/Switch' */

  /* DiscretePulseGenerator: '<S8>/Pulse Generator' */
  rtb_Flg_n = ((ECU1119_18b_st_DW.clockTickCounter_d < 1) &&
               (ECU1119_18b_st_DW.clockTickCounter_d >= 0));
  if (ECU1119_18b_st_DW.clockTickCounter_d >= 19) {
    ECU1119_18b_st_DW.clockTickCounter_d = 0;
  } else {
    ECU1119_18b_st_DW.clockTickCounter_d++;
  }

  /* End of DiscretePulseGenerator: '<S8>/Pulse Generator' */

  /* Lookup_n-D: '<S13>/EngineSpdTgt' */
  ECU1119_18b_st_B.EngineSpdTgt = look1_binlcpw(ThrottleCmd_pct,
    ECU1119_18b_st_ConstP.EngineSpdTgt_bp01Data,
    ECU1119_18b_st_ConstP.EngineSpdTgt_tableData, 10U);

  /* Sum: '<S13>/Add' */
  rtb_Add_bs = ECU1119_18b_st_B.EngineSpdTgt - ECU1119_18b_st_B.EngSpeed_rpm;

  /* Product: '<S177>/NProd Out' incorporates:
   *  Constant: '<S13>/Constant2'
   *  Constant: '<S13>/Constant3'
   *  DiscreteIntegrator: '<S150>/Filter'
   *  Product: '<S144>/DProd Out'
   *  Sum: '<S150>/SumD'
   */
  rtb_NProdOut = (rtb_Add_bs * 0.0 - ECU1119_18b_st_DW.Filter_DSTATE) * 100.0;

  /* Sum: '<S198>/Sum' incorporates:
   *  Constant: '<S13>/Constant'
   *  DiscreteIntegrator: '<S168>/Integrator'
   *  Product: '<S184>/PProd Out'
   */
  rtb_Sum = (rtb_Add_bs * 0.15 + ECU1119_18b_st_DW.Integrator_DSTATE) +
    rtb_NProdOut;

  /* Switch: '<S113>/Switch2' incorporates:
   *  Constant: '<S13>/Constant4'
   *  Constant: '<S13>/Constant5'
   *  RelationalOperator: '<S113>/LowerRelop1'
   *  RelationalOperator: '<S113>/UpperRelop'
   *  Switch: '<S113>/Switch'
   */
  if (rtb_Sum > 160.0) {
    ECU1119_18b_st_B.Switch2 = 160.0;
  } else if (rtb_Sum < 10.0) {
    /* Switch: '<S113>/Switch' incorporates:
     *  Constant: '<S13>/Constant4'
     */
    ECU1119_18b_st_B.Switch2 = 10.0;
  } else {
    ECU1119_18b_st_B.Switch2 = rtb_Sum;
  }

  /* End of Switch: '<S113>/Switch2' */

  /* Sum: '<S12>/Add' incorporates:
   *  Lookup_n-D: '<S12>/EGRTgt'
   */
  rtb_EGRErr = look2_binlcpw(ECU1119_18b_st_B.EngSpeed_rpm,
    ECU1119_18b_st_B.FuelCycle_Act_mg, ECU1119_18b_st_ConstP.EGRTgt_bp01Data,
    ECU1119_18b_st_ConstP.EGRTgt_bp02Data,
    ECU1119_18b_st_ConstP.EGRTgt_tableData,
    ECU1119_18b_st_ConstP.EGRTgt_maxIndex, 7U) - ECU1119_18b_st_B.EGR_Ratio_Act;

  /* Product: '<S79>/NProd Out' incorporates:
   *  Constant: '<S12>/Constant2'
   *  Constant: '<S12>/Constant3'
   *  DiscreteIntegrator: '<S52>/Filter'
   *  Product: '<S46>/DProd Out'
   *  Sum: '<S52>/SumD'
   */
  rtb_NProdOut_c = (rtb_EGRErr * 0.01 - ECU1119_18b_st_DW.Filter_DSTATE_m) *
    100.0;

  /* Sum: '<S100>/Sum' incorporates:
   *  DiscreteIntegrator: '<S70>/Integrator'
   *  Product: '<S86>/PProd Out'
   */
  rtb_Add3 = (rtb_EGRErr * ECU1119_18b_st_ConstB.Gain2 +
              ECU1119_18b_st_DW.Integrator_DSTATE_a) + rtb_NProdOut_c;

  /* Saturate: '<S91>/Saturation' */
  if (rtb_Add3 > 1.0) {
    rtb_Divide2 = 1.0;
  } else if (rtb_Add3 < 0.0) {
    rtb_Divide2 = 0.0;
  } else {
    rtb_Divide2 = rtb_Add3;
  }

  /* End of Saturate: '<S91>/Saturation' */

  /* Gain: '<S12>/Gain' */
  ECU1119_18b_st_B.EGROpeningTgt_pct = 100.0 * rtb_Divide2;

  /* Chart: '<S11>/Chart' */
  if (ECU1119_18b_st_DW.is_active_c1_ECU1119_18b_st == 0U) {
    ECU1119_18b_st_DW.is_active_c1_ECU1119_18b_st = 1U;
    ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b_st_IN_Idle;
    ECU1119_18b_st_B.Regen_Request = false;
    ECU1119_18b_st_B.PostInj_Request = false;
  } else {
    switch (ECU1119_18b_st_DW.is_c1_ECU1119_18b_st) {
     case ECU1119_18b_st_IN_Idle:
      if (ECU1119_18b_st_B.SootLoad_g > 18.0) {
        ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b_st_IN_Wait;
        ECU1119_18b_st_B.Regen_Request = true;
        ECU1119_18b_st_B.PostInj_Request = (ECU1119_18b_st_B.DOC_Out_Temp_C <
          550.0);
      }
      break;

     case ECU1119_18b_st_IN_Regen:
      if ((ECU1119_18b_st_B.DOC_Out_Temp_C > 680.0) ||
          (ECU1119_18b_st_B.SootLoad_g < 4.0)) {
        ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b_st_IN_Idle;
        ECU1119_18b_st_B.Regen_Request = false;
        ECU1119_18b_st_B.PostInj_Request = false;
      } else if (ECU1119_18b_st_B.DOC_Out_Temp_C < 495.0) {
        ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b_st_IN_Wait;
        ECU1119_18b_st_B.Regen_Request = true;
        ECU1119_18b_st_B.PostInj_Request = (ECU1119_18b_st_B.DOC_Out_Temp_C <
          550.0);
      } else {
        ECU1119_18b_st_B.Regen_Request = true;
      }
      break;

     default:
      if (ECU1119_18b_st_B.DOC_Out_Temp_C > 550.0) {
        ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b_st_IN_Regen;
        ECU1119_18b_st_B.Regen_Request = true;
      } else {
        ECU1119_18b_st_B.Regen_Request = true;
        ECU1119_18b_st_B.PostInj_Request = (ECU1119_18b_st_B.DOC_Out_Temp_C <
          550.0);
      }
      break;
    }
  }

  /* End of Chart: '<S11>/Chart' */

  /* DiscretePulseGenerator: '<S8>/Pulse Generator1' */
  rtb_Flg = ((ECU1119_18b_st_DW.clockTickCounter_g < 1) &&
             (ECU1119_18b_st_DW.clockTickCounter_g >= 0));
  if (ECU1119_18b_st_DW.clockTickCounter_g >= 1) {
    ECU1119_18b_st_DW.clockTickCounter_g = 0;
  } else {
    ECU1119_18b_st_DW.clockTickCounter_g++;
  }

  /* End of DiscretePulseGenerator: '<S8>/Pulse Generator1' */

  /* Outputs for Triggered SubSystem: '<S8>/VCU_Cmd_Fast' incorporates:
   *  TriggerPort: '<S300>/Trigger'
   */
  zcEvent = rt_ZCFcn(RISING_ZERO_CROSSING,
                     &ECU1119_18b_st_PrevZCX.VCU_Cmd_Fast_Trig_ZCE,
                     ((real_T)rtb_Flg));
  if (zcEvent != NO_ZCEVENT) {
    /* DataTypeConversion: '<S300>/Data Type Conversion' */
    ECU1119_18b_st_B.DataTypeConversion = ECU1119_18b_st_B.Regen_Request;

    /* DataTypeConversion: '<S300>/Data Type Conversion4' */
    ECU1119_18b_st_B.DataTypeConversion4 = ECU1119_18b_st_B.PostInj_Request;

    /* S-Function (scanpack): '<S300>/VCU_Cmd_Fast' */
    /* S-Function (scanpack): '<S300>/VCU_Cmd_Fast' */
    ECU1119_18b_st_B.VCU_Cmd_Fast.ID = 263U;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Length = 8U;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Extended = 0U;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Remote = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[0] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[1] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[2] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[3] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[4] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[5] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[6] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Fast.Data[7] = 0;

    {
      /* --------------- START Packing signal 0 ------------------
       *  startBit                = 56
       *  length                  = 8
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = UNSIGNED
       *  factor                  = 1.0
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.DataTypeConversion;

          /* no scaling required */
          outValue = result;
        }

        {
          uint8_T packedValue;
          if (outValue > (real64_T)(255)) {
            packedValue = (uint8_T) 255;
          } else if (outValue < (real64_T)(0)) {
            packedValue = (uint8_T) 0;
          } else {
            packedValue = (uint8_T) (outValue);
          }

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[7] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[7] | (uint8_T)(packedValue);
            }
          }
        }
      }

      /* --------------- START Packing signal 1 ------------------
       *  startBit                = 32
       *  length                  = 16
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = UNSIGNED
       *  factor                  = 0.01
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.EGROpeningTgt_pct;

          /* no offset to apply */
          result = result * (1 / 0.01);
          outValue = result;
        }

        {
          uint16_T packedValue;
          if (outValue > (real64_T)(65535)) {
            packedValue = (uint16_T) 65535;
          } else if (outValue < (real64_T)(0)) {
            packedValue = (uint16_T) 0;
          } else {
            packedValue = (uint16_T) (outValue);
          }

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[4] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[4] | (uint8_T)((uint16_T)
                (packedValue & (uint16_T)0xFFU));
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[5] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[5] | (uint8_T)((uint16_T)
                ((uint16_T)(packedValue & (uint16_T)0xFF00U) >> 8));
            }
          }
        }
      }

      /* --------------- START Packing signal 2 ------------------
       *  startBit                = 0
       *  length                  = 16
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = UNSIGNED
       *  factor                  = 0.1
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.EngineSpdTgt;

          /* no offset to apply */
          result = result * (1 / 0.1);
          outValue = result;
        }

        {
          uint16_T packedValue;
          if (outValue > (real64_T)(65535)) {
            packedValue = (uint16_T) 65535;
          } else if (outValue < (real64_T)(0)) {
            packedValue = (uint16_T) 0;
          } else {
            packedValue = (uint16_T) (outValue);
          }

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[0] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[0] | (uint8_T)((uint16_T)
                (packedValue & (uint16_T)0xFFU));
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[1] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[1] | (uint8_T)((uint16_T)
                ((uint16_T)(packedValue & (uint16_T)0xFF00U) >> 8));
            }
          }
        }
      }

      /* --------------- START Packing signal 3 ------------------
       *  startBit                = 16
       *  length                  = 16
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = UNSIGNED
       *  factor                  = 0.005
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.Switch2;

          /* no offset to apply */
          result = result * (1 / 0.005);
          outValue = result;
        }

        {
          uint16_T packedValue;
          if (outValue > (real64_T)(65535)) {
            packedValue = (uint16_T) 65535;
          } else if (outValue < (real64_T)(0)) {
            packedValue = (uint16_T) 0;
          } else {
            packedValue = (uint16_T) (outValue);
          }

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[2] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[2] | (uint8_T)((uint16_T)
                (packedValue & (uint16_T)0xFFU));
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[3] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[3] | (uint8_T)((uint16_T)
                ((uint16_T)(packedValue & (uint16_T)0xFF00U) >> 8));
            }
          }
        }
      }

      /* --------------- START Packing signal 4 ------------------
       *  startBit                = 48
       *  length                  = 8
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = UNSIGNED
       *  factor                  = 1.0
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.DataTypeConversion4;

          /* no scaling required */
          outValue = result;
        }

        {
          uint8_T packedValue;
          if (outValue > (real64_T)(255)) {
            packedValue = (uint8_T) 255;
          } else if (outValue < (real64_T)(0)) {
            packedValue = (uint8_T) 0;
          } else {
            packedValue = (uint8_T) (outValue);
          }

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Fast.Data[6] =
                ECU1119_18b_st_B.VCU_Cmd_Fast.Data[6] | (uint8_T)(packedValue);
            }
          }
        }
      }
    }

    /* S-Function (fcan_mpc_send): '<S300>/FCAN_Send_ID_0x18FF0800' */
    {
      uint8_t* data = &ECU1119_18b_st_B.VCU_Cmd_Fast.Data[0];
      flexcan_data_info_t txInfo = {
        .msg_id_type = FLEXCAN_MSG_ID_STD,
        .data_length = ECU1119_18b_st_B.VCU_Cmd_Fast.Length,
        .is_remote = false
      };

      FLEXCAN_DRV_AbortTransfer(2, 6);
      FLEXCAN_DRV_ConfigTxMb(2, 6, &txInfo, 0x107);
      FLEXCAN_DRV_Send(2, 6, &txInfo, 0x107, data);
    }

    /* DataStoreWrite: '<S300>/Data Store Write' incorporates:
     *  Constant: '<S300>/Constant2'
     *  DataStoreRead: '<S300>/Data Store Read'
     *  Sum: '<S300>/Add'
     */
    Cnt_FAST_OUT++;
  }

  /* End of Outputs for SubSystem: '<S8>/VCU_Cmd_Fast' */

  /* Outputs for Triggered SubSystem: '<S8>/VCU_Cmd_Slow' incorporates:
   *  TriggerPort: '<S301>/Trigger'
   */
  zcEvent = rt_ZCFcn(RISING_ZERO_CROSSING,
                     &ECU1119_18b_st_PrevZCX.VCU_Cmd_Slow_Trig_ZCE,
                     ((real_T)rtb_Flg_n));
  if (zcEvent != NO_ZCEVENT) {
    /* S-Function (scanpack): '<S301>/VCU_Cmd_Slow' */
    /* S-Function (scanpack): '<S301>/VCU_Cmd_Slow' */
    ECU1119_18b_st_B.VCU_Cmd_Slow.ID = 264U;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Length = 8U;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Extended = 0U;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Remote = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[0] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[1] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[2] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[3] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[4] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[5] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[6] = 0;
    ECU1119_18b_st_B.VCU_Cmd_Slow.Data[7] = 0;

    {
      /* --------------- START Packing signal 0 ------------------
       *  startBit                = 0
       *  length                  = 32
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = SINGLE
       *  factor                  = 1.0
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_ConstB.DataTypeConversion1;

          /* no scaling required */
          outValue = result;
        }

        {
          real32_T typedValue;
          uint32_T* pInput;
          uint32_T typedIntValue;
          typedValue = (real32_T) (outValue);
          pInput = (uint32_T*) (&typedValue);
          typedIntValue = *pInput;

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[0] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[0] | (uint8_T)((uint32_T)
                (typedIntValue & (uint32_T)0xFFU));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[1] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[1] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF00U) >> 8));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[2] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[2] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF0000U) >> 16));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[3] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[3] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF000000U) >> 24));
            }
          }
        }
      }

      /* --------------- START Packing signal 1 ------------------
       *  startBit                = 32
       *  length                  = 32
       *  desiredSignalByteLayout = LITTLEENDIAN
       *  dataType                = SINGLE
       *  factor                  = 0.1
       *  offset                  = 0.0
       *  minimum                 = 0.0
       *  maximum                 = 0.0
       * -----------------------------------------------------------------------*/
      {
        real64_T outValue = 0;

        {
          real64_T result = ECU1119_18b_st_B.mUREA_target;

          /* no offset to apply */
          result = result * (1 / 0.1);
          outValue = result;
        }

        {
          real32_T typedValue;
          uint32_T* pInput;
          uint32_T typedIntValue;
          typedValue = (real32_T) (outValue);
          pInput = (uint32_T*) (&typedValue);
          typedIntValue = *pInput;

          {
            {
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[4] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[4] | (uint8_T)((uint32_T)
                (typedIntValue & (uint32_T)0xFFU));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[5] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[5] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF00U) >> 8));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[6] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[6] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF0000U) >> 16));
              ECU1119_18b_st_B.VCU_Cmd_Slow.Data[7] =
                ECU1119_18b_st_B.VCU_Cmd_Slow.Data[7] | (uint8_T)((uint32_T)
                ((uint32_T)(typedIntValue & (uint32_T)0xFF000000U) >> 24));
            }
          }
        }
      }
    }

    /* S-Function (fcan_mpc_send): '<S301>/FCAN_Send_ID_0x18FF0900' */
    {
      uint8_t* data = &ECU1119_18b_st_B.VCU_Cmd_Slow.Data[0];
      flexcan_data_info_t txInfo = {
        .msg_id_type = FLEXCAN_MSG_ID_STD,
        .data_length = ECU1119_18b_st_B.VCU_Cmd_Slow.Length,
        .is_remote = false
      };

      FLEXCAN_DRV_AbortTransfer(2, 7);
      FLEXCAN_DRV_ConfigTxMb(2, 7, &txInfo, 0x108);
      FLEXCAN_DRV_Send(2, 7, &txInfo, 0x108, data);
    }

    /* DataStoreWrite: '<S301>/Data Store Write' incorporates:
     *  Constant: '<S301>/Constant2'
     *  DataStoreRead: '<S301>/Data Store Read'
     *  Sum: '<S301>/Add'
     */
    Cnt_SLOW_OUT++;
  }

  /* End of Outputs for SubSystem: '<S8>/VCU_Cmd_Slow' */

  /* S-Function (etimer_mpc_preload): '<S217>/eTimer_Preload2' */
  ETIMER_DRV_ReloadOnCompare(0, 5, ECU1119_18b_st_ConstB.DataTypeConversion,
    true);                             //rolloverEnabled
  ETIMER_DRV_SetCompareThresholdBuffered(0, 5,
    ECU1119_18b_st_B.DataTypeConversion1, ECU1119_18b_st_B.DataTypeConversion2);

  /* S-Function (etimer_mpc_start_stop_timer): '<S217>/eTimer_Start_Stop_Timer1' */
  ETIMER_DRV_StartTimerChannels(0, ETIMER_ENABLE_CH5);

  /* S-Function (etimer_mpc_preload): '<S216>/eTimer_Preload2' */
  ETIMER_DRV_ReloadOnCompare(2, 2, ECU1119_18b_st_ConstB.DataTypeConversion_a,
    true);                             //rolloverEnabled
  ETIMER_DRV_SetCompareThresholdBuffered(2, 2,
    ECU1119_18b_st_B.DataTypeConversion1_k,
    ECU1119_18b_st_B.DataTypeConversion2_i);

  /* S-Function (etimer_mpc_start_stop_timer): '<S216>/eTimer_Start_Stop_Timer1' */
  ETIMER_DRV_StartTimerChannels(2, ETIMER_ENABLE_CH2);

  /* S-Function (etimer_mpc_preload): '<S215>/eTimer_Preload2' */
  ETIMER_DRV_ReloadOnCompare(0, 3, ECU1119_18b_st_ConstB.DataTypeConversion_m,
    true);                             //rolloverEnabled
  ETIMER_DRV_SetCompareThresholdBuffered(0, 3,
    ECU1119_18b_st_B.DataTypeConversion1_a,
    ECU1119_18b_st_B.DataTypeConversion2_e);

  /* S-Function (etimer_mpc_start_stop_timer): '<S215>/eTimer_Start_Stop_Timer1' */
  ETIMER_DRV_StartTimerChannels(0, ETIMER_ENABLE_CH3);

  /* S-Function (gpio_mpc_output): '<S211>/HS001' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead) {
    PINS_DRV_SetPins(PTF, (1 << 5));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 5));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS007' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead2) {
    PINS_DRV_SetPins(PTF, (1 << 7));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 7));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS002 ' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead4) {
    PINS_DRV_SetPins(PTF, (1 << 4));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 4));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS003' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead5) {
    PINS_DRV_SetPins(PTF, (1 << 3));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 3));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS004' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead6) {
    PINS_DRV_SetPins(PTB, (1 << 6));
  } else {
    PINS_DRV_ClearPins(PTB, (1 << 6));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS005' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead7) {
    PINS_DRV_SetPins(PTA, (1 << 12));
  } else {
    PINS_DRV_ClearPins(PTA, (1 << 12));
  }

  /* S-Function (gpio_mpc_output): '<S211>/HS010' */
  /* Data Signal Update */
  if (ECU1119_18b_st_B.DataStoreRead9) {
    PINS_DRV_SetPins(PTF, (1 << 9));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 9));
  }

  /* S-Function (gpio_mpc_output): '<S213>/LS_EN' incorporates:
   *  Constant: '<S213>/Constant'
   */
  /* Data Signal Update */
  if (true) {
    PINS_DRV_SetPins(PTA, (1 << 2));
  } else {
    PINS_DRV_ClearPins(PTA, (1 << 2));
  }

  /* S-Function (gpio_mpc_output): '<S213>/LS_rst2' incorporates:
   *  Constant: '<S213>/Constant1'
   */
  /* Data Signal Update */
  if (true) {
    PINS_DRV_SetPins(PTA, (1 << 1));
  } else {
    PINS_DRV_ClearPins(PTA, (1 << 1));
  }

  /* S-Function (gpio_mpc_output): '<S213>/LS_rst1' incorporates:
   *  Constant: '<S213>/Constant2'
   */
  /* Data Signal Update */
  if (true) {
    PINS_DRV_SetPins(PTC, (1 << 10));
  } else {
    PINS_DRV_ClearPins(PTC, (1 << 10));
  }

  /* Outputs for Enabled SubSystem: '<S213>/LS_CTRL' incorporates:
   *  EnablePort: '<S226>/Enable'
   */
  /* Logic: '<S213>/Logical Operator1' */
  if (!rtb_LogicalOperator) {
    /* S-Function (spi_mpc_master_transfer): '<S226>/SPI_Master_Transfer_To1' */
    {
      DSPI_UpdateCS(0, 5);
      DSPI_MasterTransfer(0, &ECU1119_18b_st_B.VectorConcatenate1_b[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To1_l[0], 1);
    }

    /* Outputs for Atomic SubSystem: '<S226>/If Action Subsystem1' */
    /* Switch: '<S228>/Switch' incorporates:
     *  Constant: '<S228>/Constant1'
     *  Constant: '<S228>/Constant2'
     *  DataStoreRead: '<S228>/Data Store Read6'
     */
    if (LS002) {
      tmp_0 = 128U;
    } else {
      tmp_0 = 64U;
    }

    /* End of Switch: '<S228>/Switch' */

    /* Switch: '<S228>/Switch1' incorporates:
     *  Constant: '<S228>/Constant3'
     *  Constant: '<S228>/Constant4'
     *  DataStoreRead: '<S228>/Data Store Read5'
     */
    if (LS001) {
      tmp_1 = 32U;
    } else {
      tmp_1 = 16U;
    }

    /* End of Switch: '<S228>/Switch1' */

    /* Switch: '<S228>/Switch2' incorporates:
     *  Constant: '<S228>/Constant5'
     *  Constant: '<S228>/Constant6'
     *  DataStoreRead: '<S228>/Data Store Read4'
     */
    if (LS011) {
      tmp_2 = 8U;
    } else {
      tmp_2 = 4U;
    }

    /* End of Switch: '<S228>/Switch2' */

    /* Switch: '<S228>/Switch3' incorporates:
     *  Constant: '<S228>/Constant7'
     *  Constant: '<S228>/Constant8'
     *  DataStoreRead: '<S228>/Data Store Read'
     */
    if (LS004) {
      tmp_3 = 2U;
    } else {
      tmp_3 = 1U;
    }

    /* End of Switch: '<S228>/Switch3' */

    /* DataTypeConversion: '<S228>/Data Type Conversion1' incorporates:
     *  Sum: '<S228>/Add'
     */
    ECU1119_18b_st_B.VectorConcatenate1_b[1] = (uint8_T)((((uint32_T)tmp_0 +
      tmp_1) + tmp_2) + tmp_3);

    /* End of Outputs for SubSystem: '<S226>/If Action Subsystem1' */

    /* SignalConversion: '<S226>/ConcatBufferAtVector Concatenate1In1' */
    ECU1119_18b_st_B.VectorConcatenate1_b[0] =
      ECU1119_18b_st_ConstB.DataTypeConversion_j;
  }

  /* End of Logic: '<S213>/Logical Operator1' */
  /* End of Outputs for SubSystem: '<S213>/LS_CTRL' */

  /* Outputs for Enabled SubSystem: '<S213>/LS_CTRL1' incorporates:
   *  EnablePort: '<S227>/Enable'
   */
  if (rtb_LogicalOperator) {
    /* S-Function (spi_mpc_master_transfer): '<S227>/SPI_Master_Transfer_To1' */
    {
      DSPI_UpdateCS(0, 1);
      DSPI_MasterTransfer(0, &ECU1119_18b_st_B.VectorConcatenate1_p[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To1_k[0], 1);
    }

    /* Outputs for Atomic SubSystem: '<S227>/If Action Subsystem1' */
    /* Switch: '<S229>/Switch' incorporates:
     *  Constant: '<S229>/Constant1'
     *  Constant: '<S229>/Constant2'
     *  DataStoreRead: '<S229>/Data Store Read6'
     */
    if (LS016) {
      tmp_0 = 128U;
    } else {
      tmp_0 = 64U;
    }

    /* End of Switch: '<S229>/Switch' */

    /* Switch: '<S229>/Switch1' incorporates:
     *  Constant: '<S229>/Constant3'
     *  Constant: '<S229>/Constant4'
     *  DataStoreRead: '<S229>/Data Store Read5'
     */
    if (LS009) {
      tmp_1 = 32U;
    } else {
      tmp_1 = 16U;
    }

    /* End of Switch: '<S229>/Switch1' */

    /* Switch: '<S229>/Switch2' incorporates:
     *  Constant: '<S229>/Constant5'
     *  Constant: '<S229>/Constant6'
     *  DataStoreRead: '<S229>/Data Store Read4'
     */
    if (LS015) {
      tmp_2 = 8U;
    } else {
      tmp_2 = 4U;
    }

    /* End of Switch: '<S229>/Switch2' */

    /* Switch: '<S229>/Switch3' incorporates:
     *  Constant: '<S229>/Constant7'
     *  Constant: '<S229>/Constant8'
     *  DataStoreRead: '<S229>/Data Store Read'
     */
    if (LS014) {
      tmp_3 = 2U;
    } else {
      tmp_3 = 1U;
    }

    /* End of Switch: '<S229>/Switch3' */

    /* DataTypeConversion: '<S229>/Data Type Conversion1' incorporates:
     *  Sum: '<S229>/Add'
     */
    ECU1119_18b_st_B.VectorConcatenate1_p[1] = (uint8_T)((((uint32_T)tmp_0 +
      tmp_1) + tmp_2) + tmp_3);

    /* End of Outputs for SubSystem: '<S227>/If Action Subsystem1' */

    /* SignalConversion: '<S227>/ConcatBufferAtVector Concatenate1In1' */
    ECU1119_18b_st_B.VectorConcatenate1_p[0] =
      ECU1119_18b_st_ConstB.DataTypeConversion_h;
  }

  /* End of Outputs for SubSystem: '<S213>/LS_CTRL1' */

  /* S-Function (gpio_mpc_output): '<S214>/LS_EN1' incorporates:
   *  Constant: '<S214>/Constant1'
   */
  /* Data Signal Update */
  if (true) {
    PINS_DRV_SetPins(PTF, (1 << 10));
  } else {
    PINS_DRV_ClearPins(PTF, (1 << 10));
  }

  /* S-Function (gpio_mpc_output): '<S214>/LS_rst' incorporates:
   *  Constant: '<S214>/Constant3'
   */
  /* Data Signal Update */
  if (true) {
    PINS_DRV_SetPins(PTC, (1 << 14));
  } else {
    PINS_DRV_ClearPins(PTC, (1 << 14));
  }

  /* Outputs for Enabled SubSystem: '<S214>/Subsystem' incorporates:
   *  EnablePort: '<S231>/Enable'
   */
  /* Logic: '<S214>/Logical Operator' incorporates:
   *  Constant: '<S230>/Constant'
   *  DataStoreRead: '<S214>/Data Store Read'
   *  DataStoreWrite: '<S4>/Data Store Write3'
   *  RelationalOperator: '<S230>/Compare'
   */
  if ((VCU_Mode == 2) && ECU1119_18b_st_ConstB.DataTypeConversion1_p) {
    /* S-Function (spi_mpc_master_transfer): '<S231>/SPI_Master_Transfer_To2' */
    {
      DSPI_UpdateCS(3, 3);
      DSPI_MasterTransfer(3, &ECU1119_18b_st_B.VectorConcatenate2[0],
                          &ECU1119_18b_st_B.SPI_Master_Transfer_To2_j[0], 1);
    }

    /* Outputs for Atomic SubSystem: '<S231>/¿ØÖÆ' */
    /* DataTypeConversion: '<S232>/Data Type Conversion' incorporates:
     *  Constant: '<S232>/Constant9'
     *  DataStoreRead: '<S232>/Data Store Read1'
     *  DataStoreRead: '<S232>/Data Store Read2'
     *  Gain: '<S232>/Gain8'
     *  Gain: '<S232>/Gain9'
     *  Sum: '<S232>/Add1'
     */
    ECU1119_18b_st_B.VectorConcatenate2[0] = (uint8_T)(((((uint32_T)(LS012 << 7)
      << 1) + ((uint32_T)LS007 << 7)) + 5632U) >> 7);

    /* DataTypeConversion: '<S232>/Data Type Conversion1' incorporates:
     *  DataStoreRead: '<S232>/Data Store Read10'
     *  DataStoreRead: '<S232>/Data Store Read5'
     *  DataStoreRead: '<S232>/Data Store Read6'
     *  DataStoreRead: '<S232>/Data Store Read9'
     *  Gain: '<S232>/Gain2'
     *  Gain: '<S232>/Gain3'
     *  Gain: '<S232>/Gain6'
     *  Gain: '<S232>/Gain7'
     *  Sum: '<S232>/Add'
     */
    tmp = floor(((((((real_T)(LS013 << 7) * 0.5 + (real_T)(LS006 << 7)) +
                    ECU1119_18b_st_ConstB.Gain5) + ECU1119_18b_st_ConstB.Gain4)
                  + (real_T)(LS008 << 7) * 0.0625) + (real_T)(LS010 << 7) *
                 0.03125) + ECU1119_18b_st_ConstB.Gain1_p);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 256.0);
    }

    ECU1119_18b_st_B.VectorConcatenate2[1] = (uint8_T)(tmp < 0.0 ? (int32_T)
      (uint8_T)-(int8_T)(uint8_T)-tmp : (int32_T)(uint8_T)tmp);

    /* End of DataTypeConversion: '<S232>/Data Type Conversion1' */
    /* End of Outputs for SubSystem: '<S231>/¿ØÖÆ' */
  }

  /* End of Logic: '<S214>/Logical Operator' */
  /* End of Outputs for SubSystem: '<S214>/Subsystem' */

  /* Sum: '<S38>/SumI2' */
  rtb_SumI2 = rtb_Divide2 - rtb_Add3;

  /* Product: '<S59>/IProd Out' */
  rtb_EGRErr *= ECU1119_18b_st_ConstB.Gain1;

  /* Outputs for Atomic SubSystem: '<Root>/Init' */
  /* If: '<S3>/If1' incorporates:
   *  DataStoreRead: '<S3>/Data Store Read1'
   */
  if (VCU_Mode == 2) {
    /* Outputs for IfAction SubSystem: '<S3>/CAN_init' incorporates:
     *  ActionPort: '<S233>/Action Port'
     */
    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Fast_Fb1' */
    FLEXCAN_DRV_Receive(2, 0, &canCom2_recvBuff0);

    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Fast_Fb2' */
    FLEXCAN_DRV_Receive(2, 1, &canCom2_recvBuff1);

    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Slow_Fb1' */
    FLEXCAN_DRV_Receive(2, 4, &canCom2_recvBuff4);

    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Slow_Fb2' */
    FLEXCAN_DRV_Receive(2, 5, &canCom2_recvBuff5);

    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Temp_Fb1' */
    FLEXCAN_DRV_Receive(2, 2, &canCom2_recvBuff2);

    /* S-Function (fcan_mpc_receive): '<S233>/Obj_Temp_Fb2' */
    FLEXCAN_DRV_Receive(2, 3, &canCom2_recvBuff3);

    /* End of Outputs for SubSystem: '<S3>/CAN_init' */
  }

  /* End of If: '<S3>/If1' */

  /* If: '<S3>/If2' incorporates:
   *  DataStoreRead: '<S3>/Data Store Read3'
   */
  rtAction = -1;
  if (ECU1119_18b_st_DW.Init_flg == 0) {
    rtAction = 0;
  }

  if (rtAction == 0) {
    /* Outputs for IfAction SubSystem: '<S3>/Init' incorporates:
     *  ActionPort: '<S234>/Action Port'
     */
    /* Chart: '<S234>/Chart' incorporates:
     *  DataStoreRead: '<S234>/Data Store Read1'
     */
    if (ECU1119_18b_st_DW.temporalCounter_i1 < 1023U) {
      ECU1119_18b_st_DW.temporalCounter_i1++;
    }

    if (ECU1119_18b_st_DW.is_active_c5_ECU1119_18b_st == 0U) {
      ECU1119_18b_st_DW.is_active_c5_ECU1119_18b_st = 1U;
      ECU1119_18b_st_DW.is_c5_ECU1119_18b_st = ECU1119_18b_st_IN_POWER_ON;
      rtb_Flg_n = 1;
    } else {
      switch (ECU1119_18b_st_DW.is_c5_ECU1119_18b_st) {
       case ECU1119_18b_st_IN_POWER_HOLD:
        if (KeyOn) {
          ECU1119_18b_st_DW.is_c5_ECU1119_18b_st = ECU1119_18b_st_IN_POWER_ON;
          rtb_Flg_n = 1;
        } else if (ECU1119_18b_st_DW.temporalCounter_i1 >= 1000U) {
          ECU1119_18b_st_DW.is_c5_ECU1119_18b_st = ECU1119_18b_st_IN_POWER_OFF;
          rtb_Flg_n = 0;
        } else {
          rtb_Flg_n = 1;
        }
        break;

       case ECU1119_18b_st_IN_POWER_OFF:
        rtb_Flg_n = 0;
        break;

       default:
        if (!KeyOn) {
          ECU1119_18b_st_DW.is_c5_ECU1119_18b_st = ECU1119_18b_st_IN_POWER_HOLD;
          ECU1119_18b_st_DW.temporalCounter_i1 = 0U;
          rtb_Flg_n = 1;
        } else {
          rtb_Flg_n = 1;
        }
        break;
      }
    }

    /* End of Chart: '<S234>/Chart' */

    /* DataTypeConversion: '<S234>/Data Type Conversion1' incorporates:
     *  DataStoreWrite: '<S234>/Data Store Write'
     */
    LS001 = (rtb_Flg_n != 0);

    /* DataStoreWrite: '<S234>/Data Store Write3' */
    ECU1119_18b_st_DW.Init_flg = ECU1119_18b_st_ConstB.DataTypeConversion_o;

    /* End of Outputs for SubSystem: '<S3>/Init' */
  }

  /* End of If: '<S3>/If2' */
  /* End of Outputs for SubSystem: '<Root>/Init' */
  /* Product: '<S210>/Divide3' incorporates:
   *  Constant: '<S210>/Freq_MC3'
   *  Constant: '<S210>/Pre5'
   *  DataStoreRead: '<S210>/Data Store Read5'
   */
  rtb_Divide2 = 1.25E+6 / LSO3_ETC_FRQ;

  /* Product: '<S210>/Product1' incorporates:
   *  DataStoreRead: '<S210>/Data Store Read4'
   */
  rtb_Add3 = LSO3_ETC_DC * rtb_Divide2;

  /* DataTypeConversion: '<S217>/Data Type Conversion1' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion1 = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S217>/Data Type Conversion1' */

  /* Sum: '<S210>/Add1' */
  rtb_Add3 = rtb_Divide2 - rtb_Add3;

  /* DataTypeConversion: '<S217>/Data Type Conversion2' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion2 = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S217>/Data Type Conversion2' */

  /* Product: '<S210>/Divide4' incorporates:
   *  Constant: '<S210>/Freq_MC4'
   *  Constant: '<S210>/Pre4'
   *  DataStoreRead: '<S210>/Data Store Read3'
   */
  rtb_Divide2 = 1.25E+6 / LSO17_ETC_FRQ;

  /* Product: '<S210>/Product2' incorporates:
   *  DataStoreRead: '<S210>/Data Store Read1'
   */
  rtb_Add3 = LSO17_ETC_DC * rtb_Divide2;

  /* DataTypeConversion: '<S216>/Data Type Conversion1' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion1_k = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S216>/Data Type Conversion1' */

  /* Sum: '<S210>/Add2' */
  rtb_Add3 = rtb_Divide2 - rtb_Add3;

  /* DataTypeConversion: '<S216>/Data Type Conversion2' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion2_i = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S216>/Data Type Conversion2' */

  /* Product: '<S210>/Divide2' incorporates:
   *  Constant: '<S210>/Freq_MC5'
   *  Constant: '<S210>/Pre3'
   *  DataStoreRead: '<S210>/Data Store Read13'
   */
  rtb_Divide2 = 1.25E+6 / LSO18_ETC_FRQ;

  /* Product: '<S210>/Product6' incorporates:
   *  DataStoreRead: '<S210>/Data Store Read12'
   */
  rtb_Add3 = LSO18_ETC_DC * rtb_Divide2;

  /* DataTypeConversion: '<S215>/Data Type Conversion1' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion1_a = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S215>/Data Type Conversion1' */

  /* Sum: '<S210>/Add3' */
  rtb_Add3 = rtb_Divide2 - rtb_Add3;

  /* DataTypeConversion: '<S215>/Data Type Conversion2' */
  tmp = floor(rtb_Add3);
  if (rtIsNaN(tmp) || rtIsInf(tmp)) {
    tmp = 0.0;
  } else {
    tmp = fmod(tmp, 65536.0);
  }

  ECU1119_18b_st_B.DataTypeConversion2_e = (uint16_T)(tmp < 0.0 ? (int32_T)
    (uint16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(uint16_T)tmp);

  /* End of DataTypeConversion: '<S215>/Data Type Conversion2' */

  /* Update for DiscreteIntegrator: '<S168>/Integrator' incorporates:
   *  Constant: '<S13>/Constant1'
   *  Product: '<S157>/IProd Out'
   *  Sum: '<S136>/SumI2'
   *  Sum: '<S136>/SumI4'
   */
  ECU1119_18b_st_DW.Integrator_DSTATE += ((rtb_Sum - rtb_Sum) + rtb_Add_bs *
    0.045) * 0.005;

  /* Update for DiscreteIntegrator: '<S150>/Filter' */
  ECU1119_18b_st_DW.Filter_DSTATE += 0.005 * rtb_NProdOut;

  /* Update for DiscreteIntegrator: '<S70>/Integrator' incorporates:
   *  Sum: '<S38>/SumI4'
   */
  ECU1119_18b_st_DW.Integrator_DSTATE_a += (rtb_SumI2 + rtb_EGRErr) * 0.005;

  /* Update for DiscreteIntegrator: '<S52>/Filter' */
  ECU1119_18b_st_DW.Filter_DSTATE_m += 0.005 * rtb_NProdOut_c;
}

/* Model initialize function */
void ECU1119_18b_st_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize error status */
  rtmSetErrorStatus(ECU1119_18b_st_M, (NULL));

  /* block I/O */
  (void) memset(((void *) &ECU1119_18b_st_B), 0,
                sizeof(B_ECU1119_18b_st_T));

  /* exported global signals */
  ThrottleCmd_pct = 0.0;

  /* states (dwork) */
  (void) memset((void *)&ECU1119_18b_st_DW, 0,
                sizeof(DW_ECU1119_18b_st_T));

  /* exported global states */
  Cnt_SLOW2 = 0U;
  Cnt_TEMP1 = 0U;
  VCU_Mode = 0U;
  Cnt_TEMP2 = 0U;
  Cnt_SLOW1 = 0U;
  Cnt_FAST_OUT = 0U;
  Cnt_SLOW_OUT = 0U;
  ResetFlg = 0U;
  Cnt_FAST1 = 0U;
  Cnt_FAST2 = 0U;
  Init_flg_SPI = 0U;
  KeyOn = false;
  LS007 = false;
  LS012 = false;
  LS013 = false;
  LS018 = false;
  LS019 = false;
  LS003 = false;
  LS017 = false;
  LS014 = false;
  LS015 = false;
  LS009 = false;
  LS016 = false;
  LS004 = false;
  LS011 = false;
  LS001 = false;
  LS002 = false;
  LS010 = false;
  LS008 = false;
  LS006 = false;

  /* custom states */
  HSO08_PWM_DC = 0.0F;
  HSO08_PWM_FRQ = 0.0F;
  HSO14_PWM_DC = 0.0F;
  HSO14_PWM_FRQ = 0.0F;
  LSO18_ETC_DC = 0.0F;
  LSO18_ETC_FRQ = 0.0F;
  LSO19_PWM_DC = 0.0F;
  LSO19_PWM_FRQ = 0.0F;
  DI31_PWM_DC = 0.0F;
  DI31_PWM_FRQ = 0.0F;
  DI32_PWM_DC = 0.0F;
  DI32_PWM_FRQ = 0.0F;
  DI33_PWM_DC = 0.0F;
  DI33_PWM_FRQ = 0.0F;
  DI34_PWM_DC = 0.0F;
  DI34_PWM_FRQ = 0.0F;
  LSO17_ETC_FRQ = 0.0F;
  LSO3_ETC_DC = 0.0F;
  LSO3_ETC_FRQ = 0.0F;
  HS008_ETC_FRQ = 0.0F;
  HSO14_ETC_FRQ = 0.0F;
  LSO19_ETC_DC = 0.0F;
  LSO19_ETC_FRQ = 0.0F;
  AI03 = 0.0F;
  AI19 = 0.0F;
  AI11 = 0.0F;
  AI16 = 0.0F;
  AI18 = 0.0F;
  AI06 = 0.0F;
  AI07 = 0.0F;
  AI08 = 0.0F;
  AI12 = 0.0F;
  AI15 = 0.0F;
  AI17 = 0.0F;
  AI04 = 0.0F;
  AI05 = 0.0F;
  AI09 = 0.0F;
  AI20 = 0.0F;
  LSO17_ETC_DC = 0.0F;
  HS014_ETC_DC = 0.0F;
  HS008_ETC_DC = 0.0F;
  HS001 = false;
  HS008 = false;
  HS002 = false;
  HS014 = false;
  HS003 = false;
  HS007 = false;
  HS004 = false;
  HS005 = false;
  HS010 = false;
  DI31 = false;
  DI32 = false;
  DI33 = false;
  DI07 = false;
  DI01 = false;
  DI10 = false;
  DI13 = false;
  DI15 = false;
  DI16 = false;
  DI17 = false;
  DI18 = false;
  DI02 = false;
  DI03 = false;
  DI34 = false;
  DI04 = false;
  DI12 = false;
  DI08 = false;
  DI09 = false;
  HS006 = false;

  /* Start for S-Function (fcan_mpc_config): '<Root>/FCAN_Config4' */
  {
    const flexcan_user_config_t canCom1_InitConfig = {
      .pe_clock = FLEXCAN_CLK_SOURCE_PERIPH,
      .max_num_mb = 63U,
      .num_id_filters = FLEXCAN_RX_FIFO_ID_FILTERS_8,
      .is_rx_fifo_needed = false,
      .flexcanMode = FLEXCAN_NORMAL_MODE,

      /* Bitrate: 250U and clock frequency: 67000000U */
      .bitrate = {
        .propSeg = 7U,
        .phaseSeg1 = 2U,
        .phaseSeg2 = 1U,
        .preDivider = 18U,
        .rJumpwidth = 2U
      },
      .transfer_type = FLEXCAN_RXFIFO_USING_INTERRUPTS,
    };

    /* Enable CAN1 clock */
    MBDT_SetPeripheralClockControl(FLEXCAN1_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);

    /* pin config */
    pin_settings_config_t pin_vect[] = {
      /* Tx pin */
      {
        .base = SIUL2,
        .pinPortIdx = 14U,
        .mux = PORT_MUX_ALT1,
        .direction = GPIO_OUTPUT_DIRECTION,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTA,
      },

      /* Rx pin */
      {
        .base = SIUL2,
        .pinPortIdx = 15U,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .mux = PORT_MUX_AS_GPIO,
        .gpioBase = PTA,
        .inputMuxReg[0] = 33U,
        .inputMux[0] = PORT_MUX_ALT1,
        .inputMux[1] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[2] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[3] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[4] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[5] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[6] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[7] = PORT_INPUT_MUX_NO_INIT,
        .outputBuffer = PORT_OUTPUT_BUFFER_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_ENABLED,
        .safeMode = PORT_SAFE_MODE_DISABLED,
        .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
      } };

    PINS_DRV_Init(2, pin_vect);
    FLEXCAN_DRV_Init(1, &canCom1_State, &canCom1_InitConfig);
  }

  /* Start for S-Function (fcan_mpc_config): '<Root>/FCAN_Config6' */
  {
    const flexcan_user_config_t canCom2_InitConfig = {
      .pe_clock = FLEXCAN_CLK_SOURCE_PERIPH,
      .max_num_mb = 63U,
      .num_id_filters = FLEXCAN_RX_FIFO_ID_FILTERS_8,
      .is_rx_fifo_needed = false,
      .flexcanMode = FLEXCAN_NORMAL_MODE,

      /* Bitrate: 500U and clock frequency: 67000000U */
      .bitrate = {
        .propSeg = 7U,
        .phaseSeg1 = 6U,
        .phaseSeg2 = 2U,
        .preDivider = 6U,
        .rJumpwidth = 3U
      },
      .transfer_type = FLEXCAN_RXFIFO_USING_INTERRUPTS,
    };

    /* Enable CAN2 clock */
    MBDT_SetPeripheralClockControl(FLEXCAN2_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);

    /* pin config */
    pin_settings_config_t pin_vect[] = {
      /* Tx pin */
      {
        .base = SIUL2,
        .pinPortIdx = 94U,
        .mux = PORT_MUX_ALT2,
        .direction = GPIO_OUTPUT_DIRECTION,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTF,
      },

      /* Rx pin */
      {
        .base = SIUL2,
        .pinPortIdx = 95U,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .mux = PORT_MUX_AS_GPIO,
        .gpioBase = PTF,
        .inputMuxReg[0] = 34U,
        .inputMux[0] = PORT_MUX_ALT1,
        .inputMux[1] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[2] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[3] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[4] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[5] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[6] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[7] = PORT_INPUT_MUX_NO_INIT,
        .outputBuffer = PORT_OUTPUT_BUFFER_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_ENABLED,
        .safeMode = PORT_SAFE_MODE_DISABLED,
        .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
      } };

    PINS_DRV_Init(2, pin_vect);
    FLEXCAN_DRV_Init(2, &canCom2_State, &canCom2_InitConfig);
  }

  /* Start for DiscretePulseGenerator: '<S4>/Pulse Generator' */
  ECU1119_18b_st_DW.clockTickCounter = 0;

  /* Start for S-Function (gpio_mpc_output): '<S5>/HS1' */
  {
    /* Enable clock */
    MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_3,
      MC_ME_PERIPH_CONFIG_2);

    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 86U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S5>/HS4' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 13U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTA,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (fcan_mpc_isr): '<S7>/CAN0_Rx_500' incorporates:
   *  SubSystem: '<S7>/CAN2'
   */
  ECU1119_18b_st_CAN2_Start();
  FLEXCAN_DRV_InstallEventCallback(2, fcan2_mpc_event_callback, (void *)0);

  /* End of Start for S-Function (fcan_mpc_isr): '<S7>/CAN0_Rx_500' */

  /* Start for DiscretePulseGenerator: '<S8>/Pulse Generator' */
  ECU1119_18b_st_DW.clockTickCounter_d = 0;

  /* Start for DiscretePulseGenerator: '<S8>/Pulse Generator1' */
  ECU1119_18b_st_DW.clockTickCounter_g = 0;

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS001' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 85U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS007' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 87U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS002 ' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 84U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS003' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 83U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS004' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 22U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTB,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS005' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 12U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTA,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S211>/HS010' */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 89U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S213>/LS_EN' incorporates:
   *  Constant: '<S213>/Constant'
   */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 2U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTA,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S213>/LS_rst2' incorporates:
   *  Constant: '<S213>/Constant1'
   */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 1U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTA,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S213>/LS_rst1' incorporates:
   *  Constant: '<S213>/Constant2'
   */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 42U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTC,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S214>/LS_EN1' incorporates:
   *  Constant: '<S214>/Constant1'
   */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 90U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTF,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for S-Function (gpio_mpc_output): '<S214>/LS_rst' incorporates:
   *  Constant: '<S214>/Constant3'
   */
  {
    /* Configure the output port init structure. */
    const pin_settings_config_t pin = {
      .base = SIUL2,
      .pinPortIdx = 46U,
      .mux = PORT_MUX_AS_GPIO,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,

#ifdef FEATURE_PINS_HAS_DRIVE_STRENGTH_CONTROL

      .driveSelect = PORT_STRENGTH_DISABLED
#endif
      .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,

#ifdef FEATURE_SIUL2_HAS_ANALOG_PAD

      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_ENABLED,

#endif

      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_OUTPUT

      .invertOutput = PORT_INVERT_OUTPUT_DISABLED,

#endif

#ifdef FEATURE_SIUL2_HAS_INVERT_DATA_INPUT

      .inputInvert = PORT_INVERT_INPUT_DISABLED,

#endif

      .gpioBase = PTC,
      .initValue = 1u,
      .direction = GPIO_OUTPUT_DIRECTION
    };

    /* Initialize pin structure */
    PINS_DRV_Init(1, &pin);
  }

  /* Start for Atomic SubSystem: '<Root>/Init' */
  /* Start for IfAction SubSystem: '<S3>/CAN_init' */
  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Fast_Fb1' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 0, &rxInfo, 0x101);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 0, 0xFFFFFFFF);
  }

  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Fast_Fb2' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 1, &rxInfo, 0x102);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 1, 0xFFFFFFFF);
  }

  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Slow_Fb1' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 4, &rxInfo, 0x105);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 4, 0xFFFFFFFF);
  }

  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Slow_Fb2' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 5, &rxInfo, 0x106);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 5, 0xFFFFFFFF);
  }

  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Temp_Fb1' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 2, &rxInfo, 0x103);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 2, 0xFFFFFFFF);
  }

  /* Start for S-Function (fcan_mpc_receive): '<S233>/Obj_Temp_Fb2' */
  {
    flexcan_msgbuff_id_type_t msg_id_type = FLEXCAN_MSG_ID_STD;
    flexcan_data_info_t rxInfo = {
      .msg_id_type = FLEXCAN_MSG_ID_STD,
      .data_length = 8,
      .is_remote = false
    };

    FLEXCAN_DRV_ConfigRxMb(2, 3, &rxInfo, 0x104);
    FLEXCAN_DRV_SetRxMaskType(2, FLEXCAN_RX_MASK_INDIVIDUAL);
    FLEXCAN_DRV_SetRxIndividualMask(2, msg_id_type, 3, 0xFFFFFFFF);
  }

  /* End of Start for SubSystem: '<S3>/CAN_init' */
  /* End of Start for SubSystem: '<Root>/Init' */

  /* Start for S-Function (fm_mpc_config): '<Root>/FreeMaster_Config' */
  pin_settings_config_t pin_vect[] = {
    /* Tx pin */
    {
      .base = SIUL2,
      .pinPortIdx = 16U,
      .mux = PORT_MUX_ALT1,
      .direction = GPIO_OUTPUT_DIRECTION,
      .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,
      .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
      .safeMode = PORT_SAFE_MODE_ENABLED,
      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
      .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
      .gpioBase = PTB,
    },

    /* Rx pin */
    {
      .base = SIUL2,
      .pinPortIdx = 17U,
      .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
      .openDrain = PORT_OPEN_DRAIN_DISABLED,
      .mux = PORT_MUX_AS_GPIO,
      .gpioBase = PTB,
      .inputMuxReg[0] = 32U,
      .inputMux[0] = PORT_MUX_ALT2,
      .inputMux[1] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[2] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[3] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[4] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[5] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[6] = PORT_INPUT_MUX_NO_INIT,
      .inputMux[7] = PORT_INPUT_MUX_NO_INIT,
      .outputBuffer = PORT_OUTPUT_BUFFER_DISABLED,
      .inputBuffer = PORT_INPUT_BUFFER_ENABLED,
      .safeMode = PORT_SAFE_MODE_DISABLED,
      .slewRateCtrlSel = FULL_STRENGTH_WITHOUT_SLEWRATE_CONTROL,
      .hysteresisSelect = PORT_HYSTERESYS_DISABLED,
      .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
    } };

  PINS_DRV_Init(2, pin_vect);

  /* Initialize FreeMaster. */
  freemaster_interface_init();
  FMSTR_Init();

  /* Start for S-Function (spi_mpc_config): '<Root>/SPI_Config_CANB&LS' */
  {
    /* Enable SPI clock */
    MBDT_SetPeripheralClockControl(SPI3_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);

    /* Enable clock for pins */
    MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);
  }

  {
    /* Setup SPI pins */
    pin_settings_config_t spi_pin_mux[5] = {
      /* SIN pin settings */
      {
        /* PTE15 pin selected */
        .base = SIUL2,
        .pinPortIdx = 79U,
        .mux = PORT_MUX_AS_GPIO,
        .outputBuffer = PORT_OUTPUT_BUFFER_DISABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_ENABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTE,
        .intConfig =
        {
          .intEdgeSel = SIUL2_INT_DISABLE
        },
        .inputMux[0] = PORT_MUX_ALT4,
        .inputInvert[0] = PORT_INVERT_INPUT_DISABLED,
        .inputMuxReg[0] = 50U,
        .inputMux[1] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[2] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[3] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[4] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[5] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[6] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[7] = PORT_INPUT_MUX_NO_INIT
      },

      /* SOUT pin settings */
      {
        /* PTE14 pin selected */
        .base = SIUL2,
        .pinPortIdx = 78U,
        .mux = PORT_MUX_ALT2,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTE
      },

      /* PCS settings */
      {
        /* PTD12 pin selected */
        .base = SIUL2,
        .pinPortIdx = 60U,
        .mux = PORT_MUX_ALT3,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTD
      },

      /* PCS settings */
      {
        /* PTD14 pin selected */
        .base = SIUL2,
        .pinPortIdx = 62U,
        .mux = PORT_MUX_ALT3,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTD
      },

      /* SCK */
      {
        /* PTE13 pin selected */
        .base = SIUL2,
        .pinPortIdx = 77U,
        .mux = PORT_MUX_ALT4,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTE
      }
    };

    PINS_DRV_Init(5, spi_pin_mux);

    /* Configure the SPI init structure. */
    dspi_master_config_t spiConfig3 = {
      .bitsPerSec = 500000U,
      .whichPCS = 0,
      .pcsPolarity = DSPI_ACTIVE_LOW,
      .continuousPCS = true,
      .bitcount = 16U,
      .clkPhase = DSPI_CLOCK_PHASE_2ND_EDGE,
      .clkPolarity = DSPI_ACTIVE_HIGH,
      .lsbFirst = false,
      .transferType = DSPI_USING_INTERRUPTS,
      .callback = (spi_callback_t)spi_master_transfer_callback3,
    };

    /* Initializes an SPI instance for interrupt driven master mode operation */
    DSPI_MasterInit(3, &spiMasterState3, &spiConfig3);
  }

  /* Start for S-Function (spi_mpc_config): '<Root>/SPI_Config_EEPROM&LS' */
  {
    /* Enable SPI clock */
    MBDT_SetPeripheralClockControl(SPI0_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);

    /* Enable clock for pins */
    MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
      MC_ME_PERIPH_CONFIG_3);
  }

  {
    /* Setup SPI pins */
    pin_settings_config_t spi_pin_mux[6] = {
      /* SIN pin settings */
      {
        /* PTC7 pin selected */
        .base = SIUL2,
        .pinPortIdx = 39U,
        .mux = PORT_MUX_AS_GPIO,
        .outputBuffer = PORT_OUTPUT_BUFFER_DISABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_ENABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTC,
        .intConfig =
        {
          .intEdgeSel = SIUL2_INT_DISABLE
        },
        .inputMux[0] = PORT_MUX_ALT1,
        .inputInvert[0] = PORT_INVERT_INPUT_DISABLED,
        .inputMuxReg[0] = 41U,
        .inputMux[1] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[2] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[3] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[4] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[5] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[6] = PORT_INPUT_MUX_NO_INIT,
        .inputMux[7] = PORT_INPUT_MUX_NO_INIT
      },

      /* SOUT pin settings */
      {
        /* PTC6 pin selected */
        .base = SIUL2,
        .pinPortIdx = 38U,
        .mux = PORT_MUX_ALT1,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTC
      },

      /* PCS settings */
      {
        /* PTC4 pin selected */
        .base = SIUL2,
        .pinPortIdx = 36U,
        .mux = PORT_MUX_ALT1,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTC
      },

      /* PCS settings */
      {
        /* PTG8 pin selected */
        .base = SIUL2,
        .pinPortIdx = 104U,
        .mux = PORT_MUX_ALT2,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTG
      },

      /* PCS settings */
      {
        /* PTD8 pin selected */
        .base = SIUL2,
        .pinPortIdx = 56U,
        .mux = PORT_MUX_ALT3,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTD
      },

      /* SCK */
      {
        /* PTC5 pin selected */
        .base = SIUL2,
        .pinPortIdx = 37U,
        .mux = PORT_MUX_ALT1,
        .outputBuffer = PORT_OUTPUT_BUFFER_ENABLED,
        .openDrain = PORT_OPEN_DRAIN_DISABLED,
        .slewRateCtrlSel = HALF_STRENGTH_WITH_SLEWRATE_CONTROL,
        .hysteresisSelect = PORT_HYSTERESYS_ENABLED,
        .safeMode = PORT_SAFE_MODE_ENABLED,
        .analogPadCtrlSel = PORT_ANALOG_PAD_CONTROL_DISABLED,
        .inputBuffer = PORT_INPUT_BUFFER_DISABLED,
        .pullConfig = PORT_INTERNAL_PULL_NOT_ENABLED,
        .gpioBase = PTC
      }
    };

    PINS_DRV_Init(6, spi_pin_mux);

    /* Configure the SPI init structure. */
    dspi_master_config_t spiConfig0 = {
      .bitsPerSec = 500000U,
      .whichPCS = 0,
      .pcsPolarity = DSPI_ACTIVE_LOW,
      .continuousPCS = true,
      .bitcount = 16U,
      .clkPhase = DSPI_CLOCK_PHASE_2ND_EDGE,
      .clkPolarity = DSPI_ACTIVE_HIGH,
      .lsbFirst = false,
      .transferType = DSPI_USING_INTERRUPTS,
      .callback = (spi_callback_t)spi_master_transfer_callback0,
    };

    /* Initializes an SPI instance for interrupt driven master mode operation */
    DSPI_MasterInit(0, &spiMasterState0, &spiConfig0);
  }

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr0Ch2PinsCfg);

  /* Un-gate eTimer clock*/
  MBDT_SetPeripheralClockControl(ETIMER0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);

  /* Initializes the ETIMER module. */
  ETIMER_DRV_Init(ETIMER_MODULE_0);

  /* Initializes the channel 2. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_0, ETIMER_IRQ_CH2, &eTmr0Ch2Cfg);

  /* Setting the CNTR channel 2 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_0, 2, 0U);

  /* Starts channel 2 counting. */
  ETIMER_DRV_StartTimerChannels(ETIMER_MODULE_0, ETIMER_ENABLE_CH2);

  /* Starts channel 2 capture arming*/
  ETIMER_DRV_StartCapture(ETIMER_MODULE_0, 2);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config1' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch2PinsCfg);

  /* Un-gate eTimer clock*/
  MBDT_SetPeripheralClockControl(ETIMER1_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);

  /* Initializes the ETIMER module. */
  ETIMER_DRV_Init(ETIMER_MODULE_1);

  /* Initializes the channel 2. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH2, &eTmr1Ch2Cfg);

  /* Setting the CNTR channel 2 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 2, 0U);

  /* Starts channel 2 counting. */
  ETIMER_DRV_StartTimerChannels(ETIMER_MODULE_1, ETIMER_ENABLE_CH2);

  /* Starts channel 2 capture arming*/
  ETIMER_DRV_StartCapture(ETIMER_MODULE_1, 2);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config10' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr0Ch3PinsCfg);

  /* Initializes the channel 3. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_0, ETIMER_IRQ_CH3, &eTmr0Ch3Cfg);

  /* Setting the CNTR channel 3 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_0, 3, 1U);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config11' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr0Ch5PinsCfg);

  /* Initializes the channel 5. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_0, ETIMER_IRQ_CH5, &eTmr0Ch5Cfg);

  /* Setting the CNTR channel 5 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_0, 5, 1U);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config12' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr2Ch2PinsCfg);

  /* Un-gate eTimer clock*/
  MBDT_SetPeripheralClockControl(ETIMER2_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);

  /* Initializes the ETIMER module. */
  ETIMER_DRV_Init(ETIMER_MODULE_2);

  /* Initializes the channel 2. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_2, ETIMER_IRQ_CH2, &eTmr2Ch2Cfg);

  /* Setting the CNTR channel 2 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_2, 2, 1U);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config13' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch0PinsCfg);

  /* Initializes the channel 0. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH0, &eTmr1Ch0Cfg);

  /* Setting the CNTR channel 0 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 0, 0U);

  /* Starts channel 0 counting. */
  ETIMER_DRV_StartTimerChannels(ETIMER_MODULE_1, ETIMER_ENABLE_CH0);

  /* Starts channel 0 capture arming*/
  ETIMER_DRV_StartCapture(ETIMER_MODULE_1, 0);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config2' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch3PinsCfg);

  /* Initializes the channel 3. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH3, &eTmr1Ch3Cfg);

  /* Setting the CNTR channel 3 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 3, 0U);

  /* Starts channel 3 counting. */
  ETIMER_DRV_StartTimerChannels(ETIMER_MODULE_1, ETIMER_ENABLE_CH3);

  /* Starts channel 3 capture arming*/
  ETIMER_DRV_StartCapture(ETIMER_MODULE_1, 3);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config3' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch1PinsCfg);

  /* Initializes the channel 1. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH1, &eTmr1Ch1Cfg);

  /* Setting the CNTR channel 1 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 1, 0U);

  /* Starts channel 1 counting. */
  ETIMER_DRV_StartTimerChannels(ETIMER_MODULE_1, ETIMER_ENABLE_CH1);

  /* Starts channel 1 capture arming*/
  ETIMER_DRV_StartCapture(ETIMER_MODULE_1, 1);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config8' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch4PinsCfg);

  /* Initializes the channel 4. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH4, &eTmr1Ch4Cfg);

  /* Setting the CNTR channel 4 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 4, 1U);

  /* Start for S-Function (etimer_mpc_config): '<Root>/eTimer_Config9' */

  /* Enable clock for pins */
  MBDT_SetPeripheralClockControl(SIUL0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  PINS_DRV_Init(1, eTmr1Ch5PinsCfg);

  /* Initializes the channel 5. */
  ETIMER_DRV_InitChannel(ETIMER_MODULE_1, ETIMER_IRQ_CH5, &eTmr1Ch5Cfg);

  /* Setting the CNTR channel 5 value. */
  ETIMER_DRV_SetTimerTicks(ETIMER_MODULE_1, 5, 1U);

  /* Start for DataStoreMemory: '<Root>/Data Store Memory106' */
  HSO08_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory108' */
  HSO14_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory110' */
  LSO18_ETC_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory112' */
  LSO19_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory113' */
  DI31_PWM_DC = 0.5F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory114' */
  DI31_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory115' */
  DI32_PWM_DC = 0.5F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory117' */
  DI32_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory118' */
  DI33_PWM_DC = 0.5F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory119' */
  DI33_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory120' */
  DI34_PWM_DC = 0.5F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory121' */
  DI34_PWM_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory122' */
  LSO17_ETC_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory124' */
  LSO3_ETC_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory129' */
  HS008_ETC_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory130' */
  HSO14_ETC_FRQ = 200.0F;

  /* Start for DataStoreMemory: '<Root>/Data Store Memory132' */
  LSO19_ETC_FRQ = 200.0F;
  ECU1119_18b_st_PrevZCX.VCU_Cmd_Fast_Trig_ZCE = UNINITIALIZED_ZCSIG;
  ECU1119_18b_st_PrevZCX.VCU_Cmd_Slow_Trig_ZCE = UNINITIALIZED_ZCSIG;

  /* SystemInitialize for Chart: '<S4>/Chart1' */
  ECU1119_18b_st_DW.is_active_c23_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c23_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* SystemInitialize for Chart: '<S4>/Chart2' */
  ECU1119_18b_st_DW.is_active_c24_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c24_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* SystemInitialize for Chart: '<S4>/Chart' */
  ECU1119_18b_st_DW.is_active_c22_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c22_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* SystemInitialize for IfAction SubSystem: '<S4>/CS1 LS' */
  /* SystemInitialize for Chart: '<S236>/Chart' */
  ECU1119_18b_st_DW.is_active_c11_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c11_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* End of SystemInitialize for SubSystem: '<S4>/CS1 LS' */

  /* SystemInitialize for IfAction SubSystem: '<S4>/CS3 LS' */
  /* SystemInitialize for Chart: '<S238>/Chart' */
  ECU1119_18b_st_DW.is_active_c14_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c14_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* End of SystemInitialize for SubSystem: '<S4>/CS3 LS' */

  /* SystemInitialize for IfAction SubSystem: '<S4>/CS5 LS' */
  /* SystemInitialize for Chart: '<S239>/Chart' */
  ECU1119_18b_st_DW.is_active_c21_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c21_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* End of SystemInitialize for SubSystem: '<S4>/CS5 LS' */

  /* SystemInitialize for Chart: '<S11>/Chart' */
  ECU1119_18b_st_DW.is_active_c1_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c1_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* SystemInitialize for Atomic SubSystem: '<Root>/Init' */
  /* SystemInitialize for IfAction SubSystem: '<S3>/Init' */
  /* SystemInitialize for Chart: '<S234>/Chart' */
  ECU1119_18b_st_DW.temporalCounter_i1 = 0U;
  ECU1119_18b_st_DW.is_active_c5_ECU1119_18b_st = 0U;
  ECU1119_18b_st_DW.is_c5_ECU1119_18b_st = ECU1119_18b__IN_NO_ACTIVE_CHILD;

  /* End of SystemInitialize for SubSystem: '<S3>/Init' */
  /* End of SystemInitialize for SubSystem: '<Root>/Init' */
}

/* Model terminate function */
void ECU1119_18b_st_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
