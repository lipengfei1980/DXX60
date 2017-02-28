#ifndef CARSTATUS_H
#define CARSTATUS_H

#include <QString>
#include <QTimer>
#include <QTimerEvent>
#include <serial.h>
#include <QObject>
//#include <QtNetwork/QHostAddress>
//#include <QtNetwork/QTcpSocket>
/*
 * times for key debounce and long button
 */
#define KEY_LONG_TIME 20		// 20 * 100ms = 2000ms

class CarStatus : public QObject
{
	typedef enum{
		KEY_OK,
	}KEY_TYPE;

	typedef enum{
		KEY_NONE,
		KEY_SHORT,
		KEY_LONG,
	}KEY_STATUS;

	typedef enum{
		MENU_NONE,
#define MENU_L1_MIN MENU_L1_ENERGY
		MENU_L1_ENERGY,
		MENU_L1_LCDLIGHT,
		MENU_L1_OVERSPEED,
//		MENU_L1_TIREPRESS,
		MENU_L1_MUSIC,
		MENU_L1_THEME,
		MENU_L1_EXIT,
#define MENU_L1_MAX MENU_L1_EXIT
	}MENU_TYPE_NUM;

	typedef enum{
		TIPS_NONE,
		TIPS_CHARGE_LINE,//充电继电器粘连				long		0
		TIPS_CHARGER_HOT,//充电插座过温				long		0
		TIPS_ESCL,//ESCL故障							5s			1
		TIPS_PEPS,//PEPS故障							5s			1
		TIPS_KEYPOWER_LOW,//钥匙电压低				5s			0
		TIPS_MISS_KEY,//未检测到钥匙					5s			1
		TIPS_KEY_OUTSIDE,//钥匙不在车内				5s			0
		TIPS_KEY_POWERON,//请将钥匙靠近启动按钮			5s			0
		TIPS_PUSH_POWERON,//请按下启动按钮				5s			0
		TIPS_TAKE_PGEAR,//请将档位置于P档				5s			1
		TIPS_POWER_ON,//踩下制动踏板 ............		5s			1
		TIPS_SYS,
		TIPS_HAND_BRAKE,//手刹未解除					long		1
		TIPS_TIRE_PRESSURE_TEMPHOT,//轮胎温度过高		long		0
		TIPS_TIRE_PRESSURE_LOW,//轮胎胎压过低			long		0
		TIPS_TIRE_PRESSURE_HIGH,//轮胎胎压过高		long		0
		TIPS_TIRE_PRESSURE_LEAKAGE,//轮胎漏气			long		0
		TIPS_TIRE_PRESSURE_SENSOR_BATTERY_LOW,//轮胎传感器电量低	long	0
		TIPS_WATER_PUMP,//水泵故障					5s			1
		TIPS_VAC_PUMP,//真空助力低					5s
		TIPS_LOW_BEAM,//小灯未关						long
		TIPS_CAR_DOOR,//车门未关报警					long
		TIPS_SEAT_BELT,//安全带未系					5s
		TIPS_OVER_SPEED,//超速报警					long
		TIPS_MAX,
	}TIPSINFO;

	typedef enum{
		STATE_ALL,
		STATE_CHARGE,
		STATE_DORMANCY,
	}SHOWSTATE;

	Q_OBJECT
	Q_ENUMS(TIPSREC)

	Q_PROPERTY(uint speed MEMBER m_speed NOTIFY speedChanged)
	Q_PROPERTY(uint ignOnMusic MEMBER m_ignOnMusic NOTIFY ignOnMusicChanged)
	Q_PROPERTY(uint rpm MEMBER m_rpm NOTIFY rpmChanged)
	Q_PROPERTY(uint odo MEMBER m_odo NOTIFY odoChanged)
	Q_PROPERTY(uint gear MEMBER m_gear NOTIFY gearChanged)
	Q_PROPERTY(uint trip MEMBER m_trip NOTIFY tripChanged)
	Q_PROPERTY(uint waterTemp MEMBER m_waterTemp NOTIFY waterTempChanged)
	Q_PROPERTY(uint powerMeter MEMBER m_powerMeter NOTIFY powerMeterChanged)
	Q_PROPERTY(uint mileage MEMBER m_mileage NOTIFY mileageChanged)
	Q_PROPERTY(uint theme MEMBER m_theme NOTIFY themeChanged)
	Q_PROPERTY(uint lcdLight MEMBER m_lcdLight NOTIFY lcdLightChanged)
	Q_PROPERTY(uint lcdNightLight MEMBER m_lcdNightLight NOTIFY lcdNightLightChanged)
	Q_PROPERTY(QString hour MEMBER m_hour NOTIFY hourChanged)
	Q_PROPERTY(QString minite MEMBER m_minite NOTIFY miniteChanged)
	Q_PROPERTY(bool leftFrontDoor MEMBER m_leftFrontDoor NOTIFY leftFrontDoorChanged)
	Q_PROPERTY(bool leftRearDoor MEMBER m_leftRearDoor NOTIFY leftRearDoorChanged)
	Q_PROPERTY(bool rightFrontDoor MEMBER m_rightFrontDoor NOTIFY rightFrontDoorChanged)
	Q_PROPERTY(bool rightRearDoor MEMBER m_rightRearDoor NOTIFY rightRearDoorChanged)
	Q_PROPERTY(bool hoodDoor MEMBER m_hoodDoor NOTIFY hoodDoorChanged)
	Q_PROPERTY(bool trunkDoor MEMBER m_trunkDoor NOTIFY trunkDoorChanged)
	Q_PROPERTY(uint powerStatus MEMBER m_powerStatus NOTIFY powerStatusChanged)
	Q_PROPERTY(uint carTemp MEMBER m_carTemp NOTIFY carTempChanged)
	Q_PROPERTY(uint outsideTemp MEMBER m_outsideTemp NOTIFY outsideTempChanged)
	Q_PROPERTY(uint chargeCurrent MEMBER m_chargeCurrent NOTIFY chargeCurrentChanged)

