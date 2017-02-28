#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>

/*
 * general car information
 */
typedef struct{
	uint8_t speed;							//byte0: 0 ~ 7 车速
	uint8_t ignOnMusic: 3,					//byte0: 0 ~ 2 开机音乐参数
		remain0: 5;							//byte1: 3 ~ 7 预留0
    uint16_t rpm;							//byte1 ~ 2: 0 ~ 15 电机转速表
    uint32_t odo: 24,						//byte3 ~ 6: 0 ~ 23 总里程
        gear: 3,							//byte3 ~ 6: 24 ~ 26 档位
        lcdNightLight: 5;							//byte3 ~ 6: 27 ~ 31 预留1
    uint16_t trip;							//byte7 ~ 8: 0 ~ 15 里程小计
    uint8_t waterTemp;						//byte9: 0 ~ 7 电机控制器水温表
    uint8_t powerMeter;						//byte10: 0 ~ 7 系统功率表
    uint32_t dateTime;						//byte13 ~ 16: 0 ~ 31 日期时间
    uint8_t mileage;						//byte11: 0 ~ 7 续驶里程
    uint8_t okBtn: 1,						//byte12: 0 页面切换开关状态
        theme: 3,							//byte12: 1 ~ 3 仪表界面
        lcdLight: 4;						//byte12: 4 ~ 7 LCD屏亮度
    uint8_t leftFrontDoor: 1,				//byte17: 0 左前门
        leftRearDoor: 1,					//byte17: 1 左后门
        rightFrontDoor: 1,					//byte17: 2 右前门
        rightRearDoor: 1,					//byte17: 3 右后门
        hoodDoor: 1,						//byte17: 4 引擎盖
        trunkDoor: 1,						//byte17: 5 后备箱
        powerStatus: 1,						//byte17: 6 电源状态－IGN			//add by 2.0
        remain2: 1;							//byte17: 7 预留2
}__attribute__((packed)) GeneralInfo;

/*
 * special car information
 */
typedef struct{
    uint8_t carTemp;						//byte18: 0 ~ 7 车内温度
    uint8_t epsErrLight: 1,					//byte20: 0 EPS故障指示灯
        lowBeam: 1,							//byte20: 1 小灯指示灯
        highBeam: 1,						//byte20: 2 远光灯指示灯
        leftSignal: 1,						//byte20: 3 左转向指示灯
        rightSignal: 1,						//byte20: 4 右转向指示灯
        backFogLight: 1,					//byte20: 5 后雾灯指示灯
        frontFogLight: 1,					//byte20: 6 前雾灯指示灯
        waterTempLight: 1;					//byte20: 7 水温报警指示灯		//
    uint8_t airBagLight: 1,					//byte21: 0 安全气囊报警灯
        dcdcErrLight: 1,					//byte21: 1 DCDC故障指示灯
        batteryCutoff: 1,					//byte21: 2 动力电池切断指示灯
        batteryErr: 2,						//byte21: 3 ~ 4 动力电池故障指示灯
        batteryLow: 2,						//byte21: 5 ~ 6 电池剩余容量低指示灯
        mainSeatbelt: 1;					//byte21: 7 主驾驶安全带未系指示灯
    uint8_t copilotSeatbelt: 1,				//byte22: 0 副驾驶安全带未系指示灯
        pepsKeyLight: 1,					//byte22: 1 PEPS钥匙位置信号灯
        meterHotLight: 1,					//byte22: 2 电机及控制器过热报警灯
        tirePressLight: 1,					//byte22: 3 胎压故障警告灯
        chargeLine: 1,						//byte22: 4 充电线连接信号灯
        insulation: 2,						//byte22: 5 ~ 6 绝缘电阻报警灯
        chargeLight: 1;						//byte22: 7 充电指示灯
	uint8_t soc;							//byte23: 0 ~ 7 系统SOC
	uint8_t sysLose: 1,				//byte24: 0 P档控制器故障指示灯
        ready: 1,							//byte24: 1 Ready指示
        ebdLight: 1,						//byte24: 2 EBD指示灯
        absLight: 1,						//byte24: 3 ABS报警灯
        sysErr: 1,							//byte24: 4 系统故障报警灯
        limitedPower: 1,					//byte24: 5 限功率指示灯
        pControllerErr: 2;							//byte24: 6 ~ 7 预留3
    uint8_t energyConsumption;				//byte25: 0 ~ 7 百公里能耗
    uint8_t overSpeed;						//byte26: 0 ~ 7 超速报警值
    uint8_t lowBeamText: 1,					//byte27: 0 文字提示：小灯未关报警
        overSpeedWarning: 1,				//byte27: 1 界面提示：超速报警
        vacuumPumpText: 1,					//byte27: 2 文字提示：真空泵报警
        handbrakeText: 1,					//byte27: 3 文字提示：手刹未解除报警
        waterPumpText: 1,					//byte27: 4 文字提示：水泵故障
        chargerHotText: 1,					//byte27: 5 文字提示：充电插座过热报警
        chargeLineText: 1,					//byte27: 6 文字提示：充电继电器粘连报警
        powerOnText: 1;						//byte27: 7 文字提示：踩下制动踏板...
    uint8_t esclText: 1,					//byte28: 0 文字提示：ESCL故障
        pepsText: 1,						//byte28: 1 文字提示：PEPS故障
        keyPowerLowText: 1,					//byte28: 2 文字提示：钥匙电压低
        missKetText: 1,						//byte28: 3 文字提示：未检测到钥匙
        keyOutsideText: 1,					//byte28: 4 文字提示：钥匙不在车内
        keyPowerOnText: 1,					//byte28: 5 文字提示：请将钥匙靠近启动按钮
        pushPowerOnText: 1,					//byte28: 6 文字提示：请按下启动按钮
        takePgear: 1;						//byte28: 7 文字提示：请将档位置于P档
    uint8_t outsideTemp;					//byte19: 0 ~ 7 环境温度
    uint16_t chargeCurrent;						//byte29 ~ 30: 0 ~ 15 预留4
    uint8_t lfTP;							//byte31: 0 ~ 7 左前轮胎压值
    uint8_t rfTP;							//byte32: 0 ~ 7 右前轮胎压值
    uint8_t lrTP;							//byte33: 0 ~ 7 左后轮胎压值
    uint8_t rrTP;							//byte34: 0 ~ 7 右后轮胎压值
    uint8_t lfTT;							//byte36: 0 ~ 7 左前轮胎温度
    uint8_t rfTT;							//byte37: 0 ~ 7 右前轮胎温度
    uint8_t lrTT;							//byte38: 0 ~ 7 左后轮胎温度
    uint8_t rrTT;							//byte39: 0 ~ 7 右后轮胎温度
    uint8_t lfTPStatus: 2,					//byte35: 0 ~ 1 左前轮胎压状态
        rfTPStatus: 2,						//byte35: 2 ~ 3 右前轮胎压状态
        lrTPStatus: 2,						//byte35: 4 ~ 5 左后轮胎压状态
        rrTPStatus: 2;						//byte35: 6 ~ 7 右后轮胎压状态
    uint8_t lfTPlow: 1,						//byte40: 0 左前轮传感器低压提示
        rfTPlow: 1,							//byte40: 1 右前轮传感器低压提示
        lrTPlow: 1,							//byte40: 2 左后轮传感器低压提示
        rrTPlow: 1,							//byte40: 3 右后轮传感器低压提示
        lfTTStatus: 1,						//byte40: 4 左前轮温度状态
        rfTTStatus: 1,						//byte40: 5 右前轮温度状态
        lrTTStatus: 1,						//byte40: 6 左后轮温度状态
		rrTTStatus: 1;						//byte40: 7 右后轮温度状态
	uint16_t pepsPowerStatus: 3,			//byte41 ~ 42: 0 ~ 2 PEPS电源状态
		radarTest: 2,						//byte41 ~ 42: 3 ~ 4 雷达自检
		radarDistance: 3,					//byte41 ~ 42: 5 ~ 7 障碍物距离
		remain5: 8;							//byte41 ~ 42: 3 ~ 15 预留5
    uint8_t mcuVer1;						//byte43: 0 ~ 7 mcu版本号第1位
    uint8_t mcuVer2;						//byte44: 0 ~ 7 mcu版本号第2位
    uint8_t mcuVer3;						//byte45: 0 ~ 7 mcu版本号第3位
    uint8_t seconds;						//byte46: 0 ~ 7 关机倒计时
}__attribute__((packed)) SpecialInfo;

