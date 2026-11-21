/*
 * File: ECU1119_18b_st.h
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

#ifndef RTW_HEADER_ECU1119_18b_st_h_
#define RTW_HEADER_ECU1119_18b_st_h_
#include <math.h>
#include <stddef.h>
#include <string.h>
#ifndef ECU1119_18b_st_COMMON_INCLUDES_
# define ECU1119_18b_st_COMMON_INCLUDES_
#include <stdint.h>
#include "rtwtypes.h"
#include "zero_crossing_types.h"
#include "flexcan_hw_access.h"
#include "flexcan_driver.h"
#include "interrupt_manager.h"
#include "can_message.h"
#include "device_registers.h"
#include "clock_manager.h"
#include "pins_driver.h"
#include "mbdt_clock.h"
#include "etimer_driver.h"
#include "freemaster.h"
#include "freemaster_interface_init.h"
#include "dspi_driver.h"
#include "dspi_hw_access.h"
#include "osif.h"
#include "edma_driver.h"
#include "fcan2_mpc_event_callback.h"
#include "etimer0_channel2_config.h"
#include "etimer1_channel2_config.h"
#include "etimer0_channel3_config.h"
#include "etimer0_channel5_config.h"
#include "etimer2_channel2_config.h"
#include "etimer1_channel0_config.h"
#include "etimer1_channel3_config.h"
#include "etimer1_channel1_config.h"
#include "etimer1_channel4_config.h"
#include "etimer1_channel5_config.h"
#endif                                 /* ECU1119_18b_st_COMMON_INCLUDES_ */

