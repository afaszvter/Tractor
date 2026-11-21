1.本文件用于VCU的文件烧录、TSMaster监控、FreeMASTER监控
2.烧录文件：\module\ECU1114_18b_mbd_rtw\ECU1114_18b.mot
  FreeMASTER:module\ECU1114_18b_mbd_rtw\ECU1114_18b.elf
  DBC文件：\module\ECU_CAN.dbc
3.CAN网络拓扑
  3.1CANA用于刷写与监控，连接VectorCANcaseXL通道1
      CANC 用于读取报文，连接VectorCANcaseXL通道2
  3.2以上需要vector Hardware配置相关驱动
4.测试
2026/11/14/1505：CAN收发均正常
