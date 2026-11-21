/*
 * File: freemaster_interface_init.c
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

/********************  Dependent Include files here **********************/
#include "freemaster.h"
#include "freemaster_interface_init.h"
#include "clock_manager.h"
#include "device_registers.h"
#include "interrupt_manager.h"
#include "mbdt_clock.h"
#include "flexcan_driver.h"

/**********************  Initialization Function *************************/
void freemaster_interface_init(void)
{
  static flexcan_state_t canCom0_State;
  const flexcan_user_config_t canCom0_InitConfig = {
    .pe_clock = FLEXCAN_CLK_SOURCE_OSC,
    .max_num_mb = 15,
    .num_id_filters = FLEXCAN_RX_FIFO_ID_FILTERS_8,
    .is_rx_fifo_needed = false,
    .flexcanMode = FLEXCAN_NORMAL_MODE,
    .bitrate = {
      .propSeg = 6,
      .phaseSeg1 = 5,
      .phaseSeg2 = 5,
      .preDivider = 3,
      .rJumpwidth = 3
    },
    .transfer_type = FLEXCAN_RXFIFO_USING_INTERRUPTS,
  };

  MBDT_SetPeripheralClockControl(FLEXCAN0_CLK, MC_ME_PERIPH_CONFIG_2,
    MC_ME_PERIPH_CONFIG_2);
  FLEXCAN_DRV_Init(0, &canCom0_State, &canCom0_InitConfig);
}

/*
 *######################################################################
 *                           End of File
 *######################################################################
 */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