#include "ECU1119_18b_st_types.h"
#include "rt_zcfcn.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block signals (default storage) */
typedef struct {
  CAN_MESSAGE_BUS VCU_Cmd_Slow;        /* '<S301>/VCU_Cmd_Slow' */
  CAN_MESSAGE_BUS VCU_Cmd_Fast;        /* '<S300>/VCU_Cmd_Fast' */
  CAN_MESSAGE_BUS CAN_Msg_In;          /* '<S277>/Bus Creator' */
  CAN_MESSAGE_BUS CAN_Msg_In_i;        /* '<S275>/Bus Creator' */
  CAN_MESSAGE_BUS CAN_Msg_In_h;        /* '<S273>/Bus Creator' */
  real_T mUREA_target;                 /* '<S10>/Switch' */
  real_T EngineSpdTgt;                 /* '<S13>/EngineSpdTgt' */
  real_T Switch2;                      /* '<S113>/Switch2' */
  real_T EGROpeningTgt_pct;            /* '<S12>/Gain' */
  real_T DataTypeConversion;           /* '<S300>/Data Type Conversion' */
  real_T DataTypeConversion4;          /* '<S300>/Data Type Conversion4' */
  real_T CANUnpack6_o1;                /* '<S277>/CAN Unpack6' */
  real_T CANUnpack6_o2;                /* '<S277>/CAN Unpack6' */
  real_T CANUnpack6_o3;                /* '<S277>/CAN Unpack6' */
  real_T CANUnpack6_o4;                /* '<S277>/CAN Unpack6' */
  real_T DPF_Out_Temp_C;               /* '<S277>/Data Type Conversion1' */
  real_T DOC_Out_Temp_C;               /* '<S277>/Data Type Conversion2' */
  real_T CANUnpack6_o1_l;              /* '<S275>/CAN Unpack6' */
  real_T CANUnpack6_o2_k;              /* '<S275>/CAN Unpack6' */
  real_T CANUnpack6_o3_e;              /* '<S275>/CAN Unpack6' */
  real_T CANUnpack6_o4_j;              /* '<S275>/CAN Unpack6' */
  real_T NOx_SCR_In_gph;               /* '<S275>/Data Type Conversion1' */
  real_T SootLoad_g;                   /* '<S275>/Data Type Conversion3' */
  real_T CANUnpack6_o1_p;              /* '<S273>/CAN Unpack6' */
  real_T CANUnpack6_o2_f;              /* '<S273>/CAN Unpack6' */
  real_T CANUnpack6_o3_l;              /* '<S273>/CAN Unpack6' */
  real_T CANUnpack6_o4_n;              /* '<S273>/CAN Unpack6' */
  real_T EGR_Ratio_Act;                /* '<S273>/Data Type Conversion1' */
  real_T EngSpeed_rpm;                 /* '<S273>/Data Type Conversion2' */
  real_T FuelCycle_Act_mg;             /* '<S273>/Data Type Conversion3' */
  real_T high;                         /* '<S238>/Chart' */
  real_T low;                          /* '<S238>/Chart' */
  uint32_T CAN0_Rx_500_o3;             /* '<S7>/CAN0_Rx_500' */
  uint16_T CAN0_Rx_500_o6;             /* '<S7>/CAN0_Rx_500' */
  uint16_T DataTypeConversion1;        /* '<S217>/Data Type Conversion1' */
  uint16_T DataTypeConversion2;        /* '<S217>/Data Type Conversion2' */
  uint16_T DataTypeConversion1_k;      /* '<S216>/Data Type Conversion1' */
  uint16_T DataTypeConversion2_i;      /* '<S216>/Data Type Conversion2' */
  uint16_T DataTypeConversion1_a;      /* '<S215>/Data Type Conversion1' */
  uint16_T DataTypeConversion2_e;      /* '<S215>/Data Type Conversion2' */
  uint8_T CAN0_Rx_500_o2;              /* '<S7>/CAN0_Rx_500' */
  uint8_T CAN0_Rx_500_o4[8];           /* '<S7>/CAN0_Rx_500' */
  uint8_T CAN0_Rx_500_o5;              /* '<S7>/CAN0_Rx_500' */
  uint8_T SPI_Master_Transfer_To2[2];  /* '<S238>/SPI_Master_Transfer_To2' */
  uint8_T VectorConcatenate1[2];       /* '<S238>/Vector Concatenate1' */
  uint8_T SPI_Master_Transfer_To1[2];  /* '<S239>/SPI_Master_Transfer_To1' */
  uint8_T VectorConcatenate1_o[2];     /* '<S239>/Vector Concatenate1' */
  uint8_T SPI_Master_Transfer_To1_b[2];/* '<S236>/SPI_Master_Transfer_To1' */
  uint8_T VectorConcatenate1_j[2];     /* '<S236>/Vector Concatenate1' */
  uint8_T SPI_Master_Transfer_To2_b[2];/* '<S237>/SPI_Master_Transfer_To2' */
  uint8_T SPI_Master_Transfer_To2_j[2];/* '<S231>/SPI_Master_Transfer_To2' */
  uint8_T VectorConcatenate2[2];       /* '<S231>/Vector Concatenate2' */
  uint8_T SPI_Master_Transfer_To1_k[2];/* '<S227>/SPI_Master_Transfer_To1' */
  uint8_T VectorConcatenate1_p[2];     /* '<S227>/Vector Concatenate1' */
  uint8_T SPI_Master_Transfer_To1_l[2];/* '<S226>/SPI_Master_Transfer_To1' */
  uint8_T VectorConcatenate1_b[2];     /* '<S226>/Vector Concatenate1' */
  boolean_T DataStoreRead9;            /* '<S211>/Data Store Read9' */
  boolean_T DataStoreRead7;            /* '<S211>/Data Store Read7' */
  boolean_T DataStoreRead6;            /* '<S211>/Data Store Read6' */
  boolean_T DataStoreRead5;            /* '<S211>/Data Store Read5' */
  boolean_T DataStoreRead4;            /* '<S211>/Data Store Read4' */
  boolean_T DataStoreRead2;            /* '<S211>/Data Store Read2' */
  boolean_T DataStoreRead;             /* '<S211>/Data Store Read' */
  boolean_T Regen_Request;             /* '<S11>/Chart' */
  boolean_T PostInj_Request;           /* '<S11>/Chart' */
} B_ECU1119_18b_st_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Integrator_DSTATE;            /* '<S168>/Integrator' */
  real_T Filter_DSTATE;                /* '<S150>/Filter' */
  real_T Integrator_DSTATE_a;          /* '<S70>/Integrator' */
  real_T Filter_DSTATE_m;              /* '<S52>/Filter' */
  real_T cnt;                          /* '<S238>/Chart' */
  real_T cnt_l;                        /* '<S239>/Chart' */
  real_T cnt_b;                        /* '<S236>/Chart' */
  real_T cnt_lz;                       /* '<S4>/Chart2' */
  real_T cnt_li;                       /* '<S4>/Chart1' */
  int32_T clockTickCounter;            /* '<S4>/Pulse Generator' */
  int32_T clockTickCounter_d;          /* '<S8>/Pulse Generator' */
  int32_T clockTickCounter_g;          /* '<S8>/Pulse Generator1' */
  int_T VCU_Cmd_Slow_ModeSignalID;     /* '<S301>/VCU_Cmd_Slow' */
  int_T VCU_Cmd_Fast_ModeSignalID;     /* '<S300>/VCU_Cmd_Fast' */
  int_T CANUnpack6_ModeSignalID;       /* '<S277>/CAN Unpack6' */
  int_T CANUnpack6_StatusPortID;       /* '<S277>/CAN Unpack6' */
  int_T CANUnpack6_ModeSignalID_o;     /* '<S275>/CAN Unpack6' */
  int_T CANUnpack6_StatusPortID_l;     /* '<S275>/CAN Unpack6' */
  int_T CANUnpack6_ModeSignalID_ob;    /* '<S273>/CAN Unpack6' */
  int_T CANUnpack6_StatusPortID_i;     /* '<S273>/CAN Unpack6' */
  uint16_T temporalCounter_i1;         /* '<S234>/Chart' */
  uint8_T Init_flg;                    /* '<Root>/Data Store Memory4' */
  uint8_T is_active_c14_ECU1119_18b_st;/* '<S238>/Chart' */
  uint8_T is_c14_ECU1119_18b_st;       /* '<S238>/Chart' */
  uint8_T is_active_c21_ECU1119_18b_st;/* '<S239>/Chart' */
  uint8_T is_c21_ECU1119_18b_st;       /* '<S239>/Chart' */
  uint8_T is_active_c11_ECU1119_18b_st;/* '<S236>/Chart' */
  uint8_T is_c11_ECU1119_18b_st;       /* '<S236>/Chart' */
  uint8_T is_active_c24_ECU1119_18b_st;/* '<S4>/Chart2' */
  uint8_T is_c24_ECU1119_18b_st;       /* '<S4>/Chart2' */
  uint8_T is_active_c23_ECU1119_18b_st;/* '<S4>/Chart1' */
  uint8_T is_c23_ECU1119_18b_st;       /* '<S4>/Chart1' */
  uint8_T is_active_c22_ECU1119_18b_st;/* '<S4>/Chart' */
  uint8_T is_c22_ECU1119_18b_st;       /* '<S4>/Chart' */
  uint8_T is_active_c5_ECU1119_18b_st; /* '<S234>/Chart' */
  uint8_T is_c5_ECU1119_18b_st;        /* '<S234>/Chart' */
  uint8_T is_active_c1_ECU1119_18b_st; /* '<S11>/Chart' */
  uint8_T is_c1_ECU1119_18b_st;        /* '<S11>/Chart' */
} DW_ECU1119_18b_st_T;