	Q_PROPERTY(bool epsErrLight MEMBER m_epsErrLight NOTIFY epsErrLightChanged)
	Q_PROPERTY(bool lowBeam MEMBER m_lowBeam NOTIFY lowBeamChanged)
	Q_PROPERTY(bool highBeam MEMBER m_highBeam NOTIFY highBeamChanged)
	Q_PROPERTY(bool leftSignal MEMBER m_leftSignal NOTIFY leftSignalChanged)
	Q_PROPERTY(bool rightSignal MEMBER m_rightSignal NOTIFY rightSignalChanged)
	Q_PROPERTY(bool backFogLight MEMBER m_backFogLight NOTIFY backFogLightChanged)
	Q_PROPERTY(bool frontFogLight MEMBER m_frontFogLight NOTIFY frontFogLightChanged)
	Q_PROPERTY(bool waterTempLight MEMBER m_waterTempLight NOTIFY waterTempLightChanged)
	Q_PROPERTY(bool airBagLight MEMBER m_airBagLight NOTIFY airBagLightChanged)
	Q_PROPERTY(bool dcdcErrLight MEMBER m_dcdcErrLight NOTIFY dcdcErrLightChanged)
	Q_PROPERTY(bool batteryCutoff MEMBER m_batteryCutoff NOTIFY batteryCutoffChanged)
	Q_PROPERTY(uint batteryErr MEMBER m_batteryErr NOTIFY batteryErrChanged)
	Q_PROPERTY(uint batteryLow MEMBER m_batteryLow NOTIFY batteryLowChanged)
	Q_PROPERTY(bool mainSeatbelt MEMBER m_mainSeatbelt NOTIFY mainSeatbeltChanged)
	Q_PROPERTY(bool copilotSeatbelt MEMBER m_copilotSeatbelt NOTIFY copilotSeatbeltChanged)
	Q_PROPERTY(bool pepsKeyLight MEMBER m_pepsKeyLight NOTIFY pepsKeyLightChanged)
	Q_PROPERTY(bool meterHotLight MEMBER m_meterHotLight NOTIFY meterHotLightChanged)
	Q_PROPERTY(bool tirePressLight MEMBER m_tirePressLight NOTIFY tirePressLightChanged)
	Q_PROPERTY(uint chargeLine MEMBER m_chargeLine NOTIFY chargeLineChanged)
	Q_PROPERTY(uint insulation MEMBER m_insulation NOTIFY insulationChanged)
	Q_PROPERTY(bool chargeLight MEMBER m_chargeLight NOTIFY chargeLightChanged)
	Q_PROPERTY(uint soc MEMBER m_soc NOTIFY socChanged)
	Q_PROPERTY(uint pControllerErr MEMBER m_pControllerErr NOTIFY pControllerErrChanged)
	Q_PROPERTY(bool ready MEMBER m_ready NOTIFY readyChanged)
	Q_PROPERTY(bool ebdLight MEMBER m_ebdLight NOTIFY ebdLightChanged)
	Q_PROPERTY(bool absLight MEMBER m_absLight NOTIFY absLightChanged)
	Q_PROPERTY(bool sysErr MEMBER m_sysErr NOTIFY sysErrChanged)
	Q_PROPERTY(bool limitedPower MEMBER m_limitedPower NOTIFY limitedPowerChanged)

