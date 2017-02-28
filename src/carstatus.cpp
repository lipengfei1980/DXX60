#include <QDebug>
#include <QFile>
#include <QDateTime>
#include <QProcess>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <serial.h>
#include <carstatus.h>
#include <QString>
//#include <QTcpSocket>
#include <QtCore/QFile>

#define ValueChangeSet(name, v) do{if(m_##name!=(v)){m_##name=(v); emit name##Changed(v); qDebug()<<QString(#name)<<(v);}}while(0)
#define ErrChangeSet(tipsname, tipsValue, v, status) do{\
	bool v_bak = (v);\
	if(m_dashboardStatus == "dormancyPanel" && status == STATE_ALL){(v_bak)=false;}\
	if(m_dashboardStatus == "chargePanel" && status != STATE_CHARGE){(v_bak)=false;}\
	if((tipsValue)!=(v_bak)){(tipsValue)=(v_bak); tipsSet(&tipsInfoList,(tipsname),(tipsValue)); }\
	}while(0)
#if 0
#define WavChangeSet(tipsValue, v) do{\
	bool v_bak = (v);\
	if((tipsValue)!=(v_bak)){(tipsValue)=(v_bak); }\
	}while(0)
#endif

#define AnimationDealEmit(name, from, to, ms, isFirst) \
	do{	\
	if(!isFirst) {	\
	m_##name += (to - from) / (3 * ms / 25);	\
	} else {	\
	m_##name = from;	\
	}	\
	if(((to - from) > 0) ? m_##name < to : m_##name > to) {	\
	emit name##Changed(m_##name);	\
	name##Timer->start(ms / (3 * ms / 25));	\
	} else {	\
	m_##name = to;	\
	emit name##Changed(m_##name);	\
	name##Timer->stop();	\
	}	\
	}while(0)