/* Zero-crossing (trigger) state */
typedef struct {
  ZCSigState VCU_Cmd_Slow_Trig_ZCE;    /* '<S8>/VCU_Cmd_Slow' */
  ZCSigState VCU_Cmd_Fast_Trig_ZCE;    /* '<S8>/VCU_Cmd_Fast' */
} PrevZCX_ECU1119_18b_st_T;

/* Invariant block signals (default storage) */
typedef struct {
  const real_T Gain2;                  /* '<S12>/Gain2' */
  const real_T Gain1;                  /* '<S12>/Gain1' */
  const real_T DataTypeConversion1;    /* '<S301>/Data Type Conversion1' */
  const real_T Gain5;                  /* '<S232>/Gain5' */
  const real_T Gain4;                  /* '<S232>/Gain4' */
  const real_T Gain1_p;                /* '<S232>/Gain1' */
  const uint16_T DataTypeConversion;   /* '<S217>/Data Type Conversion' */
  const uint16_T DataTypeConversion_a; /* '<S216>/Data Type Conversion' */
  const uint16_T DataTypeConversion_m; /* '<S215>/Data Type Conversion' */
  const uint8_T DataTypeConversion3;   /* '<S237>/Data Type Conversion3' */
  const uint8_T DataTypeConversion2;   /* '<S237>/Data Type Conversion2' */
  const uint8_T VectorConcatenate2[2]; /* '<S237>/Vector Concatenate2' */
  const uint8_T DataTypeConversion_o;  /* '<S234>/Data Type Conversion' */
  const uint8_T DataTypeConversion_h;  /* '<S229>/Data Type Conversion' */
  const uint8_T DataTypeConversion_j;  /* '<S228>/Data Type Conversion' */
  const boolean_T DataTypeConversion_b;/* '<S5>/Data Type Conversion' */
  const boolean_T DataTypeConversion1_p;/* '<S4>/Data Type Conversion1' */
} ConstB_ECU1119_18b_st_T;

/* Constant parameters (default storage) */
typedef struct {
  /* Expression: EngineSpdTgt
   * Referenced by: '<S13>/EngineSpdTgt'
   */
  real_T EngineSpdTgt_tableData[11];

  /* Expression: EngineSpdTgt_x
   * Referenced by: '<S13>/EngineSpdTgt'
   */
  real_T EngineSpdTgt_bp01Data[11];

  /* Expression: EGRTgt
   * Referenced by: '<S12>/EGRTgt'
   */
  real_T EGRTgt_tableData[35];

  /* Expression: EGRTgt_x
   * Referenced by: '<S12>/EGRTgt'
   */
  real_T EGRTgt_bp01Data[7];

  /* Expression: EGRTgt_y
   * Referenced by: '<S12>/EGRTgt'
   */
  real_T EGRTgt_bp02Data[5];

  /* Computed Parameter: EGRTgt_maxIndex
   * Referenced by: '<S12>/EGRTgt'
   */
  uint32_T EGRTgt_maxIndex[2];
} ConstP_ECU1119_18b_st_T;

/* Real-time Model Data Structure */
struct tag_RTM_ECU1119_18b_st_T {
  const char_T *errorStatus;
};

/* Block signals (default storage) */
extern B_ECU1119_18b_st_T ECU1119_18b_st_B;

/* Block states (default storage) */
extern DW_ECU1119_18b_st_T ECU1119_18b_st_DW;
extern const ConstB_ECU1119_18b_st_T ECU1119_18b_st_ConstB;/* constant block i/o */

/* Constant parameters (default storage) */
extern const ConstP_ECU1119_18b_st_T ECU1119_18b_st_ConstP;

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern real_T ThrottleCmd_pct;         /* '<S273>/Data Type Conversion4' */

/*
 * Exported States
 *
 * Note: Exported states are block states with an exported global
 * storage class designation.  Code generation will declare the memory for these
 * states and exports their symbols.
 *
 */
extern uint8_T Cnt_SLOW2;              /* '<Root>/Data Store Memory1' */
extern uint8_T Cnt_TEMP1;              /* '<Root>/Data Store Memory12' */
extern uint8_T VCU_Mode;               /* '<Root>/Data Store Memory125' */
extern uint8_T Cnt_TEMP2;              /* '<Root>/Data Store Memory13' */
extern uint8_T Cnt_SLOW1;              /* '<Root>/Data Store Memory14' */
extern uint8_T Cnt_FAST_OUT;           /* '<Root>/Data Store Memory62' */
extern uint8_T Cnt_SLOW_OUT;           /* '<Root>/Data Store Memory63' */
extern uint8_T ResetFlg;               /* '<Root>/Data Store Memory72' */
extern uint8_T Cnt_FAST1;              /* '<Root>/Data Store Memory8' */
extern uint8_T Cnt_FAST2;              /* '<Root>/Data Store Memory9' */
extern uint8_T Init_flg_SPI;           /* '<Root>/Data Store Memory98' */
extern boolean_T KeyOn;                /* '<Root>/Data Store Memory' */
extern boolean_T LS007;                /* '<Root>/Data Store Memory100' */
extern boolean_T LS012;                /* '<Root>/Data Store Memory101' */
extern boolean_T LS013;                /* '<Root>/Data Store Memory103' */
extern boolean_T LS018;                /* '<Root>/Data Store Memory11' */
extern boolean_T LS019;                /* '<Root>/Data Store Memory116' */
extern boolean_T LS003;                /* '<Root>/Data Store Memory34' */
extern boolean_T LS017;                /* '<Root>/Data Store Memory45' */
extern boolean_T LS014;                /* '<Root>/Data Store Memory86' */
extern boolean_T LS015;                /* '<Root>/Data Store Memory87' */
extern boolean_T LS009;                /* '<Root>/Data Store Memory88' */
extern boolean_T LS016;                /* '<Root>/Data Store Memory89' */
extern boolean_T LS004;                /* '<Root>/Data Store Memory91' */
extern boolean_T LS011;                /* '<Root>/Data Store Memory92' */
extern boolean_T LS001;                /* '<Root>/Data Store Memory93' */
extern boolean_T LS002;                /* '<Root>/Data Store Memory95' */
extern boolean_T LS010;                /* '<Root>/Data Store Memory96' */
extern boolean_T LS008;                /* '<Root>/Data Store Memory97' */
extern boolean_T LS006;                /* '<Root>/Data Store Memory99' */