	Q_PROPERTY(uint energyConsumption MEMBER m_energyConsumption NOTIFY energyConsumptionChanged)
	Q_PROPERTY(uint overSpeed MEMBER m_overSpeed NOTIFY overSpeedChanged)
	Q_PROPERTY(bool lowBeamText MEMBER m_lowBeamText NOTIFY lowBeamTextChanged)
	Q_PROPERTY(bool overSpeedWarning MEMBER m_overSpeedWarning NOTIFY overSpeedWarningChanged)
	Q_PROPERTY(bool vacuumPumpText MEMBER m_vacuumPumpText NOTIFY vacuumPumpTextChanged)
	Q_PROPERTY(bool handbrakeText MEMBER m_handbrakeText NOTIFY handbrakeTextChanged)
	Q_PROPERTY(bool waterPumpText MEMBER m_waterPumpText NOTIFY waterPumpTextChanged)
	Q_PROPERTY(bool chargerHotText MEMBER m_chargerHotText NOTIFY chargerHotTextChanged)
	Q_PROPERTY(bool chargeLineText MEMBER m_chargeLineText NOTIFY chargeLineTextChanged)
	Q_PROPERTY(bool powerOnText MEMBER m_powerOnText NOTIFY powerOnTextChanged)
	Q_PROPERTY(bool esclText MEMBER m_esclText NOTIFY esclTextChanged)
	Q_PROPERTY(bool pepsText MEMBER m_pepsText NOTIFY pepsTextChanged)
	Q_PROPERTY(bool keyPowerLowText MEMBER m_keyPowerLowText NOTIFY keyPowerLowTextChanged)
	Q_PROPERTY(bool missKetText MEMBER m_missKetText NOTIFY missKetTextChanged)
	Q_PROPERTY(bool keyOutsideText MEMBER m_keyOutsideText NOTIFY keyOutsideTextChanged)
	Q_PROPERTY(bool keyPowerOnText MEMBER m_keyPowerOnText NOTIFY keyPowerOnTextChanged)
	Q_PROPERTY(bool pushPowerOnText MEMBER m_pushPowerOnText NOTIFY pushPowerOnTextChanged)
	Q_PROPERTY(bool takePgear MEMBER m_takePgear NOTIFY takePgearChanged)

	Q_PROPERTY(uint lfTP MEMBER m_lfTP NOTIFY lfTPChanged)
	Q_PROPERTY(uint rfTP MEMBER m_rfTP NOTIFY rfTPChanged)
	Q_PROPERTY(uint lrTP MEMBER m_lrTP NOTIFY lrTPChanged)
	Q_PROPERTY(uint rrTP MEMBER m_rrTP NOTIFY rrTPChanged)
	Q_PROPERTY(uint lfTPStatus MEMBER m_lfTPStatus NOTIFY lfTPStatusChanged)
	Q_PROPERTY(uint rfTPStatus MEMBER m_rfTPStatus NOTIFY rfTPStatusChanged)
	Q_PROPERTY(uint lrTPStatus MEMBER m_lrTPStatus NOTIFY lrTPStatusChanged)
	Q_PROPERTY(uint rrTPStatus MEMBER m_rrTPStatus NOTIFY rrTPStatusChanged)
	Q_PROPERTY(uint lfTT MEMBER m_lfTT NOTIFY lfTTChanged)
	Q_PROPERTY(uint rfTT MEMBER m_rfTT NOTIFY rfTTChanged)
	Q_PROPERTY(uint lrTT MEMBER m_lrTT NOTIFY lrTTChanged)
	Q_PROPERTY(uint rrTT MEMBER m_rrTT NOTIFY rrTTChanged)
	Q_PROPERTY(bool lfTPlow MEMBER m_lfTPlow NOTIFY lfTPlowChanged)
	Q_PROPERTY(bool rfTPlow MEMBER m_rfTPlow NOTIFY rfTPlowChanged)
	Q_PROPERTY(bool lrTPlow MEMBER m_lrTPlow NOTIFY lrTPlowChanged)
	Q_PROPERTY(bool rrTPlow MEMBER m_rrTPlow NOTIFY rrTPlowChanged)
	Q_PROPERTY(bool lfTTStatus MEMBER m_lfTTStatus NOTIFY lfTTStatusChanged)
	Q_PROPERTY(bool rfTTStatus MEMBER m_rfTTStatus NOTIFY rfTTStatusChanged)
	Q_PROPERTY(bool lrTTStatus MEMBER m_lrTTStatus NOTIFY lrTTStatusChanged)
	Q_PROPERTY(bool rrTTStatus MEMBER m_rrTTStatus NOTIFY rrTTStatusChanged)

	Q_PROPERTY(uint pepsPowerStatus MEMBER m_pepsPowerStatus NOTIFY pepsPowerStatusChanged)
	Q_PROPERTY(bool seltText MEMBER m_seltText NOTIFY seltTextChanged)
	Q_PROPERTY(bool carDoorText MEMBER m_carDoorText NOTIFY carDoorTextChanged)
	Q_PROPERTY(bool tireText MEMBER m_tireText NOTIFY tireTextChanged)
	Q_PROPERTY(bool sysText MEMBER m_sysText NOTIFY sysTextChanged)
	Q_PROPERTY(uint mcuVer1 MEMBER m_mcuVer1 NOTIFY mcuVer1Changed)
	Q_PROPERTY(uint mcuVer2 MEMBER m_mcuVer2 NOTIFY mcuVer2Changed)
	Q_PROPERTY(uint mcuVer3 MEMBER m_mcuVer3 NOTIFY mcuVer3Changed)
	Q_PROPERTY(uint seconds MEMBER m_seconds NOTIFY secondsChanged)

