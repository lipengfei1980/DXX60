#include <QDebug>
#include <QByteArray>

#include <tran.h>
#include <serial.h>
#include <protocol.h>
#define ValueChangeSet(name, v) do{if(m_##name!=(v)){m_##name=(v); emit name##Changed(v); qDebug()<<QString(#name)<<(v);}}while(0)

SerialTran::SerialTran(const QString &serialDev, QObject *parent)
	: QObject(parent)
{
	// all have
	m_dateTime = 0;
	m_okBtn = false;
	m_speed = 0;
	m_ignOnMusic = 0;
	m_rpm = 0;
	m_odo = 0;
	m_gear = 0;
	m_trip = 0;
	m_waterTemp = 0;
	m_powerMeter = 0;
	m_mileage = 0;
        m_theme = 1;
	m_lcdLight = 0;
        m_lcdNightLight = 0;
	m_leftFrontDoor = false;
	m_leftRearDoor = false;
	m_rightFrontDoor = false;
	m_rightRearDoor = false;
	m_hoodDoor = false;
	m_trunkDoor = false;
	m_powerStatus = false;
        m_carTemp = 0;
	m_outsideTemp = 0;
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
	m_chargeLine = false;
	m_insulation = 0;
	m_chargeLight = false;
	m_soc = 0;
        m_pControllerErr = 0;
	m_ready = false;
	m_ebdLight = false;
	m_absLight = false;
	m_sysErr = false;
	m_sysLose = false;
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
        m_pepsPowerStatus = 0;
		m_radarTest = 0;
		m_radarDistance = 0;
	m_mcuVer1 = 0;
	m_mcuVer2 = 0;
	m_mcuVer3 = 0;
	m_seconds = 0;

	// settings info
	m_dateTimeSet = 0;
        m_tripClear = false;
	m_setBackLight = 0;
        m_setLcdNightLight = 0;
	m_setTheme = 0;
	m_setOverSpeed = 0;

	m_serial = new Serial(serialDev, this);
	connect(m_serial, SIGNAL(serialChanged(SettingsInfo)), this, SLOT(getSerial(SettingsInfo)));
}

void SerialTran::getSerial(SettingsInfo data)
{
	ValueChangeSet(dateTimeSet, data.dateTimeSet);
        ValueChangeSet(tripClear, data.tripClear);
	ValueChangeSet(setBackLight, data.setBackLight);
        ValueChangeSet(setLcdNightLight, data.setLcdNightLight);
	ValueChangeSet(setTheme, data.setTheme);
	ValueChangeSet(setOverSpeed, data.setOverSpeed);
}