/* Model entry point functions */
extern void ECU1119_18b_st_initialize(void);
extern void ECU1119_18b_st_step(void);
extern void ECU1119_18b_st_terminate(void);

/* Exported data declaration */

/* Volatile memory section */
/* Declaration for custom storage class: Volatile */
extern volatile real32_T AI03;
extern volatile real32_T AI04;
extern volatile real32_T AI05;
extern volatile real32_T AI06;
extern volatile real32_T AI07;
extern volatile real32_T AI08;
extern volatile real32_T AI09;
extern volatile real32_T AI11;
extern volatile real32_T AI12;
extern volatile real32_T AI15;
extern volatile real32_T AI16;
extern volatile real32_T AI17;
extern volatile real32_T AI18;
extern volatile real32_T AI19;
extern volatile real32_T AI20;
extern volatile boolean_T DI01;
extern volatile boolean_T DI02;
extern volatile boolean_T DI03;
extern volatile boolean_T DI04;
extern volatile boolean_T DI07;
extern volatile boolean_T DI08;
extern volatile boolean_T DI09;
extern volatile boolean_T DI10;
extern volatile boolean_T DI12;
extern volatile boolean_T DI13;
extern volatile boolean_T DI15;
extern volatile boolean_T DI16;
extern volatile boolean_T DI17;
extern volatile boolean_T DI18;
extern volatile boolean_T DI31;
extern volatile real32_T DI31_PWM_DC;
extern volatile real32_T DI31_PWM_FRQ;
extern volatile boolean_T DI32;
extern volatile real32_T DI32_PWM_DC;
extern volatile real32_T DI32_PWM_FRQ;
extern volatile boolean_T DI33;
extern volatile real32_T DI33_PWM_DC;
extern volatile real32_T DI33_PWM_FRQ;
extern volatile boolean_T DI34;
extern volatile real32_T DI34_PWM_DC;
extern volatile real32_T DI34_PWM_FRQ;
extern volatile boolean_T HS001;
extern volatile boolean_T HS002;
extern volatile boolean_T HS003;
extern volatile boolean_T HS004;
extern volatile boolean_T HS005;
extern volatile boolean_T HS006;
extern volatile boolean_T HS007;
extern volatile boolean_T HS008;
extern volatile real32_T HS008_ETC_DC;
extern volatile real32_T HS008_ETC_FRQ;
extern volatile boolean_T HS010;
extern volatile boolean_T HS014;
extern volatile real32_T HS014_ETC_DC;
extern volatile real32_T HSO08_PWM_DC;
extern volatile real32_T HSO08_PWM_FRQ;
extern volatile real32_T HSO14_ETC_FRQ;
extern volatile real32_T HSO14_PWM_DC;
extern volatile real32_T HSO14_PWM_FRQ;
extern volatile real32_T LSO17_ETC_DC;
extern volatile real32_T LSO17_ETC_FRQ;
extern volatile real32_T LSO18_ETC_DC;
extern volatile real32_T LSO18_ETC_FRQ;
extern volatile real32_T LSO19_ETC_DC;
extern volatile real32_T LSO19_ETC_FRQ;
extern volatile real32_T LSO19_PWM_DC;
extern volatile real32_T LSO19_PWM_FRQ;
extern volatile real32_T LSO3_ETC_DC;
extern volatile real32_T LSO3_ETC_FRQ;