	Q_PROPERTY(bool active MEMBER m_active NOTIFY activeChanged)
	Q_PROPERTY(bool keyActive MEMBER m_keyActive NOTIFY keyActiveChanged)

	//setting
	Q_PROPERTY(uint dateTimeSet MEMBER m_dateTimeSet NOTIFY dateTimeSetChanged)
	Q_PROPERTY(bool tripClear MEMBER m_tripClear NOTIFY tripClearChanged)
	Q_PROPERTY(uint setBackLight MEMBER m_setBackLight NOTIFY setBackLightChanged)
	Q_PROPERTY(uint setLcdNightLight MEMBER m_setLcdNightLight NOTIFY setLcdNightLightChanged)
	Q_PROPERTY(uint musicSet MEMBER m_musicSet NOTIFY musicSetChanged)
	Q_PROPERTY(uint setTheme MEMBER m_setTheme NOTIFY setThemeChanged)
	Q_PROPERTY(bool musicStatus MEMBER m_musicStatus NOTIFY musicStatusChanged)
	Q_PROPERTY(uint setOverSpeed MEMBER m_setOverSpeed NOTIFY setOverSpeedChanged)
	// updata function
	Q_PROPERTY(bool updateShow MEMBER m_updateShow NOTIFY updateShowChanged)
	Q_PROPERTY(QString updataTypes MEMBER m_updataTypes NOTIFY updataTypesChanged)
	Q_PROPERTY(QString updataVer MEMBER m_updataVer NOTIFY updataVerChanged)
	Q_PROPERTY(uint updataProgress MEMBER m_updataProgress NOTIFY updataProgressChanged)

	//menu state
	Q_PROPERTY(QString menuPanelState MEMBER m_menuPanelState NOTIFY menuPanelStateChanged)
	Q_PROPERTY(QString energyPanelState MEMBER m_energyPanelState NOTIFY energyPanelStateChanged)
	Q_PROPERTY(QString setLcdLightState MEMBER m_setLcdLightState NOTIFY setLcdLightStateChanged)
	Q_PROPERTY(QString setOverSpeedState MEMBER m_setOverSpeedState NOTIFY setOverSpeedStateChanged)
	Q_PROPERTY(QString musicSetState MEMBER m_musicSetState NOTIFY musicSetStateChanged)
	Q_PROPERTY(QString setThemeState MEMBER m_setThemeState NOTIFY setThemeStateChanged)
	Q_PROPERTY(QString tirePressPanelState MEMBER m_tirePressPanelState NOTIFY tirePressPanelStateChanged)
	Q_PROPERTY(QString exitPanelState MEMBER m_exitPanelState NOTIFY exitPanelStateChanged)
	Q_PROPERTY(QString tireShowState MEMBER m_tireShowState NOTIFY tireShowStateChanged)

	//tips src
	Q_PROPERTY(QString warningSrc MEMBER m_warningSrc NOTIFY warningSrcChanged)
	Q_PROPERTY(TIPSREC warningIndex MEMBER m_warningIndex NOTIFY warningIndexChanged)
	// dashboard status
	Q_PROPERTY(QString dashboardStatus MEMBER m_dashboardStatus NOTIFY dashboardStatusChanged)
	// behavior
	Q_PROPERTY(float rpmAngle MEMBER m_rpmAngle NOTIFY rpmAngleChanged)
	Q_PROPERTY(float powerMeterAngle MEMBER m_powerMeterAngle NOTIFY powerMeterAngleChanged)
	Q_PROPERTY(float powerMeterAngle1 MEMBER m_powerMeterAngle1 NOTIFY powerMeterAngle1Changed)
	Q_PROPERTY(float powerMeterAngle2 MEMBER m_powerMeterAngle2 NOTIFY powerMeterAngle2Changed)
	Q_PROPERTY(float powerMeterAngle3 MEMBER m_powerMeterAngle3 NOTIFY powerMeterAngle3Changed)
	Q_PROPERTY(float powerMeterAngle4 MEMBER m_powerMeterAngle4 NOTIFY powerMeterAngle4Changed)
	Q_PROPERTY(float powerMeterAngle5 MEMBER m_powerMeterAngle5 NOTIFY powerMeterAngle5Changed)
	Q_PROPERTY(uint insideTemp MEMBER m_insideTemp NOTIFY insideTempChanged)
	Q_PROPERTY(uint outTemp MEMBER m_outTemp NOTIFY outTempChanged)
	Q_PROPERTY(float waterTempHight MEMBER m_waterTempHight NOTIFY waterTempHightChanged)
	Q_PROPERTY(float leftPointX MEMBER m_leftPointX NOTIFY leftPointXChanged)
	Q_PROPERTY(float leftPointY MEMBER m_leftPointY NOTIFY leftPointYChanged)
	Q_PROPERTY(float socHight MEMBER m_socHight NOTIFY socHightChanged)
	Q_PROPERTY(float rightPointX MEMBER m_rightPointX NOTIFY rightPointXChanged)
	Q_PROPERTY(float rightPointY MEMBER m_rightPointY NOTIFY rightPointYChanged)
	Q_PROPERTY(bool tireWarning MEMBER m_tireWarning NOTIFY tireWarningChanged)
	//warning add 20160819
	Q_PROPERTY(bool anyDoor MEMBER m_anyDoor NOTIFY anyDoorChanged)
	Q_PROPERTY(bool tpTemp MEMBER m_tpTemp NOTIFY tpTempChanged)
	Q_PROPERTY(bool tpLow MEMBER m_tpLow NOTIFY tpLowChanged)
	Q_PROPERTY(bool tpHigh MEMBER m_tpHigh NOTIFY tpHighChanged)
	Q_PROPERTY(bool tpLeakage MEMBER m_tpLeakage NOTIFY tpLeakageChanged)
	Q_PROPERTY(bool tireBatteryLow MEMBER m_tireBatteryLow NOTIFY tireBatteryLowChanged)
	Q_PROPERTY(bool seatbelt MEMBER m_seatbelt NOTIFY seatbeltChanged)
	Q_PROPERTY(bool tpLose MEMBER m_tpLose NOTIFY tpLoseChanged)
	Q_PROPERTY(bool ttLose MEMBER m_ttLose NOTIFY ttLoseChanged)