void SerialTran::sendDownFrame()
{
	DownFrame downFrame;

	downFrame.head = 0xAA;
	downFrame.length = sizeof(CarInfo) + 2;

	downFrame.carInfo.general.speed = m_speed;
	downFrame.carInfo.general.ignOnMusic = m_ignOnMusic;
	downFrame.carInfo.general.rpm = m_rpm;
	downFrame.carInfo.general.odo = m_odo;
	downFrame.carInfo.general.gear = m_gear;
	downFrame.carInfo.general.trip = m_trip;
	downFrame.carInfo.general.waterTemp = m_waterTemp;
	downFrame.carInfo.general.powerMeter = m_powerMeter;
	downFrame.carInfo.general.mileage = m_mileage;
	downFrame.carInfo.general.okBtn = m_okBtn;
        downFrame.carInfo.general.theme = m_theme;
	downFrame.carInfo.general.lcdLight = m_lcdLight;
        downFrame.carInfo.general.lcdNightLight = m_lcdNightLight;
	downFrame.carInfo.general.dateTime = m_dateTime;
	downFrame.carInfo.general.leftFrontDoor = m_leftFrontDoor;
	downFrame.carInfo.general.leftRearDoor = m_leftRearDoor;
	downFrame.carInfo.general.rightFrontDoor = m_rightFrontDoor;
	downFrame.carInfo.general.rightRearDoor = m_rightRearDoor;
	downFrame.carInfo.general.hoodDoor = m_hoodDoor;
	downFrame.carInfo.general.trunkDoor = m_trunkDoor;
	downFrame.carInfo.general.powerStatus = m_powerStatus;

        downFrame.carInfo.special.carTemp = m_carTemp;
	downFrame.carInfo.special.outsideTemp = m_outsideTemp;
        downFrame.carInfo.special.chargeCurrent = m_chargeCurrent;
	downFrame.carInfo.special.epsErrLight = m_epsErrLight;
	downFrame.carInfo.special.lowBeam = m_lowBeam;
	downFrame.carInfo.special.highBeam = m_highBeam;
	downFrame.carInfo.special.leftSignal = m_leftSignal;
	downFrame.carInfo.special.rightSignal = m_rightSignal;
	downFrame.carInfo.special.backFogLight = m_backFogLight;
	downFrame.carInfo.special.frontFogLight = m_frontFogLight;
	downFrame.carInfo.special.waterTempLight = m_waterTempLight;
	downFrame.carInfo.special.airBagLight = m_airBagLight;
	downFrame.carInfo.special.dcdcErrLight = m_dcdcErrLight;
	downFrame.carInfo.special.batteryCutoff = m_batteryCutoff;
	downFrame.carInfo.special.batteryErr = m_batteryErr;
	downFrame.carInfo.special.batteryLow = m_batteryLow;
	downFrame.carInfo.special.mainSeatbelt = m_mainSeatbelt;
	downFrame.carInfo.special.copilotSeatbelt = m_copilotSeatbelt;
	downFrame.carInfo.special.pepsKeyLight = m_pepsKeyLight;
	downFrame.carInfo.special.meterHotLight = m_meterHotLight;
	downFrame.carInfo.special.tirePressLight = m_tirePressLight;
	downFrame.carInfo.special.chargeLine = m_chargeLine;
	downFrame.carInfo.special.insulation = m_insulation;
	downFrame.carInfo.special.chargeLight = m_chargeLight;
	downFrame.carInfo.special.soc = m_soc;
	downFrame.carInfo.special.pControllerErr = m_pControllerErr;
	downFrame.carInfo.special.ready = m_ready;
	downFrame.carInfo.special.ebdLight = m_ebdLight;
	downFrame.carInfo.special.absLight = m_absLight;
	downFrame.carInfo.special.sysErr = m_sysErr;
	downFrame.carInfo.special.sysLose = m_sysLose;
	downFrame.carInfo.special.limitedPower = m_limitedPower;
	downFrame.carInfo.special.energyConsumption = m_energyConsumption;
	downFrame.carInfo.special.overSpeed = m_overSpeed;
	downFrame.carInfo.special.lowBeamText = m_lowBeamText;
	downFrame.carInfo.special.overSpeedWarning = m_overSpeedWarning;
	downFrame.carInfo.special.vacuumPumpText = m_vacuumPumpText;
	downFrame.carInfo.special.handbrakeText = m_handbrakeText;
	downFrame.carInfo.special.waterPumpText = m_waterPumpText;
	downFrame.carInfo.special.chargerHotText = m_chargerHotText;
	downFrame.carInfo.special.chargeLineText = m_chargeLineText;
	downFrame.carInfo.special.powerOnText = m_powerOnText;
	downFrame.carInfo.special.esclText = m_esclText;
	downFrame.carInfo.special.pepsText = m_pepsText;
	downFrame.carInfo.special.keyPowerLowText = m_keyPowerLowText;
	downFrame.carInfo.special.missKetText = m_missKetText;
	downFrame.carInfo.special.keyOutsideText = m_keyOutsideText;
	downFrame.carInfo.special.keyPowerOnText = m_keyPowerOnText;
	downFrame.carInfo.special.pushPowerOnText = m_pushPowerOnText;
        downFrame.carInfo.special.takePgear = m_takePgear;
	downFrame.carInfo.special.lfTP = m_lfTP;
	downFrame.carInfo.special.rfTP = m_rfTP;
	downFrame.carInfo.special.lrTP = m_lrTP;
	downFrame.carInfo.special.rrTP = m_rrTP;
	downFrame.carInfo.special.lfTPStatus = m_lfTPStatus;
	downFrame.carInfo.special.rfTPStatus = m_rfTPStatus;
	downFrame.carInfo.special.lrTPStatus = m_lrTPStatus;
	downFrame.carInfo.special.rrTPStatus = m_rrTPStatus;
	downFrame.carInfo.special.lfTT = m_lfTT;
	downFrame.carInfo.special.rfTT = m_rfTT;
	downFrame.carInfo.special.lrTT = m_lrTT;
	downFrame.carInfo.special.rrTT = m_rrTT;
	downFrame.carInfo.special.lfTPlow = m_lfTPlow;
	downFrame.carInfo.special.rfTPlow = m_rfTPlow;
	downFrame.carInfo.special.lrTPlow = m_lrTPlow;
        downFrame.carInfo.special.rrTPlow = m_rrTPlow;
        downFrame.carInfo.special.lfTTStatus = m_lfTTStatus;
        downFrame.carInfo.special.rfTTStatus = m_rfTTStatus;
        downFrame.carInfo.special.lrTTStatus = m_lrTTStatus;
		downFrame.carInfo.special.rrTTStatus = m_rrTTStatus;
		downFrame.carInfo.special.pepsPowerStatus = m_pepsPowerStatus;
		downFrame.carInfo.special.radarTest = m_radarTest;
		downFrame.carInfo.special.radarDistance = m_radarDistance;
	downFrame.carInfo.special.mcuVer1 = m_mcuVer1;
	downFrame.carInfo.special.mcuVer2 = m_mcuVer2;
	downFrame.carInfo.special.mcuVer3 = m_mcuVer3;
	downFrame.carInfo.special.seconds = m_seconds;
	downFrame.frameTypes = 2; //add for test c50

	downFrame.crc = crc16Check((uint8_t *)(&(downFrame.carInfo)), sizeof(CarInfo));
	downFrame.tail = 0x55;

	m_serial->sendSerial(QByteArray((char *)&downFrame, sizeof(DownFrame)));
}