/* Real-time Model object */
extern RT_MODEL_ECU1119_18b_st_T *const ECU1119_18b_st_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S12>/Constant4' : Unused code path elimination
 * Block '<S12>/Constant5' : Unused code path elimination
 * Block '<S12>/Scope' : Unused code path elimination
 * Block '<S113>/Data Type Duplicate' : Unused code path elimination
 * Block '<S113>/Data Type Propagation' : Unused code path elimination
 * Block '<S13>/Scope' : Unused code path elimination
 * Block '<S1>/Gain' : Unused code path elimination
 * Block '<S1>/Gain1' : Unused code path elimination
 * Block '<S1>/Gain2' : Unused code path elimination
 * Block '<S1>/Gain3' : Unused code path elimination
 * Block '<S1>/Gain4' : Unused code path elimination
 * Block '<S226>/Data Type Conversion3' : Unused code path elimination
 * Block '<S226>/Data Type Conversion4' : Unused code path elimination
 * Block '<S227>/Data Type Conversion3' : Unused code path elimination
 * Block '<S227>/Data Type Conversion4' : Unused code path elimination
 * Block '<S231>/Data Type Conversion' : Unused code path elimination
 * Block '<S231>/Data Type Conversion1' : Unused code path elimination
 * Block '<S236>/Data Type Conversion3' : Unused code path elimination
 * Block '<S236>/Data Type Conversion4' : Unused code path elimination
 * Block '<S237>/Data Type Conversion' : Unused code path elimination
 * Block '<S237>/Data Type Conversion1' : Unused code path elimination
 * Block '<S238>/Data Type Conversion' : Unused code path elimination
 * Block '<S238>/Data Type Conversion1' : Unused code path elimination
 * Block '<S239>/Data Type Conversion3' : Unused code path elimination
 * Block '<S239>/Data Type Conversion4' : Unused code path elimination
 * Block '<S274>/Data Type Conversion1' : Unused code path elimination
 * Block '<S274>/Data Type Conversion2' : Unused code path elimination
 * Block '<S275>/Data Type Conversion2' : Unused code path elimination
 * Block '<S275>/Data Type Conversion4' : Unused code path elimination
 * Block '<S276>/Bus Creator' : Unused code path elimination
 * Block '<S276>/CAN Unpack6' : Unused code path elimination
 * Block '<S276>/Constant1' : Unused code path elimination
 * Block '<S276>/Constant4' : Unused code path elimination
 * Block '<S276>/Constant5' : Unused code path elimination
 * Block '<S276>/Data Type Conversion' : Unused code path elimination
 * Block '<S276>/Data Type Conversion1' : Unused code path elimination
 * Block '<S276>/Data Type Conversion14' : Unused code path elimination
 * Block '<S276>/Data Type Conversion15' : Unused code path elimination
 * Block '<S276>/Data Type Conversion17' : Unused code path elimination
 * Block '<S276>/Data Type Conversion18' : Unused code path elimination
 * Block '<S276>/Data Type Conversion19' : Unused code path elimination
 * Block '<S276>/Data Type Conversion2' : Unused code path elimination
 * Block '<S276>/Data Type Conversion3' : Unused code path elimination
 * Block '<S276>/Data Type Conversion4' : Unused code path elimination
 * Block '<S277>/Data Type Conversion3' : Unused code path elimination
 * Block '<S277>/Data Type Conversion4' : Unused code path elimination
 * Block '<S278>/Bus Creator' : Unused code path elimination
 * Block '<S278>/CAN Unpack6' : Unused code path elimination
 * Block '<S278>/Constant1' : Unused code path elimination
 * Block '<S278>/Constant4' : Unused code path elimination
 * Block '<S278>/Constant5' : Unused code path elimination
 * Block '<S278>/Data Type Conversion' : Unused code path elimination
 * Block '<S278>/Data Type Conversion1' : Unused code path elimination
 * Block '<S278>/Data Type Conversion14' : Unused code path elimination
 * Block '<S278>/Data Type Conversion15' : Unused code path elimination
 * Block '<S278>/Data Type Conversion17' : Unused code path elimination
 * Block '<S278>/Data Type Conversion18' : Unused code path elimination
 * Block '<S278>/Data Type Conversion19' : Unused code path elimination
 * Block '<S278>/Data Type Conversion2' : Unused code path elimination
 * Block '<S278>/Data Type Conversion4' : Unused code path elimination
 * Block '<S38>/Kb' : Eliminated nontunable gain of 1
 * Block '<S136>/Kb' : Eliminated nontunable gain of 1
 * Block '<S189>/Saturation' : Eliminated Saturate block
 * Block '<S13>/Switch' : Eliminated due to constant selection input
 * Block '<S232>/Gain' : Eliminated nontunable gain of 1
 * Block '<S238>/Manual Switch' : Eliminated due to constant selection input
 * Block '<S273>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S273>/Data Type Conversion14' : Eliminate redundant data type conversion
 * Block '<S273>/Data Type Conversion15' : Eliminate redundant data type conversion
 * Block '<S273>/Data Type Conversion17' : Eliminate redundant data type conversion
 * Block '<S273>/Data Type Conversion18' : Eliminate redundant data type conversion
 * Block '<S274>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S274>/Data Type Conversion14' : Eliminate redundant data type conversion
 * Block '<S274>/Data Type Conversion15' : Eliminate redundant data type conversion
 * Block '<S274>/Data Type Conversion17' : Eliminate redundant data type conversion
 * Block '<S274>/Data Type Conversion18' : Eliminate redundant data type conversion
 * Block '<S275>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S275>/Data Type Conversion14' : Eliminate redundant data type conversion
 * Block '<S275>/Data Type Conversion15' : Eliminate redundant data type conversion
 * Block '<S275>/Data Type Conversion17' : Eliminate redundant data type conversion
 * Block '<S275>/Data Type Conversion18' : Eliminate redundant data type conversion
 * Block '<S277>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S277>/Data Type Conversion14' : Eliminate redundant data type conversion
 * Block '<S277>/Data Type Conversion15' : Eliminate redundant data type conversion
 * Block '<S277>/Data Type Conversion17' : Eliminate redundant data type conversion
 * Block '<S277>/Data Type Conversion18' : Eliminate redundant data type conversion
 * Block '<S300>/Data Type Conversion1' : Eliminate redundant data type conversion
 * Block '<S300>/Data Type Conversion2' : Eliminate redundant data type conversion
 * Block '<S300>/Data Type Conversion3' : Eliminate redundant data type conversion
 * Block '<S301>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S13>/Constant6' : Unused code path elimination
 * Block '<S13>/FuelCyleMax' : Unused code path elimination
 * Block '<S238>/SPI' : Unused code path elimination
 * Block '<S274>/Bus Creator' : Unused code path elimination
 * Block '<S274>/CAN Unpack6' : Unused code path elimination
 * Block '<S274>/Constant1' : Unused code path elimination
 * Block '<S274>/Constant4' : Unused code path elimination
 * Block '<S274>/Constant5' : Unused code path elimination
 * Block '<S274>/Data Type Conversion19' : Unused code path elimination
 * Block '<S274>/Data Type Conversion4' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ECU1119_18b_st'
 * '<S1>'   : 'ECU1119_18b_st/ECU'
 * '<S2>'   : 'ECU1119_18b_st/GPIO '
 * '<S3>'   : 'ECU1119_18b_st/Init'
 * '<S4>'   : 'ECU1119_18b_st/Initialization & SPI timer1'
 * '<S5>'   : 'ECU1119_18b_st/Power Managment'
 * '<S6>'   : 'ECU1119_18b_st/SPI_EEPROM'
 * '<S7>'   : 'ECU1119_18b_st/SigIn'
 * '<S8>'   : 'ECU1119_18b_st/SigOut'
 * '<S9>'   : 'ECU1119_18b_st/ECU/ECU'
 * '<S10>'  : 'ECU1119_18b_st/ECU/ECU/ANR'
 * '<S11>'  : 'ECU1119_18b_st/ECU/ECU/DPF_REGEN'
 * '<S12>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl'
 * '<S13>'  : 'ECU1119_18b_st/ECU/ECU/SpdCtrl'
 * '<S14>'  : 'ECU1119_18b_st/ECU/ECU/DPF_REGEN/Chart'
 * '<S15>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller'
 * '<S16>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup'
 * '<S17>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/D Gain'
 * '<S18>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter'
 * '<S19>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter ICs'
 * '<S20>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/I Gain'
 * '<S21>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain'
 * '<S22>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain Fdbk'
 * '<S23>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator'
 * '<S24>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator ICs'
 * '<S25>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Copy'
 * '<S26>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Gain'
 * '<S27>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/P Copy'
 * '<S28>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Parallel P Gain'
 * '<S29>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Reset Signal'
 * '<S30>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation'
 * '<S31>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation Fdbk'
 * '<S32>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum'
 * '<S33>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum Fdbk'
 * '<S34>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode'
 * '<S35>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode Sum'
 * '<S36>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/postSat Signal'
 * '<S37>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/preSat Signal'
 * '<S38>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Back Calculation'
 * '<S39>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Cont. Clamping Ideal'
 * '<S40>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Cont. Clamping Parallel'
 * '<S41>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Disabled'
 * '<S42>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Disc. Clamping Ideal'
 * '<S43>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Disc. Clamping Parallel'
 * '<S44>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Anti-windup/Passthrough'
 * '<S45>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/D Gain/Disabled'
 * '<S46>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/D Gain/External Parameters'
 * '<S47>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/D Gain/Internal Parameters'
 * '<S48>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Cont. Filter'
 * '<S49>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Differentiator'
 * '<S50>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Disabled'
 * '<S51>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Disc. Backward Euler Filter'
 * '<S52>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Disc. Forward Euler Filter'
 * '<S53>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter/Disc. Trapezoidal Filter'
 * '<S54>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter ICs/Disabled'
 * '<S55>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter ICs/External IC'
 * '<S56>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter ICs/Internal IC - Differentiator'
 * '<S57>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Filter ICs/Internal IC - Filter'
 * '<S58>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/I Gain/Disabled'
 * '<S59>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/I Gain/External Parameters'
 * '<S60>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/I Gain/Internal Parameters'
 * '<S61>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain/External Parameters'
 * '<S62>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain/Internal Parameters'
 * '<S63>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain/Passthrough'
 * '<S64>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain Fdbk/Disabled'
 * '<S65>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain Fdbk/External Parameters'
 * '<S66>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain Fdbk/Internal Parameters'
 * '<S67>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Ideal P Gain Fdbk/Passthrough'
 * '<S68>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator/Continuous'
 * '<S69>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator/Disabled'
 * '<S70>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator/Discrete'
 * '<S71>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator ICs/Disabled'
 * '<S72>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator ICs/External IC'
 * '<S73>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Integrator ICs/Internal IC'
 * '<S74>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Copy/Disabled'
 * '<S75>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Copy/Disabled wSignal Specification'
 * '<S76>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Copy/External Parameters'
 * '<S77>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Copy/Internal Parameters'
 * '<S78>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Gain/Disabled'
 * '<S79>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Gain/External Parameters'
 * '<S80>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Gain/Internal Parameters'
 * '<S81>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/N Gain/Passthrough'
 * '<S82>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/P Copy/Disabled'
 * '<S83>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/P Copy/External Parameters Ideal'
 * '<S84>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/P Copy/Internal Parameters Ideal'
 * '<S85>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Parallel P Gain/Disabled'
 * '<S86>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Parallel P Gain/External Parameters'
 * '<S87>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Parallel P Gain/Internal Parameters'
 * '<S88>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Parallel P Gain/Passthrough'
 * '<S89>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Reset Signal/Disabled'
 * '<S90>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Reset Signal/External Reset'
 * '<S91>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation/Enabled'
 * '<S92>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation/Passthrough'
 * '<S93>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation Fdbk/Disabled'
 * '<S94>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation Fdbk/Enabled'
 * '<S95>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Saturation Fdbk/Passthrough'
 * '<S96>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum/Passthrough_I'
 * '<S97>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum/Passthrough_P'
 * '<S98>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum/Sum_PD'
 * '<S99>'  : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum/Sum_PI'
 * '<S100>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum/Sum_PID'
 * '<S101>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum Fdbk/Disabled'
 * '<S102>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum Fdbk/Enabled'
 * '<S103>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Sum Fdbk/Passthrough'
 * '<S104>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode/Disabled'
 * '<S105>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode/Enabled'
 * '<S106>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode Sum/Passthrough'
 * '<S107>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/Tracking Mode Sum/Tracking Mode'
 * '<S108>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/postSat Signal/Feedback_Path'
 * '<S109>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/postSat Signal/Forward_Path'
 * '<S110>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/preSat Signal/Feedback_Path'
 * '<S111>' : 'ECU1119_18b_st/ECU/ECU/EGRCtrl/PID Controller/preSat Signal/Forward_Path'
 * '<S112>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller'
 * '<S113>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/Saturation Dynamic'
 * '<S114>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup'
 * '<S115>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/D Gain'
 * '<S116>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter'
 * '<S117>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter ICs'
 * '<S118>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/I Gain'
 * '<S119>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain'
 * '<S120>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain Fdbk'
 * '<S121>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator'
 * '<S122>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator ICs'
 * '<S123>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Copy'
 * '<S124>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Gain'
 * '<S125>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/P Copy'
 * '<S126>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Parallel P Gain'
 * '<S127>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Reset Signal'
 * '<S128>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation'
 * '<S129>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation Fdbk'
 * '<S130>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum'
 * '<S131>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum Fdbk'
 * '<S132>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode'
 * '<S133>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode Sum'
 * '<S134>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/postSat Signal'
 * '<S135>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/preSat Signal'
 * '<S136>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Back Calculation'
 * '<S137>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Cont. Clamping Ideal'
 * '<S138>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Cont. Clamping Parallel'
 * '<S139>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Disabled'
 * '<S140>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Disc. Clamping Ideal'
 * '<S141>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Disc. Clamping Parallel'
 * '<S142>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Anti-windup/Passthrough'
 * '<S143>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/D Gain/Disabled'
 * '<S144>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/D Gain/External Parameters'
 * '<S145>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/D Gain/Internal Parameters'
 * '<S146>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Cont. Filter'
 * '<S147>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Differentiator'
 * '<S148>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Disabled'
 * '<S149>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Disc. Backward Euler Filter'
 * '<S150>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Disc. Forward Euler Filter'
 * '<S151>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter/Disc. Trapezoidal Filter'
 * '<S152>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter ICs/Disabled'
 * '<S153>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter ICs/External IC'
 * '<S154>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter ICs/Internal IC - Differentiator'
 * '<S155>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Filter ICs/Internal IC - Filter'
 * '<S156>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/I Gain/Disabled'
 * '<S157>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/I Gain/External Parameters'
 * '<S158>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/I Gain/Internal Parameters'
 * '<S159>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain/External Parameters'
 * '<S160>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain/Internal Parameters'
 * '<S161>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain/Passthrough'
 * '<S162>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain Fdbk/Disabled'
 * '<S163>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain Fdbk/External Parameters'
 * '<S164>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain Fdbk/Internal Parameters'
 * '<S165>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Ideal P Gain Fdbk/Passthrough'
 * '<S166>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator/Continuous'
 * '<S167>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator/Disabled'
 * '<S168>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator/Discrete'
 * '<S169>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator ICs/Disabled'
 * '<S170>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator ICs/External IC'
 * '<S171>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Integrator ICs/Internal IC'
 * '<S172>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Copy/Disabled'
 * '<S173>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Copy/Disabled wSignal Specification'
 * '<S174>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Copy/External Parameters'
 * '<S175>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Copy/Internal Parameters'
 * '<S176>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Gain/Disabled'
 * '<S177>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Gain/External Parameters'
 * '<S178>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Gain/Internal Parameters'
 * '<S179>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/N Gain/Passthrough'
 * '<S180>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/P Copy/Disabled'
 * '<S181>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/P Copy/External Parameters Ideal'
 * '<S182>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/P Copy/Internal Parameters Ideal'
 * '<S183>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Parallel P Gain/Disabled'
 * '<S184>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Parallel P Gain/External Parameters'
 * '<S185>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Parallel P Gain/Internal Parameters'
 * '<S186>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Parallel P Gain/Passthrough'
 * '<S187>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Reset Signal/Disabled'
 * '<S188>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Reset Signal/External Reset'
 * '<S189>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation/Enabled'
 * '<S190>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation/Passthrough'
 * '<S191>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation Fdbk/Disabled'
 * '<S192>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation Fdbk/Enabled'
 * '<S193>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Saturation Fdbk/Passthrough'
 * '<S194>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum/Passthrough_I'
 * '<S195>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum/Passthrough_P'
 * '<S196>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum/Sum_PD'
 * '<S197>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum/Sum_PI'
 * '<S198>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum/Sum_PID'
 * '<S199>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum Fdbk/Disabled'
 * '<S200>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum Fdbk/Enabled'
 * '<S201>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Sum Fdbk/Passthrough'
 * '<S202>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode/Disabled'
 * '<S203>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode/Enabled'
 * '<S204>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode Sum/Passthrough'
 * '<S205>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/Tracking Mode Sum/Tracking Mode'
 * '<S206>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/postSat Signal/Feedback_Path'
 * '<S207>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/postSat Signal/Forward_Path'
 * '<S208>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/preSat Signal/Feedback_Path'
 * '<S209>' : 'ECU1119_18b_st/ECU/ECU/SpdCtrl/PID Controller/preSat Signal/Forward_Path'
 * '<S210>' : 'ECU1119_18b_st/GPIO /ETC'
 * '<S211>' : 'ECU1119_18b_st/GPIO /HS'
 * '<S212>' : 'ECU1119_18b_st/GPIO /PWM_OUT'
 * '<S213>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4'
 * '<S214>' : 'ECU1119_18b_st/GPIO /SPI3: LS03_06_07_08_10_12_13_17_18_19'
 * '<S215>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem'
 * '<S216>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem1'
 * '<S217>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem2'
 * '<S218>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem3'
 * '<S219>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem4'
 * '<S220>' : 'ECU1119_18b_st/GPIO /ETC/Subsystem5'
 * '<S221>' : 'ECU1119_18b_st/GPIO /PWM_OUT/FreqCMD'
 * '<S222>' : 'ECU1119_18b_st/GPIO /PWM_OUT/PWM Configuration and Frequency Update'
 * '<S223>' : 'ECU1119_18b_st/GPIO /PWM_OUT/PWM Configuration and Frequency Update1'
 * '<S224>' : 'ECU1119_18b_st/GPIO /PWM_OUT/PWM Configuration and Frequency Update4'
 * '<S225>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4/Compare To Constant'
 * '<S226>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4/LS_CTRL'
 * '<S227>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4/LS_CTRL1'
 * '<S228>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4/LS_CTRL/If Action Subsystem1'
 * '<S229>' : 'ECU1119_18b_st/GPIO /SPI0: LS09_14_15_16_1_2_11_4/LS_CTRL1/If Action Subsystem1'
 * '<S230>' : 'ECU1119_18b_st/GPIO /SPI3: LS03_06_07_08_10_12_13_17_18_19/Compare To Constant'
 * '<S231>' : 'ECU1119_18b_st/GPIO /SPI3: LS03_06_07_08_10_12_13_17_18_19/Subsystem'
 * '<S232>' : 'ECU1119_18b_st/GPIO /SPI3: LS03_06_07_08_10_12_13_17_18_19/Subsystem/øÿ÷∆'
 * '<S233>' : 'ECU1119_18b_st/Init/CAN_init'
 * '<S234>' : 'ECU1119_18b_st/Init/Init'
 * '<S235>' : 'ECU1119_18b_st/Init/Init/Chart'
 * '<S236>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS'
 * '<S237>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS2 CANB'
 * '<S238>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS3 LS'
 * '<S239>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS'
 * '<S240>' : 'ECU1119_18b_st/Initialization & SPI timer1/Chart'
 * '<S241>' : 'ECU1119_18b_st/Initialization & SPI timer1/Chart1'
 * '<S242>' : 'ECU1119_18b_st/Initialization & SPI timer1/Chart2'
 * '<S243>' : 'ECU1119_18b_st/Initialization & SPI timer1/Compare To Constant'
 * '<S244>' : 'ECU1119_18b_st/Initialization & SPI timer1/Compare To Constant1'
 * '<S245>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS/Chart'
 * '<S246>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS/Subsystem'
 * '<S247>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS/Subsystem/SPI_en'
 * '<S248>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS/Subsystem/clear '
 * '<S249>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS1 LS/Subsystem/confi_enbit'
 * '<S250>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS3 LS/Chart'
 * '<S251>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS3 LS/Subsystem'
 * '<S252>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS3 LS/Subsystem/A◊È≈‰÷√'
 * '<S253>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS3 LS/Subsystem/B◊È≈‰÷√'
 * '<S254>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS/Chart'
 * '<S255>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS/Subsystem'
 * '<S256>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS/Subsystem/SPI_en'
 * '<S257>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS/Subsystem/clear '
 * '<S258>' : 'ECU1119_18b_st/Initialization & SPI timer1/CS5 LS/Subsystem/confi_enbit'
 * '<S259>' : 'ECU1119_18b_st/SPI_EEPROM/SPI_read'
 * '<S260>' : 'ECU1119_18b_st/SPI_EEPROM/SPI_write'
 * '<S261>' : 'ECU1119_18b_st/SPI_EEPROM/SPI_write/SPI_enable'
 * '<S262>' : 'ECU1119_18b_st/SPI_EEPROM/SPI_write/SPI_write'
 * '<S263>' : 'ECU1119_18b_st/SigIn/AI'
 * '<S264>' : 'ECU1119_18b_st/SigIn/CAN2'
 * '<S265>' : 'ECU1119_18b_st/SigIn/DI'
 * '<S266>' : 'ECU1119_18b_st/SigIn/PWM'
 * '<S267>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Fast_Fb1'
 * '<S268>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Fast_Fb2'
 * '<S269>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Slow_Fb1'
 * '<S270>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Slow_Fb2'
 * '<S271>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Temp_Fb1'
 * '<S272>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Temp_Fb2'
 * '<S273>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Fast_Fb1/UNPACK'
 * '<S274>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Fast_Fb2/UNPACK'
 * '<S275>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Slow_Fb1/UNPACK'
 * '<S276>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Slow_Fb2/UNPACK'
 * '<S277>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Temp_Fb1/UNPACK'
 * '<S278>' : 'ECU1119_18b_st/SigIn/CAN2/Obj_Temp_Fb2/UNPACK'
 * '<S279>' : 'ECU1119_18b_st/SigIn/DI/DI_31_32_33_34'
 * '<S280>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS1'
 * '<S281>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS2'
 * '<S282>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS3'
 * '<S283>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS4'
 * '<S284>' : 'ECU1119_18b_st/SigIn/PWM/Subsystem'
 * '<S285>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS1/Subsystem'
 * '<S286>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS1/Subsystem_capture'
 * '<S287>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS1/Subsystem_capture/Counter Limited'
 * '<S288>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS2/Subsystem'
 * '<S289>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS2/Subsystem_capture'
 * '<S290>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS2/Subsystem_capture/Counter Limited'
 * '<S291>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS3/Subsystem'
 * '<S292>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS3/Subsystem_capture'
 * '<S293>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS3/Subsystem_capture/Counter Limited'
 * '<S294>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS4/Subsystem'
 * '<S295>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS4/Subsystem_capture'
 * '<S296>' : 'ECU1119_18b_st/SigIn/PWM/PWM_PTS4/Subsystem_capture/Counter Limited'
 * '<S297>' : 'ECU1119_18b_st/SigIn/PWM/Subsystem/Frequency_DutyCycle_Computation'
 * '<S298>' : 'ECU1119_18b_st/SigIn/PWM/Subsystem/eTimer Configuration and Signal Measurements'
 * '<S299>' : 'ECU1119_18b_st/SigIn/PWM/Subsystem/eTimer Configuration and Signal Measurements/Subsystem_capture'
 * '<S300>' : 'ECU1119_18b_st/SigOut/VCU_Cmd_Fast'
 * '<S301>' : 'ECU1119_18b_st/SigOut/VCU_Cmd_Slow'
 */
#endif                                 /* RTW_HEADER_ECU1119_18b_st_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
