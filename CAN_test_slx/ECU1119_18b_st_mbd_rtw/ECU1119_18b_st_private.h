/*
 * File: ECU1119_18b_st_private.h
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

#ifndef RTW_HEADER_ECU1119_18b_st_private_h_
#define RTW_HEADER_ECU1119_18b_st_private_h_
#include "rtwtypes.h"
#include "zero_crossing_types.h"
#include "ECU1119_18b_st.h"
#ifndef UCHAR_MAX
#include <limits.h>
#endif

#if ( UCHAR_MAX != (0xFFU) ) || ( SCHAR_MAX != (0x7F) )
#error Code was generated for compiler with different sized uchar/char. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

#if ( USHRT_MAX != (0xFFFFU) ) || ( SHRT_MAX != (0x7FFF) )
#error Code was generated for compiler with different sized ushort/short. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

#if ( UINT_MAX != (0xFFFFFFFFU) ) || ( INT_MAX != (0x7FFFFFFF) )
#error Code was generated for compiler with different sized uint/int. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

#if ( ULONG_MAX != (0xFFFFFFFFU) ) || ( LONG_MAX != (0x7FFFFFFF) )
#error Code was generated for compiler with different sized ulong/long. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

extern flexcan_state_t canCom1_State;
extern flexcan_state_t canCom2_State;
extern flexcan_msgbuff_t canCom2_recvBuff0;
extern flexcan_msgbuff_t canCom2_recvBuff1;
extern flexcan_msgbuff_t canCom2_recvBuff4;
extern flexcan_msgbuff_t canCom2_recvBuff5;
extern flexcan_msgbuff_t canCom2_recvBuff2;
extern flexcan_msgbuff_t canCom2_recvBuff3;

#if defined(__MWERKS__)

double fmod (double x, double y);
double fabs (double);

#endif

extern real_T look1_binlcpw(real_T u0, const real_T bp0[], const real_T table[],
  uint32_T maxIndex);
extern real_T look2_binlcpw(real_T u0, real_T u1, const real_T bp0[], const
  real_T bp1[], const real_T table[], const uint32_T maxIndex[], uint32_T stride);
extern void ECU1119_18b_st_CAN2_Start(void);
extern void ECU1119_18b_st_CAN2(void);

#endif                                 /* RTW_HEADER_ECU1119_18b_st_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