CarStatus::CarStatus(const QString &serialDev, QObject *parent) :
	QObject(parent)
{
	initValues();
//	initNetWork();
	m_serial = new Serial(serialDev, this);
	connect(m_serial, SIGNAL(serialChanged(CarInfo)), this, SLOT(getSerial(CarInfo)));
	connect(m_serial, SIGNAL(mcuUpdataChanged(QByteArray)), this, SLOT(mcuUpdataSerial(QByteArray)));
	connect(this, SIGNAL(buttonShort()), this, SLOT(shortKeyDeal()));
	connect(this, SIGNAL(buttonLong()), this, SLOT(longKeyDeal()));
	m_tipsInfoTimer = new QTimer(this);
	connect(m_tipsInfoTimer, SIGNAL(timeout()), this, SLOT(tipsInfoTimer()));

	//Animation
	rpmAngleTimer = new QTimer(this);
	connect(rpmAngleTimer, SIGNAL(timeout()),this,SLOT(rpmAngleTimeout()));
	powerMeterAngleTimer = new QTimer(this);
	connect(powerMeterAngleTimer, SIGNAL(timeout()),this,SLOT(powerMeterAngleTimeout()));
	powerMeterAngle1Timer = new QTimer(this);
	connect(powerMeterAngle1Timer, SIGNAL(timeout()),this,SLOT(powerMeterAngle1Timeout()));
	powerMeterAngle2Timer = new QTimer(this);
	connect(powerMeterAngle2Timer, SIGNAL(timeout()),this,SLOT(powerMeterAngle2Timeout()));
	powerMeterAngle3Timer = new QTimer(this);
	connect(powerMeterAngle3Timer, SIGNAL(timeout()),this,SLOT(powerMeterAngle3Timeout()));
	powerMeterAngle4Timer = new QTimer(this);
	connect(powerMeterAngle4Timer, SIGNAL(timeout()),this,SLOT(powerMeterAngle4Timeout()));
	powerMeterAngle5Timer = new QTimer(this);
	connect(powerMeterAngle5Timer, SIGNAL(timeout()),this,SLOT(powerMeterAngle5Timeout()));
	waterTempHightTimer = new QTimer(this);
	connect(waterTempHightTimer, SIGNAL(timeout()),this,SLOT(waterTempHightTimeout()));
	leftPointXTimer = new QTimer(this);
	connect(leftPointXTimer, SIGNAL(timeout()),this,SLOT(leftPointXTimeout()));
	leftPointYTimer = new QTimer(this);
	connect(leftPointYTimer, SIGNAL(timeout()),this,SLOT(leftPointYTimeout()));
	socHightTimer = new QTimer(this);
	connect(socHightTimer, SIGNAL(timeout()),this,SLOT(socHightTimeout()));
	rightPointXTimer = new QTimer(this);
	connect(rightPointXTimer, SIGNAL(timeout()),this,SLOT(rightPointXTimeout()));
	rightPointYTimer = new QTimer(this);
	connect(rightPointYTimer, SIGNAL(timeout()),this,SLOT(rightPointYTimeout()));

	connect(this, SIGNAL(leftFrontDoorChanged(bool)), this, SLOT(setAnyDoor()));
	connect(this, SIGNAL(leftRearDoorChanged(bool)), this, SLOT(setAnyDoor()));
	connect(this, SIGNAL(rightFrontDoorChanged(bool)), this, SLOT(setAnyDoor()));
	connect(this, SIGNAL(rightRearDoorChanged(bool)), this, SLOT(setAnyDoor()));
	connect(this, SIGNAL(hoodDoorChanged(bool)), this, SLOT(setAnyDoor()));
	connect(this, SIGNAL(trunkDoorChanged(bool)), this, SLOT(setAnyDoor()));

	connect(this, SIGNAL(lfTPStatusChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(rfTPStatusChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(lrTPStatusChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(rrTPStatusChanged(uint)), this, SLOT(setTPStatus()));

	connect(this, SIGNAL(lfTTStatusChanged(bool)), this, SLOT(setTTStatus()));
	connect(this, SIGNAL(rfTTStatusChanged(bool)), this, SLOT(setTTStatus()));
	connect(this, SIGNAL(lrTTStatusChanged(bool)), this, SLOT(setTTStatus()));
	connect(this, SIGNAL(rrTTStatusChanged(bool)), this, SLOT(setTTStatus()));

	connect(this, SIGNAL(lfTPChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(rfTPChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(lrTPChanged(uint)), this, SLOT(setTPStatus()));
	connect(this, SIGNAL(rrTPChanged(uint)), this, SLOT(setTPStatus()));

	connect(this, SIGNAL(lfTPlowChanged(bool)), this, SLOT(setTPBattery()));
	connect(this, SIGNAL(rfTPlowChanged(bool)), this, SLOT(setTPBattery()));
	connect(this, SIGNAL(lrTPlowChanged(bool)), this, SLOT(setTPBattery()));
	connect(this, SIGNAL(rrTPlowChanged(bool)), this, SLOT(setTPBattery()));

	connect(this, SIGNAL(lfTPChanged(uint)), this, SLOT(setTPLose()));
	connect(this, SIGNAL(rfTPChanged(uint)), this, SLOT(setTPLose()));
	connect(this, SIGNAL(lrTPChanged(uint)), this, SLOT(setTPLose()));
	connect(this, SIGNAL(rrTPChanged(uint)), this, SLOT(setTPLose()));

	connect(this, SIGNAL(lfTTChanged(uint)), this, SLOT(setTTLose()));
	connect(this, SIGNAL(rfTTChanged(uint)), this, SLOT(setTTLose()));
	connect(this, SIGNAL(lrTTChanged(uint)), this, SLOT(setTTLose()));
	connect(this, SIGNAL(rrTTChanged(uint)), this, SLOT(setTTLose()));

	connect(this, SIGNAL(mainSeatbeltChanged(bool)), this, SLOT(setseatbelt()));
	connect(this, SIGNAL(copilotSeatbeltChanged(bool)), this, SLOT(setseatbelt()));


	startTimer(UPFRAME_FREQ);
}

///*连接建立时调用该函数，停止发送建立连接的请求*/
//void CarStatus::conEstablished()
//{
//	m_connectFlag = true;
//	m_tcpConnectTimer->stop();
//}
///*当连接断开时，发送连接请求*/
//void CarStatus::disConnected()
//{
//	m_connectFlag = false;
//	client->close();
//	m_tcpConnectTimer->start(500);
//}

///*请求链接函数：以每秒2次的频率向服务器请求建立链接，
//	当链接建立时停止发送请求。*/
//void CarStatus::connecting()
//{
//	client->connectToHost(CONNECT_SERVERS_ADDR, CONNECT_SERVERS_PORT);    // local
//}

//void CarStatus::sendWavId()
//{
//	AckAudio ackAudio;
//	memset(&ackAudio, 0, sizeof(AckAudio));

//	ackAudio.head = 0xAA;
//	ackAudio.length = sizeof(AckAudio) + 5;
//	ackAudio.socketPack.wavCharging = m_wavCharging;
//	ackAudio.socketPack.music1 = m_music1;
//	ackAudio.socketPack.music2 = m_music2;
//	ackAudio.crc = crc16Check((uint8_t *)(&(ackAudio.socketPack)), sizeof(SocketPack));
//	ackAudio.tail = 0x55;
//	long len = 0;
//	qDebug()<<"music1 ======================= "<<m_music1;
//	qDebug()<<"music2 ======================= "<<m_music2;
//	len = client->write(QByteArray((char *)&ackAudio, sizeof(AckAudio)));
//	client->flush();         //立即把缓冲区的数据写到底层的网络套接字中，即立刻把数据发送出去。

//	if (-1 == len)
//	{
//		client->close();
//		return;
//	}
//}

//void CarStatus::initNetWork()
//{
//	client = new QTcpSocket();
//	client->setParent(this);
//	client->connectToHost(CONNECT_SERVERS_ADDR, CONNECT_SERVERS_PORT);    // local
//	m_tcpConnectTimer = new QTimer;
//	m_tcpConnectTimer->start(500);
//	connect(m_tcpConnectTimer,SIGNAL(timeout()),this,SLOT(connecting()));
//	connect(client, SIGNAL(connected()), this, SLOT(conEstablished()));
//	connect(client, SIGNAL(connected()), this, SLOT(sendWavId()));
//	connect(client, SIGNAL(disconnected()), this, SLOT(disConnected()));
//}

void CarStatus::initValues()
{
	m_active = false;
	m_keyActive = true;

	// all have
	m_speed = 0;
	m_ignOnMusic = 0;
	m_rpm = 0;
	m_odo = 0;
	m_gear = 0;
	m_trip = 0;
	m_waterTemp = 0;
	m_powerMeter = 60;
	m_mileage = 0;
	m_theme = 1;
	m_lcdLight = 0;
	m_lcdNightLight = 0;
	m_hour = "00";
	m_minite = "00";
	m_leftFrontDoor = false;
	m_leftRearDoor = false;
	m_rightFrontDoor = false;
	m_rightRearDoor = false;
	m_hoodDoor = false;
	m_trunkDoor = false;
	m_powerStatus = 2;	//set value not 0 or 1
	m_carTemp = 40;
	m_outsideTemp = 40;
	m_chargeCurrent = 0;

	m_epsErrLight = false;
	m_lowBeam = false;
	m_highBeam = false;
	m_leftSignal = false;
	m_rightSignal = false;
	m_backFogLight = false;
	m_frontFogLight = false;
	m_waterTempLight = false;
	m_airBagLight = false;
	m_dcdcErrLight = false;
	m_batteryCutoff = false;
	m_batteryErr = 0;
	m_batteryLow = 0;
	m_mainSeatbelt = false;
	m_copilotSeatbelt = false;
	m_pepsKeyLight = false;
	m_meterHotLight = false;
	m_tirePressLight = false;
	m_chargeLine = 0; // set value not 0 or 1
	m_insulation = 0;
	m_chargeLight = false;
	m_soc = 0;
	m_pControllerErr = 0;
	m_ready = false;
	m_ebdLight = false;
	m_absLight = false;
	m_sysErr = false;
	m_limitedPower = false;

	m_energyConsumption = 0;
	m_overSpeed = 0;
	m_lowBeamText = false;
	m_overSpeedWarning = false;
	m_vacuumPumpText = false;
	m_handbrakeText = false;
	m_waterPumpText = false;
	m_chargerHotText = false;
	m_chargeLineText = false;
	m_powerOnText = false;
	m_esclText = false;
	m_pepsText = false;
	m_keyPowerLowText = false;
	m_missKetText = false;
	m_keyOutsideText = false;
	m_keyPowerOnText = false;
	m_pushPowerOnText = false;
	m_takePgear = false;

	m_lfTP = 0;
	m_rfTP = 0;
	m_lrTP = 0;
	m_rrTP = 0;
	m_lfTPStatus = 0;
	m_rfTPStatus = 0;
	m_lrTPStatus = 0;
	m_rrTPStatus = 0;
	m_lfTT = 0;
	m_rfTT = 0;
	m_lrTT = 0;
	m_rrTT = 0;
	m_lfTPlow = false;
	m_rfTPlow = false;
	m_lrTPlow = false;
	m_rrTPlow = false;
	m_lfTTStatus = false;
	m_rfTTStatus = false;
	m_lrTTStatus = false;
	m_rrTTStatus = false;
	m_chargePanelVisible = true;

	m_pepsPowerStatus = 0;
	m_seltText = false;
	m_carDoorText = false;
	m_tireText = false;
	m_sysText = false;
	m_mcuVer1 = 0;
	m_mcuVer2 = 0;
	m_mcuVer3 = 0;
	m_seconds = 0;

	m_dateTimeSet = 0;
	m_tripClear = false;
	m_setBackLight = 0;
	m_setLcdNightLight = 0;
	m_musicSet = 0;
	m_setTheme = 0;
	m_musicStatus = false;
	m_setOverSpeed = 0;

	m_key_ok = false;
	m_key_okStep = 0;

	m_updateShow = false;
	m_updataTypes = "";
	m_updataVer = "";
	m_updataProgress = 0;

	curMenu = MENU_NONE;
	m_energyPanelState = "";
	m_setLcdLightState = "";
	m_setOverSpeedState = "";
	m_musicSetState = "";
	m_setThemeState = "";
	m_tirePressPanelState = "";
	m_exitPanelState = "";
	m_tireShowState = "";
	emit energyPanelStateChanged(m_energyPanelState);
	emit setLcdLightStateChanged(m_setLcdLightState);
	emit setOverSpeedStateChanged(m_setOverSpeedState);
	emit musicSetStateChanged(m_musicSetState);
	emit setThemeStateChanged(m_setThemeState);
	emit tirePressPanelStateChanged(m_tirePressPanelState);
	emit exitPanelStateChanged(m_exitPanelState);

	// tips src
	m_warningIndex = TIPS_SINGLE;
	m_warningSrc = "";
	emit warningSrcChanged(m_warningSrc);
	emit warningIndexChanged(m_warningIndex);

	//dashboard status
	m_dashboardStatus = "dormancyPanel";
	emit dashboardStatusChanged(m_dashboardStatus);

	tipsChargeLine.priority =  1;
	tipsChargeLine.uniq_id = TIPS_CHARGE_LINE;
	tipsChargeLine.qmlPath = "qrc:/qml/qml/content/Warning/ChargeWarningPanel.qml";
	tipsChargeLine.time = 10000;

	tipsChargeHot.priority = 2;
	tipsChargeHot.uniq_id = TIPS_CHARGER_HOT;
	tipsChargeHot.qmlPath = "qrc:/qml/qml/content/Warning/ChargerHotWarningPanel.qml";
	tipsChargeHot.time = 10000;

	tipsEscl.priority = 3;
	tipsEscl.uniq_id = TIPS_ESCL;
	tipsEscl.qmlPath = "qrc:/qml/qml/content/Warning/EsclWarningPanel.qml";
	tipsEscl.time = 10000;

	tipsPeps.priority = 4;
	tipsPeps.uniq_id = TIPS_PEPS;
	tipsPeps.qmlPath = "qrc:/qml/qml/content/Warning/PepsWarningPanel.qml";
	tipsPeps.time = 10000;

	tipsKeyPowerLow.priority = 5;
	tipsKeyPowerLow.uniq_id = TIPS_KEYPOWER_LOW;
	tipsKeyPowerLow.qmlPath = "qrc:/qml/qml/content/Warning/KeyPowerLowWarningPanel.qml";
	tipsKeyPowerLow.time = 10000;

	tipsMissKey.priority = 6;
	tipsMissKey.uniq_id = TIPS_MISS_KEY;
	tipsMissKey.qmlPath = "qrc:/qml/qml/content/Warning/MissKeyWarningPanel.qml";
	tipsMissKey.time = 10000;

	tipsKeyOutside.priority = 7;
	tipsKeyOutside.uniq_id = TIPS_KEY_OUTSIDE;
	tipsKeyOutside.qmlPath = "qrc:/qml/qml/content/Warning/KeyOutsideWarningPanel.qml";
	tipsKeyOutside.time = 10000;

	tipsKeyPowerOn.priority = 8;
	tipsKeyPowerOn.uniq_id = TIPS_KEY_POWERON;
	tipsKeyPowerOn.qmlPath = "qrc:/qml/qml/content/Warning/KeyPowerOnWarningPanel.qml";
	tipsKeyPowerOn.time = 10000;

	tipsPushPowerOn.priority = 9;
	tipsPushPowerOn.uniq_id = TIPS_PUSH_POWERON;
	tipsPushPowerOn.qmlPath = "qrc:/qml/qml/content/Warning/PushPowerWarningPanel.qml";
	tipsPushPowerOn.time = 10000;

	tipsTakePGear.priority = 10;
	tipsTakePGear.uniq_id = TIPS_TAKE_PGEAR;
	tipsTakePGear.qmlPath = "qrc:/qml/qml/content/Warning/TakePWarningPanel.qml";
	tipsTakePGear.time = 10000;

	tipsPowerOn.priority = 11;
	tipsPowerOn.uniq_id = TIPS_POWER_ON;
	tipsPowerOn.qmlPath = "qrc:/qml/qml/content/Warning/PowerOnWarningPanel.qml";
	tipsPowerOn.time = 10000;

	tipsSysText.priority =  12;
	tipsSysText.uniq_id = TIPS_SYS;
	tipsSysText.qmlPath = "qrc:/qml/qml/content/Warning/SysWarningPanel.qml";
	tipsSysText.time = 10000;

	tipsHandBrake.priority = 13;
	tipsHandBrake.uniq_id = TIPS_HAND_BRAKE;
	tipsHandBrake.qmlPath = "qrc:/qml/qml/content/Warning/HandbrakeWarningPanel.qml";
	tipsHandBrake.time = 10000;

	tipsTTHot.priority = 14;
	tipsTTHot.uniq_id = TIPS_TIRE_PRESSURE_TEMPHOT;
	tipsTTHot.qmlPath = "qrc:/qml/qml/content/Warning/TpTempWarningPanel.qml";
	tipsTTHot.time = 10000;

	tipsTPLow.priority = 15;
	tipsTPLow.uniq_id = TIPS_TIRE_PRESSURE_LOW;
	tipsTPLow.qmlPath = "qrc:/qml/qml/content/Warning/TpLowWarningPanel.qml";
	tipsTPLow.time = 10000;

	tipsTPHigh.priority = 16;
	tipsTPHigh.uniq_id = TIPS_TIRE_PRESSURE_HIGH;
	tipsTPHigh.qmlPath = "qrc:/qml/qml/content/Warning/TpHighWarningPanel.qml";
	tipsTPHigh.time = 10000;

	tipsTPLeakage.priority = 17;
	tipsTPLeakage.uniq_id = TIPS_TIRE_PRESSURE_LEAKAGE;
	tipsTPLeakage.qmlPath = "qrc:/qml/qml/content/Warning/TireLeakageWarningPanel.qml";
	tipsTPLeakage.time = 10000;

	tipsTPBatteryLow.priority = 18;
	tipsTPBatteryLow.uniq_id = TIPS_TIRE_PRESSURE_SENSOR_BATTERY_LOW;
	tipsTPBatteryLow.qmlPath = "qrc:/qml/qml/content/Warning/SensorLowWarningPanel.qml";
	tipsTPBatteryLow.time = 10000;

	tipsWaterPump.priority = 19;
	tipsWaterPump.uniq_id = TIPS_WATER_PUMP;
	tipsWaterPump.qmlPath = "qrc:/qml/qml/content/Warning/WaterWarningPanel.qml";
	tipsWaterPump.time = 10000;

	tipsVacPump.priority = 20;
	tipsVacPump.uniq_id = TIPS_VAC_PUMP;
	tipsVacPump.qmlPath = "qrc:/qml/qml/content/Warning/VacuumWarningPanel.qml";
	tipsVacPump.time = 10000	;

	tipsLowBeam.priority = 21;
	tipsLowBeam.uniq_id = TIPS_LOW_BEAM;
	tipsLowBeam.qmlPath = "qrc:/qml/qml/content/Warning/LowbeamWarningPanel.qml";
	tipsLowBeam.time = 1000;

	tipsCarDoor.priority = 22;
	tipsCarDoor.uniq_id = TIPS_CAR_DOOR;
	tipsCarDoor.qmlPath = "qrc:/qml/qml/content/Warning/CardoorWarningPanel.qml";
	tipsCarDoor.time = 10000;

	tipsSeatBelt.priority = 23;
	tipsSeatBelt.uniq_id = TIPS_SEAT_BELT;
	tipsSeatBelt.qmlPath = "qrc:/qml/qml/content/Warning/SeatbeltWarningPanel.qml";
	tipsSeatBelt.time = 10000;

	tipsOverSpeed.priority = 24;
	tipsOverSpeed.uniq_id = TIPS_OVER_SPEED;
	tipsOverSpeed.qmlPath = "qrc:/qml/qml/content/Warning/OverSpeedWarningPanel.qml";
	tipsOverSpeed.time = 10000;
	m_warningSrc = "";
	tipsInfoList.clear();

	//Animation rpm
	m_rpmAngle = 0.0;
	m_rpmAngleFrom = 0.0;
	m_rpmAngleTo = 0.0;
	//Animation powerMeterAngle
	m_powerMeterAngle = -70.0;
	m_powerMeterAngleFrom = -70.0;
	m_powerMeterAngleTo = -70.0;
	//Animation powerMeterAngle1
	m_powerMeterAngle1 = 0.0;
	m_powerMeterAngle1From = 0.0;
	m_powerMeterAngle1To = 0.0;
	//Animation powerMeterAngle2
	m_powerMeterAngle2 = -29.0 - 44.5;
	m_powerMeterAngle2From = -29.0 - 44.5;
	m_powerMeterAngle2To = -29.0 - 44.5;
	//Animation powerMeterAngle3
	m_powerMeterAngle3 = 43.5 - 29.0;
	m_powerMeterAngle3From = 43.5 - 29.0;
	m_powerMeterAngle3To = 43.5 - 29.0;
	//Animation powerMeterAngle4
	m_powerMeterAngle4 = -28.0 - 44.0;
	m_powerMeterAngle4From = -28.0 - 44.0;
	m_powerMeterAngle4To = -28.0 - 44.0;
	//Animation powerMeterAngle5
	m_powerMeterAngle5 = 44.0 - 27.0;
	m_powerMeterAngle5From = 44.0 - 27.0;
	m_powerMeterAngle5To = 44.0 - 27.0;
	//temp
	m_insideTemp = 0;
	m_outTemp = 0;
	//left waterTempBar
	m_waterTempHight = 95.0;
	m_waterTempHightFrom = 95.0;
	m_waterTempHightTo = 95.0;
	m_leftPointX = 170.0;
	m_leftPointXFrom = 170.0;
	m_leftPointXTo = 170.0;
	m_leftPointY = 331.0;
	m_leftPointYFrom = 331.0;
	m_leftPointYTo = 331.0;
	//right socBar
	m_socHight = 6.5;
	m_socHightFrom = 6.5;
	m_socHightTo = 6.5;
	m_rightPointX = 1077.0;
	m_rightPointXFrom = 1077.0;
	m_rightPointXTo = 1077.0;
	m_rightPointY = 334.0;
	m_rightPointYFrom = 334.0;
	m_rightPointYTo = 334.0;
	m_tireWarning = false;
	//warning add 20160819
	m_anyDoor = false;
	m_tpTemp = false;
	m_tpLow = false;
	m_tpHigh = false;
	m_tpLose = false;
	m_ttLose = false;
	m_tpLeakage = false;
	m_tireBatteryLow = false;
	m_seatbelt = false;
	m_tipsChargeLine = false;
	m_tipsChargeHot = false;
	m_tipsEscl = false;
	m_tipsPeps = false;
	m_tipsKeypowerLow = false;
	m_tipsMissKey = false;
	m_tipsKeyOutside = false;
	m_tipsKeyPowerOn = false;
	m_tipsPushPowerOn = false;
	m_tipsTakePGear = false;
	m_tipsPowerOn = false;
	m_tipsHandBrake = false;
	m_tipsTPTempHot = false;
	m_tipsTPHigh = false;
	m_tipsTPLow = false;
	m_tipsTPLeakage = false;
	m_tipsTPSensorLow = false;
	m_tipsWaterPump = false;
	m_tipsVacPump = false;
	m_tipsCarDoor = false;
	m_tipsSeatBelt = false;
	m_tipsOverSpeed = false;
	m_tipsLowBeam = false;
	m_tipsSysText = false;

//	m_wavCharging = false;
//	m_music1 = false;
//	m_music2 = false;
//	m_connectFlag = false;
//	m_logoV = false;

	memset(m_speedData,0,sizeof(m_speedData));
}

void CarStatus::setAnyDoor()
{
	m_anyDoor = (m_leftFrontDoor || m_rightFrontDoor || m_leftRearDoor || m_rightRearDoor || m_hoodDoor || m_trunkDoor);
	emit anyDoorChanged(m_anyDoor);
}

void CarStatus::setTPStatus()
{
	m_tpHigh = (((m_lfTPStatus == 1) && (m_lfTP != 255)) || ((m_rfTPStatus == 1) && (m_rfTP != 255)) || ((m_lrTPStatus == 1) && (m_lrTP != 255)) || ((m_rrTPStatus == 1) && (m_rrTP != 255)) );
	m_tpLow = (((m_lfTPStatus == 2) && (m_lfTP != 255)) || ((m_rfTPStatus == 2) && (m_rfTP != 255)) || ((m_lrTPStatus == 2) && (m_lrTP != 255)) || ((m_rrTPStatus == 2) && (m_rrTP != 255)) );
	m_tpLeakage = (((m_lfTPStatus == 3) && (m_lfTP != 255)) || ((m_rfTPStatus == 3) && (m_rfTP != 255)) || ((m_lrTPStatus == 3) && (m_lrTP != 255)) || ((m_rrTPStatus == 3) && (m_rrTP != 255)) );
	emit tpHighChanged(m_tpHigh);
	emit tpLowChanged(m_tpLow);
	emit tpLeakageChanged(m_tpLeakage);
}

void CarStatus::setTTStatus()
{
	m_tpTemp = (m_lfTTStatus || m_rfTTStatus || m_lrTTStatus || m_rrTTStatus);
	emit tpTempChanged(m_tpTemp);
}

void CarStatus::setTTLose()
{
	m_ttLose = ((m_lfTT == 255) || (m_rfTT == 255) || (m_lrTT == 255) || (m_rrTT == 255));
	emit ttLoseChanged(m_ttLose);
}

void CarStatus::setTPLose()
{
	m_tpLose = ((m_lfTP == 255) || (m_rfTP == 255) || (m_lrTP == 255) || (m_rrTP == 255));
	emit tpLoseChanged(m_tpLose);
}

void CarStatus::setTPBattery()
{
	m_tireBatteryLow = (m_lfTPlow || m_rfTPlow || m_lrTPlow || m_rrTPlow);
	emit tireBatteryLowChanged(m_tireBatteryLow);
}

void CarStatus::setseatbelt()
{
	m_seatbelt = (m_mainSeatbelt || m_copilotSeatbelt);
	emit seatbeltChanged(m_seatbelt);
}

CarStatus::KEY_STATUS CarStatus::isLongkeyDeal(uint key_v, uint *key_step, uint *key_no_step)
{
	if( *key_step == KEY_LONG_TIME ){
		if(!key_v) {
			*key_step = 0;
		}
		return KEY_NONE;
	}

	if( *key_no_step > 50 ){
		*key_no_step = 0;
		curMenu = MENU_NONE;
		m_menuPanelState = m_energyPanelState = m_setLcdLightState = m_setOverSpeedState = m_musicSetState = m_setThemeState = m_tirePressPanelState = m_exitPanelState = "";
		emit energyPanelStateChanged(m_energyPanelState);
		emit setLcdLightStateChanged(m_setLcdLightState);
		emit setOverSpeedStateChanged(m_setOverSpeedState);
		emit musicSetStateChanged(m_musicSetState);
		emit setThemeStateChanged(m_setThemeState);
		emit tirePressPanelStateChanged(m_tirePressPanelState);
		emit exitPanelStateChanged(m_exitPanelState);
		emit menuPanelStateChanged(m_menuPanelState);
		return KEY_NONE;
	}

	if (key_v){
		++*key_step;
		*key_no_step = 0;
	}
	else
		++*key_no_step;

	// LongKey deal
	if( *key_step > 0 && *key_step <= KEY_LONG_TIME ) {
		if(!key_v) {
			*key_step = 0;
			return KEY_SHORT;
		}

		if( *key_step == KEY_LONG_TIME ) {
			return KEY_LONG;
		}
	}
	return KEY_NONE;
}

void CarStatus::keyDeal(uint key_v, KEY_TYPE key_type)
{
	KEY_STATUS keyStatus = KEY_NONE;
	m_key_ok = key_v;
	switch(key_type){
	case KEY_OK:
		keyStatus = isLongkeyDeal(m_key_ok, &m_key_okStep, &m_key_noStep);
		switch (keyStatus) {
		case KEY_SHORT:
			emit buttonShort();
			break;
		case KEY_LONG:
			emit buttonLong();
			break;
		default:
			break;
		}
		break;
	}
}

void CarStatus::speedValue(uint spd, uint *spd_step)
{
	int i;
	speedSum = 0;
	if(*spd_step > 9)
		*spd_step = 0;
	m_speedData[*spd_step] = spd;
	++*spd_step;
	for(i=0;i<10;i++){
		speedSum += m_speedData[i];
	}
	m_speed = speedSum / 10;
	emit speedChanged(m_speed);
}

void CarStatus::chargeShow(bool doorStatus)
{
	static int charge_step = 0;
	if(m_dashboardStatus == "chargePanel"){
		if(doorStatus)
			charge_step = 0;

		++charge_step;

		if(charge_step >= 300)
			m_chargePanelVisible = false;
		else
			m_chargePanelVisible = true;

		emit chargePanelVisibleChanged(m_chargePanelVisible);
	}
	else
		charge_step = 0;
}

//void CarStatus::musicOff(bool socStatus)
//{
//	static int music_step = 0;
//	if(socStatus)
//		music_step = 0;

//	++music_step;

//	if(music_step >= 100){
//		m_musicStatus = true;
//		music_step = 0;
//	}
//	else
//		m_musicStatus = false;
//}

void CarStatus::getSerial(CarInfo data)
{
	ValueChangeSet(theme,data.theme);

	int chargeLineTemp = 0;
	int powerStatusTemp = 0;
	chargeLineTemp = m_chargeLine;
	powerStatusTemp = m_powerStatus;
	ValueChangeSet(chargeLine,data.chargeLine);
	ValueChangeSet(powerStatus,data.powerStatus);
	if((data.chargeLine != chargeLineTemp) || data.powerStatus != powerStatusTemp){
		emit statusChanged();
		//		qDebug("emit statusChanged();");
	}

	chargeShow(m_anyDoor);
	QString dashboardStatusStr = "";
	if(m_updateShow){
		dashboardStatusStr = "updatePanel";
	}
	else{
		switch (m_powerStatus) {
		case 0:
			if(m_chargeLine)
				dashboardStatusStr = "chargePanel";
			else
				dashboardStatusStr = "dormancyPanel";
			break;
		case 1:
			if(m_chargeLine)
				dashboardStatusStr = "chargePanel";
			else
				dashboardStatusStr = "mainPanel";

			break;
		default:
			break;
		}
	}
	ValueChangeSet(dashboardStatus, dashboardStatusStr);
	ValueChangeSet(gear,data.gear);
	if (m_tripClear) {
		if (data.trip <= 1) {
			m_tripClear = false;
		}
	}
	ValueChangeSet(trip,data.trip);
	ValueChangeSet(odo,data.odo);
	if(m_carTemp != data.carTemp){
		m_carTemp = data.carTemp;
		if(m_carTemp >= 140)
			m_insideTemp = 99;
		else if(m_carTemp > 40)
			m_insideTemp = m_carTemp - 40;
		else
			m_insideTemp = 40 - m_carTemp;
		emit carTempChanged(m_carTemp);
		emit insideTempChanged(m_insideTemp);
	}
	if(m_outsideTemp != data.outsideTemp){
		m_outsideTemp = data.outsideTemp;
		if(m_outsideTemp >= 140)
			m_outTemp = 99;
		else if(m_outsideTemp > 40)
			m_outTemp = m_outsideTemp - 40;
		else
			m_outTemp = 40 - m_outsideTemp;
		emit outsideTempChanged(m_outsideTemp);
		emit outTempChanged(m_outTemp);
	}
	ValueChangeSet(mileage,data.mileage);

	if (m_active) {
		if(m_rpm != data.rpm){
			m_rpm = data.rpm;
			m_rpmAngleFrom = m_rpmAngle;
			if(m_rpm >= 10000)
				m_rpmAngleTo = 180;
			else
				m_rpmAngleTo = 180.0/10000.0*m_rpm;
			AnimationDealEmit(rpmAngle, m_rpmAngleFrom, m_rpmAngleTo, 500, true);
		}

		if(m_waterTemp != data.waterTemp){
			m_waterTemp = data.waterTemp;
			m_waterTempHightFrom = m_waterTempHight;
			m_leftPointXFrom = m_leftPointX;
			m_leftPointYFrom = m_leftPointY;
			if(m_waterTemp > 140){
				m_waterTempHightTo = 90.0 * 1.121 + 95.0;
				m_leftPointXTo = 170.0 - 70.0;
				m_leftPointYTo = 331.0 - 90.0;
			}
			else if(m_waterTemp >= 60){
				m_waterTempHightTo = (90.0 / 80.0 * (m_waterTemp - 60)) * 1.121 + 95.0;
				m_leftPointXTo = 170.0 - 70.0 / 80.0 * (m_waterTemp - 60);
				m_leftPointYTo = 331.0 - 90.0 / 80.0 * (m_waterTemp - 60);
			}
			else{
				m_waterTempHightTo = 95.0;
				m_leftPointXTo = 170.0;
				m_leftPointYTo = 331.0;
			}
			emit waterTempChanged(m_waterTemp);
			AnimationDealEmit(leftPointX, m_leftPointXFrom, m_leftPointXTo, 200, true);
			AnimationDealEmit(leftPointY, m_leftPointYFrom, m_leftPointYTo, 200, true);
			AnimationDealEmit(waterTempHight, m_waterTempHightFrom, m_waterTempHightTo, 200, true);
		}
		if(m_powerMeter != data.powerMeter){
			m_powerMeter = data.powerMeter;
			m_powerMeterAngleFrom = m_powerMeterAngle;
			m_powerMeterAngle1From = m_powerMeterAngle1;
			m_powerMeterAngle2From = m_powerMeterAngle2;
			m_powerMeterAngle3From = m_powerMeterAngle3;
			m_powerMeterAngle4From = m_powerMeterAngle4;
			m_powerMeterAngle5From = m_powerMeterAngle5;
			if(m_powerMeter < 30){
				m_powerMeterAngleTo = -35.0;
				m_powerMeterAngle1To = 0.0;
				m_powerMeterAngle2To = -29.0;
				m_powerMeterAngle3To = 43.5 - 29.0;
				m_powerMeterAngle4To = -28.0;
				m_powerMeterAngle5To = 44.0 - 27.0;
			}
			else if(m_powerMeter <= 60){
				m_powerMeterAngleTo = -35.0 - 35.0 / 30.0 * (m_powerMeter - 30.0);
				m_powerMeterAngle1To = 0.0;
				m_powerMeterAngle2To = -29.0 - 44.5 / 30.0 * (m_powerMeter - 30.0);
				m_powerMeterAngle3To = 43.5 - 29.0;
				m_powerMeterAngle4To = -28.0 - 44.0 / 30.0 * (m_powerMeter - 30.0);
				m_powerMeterAngle5To = 44.0 - 27.0;
			}
			else if(m_powerMeter <= 150){
				m_powerMeterAngle1To = 0.0 - 35.0 / 90.0 * (m_powerMeter - 60.0);
				m_powerMeterAngleTo = -70.0;
				m_powerMeterAngle3To = 43.5 - 43.5 / 90.0 * (m_powerMeter - 60.0) - 29.0;
				m_powerMeterAngle2To = -29.0 - 44.5;
				m_powerMeterAngle5To = 44.0 - 44.0 / 90.0 * (m_powerMeter - 60.0) - 27.0;
				m_powerMeterAngle4To = -28.0 - 44.0;
			}
			else{
				m_powerMeterAngleTo = -70.0;
				m_powerMeterAngle1To = -35.0;
				m_powerMeterAngle2To = -29.0 - 44.5;
				m_powerMeterAngle3To = 0.0 - 29.0;
				m_powerMeterAngle4To = -28.0 - 44.0;
				m_powerMeterAngle5To = 0.0 - 27.0;
			}
			AnimationDealEmit(powerMeterAngle, m_powerMeterAngleFrom, m_powerMeterAngleTo, 500, true);
			AnimationDealEmit(powerMeterAngle1, m_powerMeterAngle1From, m_powerMeterAngle1To, 500, true);
			AnimationDealEmit(powerMeterAngle2, m_powerMeterAngle2From, m_powerMeterAngle2To, 500, true);
			AnimationDealEmit(powerMeterAngle3, m_powerMeterAngle3From, m_powerMeterAngle3To, 500, true);
			AnimationDealEmit(powerMeterAngle4, m_powerMeterAngle4From, m_powerMeterAngle4To, 500, true);
			AnimationDealEmit(powerMeterAngle5, m_powerMeterAngle5From, m_powerMeterAngle5To, 500, true);
			emit powerMeterChanged(m_powerMeter);
			//			ValueChangeSet(powerMeter,data.powerMeter);
		}
		if(m_keyActive){
			keyDeal(data.okBtn,KEY_OK);
		}
		speedValue(data.speed,&m_spd_step);
		if(data.lcdLight == m_setBackLight && m_setLcdLightState != "set")
			m_setBackLight = 0;
		ValueChangeSet(lcdLight,data.lcdLight);
		if(data.lcdNightLight == m_setLcdNightLight && m_setLcdLightState != "set")
			m_setLcdNightLight = 0;
		ValueChangeSet(lcdNightLight,data.lcdNightLight);


		QDateTime time;
		time.setTimeSpec(Qt::UTC);
		time.setTime_t(data.dateTime);
		if(m_dateTimeSet) {
			QDateTime dateTimeSet;
			dateTimeSet.setTimeSpec(Qt::UTC);
			dateTimeSet.setTime_t(m_dateTimeSet);

			if(dateTimeSet.time().hour() == time.time().hour()
					&& time.time().minute() == dateTimeSet.time().minute()
					&& time.time().second() - dateTimeSet.time().second()<= 60 ){
				m_dateTimeSet = 0;
			}
		}
		ValueChangeSet(hour,time.toString("hh"));
		ValueChangeSet(minite,time.toString("mm"));
		ValueChangeSet(chargeCurrent,data.chargeCurrent);
		ValueChangeSet(epsErrLight,data.epsErrLight);
		ValueChangeSet(backFogLight,data.backFogLight);
		ValueChangeSet(frontFogLight,data.frontFogLight);
		ValueChangeSet(waterTempLight,data.waterTempLight);
		ValueChangeSet(airBagLight,data.airBagLight);
		ValueChangeSet(dcdcErrLight,data.dcdcErrLight);
		ValueChangeSet(batteryCutoff,data.batteryCutoff);
		ValueChangeSet(batteryErr,data.batteryErr);
		ValueChangeSet(batteryLow,data.batteryLow);
		ValueChangeSet(mainSeatbelt,data.mainSeatbelt);
		ValueChangeSet(copilotSeatbelt,data.copilotSeatbelt);
		ValueChangeSet(meterHotLight,data.meterHotLight);
		ValueChangeSet(tirePressLight,data.tirePressLight);
		ValueChangeSet(insulation,data.insulation);
		ValueChangeSet(chargeLight,data.chargeLight);
		if(m_soc != data.soc){
			m_soc = data.soc;
			m_socHightFrom = m_socHight;
			m_rightPointXFrom = m_rightPointX;
			m_rightPointYFrom = m_rightPointY;
			if(m_soc >= 98){
				m_socHightTo = 94.0 * 1.14 + 6.5;
				m_rightPointXTo = 1077.0 + 70.0;
				m_rightPointYTo = 334.0 - 94.0;
			}
			else if(m_soc <= 6){
				m_socHightTo = 6.5;
				m_rightPointXTo = 1077.0;
				m_rightPointYTo = 334.0;
			}
			else {
				m_socHightTo = (94.0 / 100.0 * m_soc) * 1.14 + 6.5;
				m_rightPointXTo = 1077.0 + 70.0 / 100.0 * (m_soc);
				m_rightPointYTo = 334.0 - 94.0 / 100.0 * (m_soc);
			}
			AnimationDealEmit(rightPointX, m_rightPointXFrom, m_rightPointXTo, 200, true);
			AnimationDealEmit(rightPointY, m_rightPointYFrom, m_rightPointYTo, 200, true);
			AnimationDealEmit(socHight, m_socHightFrom, m_socHightTo, 200, true);
			emit socChanged(m_soc);
		}
		ValueChangeSet(pControllerErr,data.pControllerErr);
		ValueChangeSet(ready,data.ready);
		ValueChangeSet(ebdLight,data.ebdLight);
		ValueChangeSet(absLight,data.absLight);
		ValueChangeSet(sysErr,data.sysErr);
		ValueChangeSet(limitedPower,data.limitedPower);
		ValueChangeSet(energyConsumption,data.energyConsumption);

		ValueChangeSet(lfTP,data.lfTP);
		ValueChangeSet(rfTP,data.rfTP);
		ValueChangeSet(lrTP,data.lrTP);
		ValueChangeSet(rrTP,data.rrTP);
		ValueChangeSet(lfTPStatus,data.lfTPStatus);
		ValueChangeSet(rfTPStatus,data.rfTPStatus);
		ValueChangeSet(lrTPStatus,data.lrTPStatus);
		ValueChangeSet(rrTPStatus,data.rrTPStatus);
		ValueChangeSet(lfTT,data.lfTT);
		ValueChangeSet(rfTT,data.rfTT);
		ValueChangeSet(lrTT,data.lrTT);
		ValueChangeSet(rrTT,data.rrTT);
		ValueChangeSet(lfTPlow,data.lfTPlow);
		ValueChangeSet(rfTPlow,data.rfTPlow);
		ValueChangeSet(lrTPlow,data.lrTPlow);
		ValueChangeSet(rrTPlow,data.rrTPlow);
		ValueChangeSet(lfTTStatus,data.lfTTStatus);
		ValueChangeSet(rfTTStatus,data.rfTTStatus);
		ValueChangeSet(lrTTStatus,data.lrTTStatus);
		ValueChangeSet(rrTTStatus,data.rrTTStatus);

		if(m_tpLow || m_tpHigh || m_tpLeakage || m_tpTemp || m_tireBatteryLow || m_ttLose || m_tpLose){
			m_tireShowState = "show";
		}
		else{
			m_tireShowState = "";
		}
		emit tireShowStateChanged(m_tireShowState);

	}
	ValueChangeSet(overSpeed,data.overSpeed);
	ValueChangeSet(pepsKeyLight,data.pepsKeyLight);
	ValueChangeSet(pepsPowerStatus,data.pepsPowerStatus);
	ValueChangeSet(seltText,data.seltText);
	ValueChangeSet(carDoorText,data.carDoorText);
	ValueChangeSet(tireText,data.tireText);
	ValueChangeSet(sysText,data.sysText);
	ValueChangeSet(leftFrontDoor,data.leftFrontDoor);
	ValueChangeSet(leftRearDoor,data.leftRearDoor);
	ValueChangeSet(rightFrontDoor,data.rightFrontDoor);
	ValueChangeSet(rightRearDoor,data.rightRearDoor);
	ValueChangeSet(hoodDoor,data.hoodDoor);
	ValueChangeSet(trunkDoor,data.trunkDoor);
	ValueChangeSet(lowBeam,data.lowBeam);
	ValueChangeSet(highBeam,data.highBeam);
	ValueChangeSet(leftSignal,data.leftSignal);
	ValueChangeSet(rightSignal,data.rightSignal);

	ValueChangeSet(chargeLineText,data.chargeLineText);
	ValueChangeSet(chargerHotText,data.chargerHotText);
	ValueChangeSet(esclText,data.esclText);
	ValueChangeSet(pepsText,data.pepsText);
	ValueChangeSet(keyOutsideText,data.keyOutsideText);
	ValueChangeSet(keyPowerOnText,data.keyPowerOnText);
	ValueChangeSet(pushPowerOnText,data.pushPowerOnText);
	ValueChangeSet(lowBeamText,data.lowBeamText);
	ValueChangeSet(keyPowerLowText,data.keyPowerLowText);
	ValueChangeSet(missKetText,data.missKetText);
	ValueChangeSet(takePgear,data.takePgear);
	ValueChangeSet(powerOnText,data.powerOnText);
	ValueChangeSet(waterPumpText,data.waterPumpText);
	ValueChangeSet(vacuumPumpText,data.vacuumPumpText);
	ValueChangeSet(overSpeedWarning,data.overSpeedWarning);
	ValueChangeSet(handbrakeText,data.handbrakeText);

	ErrChangeSet(tipsChargeLine, m_tipsChargeLine, data.chargeLineText, STATE_CHARGE);
	ErrChangeSet(tipsChargeHot, m_tipsChargeHot, data.chargerHotText,  STATE_CHARGE);
	ErrChangeSet(tipsEscl, m_tipsEscl, (data.esclText),  STATE_DORMANCY);
	ErrChangeSet(tipsPeps,  m_tipsPeps, (data.pepsText),  STATE_DORMANCY);
	ErrChangeSet(tipsKeyPowerLow,  m_tipsKeypowerLow,  (data.keyPowerLowText),  STATE_DORMANCY);
	ErrChangeSet(tipsMissKey, m_tipsMissKey, (data.missKetText),  STATE_DORMANCY);
	ErrChangeSet(tipsKeyOutside, m_tipsKeyOutside, (data.keyOutsideText),  STATE_DORMANCY);
	ErrChangeSet(tipsKeyPowerOn, m_tipsKeyPowerOn, (data.keyPowerOnText),  STATE_DORMANCY);
	ErrChangeSet(tipsPushPowerOn, m_tipsPushPowerOn, (data.pushPowerOnText),  STATE_DORMANCY);
	ErrChangeSet(tipsTakePGear, m_tipsTakePGear, (data.takePgear),  STATE_DORMANCY);
	ErrChangeSet(tipsPowerOn, m_tipsPowerOn, (data.powerOnText),  STATE_DORMANCY);
	ErrChangeSet(tipsSysText, m_tipsSysText, data.sysText,  STATE_ALL);
	ErrChangeSet(tipsCarDoor, m_tipsCarDoor, (m_carDoorText && !data.sysText) || (m_anyDoor && !data.sysText),  STATE_DORMANCY);
	ErrChangeSet(tipsHandBrake, m_tipsHandBrake, m_handbrakeText && !data.sysText,  STATE_ALL);

	ErrChangeSet(tipsTTHot, m_tipsTPTempHot, (m_tpTemp && !m_ttLose && m_tireText && !data.sysText),  STATE_ALL);
	ErrChangeSet(tipsTPLow, m_tipsTPLow, (m_tpLow && m_tireText && !data.sysText), STATE_ALL);
	ErrChangeSet(tipsTPHigh, m_tipsTPHigh, (m_tpHigh && m_tireText && !data.sysText), STATE_ALL);
	ErrChangeSet(tipsTPLeakage, m_tipsTPLeakage, (m_tpLeakage && m_tireText && !data.sysText), STATE_ALL);
	ErrChangeSet(tipsTPBatteryLow, m_tipsTPSensorLow, (m_tireBatteryLow && m_tireText && !data.sysText), STATE_ALL);

	ErrChangeSet(tipsWaterPump, m_tipsWaterPump, data.waterPumpText && !data.sysText, STATE_ALL);
	ErrChangeSet(tipsVacPump, m_tipsVacPump, data.vacuumPumpText && !data.sysText, STATE_ALL);
	ErrChangeSet(tipsSeatBelt, m_tipsSeatBelt, m_seltText && !data.sysText, STATE_ALL);
	ErrChangeSet(tipsOverSpeed, m_tipsOverSpeed, m_overSpeedWarning && !data.sysText, STATE_ALL);
	ErrChangeSet(tipsLowBeam, m_tipsLowBeam, data.lowBeamText && !data.sysText, STATE_DORMANCY);

//	if(m_connectFlag){
//		WavChangeSet(m_wavCharging, data.wavCharge);
//		if(m_logoV == true && ignFlag == 0){
//				m_ignOnMusic = data.ignOnMusic;
//				switch(m_ignOnMusic){
//				case 0:m_music1 = false;
//					m_music2 = false;
//					break;
//				case 1:m_music1 = true;break;
//				case 2:m_music2 = true;break;
//				default:break;
//				}
//				emit ignOnMusicChanged(m_ignOnMusic);
//			ignFlag++;

//		} else {
//			if( m_logoV == false){
//				ignFlag = 0;
//				m_music1 = false;
//				m_music2 = false;
//			}
//		}
//		qDebug()<<"ignFlag ====== "<<ignFlag;
//		qDebug()<<"m_logoV ====== "<<m_logoV;
//	}
	ValueChangeSet(ignOnMusic,data.ignOnMusic);
//	musicOff(m_connectFlag);
	ValueChangeSet(mcuVer1,data.mcuVer1);
	ValueChangeSet(mcuVer2,data.mcuVer2);
	ValueChangeSet(mcuVer3,data.mcuVer3);
	ValueChangeSet(seconds,data.seconds);

//	sendWavId();
}

void CarStatus::setSerial()
{
	UpFrame upFrame;
	memset(&upFrame, 0, sizeof(UpFrame));

	upFrame.head = 0xAA;
	upFrame.length = sizeof(SettingsInfo) + 2;

	upFrame.frameTypes = m_frameTypes;
	upFrame.settingsInfo.dateTimeSet = m_dateTimeSet;
	upFrame.settingsInfo.tripClear = m_tripClear;
	if(m_setLcdLightState == "set"){
		upFrame.settingsInfo.setBackLight = m_setBackLight;
		upFrame.settingsInfo.setLcdNightLight = m_setLcdNightLight;
	}
	else
		upFrame.settingsInfo.setBackLight = upFrame.settingsInfo.setLcdNightLight = 0;
	if(m_setThemeState == "set")
		upFrame.settingsInfo.setTheme = m_setTheme;
	else
		upFrame.settingsInfo.setTheme = 0;
	if(m_setOverSpeedState == "set")
		upFrame.settingsInfo.setOverSpeed = m_setOverSpeed;
	else
		upFrame.settingsInfo.setOverSpeed = 0;
	if(m_musicSetState == "set")
		upFrame.settingsInfo.musicSet = m_musicSet;
	else
		upFrame.settingsInfo.musicSet = 0;

	upFrame.settingsInfo.musicStatus = m_musicStatus;

	upFrame.crc = crc16Check((uint8_t *)(&(upFrame.settingsInfo)), sizeof(SettingsInfo));
	upFrame.tail = 0x55;

	m_serial->sendSerial(QByteArray((char *)&upFrame, sizeof(UpFrame)));
}

void CarStatus::timerEvent(QTimerEvent *event)
{
	Q_UNUSED(event);
	if( m_updateShow == false ){
		setSerial();
	}
}

void CarStatus::mcuUpdataSerial(QByteArray data)
{
	AckMcu ackMcu;
	memset(&ackMcu, 0, sizeof(AckMcu));

	ackMcu.head = 0xAA;
	ackMcu.length = 8;
	ackMcu.frameTpyes = MCU_UPDATA_TYPE;
	ackMcu.tail = 0x55;
	qDebug() << "Get serial." << data.toHex();

	switch ((uint8_t)data.at(3)) {
	case MCU_PACKET_INFO_TYPES:
		qDebug() << "MCU_PACKET_INFO_TYPES" << data.toHex();
		ackMcu.ackType = QT_PACKET_INFO_ACK_TYPES;
		ackMcu.content[0] = QT_ACK_OK;
		ackMcu.crc = crc16Check((uint8_t *)(&(ackMcu.ackType)), 6);
		m_updateShow = true;
		emit updateShowChanged(m_updateShow);
		m_updataTypes = "MCU upgrade...";
		emit updataTypesChanged(m_updataTypes);
		m_updataVer = QString("Ver:%1.%2.%3").arg((uint8_t)data.at(4)).arg((uint8_t)data.at(5)).arg((uint8_t)data.at(6));
		emit updataVerChanged(m_updataVer);
		m_serial->sendSerial(QByteArray((char *)&ackMcu, sizeof(AckMcu)));
		break;
	case MCU_PACKET_PROGRESS_TYPES:
		qDebug() << "MCU_PACKET_PROGRESS_TYPES" << data.toHex();
		ackMcu.ackType = QT_PACKET_PROGRESS_ACK_TYPES;
		ackMcu.content[0] = QT_ACK_OK;
		ackMcu.crc = crc16Check((uint8_t *)(&(ackMcu.ackType)), 6);
		m_updateShow = true;
		m_updataProgress = (int)data.at(4);
		emit updataProgressChanged(m_updataProgress);
		m_updataTypes = "MCU upgrading...";
		emit updataTypesChanged(m_updataTypes);
		if(m_updataProgress == 100) {
			m_updataTypes = "MCU finished...";
			emit updataTypesChanged(m_updataTypes);
		}
		m_serial->sendSerial(QByteArray((char *)&ackMcu, sizeof(AckMcu)));
		break;
	case MCU_PACKET_END_TYPES:
		qDebug() << "MCU_PACKET_END_TYPES" << data.toHex();
		ackMcu.ackType = QT_PACKET_END_ACK_TYPES;
		ackMcu.content[0] = QT_ACK_OK;
		ackMcu.crc = crc16Check((uint8_t *)(&(ackMcu.ackType)), 6);
		m_updateShow = true;
		emit updateShowChanged(m_updateShow);
		m_updataTypes = "MCU wait reset...";
		emit updataTypesChanged(m_updataTypes);
		m_serial->sendSerial(QByteArray((char *)&ackMcu, sizeof(AckMcu)));
		break;
	default:
		break;
	}
}

void CarStatus::shortKeyDeal()
{
	if(curMenu != MENU_NONE){
		if(!(m_setLcdLightState == "set" || m_setOverSpeedState == "set" || m_musicSetState == "set" || m_setThemeState == "set")){
			if(curMenu == MENU_L1_MAX)
				curMenu = MENU_L1_MIN;
			else
				++curMenu;
		}
	} else {
		m_menuPanelState = "show";
		emit menuPanelStateChanged(m_menuPanelState);
		curMenu = MENU_L1_MIN;
	}

	switch (curMenu) {
	case MENU_L1_ENERGY:
		m_setLcdLightState = m_setOverSpeedState = m_musicSetState = m_setThemeState = m_exitPanelState = m_tirePressPanelState = "";
		m_energyPanelState = "show";
		emit energyPanelStateChanged(m_energyPanelState);
		emit setLcdLightStateChanged(m_setLcdLightState);
		emit setOverSpeedStateChanged(m_setOverSpeedState);
		emit musicSetStateChanged(m_musicSetState);
		emit setThemeStateChanged(m_setThemeState);
		emit tirePressPanelStateChanged(m_tirePressPanelState);
		emit exitPanelStateChanged(m_exitPanelState);
		break;
	case MENU_L1_LCDLIGHT:
		if( m_setLcdLightState == "set"){
			if(m_lowBeam){
				if(m_setLcdNightLight == 10)
					m_setLcdNightLight = 1;
				else
					++m_setLcdNightLight;
				emit setLcdNightLightChanged(m_setLcdNightLight);
			}
			else {
				if(m_setBackLight == 10)
					m_setBackLight = 1;
				else
					++m_setBackLight;
				emit setBackLightChanged(m_setBackLight);
			}
		}
		else {
			m_energyPanelState = m_setOverSpeedState = m_musicSetState = m_setThemeState = m_exitPanelState = m_tirePressPanelState = "";
			m_setLcdLightState = "show";
			emit energyPanelStateChanged(m_energyPanelState);
			emit setLcdLightStateChanged(m_setLcdLightState);
			emit setOverSpeedStateChanged(m_setOverSpeedState);
			emit musicSetStateChanged(m_musicSetState);
			emit setThemeStateChanged(m_setThemeState);
			emit tirePressPanelStateChanged(m_tirePressPanelState);
			emit exitPanelStateChanged(m_exitPanelState);
		}
		break;
	case MENU_L1_OVERSPEED:
		if( m_setOverSpeedState == "set"){
			if(m_setOverSpeed == 140)
				m_setOverSpeed = 255;
			else {
				if(m_setOverSpeed == 255)
					m_setOverSpeed = 60;
				else
					m_setOverSpeed += 10;
			}
			emit setOverSpeedChanged(m_setOverSpeed);
		}
		else {
			m_energyPanelState = m_setLcdLightState = m_musicSetState = m_setThemeState = m_exitPanelState = m_tirePressPanelState = "";
			m_setOverSpeedState = "show";
			emit energyPanelStateChanged(m_energyPanelState);
			emit setLcdLightStateChanged(m_setLcdLightState);
			emit setOverSpeedStateChanged(m_setOverSpeedState);
			emit musicSetStateChanged(m_musicSetState);
			emit setThemeStateChanged(m_setThemeState);
			emit tirePressPanelStateChanged(m_tirePressPanelState);
			emit exitPanelStateChanged(m_exitPanelState);
		}
		break;
		//	case MENU_L1_TIREPRESS:
		//		m_energyPanelState = m_setLcdLightState = m_setOverSpeedState = m_setThemeState = m_exitPanelState = "";
		//		m_tirePressPanelState = "show";
		//		emit energyPanelStateChanged(m_energyPanelState);
		//		emit setLcdLightStateChanged(m_setLcdLightState);
		//		emit setOverSpeedStateChanged(m_setOverSpeedState);
		//		emit setThemeStateChanged(m_setThemeState);
		//		emit tirePressPanelStateChanged(m_tirePressPanelState);
		//		emit exitPanelStateChanged(m_exitPanelState);
		//		break;
	case MENU_L1_THEME:
		if( m_setThemeState == "set"){
			if(m_setTheme == 3)
				m_setTheme = 1;
			else
				++m_setTheme;
			emit setThemeChanged(m_setTheme);
		}
		else {
			m_energyPanelState = m_setLcdLightState = m_setOverSpeedState = m_musicSetState = m_exitPanelState = m_tirePressPanelState = "";
			m_setThemeState = "show";
			emit energyPanelStateChanged(m_energyPanelState);
			emit setLcdLightStateChanged(m_setLcdLightState);
			emit setOverSpeedStateChanged(m_setOverSpeedState);
			emit musicSetStateChanged(m_musicSetState);
			emit setThemeStateChanged(m_setThemeState);
			emit tirePressPanelStateChanged(m_tirePressPanelState);
			emit exitPanelStateChanged(m_exitPanelState);
		}
		break;
	case MENU_L1_MUSIC:
		if( m_musicSetState == "set"){
			if(m_musicSet == 3)
				m_musicSet = 1;
			else
				++m_musicSet;
			emit musicSetChanged(m_musicSet);
		}
		else {
			m_energyPanelState = m_setLcdLightState = m_setOverSpeedState = m_setThemeState = m_exitPanelState = m_tirePressPanelState = "";
			m_musicSetState = "show";
			emit energyPanelStateChanged(m_energyPanelState);
			emit setLcdLightStateChanged(m_setLcdLightState);
			emit setOverSpeedStateChanged(m_setOverSpeedState);
			emit musicSetStateChanged(m_musicSetState);
			emit setThemeStateChanged(m_setThemeState);
			emit tirePressPanelStateChanged(m_tirePressPanelState);
			emit exitPanelStateChanged(m_exitPanelState);
		}
		break;
	case MENU_L1_EXIT:
		m_setLcdLightState = m_setOverSpeedState = m_musicSetState = m_setThemeState = m_energyPanelState = m_tirePressPanelState = "";
		m_exitPanelState = "show";
		emit energyPanelStateChanged(m_energyPanelState);
		emit setLcdLightStateChanged(m_setLcdLightState);
		emit setOverSpeedStateChanged(m_setOverSpeedState);
		emit musicSetStateChanged(m_musicSetState);
		emit setThemeStateChanged(m_setThemeState);
		emit tirePressPanelStateChanged(m_tirePressPanelState);
		emit exitPanelStateChanged(m_exitPanelState);
		break;
	default:
		break;
	}
}

void CarStatus::longKeyDeal()
{
	if( curMenu == MENU_NONE ) {
		m_tripClear = true;
		return;
	}

	switch (curMenu) {
	case MENU_L1_ENERGY:
		// Nothing to do
		break;
	case MENU_L1_LCDLIGHT:
		if( m_setLcdLightState == "show"){
			m_setLcdNightLight = m_lcdNightLight;
			m_setBackLight = m_lcdLight;
			emit setBackLightChanged(m_setBackLight);
			emit setLcdNightLightChanged(m_setLcdNightLight);
			m_setLcdLightState = "set";
		}
		else
			m_setLcdLightState = "show";
		emit setLcdLightStateChanged(m_setLcdLightState);
		break;
	case MENU_L1_OVERSPEED:
		if( m_setOverSpeedState == "show"){
			m_setOverSpeed = m_overSpeed;
			emit setOverSpeedChanged(m_setOverSpeed);
			m_setOverSpeedState = "set";
		}
		else
			m_setOverSpeedState = "show";
		emit setOverSpeedStateChanged(m_setOverSpeedState);
		break;
		//	case MENU_L1_TIREPRESS:
		//		break;
	case MENU_L1_THEME:
		if( m_setThemeState == "show"){
			m_setTheme = m_theme;
			emit setThemeChanged(m_setTheme);
			m_setThemeState = "set";
		}
		else
			m_setThemeState = "show";
		emit setThemeStateChanged(m_setThemeState);
		break;
	case MENU_L1_MUSIC:
		if( m_musicSetState == "show"){
			m_musicSet = m_ignOnMusic;
			emit musicSetChanged(m_musicSet);
			m_musicSetState = "set";
		}
		else
			m_musicSetState = "show";
		emit musicSetStateChanged(m_musicSetState);
		break;
	case MENU_L1_EXIT:
		curMenu = MENU_NONE;
		m_menuPanelState = m_energyPanelState = m_setLcdLightState = m_setOverSpeedState = m_musicSetState = m_setThemeState = m_tirePressPanelState = m_exitPanelState = "";
		emit energyPanelStateChanged(m_energyPanelState);
		emit setLcdLightStateChanged(m_setLcdLightState);
		emit setOverSpeedStateChanged(m_setOverSpeedState);
		emit musicSetStateChanged(m_musicSetState);
		emit setThemeStateChanged(m_setThemeState);
		emit tirePressPanelStateChanged(m_tirePressPanelState);
		emit exitPanelStateChanged(m_exitPanelState);
		emit menuPanelStateChanged(m_menuPanelState);
		break;
	default:
		break;
	}
}

bool CarStatus::insertList(QList<Warning> *list, Warning idn)
{
	int i = 0;
	tipsInfoListInsert = 0;
	for (; i < list->size(); i++) {
		if (list->at(i).priority == idn.priority)
			return false;

		if (list->at(i).priority > idn.priority)
			break;
	}
	tipsInfoListInsert = i;
	list->insert(i, idn);
	return true;
}

void CarStatus::removeList(QList<Warning> *list, Warning idn)
{
	int i = 0;
	for(; i < list->size(); i++){
		if (list->at(i).uniq_id == idn.uniq_id){
			list->removeAt(i);
			return;
		}
	}
}

void CarStatus::tipsSet(QList<Warning> *list,Warning idn,bool status)
{
	uint8_t index;
	if(status){
		if(!insertList(list,idn))
			return;
		else{
			if(list->size() == 1 || list->at(0).uniq_id == idn.uniq_id){
				m_warningSrc = list->at(0).qmlPath;
				index = list->at(0).uniq_id;
				m_warningIndex = tipsIndex(index);
				emit warningIndexChanged(m_warningIndex);
				emit warningSrcChanged(m_warningSrc);
				m_tipsInfoTimer->start(list->at(0).time);
			}
		}
	}
	else{
		if(tipsInfoList.size() > 0){
			removeList(list,idn);
			if(list->isEmpty()){
				m_tipsInfoTimer->stop();
				m_warningSrc = "";
				emit warningSrcChanged(m_warningSrc);
			}
			else{
				m_warningSrc = list->at(0).qmlPath;
				index = list->at(0).uniq_id;
				m_warningIndex = tipsIndex(index);
				emit warningIndexChanged(m_warningIndex);
				emit warningSrcChanged(m_warningSrc);
				m_tipsInfoTimer->start(list->at(0).time);
			}
		}

	}
}

void CarStatus::tipsInfoTimer()
{
	uint8_t index;
	if(tipsInfoList.at(0).time != 10000){
		tipsInfoList.removeAt(0);
		if(tipsInfoList.size() <= 0){
			m_tipsInfoTimer->stop();
			m_warningSrc = "";
			emit warningSrcChanged(m_warningSrc);
			return;
		}
	}
	m_warningSrc = tipsInfoList.at(0).qmlPath;
	index = tipsInfoList.at(0).uniq_id;
	m_warningIndex = tipsIndex(index);
	emit warningIndexChanged(m_warningIndex);
	emit warningSrcChanged(m_warningSrc);
	m_tipsInfoTimer->start(tipsInfoList.at(0).time);
}

CarStatus::TIPSREC CarStatus::tipsIndex(uint8_t idn)
{
	switch(idn){
	case TIPS_POWER_ON: return TIPS_DOUBLE;
	case TIPS_HAND_BRAKE:
	case TIPS_CAR_DOOR:
	case TIPS_SEAT_BELT:
	case TIPS_OVER_SPEED:
	case TIPS_LOW_BEAM:
	case TIPS_MISS_KEY:
	case TIPS_KEY_POWERON:
	case TIPS_PUSH_POWERON:
	case TIPS_TAKE_PGEAR:return TIPS_IMAGE;
	case TIPS_TIRE_PRESSURE_TEMPHOT:
	case TIPS_TIRE_PRESSURE_LOW:
	case TIPS_TIRE_PRESSURE_HIGH:
	case TIPS_TIRE_PRESSURE_LEAKAGE:
	case TIPS_TIRE_PRESSURE_SENSOR_BATTERY_LOW: return TIPS_TIRE;
	default:return TIPS_SINGLE;
	}
}

void CarStatus::rpmAngleTimeout()
{
	AnimationDealEmit(rpmAngle,m_rpmAngleFrom,m_rpmAngleTo,500,false);
}
void CarStatus::powerMeterAngleTimeout()
{
	AnimationDealEmit(powerMeterAngle,m_powerMeterAngleFrom,m_powerMeterAngleTo,500,false);
}
void CarStatus::powerMeterAngle1Timeout()
{
	AnimationDealEmit(powerMeterAngle1,m_powerMeterAngle1From,m_powerMeterAngle1To,500,false);
}
void CarStatus::powerMeterAngle2Timeout()
{
	AnimationDealEmit(powerMeterAngle2,m_powerMeterAngle2From,m_powerMeterAngle2To,500,false);
}
void CarStatus::powerMeterAngle3Timeout()
{
	AnimationDealEmit(powerMeterAngle3,m_powerMeterAngle3From,m_powerMeterAngle3To,500,false);
}
void CarStatus::powerMeterAngle4Timeout()
{
	AnimationDealEmit(powerMeterAngle4,m_powerMeterAngle4From,m_powerMeterAngle4To,500,false);
}
void CarStatus::powerMeterAngle5Timeout()
{
	AnimationDealEmit(powerMeterAngle5,m_powerMeterAngle5From,m_powerMeterAngle5To,500,false);
}
void CarStatus::waterTempHightTimeout()
{
	AnimationDealEmit(waterTempHight,m_waterTempHightFrom,m_waterTempHightTo,200,false);
}
void CarStatus::leftPointXTimeout()
{
	AnimationDealEmit(leftPointX,m_leftPointXFrom,m_leftPointXTo,200,false);
}
void CarStatus::leftPointYTimeout()
{
	AnimationDealEmit(leftPointY,m_leftPointYFrom,m_leftPointYTo,200,false);
}
void CarStatus::socHightTimeout()
{
	AnimationDealEmit(socHight,m_socHightFrom,m_socHightTo,200,false);
}
void CarStatus::rightPointXTimeout()
{
	AnimationDealEmit(rightPointX,m_rightPointXFrom,m_rightPointXTo,200,false);
}
void CarStatus::rightPointYTimeout()
{
	AnimationDealEmit(rightPointY,m_rightPointYFrom,m_rightPointYTo,200,false);
}