	Q_PROPERTY(bool chargePanelVisible MEMBER m_chargePanelVisible NOTIFY chargePanelVisibleChanged)
//	Q_PROPERTY(bool logoV MEMBER m_logoV NOTIFY logoVChanged)

public:
	enum TIPSREC{
		TIPS_SINGLE,
		TIPS_IMAGE,
		TIPS_DOUBLE,
		TIPS_TIRE,
	};
	explicit CarStatus(const QString &serialDev, QObject *parent = 0);
	explicit CarStatus(QObject *parent = 0)
		: QObject(parent) {}

signals:
	// all have
	void speedChanged(uint);
	void ignOnMusicChanged(uint);
	void rpmChanged(uint);
	void odoChanged(uint);
	void gearChanged(uint);
	void tripChanged(uint);
	void waterTempChanged(uint);
	void powerMeterChanged(uint);
	void mileageChanged(uint);
	void themeChanged(uint);
	void lcdLightChanged(uint);
	void lcdNightLightChanged(uint);
	void hourChanged(QString);
	void miniteChanged(QString);
	void leftFrontDoorChanged(bool);
	void leftRearDoorChanged(bool);
	void rightFrontDoorChanged(bool);
	void rightRearDoorChanged(bool);
	void hoodDoorChanged(bool);
	void trunkDoorChanged(bool);
	void powerStatusChanged(uint);
	void carTempChanged(uint);
	void outsideTempChanged(uint);
	void chargeCurrentChanged(uint);

	void epsErrLightChanged(bool);
	void lowBeamChanged(bool);
	void highBeamChanged(bool);
	void leftSignalChanged	(bool);
	void rightSignalChanged(bool);
	void backFogLightChanged(bool);
	void frontFogLightChanged(bool);
	void waterTempLightChanged(bool);
	void airBagLightChanged(bool);
	void dcdcErrLightChanged(bool);
	void batteryCutoffChanged(bool);
	void batteryErrChanged(uint);
	void batteryLowChanged(uint);
	void mainSeatbeltChanged(bool);
	void copilotSeatbeltChanged(bool);
	void pepsKeyLightChanged(bool);
	void meterHotLightChanged(bool);
	void tirePressLightChanged(bool);
	void chargeLineChanged(uint);
	void insulationChanged(uint);
	void chargeLightChanged(bool);
	void socChanged(uint);
	void pControllerErrChanged(uint);
	void readyChanged(bool);
	void ebdLightChanged(bool);
	void absLightChanged(bool);
	void sysErrChanged(bool);
	void limitedPowerChanged(bool);

	void energyConsumptionChanged(uint);
	void overSpeedChanged(uint);
	void lowBeamTextChanged(bool);
	void overSpeedWarningChanged(bool);
	void vacuumPumpTextChanged(bool);
	void handbrakeTextChanged(bool);
	void waterPumpTextChanged(bool);
	void chargerHotTextChanged(bool);
	void chargeLineTextChanged(bool);
	void powerOnTextChanged(bool);
	void esclTextChanged(bool);
	void pepsTextChanged(bool);
	void keyPowerLowTextChanged(bool);
	void missKetTextChanged(bool);
	void keyOutsideTextChanged(bool);
	void keyPowerOnTextChanged(bool);
	void pushPowerOnTextChanged(bool);
	void takePgearChanged(bool);