/*
 * complete car information
 */
typedef struct{
    GeneralInfo general;
    SpecialInfo special;
}__attribute__((packed)) CarInfo;

/*
 * frame sent by MCU
 */
typedef struct{
    uint8_t head;
    uint8_t length;
    uint8_t frameTypes;
    CarInfo carInfo;
    uint16_t crc;
    uint8_t tail;
}__attribute__((packed)) DownFrame;

/*
 * setting information
 */
typedef struct{
    uint32_t dateTimeSet;					//byte0 ~ 3: 0 ~ 31 日期时间
    uint8_t tripClear: 1,					//byte4: 0 里程小计清零
        remain5: 3,							//byte4: 1 ~ 3 预留5
        setLcdNightLight: 4;				//byte4: 4 ~ 7 设置的LCD屏亮度（夜间）
    uint8_t setBackLight: 4,				//byte5: 0 ~ 3 设置的LCD屏亮度（白天）
        setTheme: 3,						//byte5: 4 ~ 6 仪表界面主题
        remain6: 1;							//byte5: 7 预留6
    uint8_t setOverSpeed;					//byte6: 0 ~ 7 超速提醒设置值 60~140，0：不设置（预留）---状态型
}__attribute__((packed)) SettingsInfo;

/*
 * frame sent by C50
 */
typedef struct{
    uint8_t head;
    uint8_t length;
    uint8_t frameTypes;
    SettingsInfo settingsInfo;
    uint16_t crc;
    uint8_t tail;
}__attribute__((packed)) UpFrame;

/*
 * C50 version
 */
#define C50VERSION_INFO "V 3.0"

/*
 * byte length for up and down frame
 */
#define UPFRAME_BYTELEN		(const int)(sizeof(UpFrame))
#define DOWNFRAME_BYTELEN	(const int)(sizeof(DownFrame))

/*
 * update frequency for up and down frame
 */
#define UPFRAME_FREQ 500
#define DOWNFRAME_FREQ 100

/*
 * baud rate for serial
 */
#define BAUD_RATE    QSerialPort::Baud115200
/*
 * crc16 check
 */
uint16_t crc16Check(uint8_t *ptr,uint8_t len);

#endif // PROTOCOL_H
