#ifndef fcan2_mpc_event_callback_h
#define fcan2_mpc_event_callback_h

extern flexcan_msgbuff_t canCom2_recvBuffFifo;
extern void fcan2_mpc_event_callback(uint8_t instance, flexcan_event_type_t
  eventType, uint32_t buffIdx, flexcan_state_t *flexcanState);

#endif