	void lfTPChanged(uint);
	void rfTPChanged(uint);
	void lrTPChanged(uint);
	void rrTPChanged(uint);
	void lfTPStatusChanged(uint);
	void rfTPStatusChanged(uint);
	void lrTPStatusChanged(uint);
	void rrTPStatusChanged(uint);
	void lfTTChanged(uint);
	void rfTTChanged(uint);
	void lrTTChanged(uint);
	void rrTTChanged(uint);
	void lfTPlowChanged(bool);
	void rfTPlowChanged(bool);
	void lrTPlowChanged(bool);
	void rrTPlowChanged(bool);
	void lfTTStatusChanged(bool);
	void rfTTStatusChanged(bool);
	void lrTTStatusChanged(bool);
	void rrTTStatusChanged(bool);

	void buttonShort();
	void buttonLong();

	void pepsPowerStatusChanged(uint);
	void seltTextChanged(bool);
	void carDoorTextChanged(bool);
	void tireTextChanged(bool);
	void sysTextChanged(bool);
	void mcuVer1Changed(uint);
	void mcuVer2Changed(uint);
	void mcuVer3Changed(uint);
	void secondsChanged(uint);

	void activeChanged(bool);
	void keyActiveChanged(bool);

	//setting
	void dateTimeSetChanged(uint);
	void tripClearChanged(bool);
	void setBackLightChanged(uint);
	void setLcdNightLightChanged(uint);
	void musicSetChanged(uint);
	void setThemeChanged(uint);
	void musicStatusChanged(bool);
	void setOverSpeedChanged(uint);
	// updata function
	void updateShowChanged(bool);
	void updataTypesChanged(QString);
	void updataVerChanged(QString);
	void updataProgressChanged(uint);

	//Menu state
	void menuPanelStateChanged(QString);
	void tireShowStateChanged(QString);
	void energyPanelStateChanged(QString);
	void setLcdLightStateChanged(QString);
	void setOverSpeedStateChanged(QString);
	void musicSetStateChanged(QString);
	void setThemeStateChanged(QString);
	void tirePressPanelStateChanged(QString);
	void exitPanelStateChanged(QString);

	//tips src
	void warningSrcChanged(QString);
	void warningIndexChanged(TIPSREC);
	// dashboard status
	void dashboardStatusChanged(QString);
	//behavior
	void rpmAngleChanged(float);
	void powerMeterAngleChanged(float);
	void powerMeterAngle1Changed(float);
	void powerMeterAngle2Changed(float);
	void powerMeterAngle3Changed(float);
	void powerMeterAngle4Changed(float);
	void powerMeterAngle5Changed(float);
	void insideTempChanged(uint);
	void outTempChanged(uint);
	void waterTempHightChanged(float);
	void leftPointXChanged(float);
	void leftPointYChanged(float);
	void socHightChanged(float);
	void rightPointXChanged(float);
	void rightPointYChanged(float);
	void tireWarningChanged(bool);
	//warning add 20160819
	void anyDoorChanged(bool);
	void tpTempChanged(bool);
	void tpLowChanged(bool);
	void tpHighChanged(bool);
	void tpLoseChanged(bool);
	void ttLoseChanged(bool);
	void tpLeakageChanged(bool);
	void tireBatteryLowChanged(bool);
	void seatbeltChanged(bool);
	void chargePanelVisibleChanged(bool);
//	void logoVChanged(bool);

	Q_INVOKABLE void statusChanged();

protected slots:
	void setSerial();
	void getSerial(CarInfo data);
	void mcuUpdataSerial(QByteArray data);
	void shortKeyDeal();
	void longKeyDeal();
	void tipsInfoTimer();
	void rpmAngleTimeout();
	void powerMeterAngleTimeout();
	void powerMeterAngle1Timeout();
	void powerMeterAngle2Timeout();
	void powerMeterAngle3Timeout();
	void powerMeterAngle4Timeout();
	void powerMeterAngle5Timeout();
	void waterTempHightTimeout();
	void leftPointXTimeout();
	void leftPointYTimeout();
	void socHightTimeout();
	void rightPointXTimeout();
	void rightPointYTimeout();
	void setAnyDoor();
	void setTPStatus();
	void setTTStatus();
	void setTPBattery();
	void setTPLose();
	void setTTLose();
	void setseatbelt();
//	void connecting();            // 请求建立连接
//	void conEstablished();        // 建立连接
//	void disConnected();
//	void sendWavId();
//	void initNetWork();

protected:
	void timerEvent(QTimerEvent *event);
	void initValues();
	void keyDeal(uint key_v, KEY_TYPE key_type);
	void speedValue(uint spd,uint *spd_step);
	void chargeShow(bool doorStatus);
//	void musicOff(bool socStatus);
	KEY_STATUS isLongkeyDeal(uint key_v, uint *key_step, uint *key_no_step);

private:
	// all have
//	QTcpSocket *client;            // socket对象
	uint m_speed;
	uint m_ignOnMusic;
	uint m_rpm;
	uint m_odo;
	uint m_gear;
	uint m_trip;
	uint m_waterTemp;
	uint m_powerMeter;
	uint m_mileage;
	uint m_theme;
	uint m_lcdLight;
	uint m_lcdNightLight;
	QString m_hour;
	QString m_minite;
	bool m_leftFrontDoor;
	bool m_leftRearDoor;
	bool m_rightFrontDoor;
	bool m_rightRearDoor;
	bool m_hoodDoor;
	bool m_trunkDoor;
	uint m_powerStatus;
	uint m_carTemp;
	uint m_outsideTemp;
	uint m_chargeCurrent;

	bool m_epsErrLight;
	bool m_lowBeam;
	bool m_highBeam;
	bool m_leftSignal;
	bool m_rightSignal;
	bool m_backFogLight;
	bool m_frontFogLight;
	bool m_waterTempLight;
	bool m_airBagLight;
	bool m_dcdcErrLight;
	bool m_batteryCutoff;
	uint m_batteryErr;
	uint m_batteryLow;
	bool m_mainSeatbelt;
	bool m_copilotSeatbelt;
	bool m_pepsKeyLight;
	bool m_meterHotLight;
	bool m_tirePressLight;
	uint m_chargeLine;
	uint m_insulation;
	bool m_chargeLight;
	uint m_soc;
	uint m_pControllerErr;
	bool m_ready;
	bool m_ebdLight;
	bool m_absLight;
	bool m_sysErr;
	bool m_limitedPower;

	uint m_energyConsumption;
	uint m_overSpeed;
	bool m_lowBeamText;
	bool m_overSpeedWarning;
	bool m_vacuumPumpText;
	bool m_handbrakeText;
	bool m_waterPumpText;
	bool m_chargerHotText;
	bool m_chargeLineText;
	bool m_powerOnText;
	bool m_esclText;
	bool m_pepsText;
	bool m_keyPowerLowText;
	bool m_missKetText;
	bool m_keyOutsideText;
	bool m_keyPowerOnText;
	bool m_pushPowerOnText;
	bool m_takePgear;

	uint m_lfTP;
	uint m_rfTP;
	uint m_lrTP;
	uint m_rrTP;
	uint m_lfTPStatus;
	uint m_rfTPStatus;
	uint m_lrTPStatus;
	uint m_rrTPStatus;
	uint m_lfTT;
	uint m_rfTT;
	uint m_lrTT;
	uint m_rrTT;
	bool m_lfTPlow;
	bool m_rfTPlow;
	bool m_lrTPlow;
	bool m_rrTPlow;
	bool m_lfTTStatus;
	bool m_rfTTStatus;
	bool m_lrTTStatus;
	bool m_rrTTStatus;

	uint m_pepsPowerStatus;
	bool m_seltText;
	bool m_carDoorText;
	bool m_tireText;
	bool m_sysText;
	uint m_mcuVer1;
	uint m_mcuVer2;
	uint m_mcuVer3;
	uint m_seconds;

	bool m_active;
	bool m_keyActive;

	//setting
	uint m_dateTimeSet;
	bool m_tripClear;
	uint m_setBackLight;
	uint m_setLcdNightLight;
	uint m_musicSet;
	uint m_setTheme;
	bool m_musicStatus;
	uint m_setOverSpeed;

	bool m_key_ok;
	uint m_key_okStep;
	uint m_key_noStep;
	uint m_spd_step;
	uint m_speedData[10];
	uint speedSum;

	uint m_frameTypes;
	// updata function
	bool m_updateShow;
	QString m_updataTypes;
	QString m_updataVer;
	uint m_updataProgress;

	Serial *m_serial;

	QString m_menuPanelState;
	QString m_tireShowState;
	QString m_energyPanelState;
	QString m_setLcdLightState;
	QString m_setOverSpeedState;
	QString m_musicSetState;
	QString m_setThemeState;
	QString m_tirePressPanelState;
	QString m_exitPanelState;
	uint curMenu;

	TIPSREC tipsIndex(uint8_t idn);
	bool insertList(QList<Warning> *list, Warning idn);
	void removeList(QList<Warning> *list, Warning idn);
	void tipsSet(QList<Warning> *list,Warning idn, bool status);
	// tips src
	QString m_warningSrc;
	TIPSREC m_warningIndex;
	QList<Warning> tipsInfoList;
	QTimer *m_tipsInfoTimer;
//	QTimer *m_tcpConnectTimer;
	int tipsInfoListIndexs;
	int tipsInfoListInsert;
	// rpmAngle
	float m_rpmAngleFrom;
	float m_rpmAngleTo;
	float m_rpmAngle;
	// powerMeterAngle
	float m_powerMeterAngleFrom;
	float m_powerMeterAngleTo;
	float m_powerMeterAngle;
	// powerMeterAngle1
	float m_powerMeterAngle1From;
	float m_powerMeterAngle1To;
	float m_powerMeterAngle1;
	// powerMeterAngle2
	float m_powerMeterAngle2From;
	float m_powerMeterAngle2To;
	float m_powerMeterAngle2;
	// powerMeterAngle3
	float m_powerMeterAngle3From;
	float m_powerMeterAngle3To;
	float m_powerMeterAngle3;
	// powerMeterAngle4
	float m_powerMeterAngle4From;
	float m_powerMeterAngle4To;
	float m_powerMeterAngle4;
	// powerMeterAngle5
	float m_powerMeterAngle5From;
	float m_powerMeterAngle5To;
	float m_powerMeterAngle5;
	//temp
	uint m_insideTemp;
	uint m_outTemp;
	//left waterTempBar
	float m_waterTempHight;
	float m_waterTempHightFrom;
	float m_waterTempHightTo;
	float m_leftPointX;
	float m_leftPointXFrom;
	float m_leftPointXTo;
	float m_leftPointY;
	float m_leftPointYFrom;
	float m_leftPointYTo;
	//right socBar
	float m_socHight;
	float m_socHightFrom;
	float m_socHightTo;
	float m_rightPointX;
	float m_rightPointXFrom;
	float m_rightPointXTo;
	float m_rightPointY;
	float m_rightPointYFrom;
	float m_rightPointYTo;
	bool m_tireWarning;
	//warning add 20160819
	bool m_anyDoor;
	bool m_tpTemp;
	bool m_tpLow;
	bool m_tpHigh;
	bool m_tpLose;
	bool m_ttLose;
	bool m_tpLeakage;
	bool m_tireBatteryLow;
	bool m_seatbelt;
	bool m_chargePanelVisible;
//	bool m_logoV;
	//warning tipsValue
	bool m_tipsChargeLine;
	bool m_tipsChargeHot;
	bool m_tipsEscl;
	bool m_tipsPeps;
	bool m_tipsKeypowerLow;
	bool m_tipsMissKey;
	bool m_tipsKeyOutside;
	bool m_tipsKeyPowerOn;
	bool m_tipsPushPowerOn;
	bool m_tipsTakePGear;
	bool m_tipsPowerOn;
	bool m_tipsHandBrake;
	bool m_tipsTPTempHot;
	bool m_tipsTPHigh;
	bool m_tipsTPLow;
	bool m_tipsTPLeakage;
	bool m_tipsTPSensorLow;
	bool m_tipsWaterPump;
	bool m_tipsVacPump;
	bool m_tipsCarDoor;
	bool m_tipsSeatBelt;
	bool m_tipsOverSpeed;
	bool m_tipsLowBeam;
	bool m_tipsSysText;

//	bool m_wavCharging;
//	bool m_music1;
//	bool m_music2;

//	bool m_connectFlag;

	QTimer *rpmAngleTimer;
	QTimer *powerMeterAngleTimer;
	QTimer *powerMeterAngle1Timer;
	QTimer *powerMeterAngle2Timer;
	QTimer *powerMeterAngle3Timer;
	QTimer *powerMeterAngle4Timer;
	QTimer *powerMeterAngle5Timer;
	QTimer *waterTempHightTimer;
	QTimer *leftPointXTimer;
	QTimer *leftPointYTimer;
	QTimer *socHightTimer;
	QTimer *rightPointXTimer;
	QTimer *rightPointYTimer;

	Warning tipsChargeLine;
	Warning tipsChargeHot;
	Warning tipsEscl;
	Warning tipsPeps;
	Warning tipsKeyPowerLow;//TIPS_KEYPOWER_LOW;
	Warning tipsMissKey;//TIPS_MISS_KEY;
	Warning tipsKeyOutside;//TIPS_KEY_OUTSIDE;
	Warning tipsKeyPowerOn;//TIPS_KEY_POWERON;
	Warning tipsPushPowerOn;//TIPS_PUSH_POWERON;
	Warning tipsTakePGear;//TIPS_TAKE_PGEAR;
	Warning tipsPowerOn;//TIPS_POWER_ON;
	Warning tipsHandBrake;//TIPS_HAND_BRAKE;
	Warning tipsTTHot;//TIPS_TIRE_PRESSURE_TEMPHOT;
	Warning tipsTPLow;//TIPS_TIRE_PRESSURE_LOW;
	Warning tipsTPHigh;//TIPS_TIRE_PRESSURE_HIGH;
	Warning tipsTPLeakage;//TIPS_TIRE_PRESSURE_LEAKAGE;
	Warning tipsTPBatteryLow;//TIPS_TIRE_PRESSURE_SENSOR_BATTERY_LOW;
	Warning tipsWaterPump;//TIPS_WATER_PUMP;
	Warning tipsVacPump;//TIPS_VAC_PUMP;
	Warning tipsCarDoor;//TIPS_CAR_DOOR;
	Warning tipsSeatBelt;//TIPS_SEAT_BELT;
	Warning tipsOverSpeed;//TIPS_OVER_SPEED;
	Warning tipsLowBeam;//TIPS_LOW_BEAM;
	Warning tipsSysText;

	//dashboard status
	QString m_dashboardStatus;
};

#endif // CARSTATUS_H
