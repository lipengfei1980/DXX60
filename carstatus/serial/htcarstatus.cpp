#include <QDebug>
#include <QDateTime>

#include <htcarstatus.h>

#define ValueChangeSet(name, v) do{if(m_##name!=(v)){m_##name=(v); emit name##Changed(v); qDebug()<<QString(#name)<<(v);}}while(0)

HtCarStatus::HtCarStatus(const QString &serialDev, QObject *parent) :
	CarStatus(serialDev, parent)
{
	initValues();

#ifdef TIMER_FREQ
	startTimer(UPFRAME_FREQ);
#endif
}

void HtCarStatus::initValues()
{
	m_active = true;

	// all have
	m_speed = 0;
	m_odo = 0;
	m_gear = 0;
	m_gearErrorOperation = false;
	m_powerStatus = 0;
	m_tripA = 0;
	m_tripB = 0;
	m_range = 0;
	m_leftFrontDoor = false;
	m_leftRearDoor = false;
	m_rightFrontDoor = false;
	m_rightRearDoor = false;
	m_hoodDoor = false;
	m_trunkDoor = false;
	m_theme = 0;

	m_time = "00:00";
	m_date = "2000-01-01";

	// not all have
	m_soc = 0;
	m_antiTheftIcon = false;
	m_ready = false;
	m_energyRecoverIcon = false;
	m_energyRecover = 0;
	m_powerBattryTemp = 0;
	m_batteryWarningIcon = false;
	m_remoteIndication = false;
	m_highVoltageIndication = false;
	m_tirePressureIndication = false;
	m_seatbeltWarning = false;
	m_brakingError = false;
	m_EBDError = false;
	m_handbrakeError = false;
	m_motorHotError = false;
	m_chargingReminder = false;
        m_timeFormat = false;
	m_leftFrontTirePressure = 0;
	m_rightFrontTirePressure = 0;
	m_leftRearTirePressure = 0;
	m_rightRearTirePressure = 0;
	m_tirePressureStatus = false;
	m_leftFrontTPStatus = 0;
	m_LCDLight = 0;
	m_rightFrontTPStatus = 0;
	m_batteryErrIcon = false;
	m_leftRearTPStatus = 0;
	m_frontFogLamp = false;
	m_rightRearTPStatus = 0;
	m_chargeStatus = 0;
	m_backFogLamp = false;
	m_chargeCurrent = 0;
	m_chargeMode = 0;
	m_chargeHotStatus = 0;
	m_intelligenceKeyStatus = false;
	m_brakeFluidLow = false;
	m_parkErr = false;
	m_insulationErr = false;
	m_motorErr = false;
	m_leaveCar = false;
	m_takePGear = false;
	m_drivingMode = 0;
	m_takeBrake = false;
	m_drivingMotorErr = false;
	m_chargingConnect = false;
	m_motorHotText = false;
	m_batteryErrText = false;
	m_quickChange = false;
	m_batteryStatus = 0;
	m_breakLight = false;
	m_invasion = false;
	m_backLightLcd = false;
	m_frontLight = false;
	m_rightLight = false;
	m_leftLight = false;
	m_takeWheel = false;
	m_steeringColumn = false;
	m_steeringColumnLockErr = false;
	m_unUseKey = false;
	m_unIntelligenceKey = false;
	m_keyInCar = false;
	m_keyBatteryLow = false;
	m_elSteeringLock = false;
	m_speedWarning = 0;
	m_airbagIcon = false;
        m_mirrorFold = false;
	m_EPSwarning = false;
        m_pepsPowerStatus = 0;
        m_radarTest = 0;
	m_mcuVer1 = 0;
	m_mcuVer2 = 0;
        m_mcuVer3 = 0;

	// settings info
	m_backLight = 0;
	m_dateTimeSet = 0;
	m_tripAClear = false;
	m_tripBClear = false;
	m_restoreMaintenanceMileage = false;
	m_restoreFactory = false;
	m_rearviewMirrorStatus = 0;
	m_timeFormatSet = 0;
	m_overspeedWarning = 0;
	m_themeSet = 0;

	m_buttonRightStep = 0;
	m_buttonLeftStep = 0;
	m_buttonOkStep = 0;
	m_buttonOkStepFlag = false;

#ifdef HUATAI_DEBUG
	m_buttonRight = false;
	m_buttonLeft = false;
	m_buttonOk = "NONE";
#endif
}

void HtCarStatus::buttonRightDeal(bool v)
{
	if (m_buttonRightStep == 0 && v)
		++m_buttonRightStep;

	// key debounce
	if (m_buttonRightStep >= 1 && m_buttonRightStep < KEY_DEBOUNCE_TIME) {
		if (!v) {
			m_buttonRightStep = 0;
		}
		++m_buttonRightStep;
	}

	if (m_buttonRightStep == KEY_DEBOUNCE_TIME && v) {
		// the key is LeftButton
		++m_buttonRightStep;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonRight,true);
#else
		emit buttonRight();
#endif
	}

	if (m_buttonRightStep == KEY_DEBOUNCE_TIME + 1 && !v) {
		m_buttonRightStep = 0;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonRight,false);
#endif
	}
}

void HtCarStatus::buttonLeftDeal(bool v)
{
	if (m_buttonLeftStep == 0 && v)
		++m_buttonLeftStep;

	// key debounce
	if (m_buttonLeftStep >= 1 && m_buttonLeftStep < KEY_DEBOUNCE_TIME) {
		if (!v) {
			m_buttonLeftStep = 0;
		}
		++m_buttonLeftStep;
	}

	if (m_buttonLeftStep == KEY_DEBOUNCE_TIME && v) {
		// the key is LeftButton
		++m_buttonLeftStep;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonLeft,true);
#else
		emit buttonLeft();
#endif
	}

	if (m_buttonLeftStep == KEY_DEBOUNCE_TIME + 1 && !v) {
		m_buttonLeftStep = 0;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonLeft,false);
#endif
	}
}

void HtCarStatus::buttonOkDeal(bool v)
{
	if (m_buttonOkStep == 0 && v)
		++m_buttonOkStep;

	// key debounce
	if (m_buttonOkStep >= 1 && m_buttonOkStep < KEY_DEBOUNCE_TIME) {
		if(!v) {
			m_buttonOkStep = 0;
		}
		++m_buttonOkStep;
	}

	// LongKey deal
	if (m_buttonOkStep >= KEY_DEBOUNCE_TIME && m_buttonOkStep < KEY_LONG_TIME) {
		if (!v) {
			if (m_buttonOkStepFlag) {
				// the key is shortButton
				m_buttonOkStep = 0;
#ifdef HUATAI_DEBUG
				ValueChangeSet(buttonOk,"ShortButton");
#else
				emit buttonShort();
#endif
			}
			m_buttonOkStepFlag = true;
		}
		else {
			m_buttonOkStepFlag = false;
		}
		++m_buttonOkStep;
	}

	if (m_buttonOkStep == KEY_LONG_TIME && v) {
		// the key is LongButton
		++m_buttonOkStep;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonOk,"LongButton");
#else
		emit buttonLong();
#endif
	}

	if (m_buttonOkStep == KEY_LONG_TIME + 1 && !v) {
		m_buttonOkStep = 0;
#ifdef HUATAI_DEBUG
		ValueChangeSet(buttonOk,"NONE");
#endif
	}
}

void HtCarStatus::getSerial(CarInfo data)
{
	if (m_active) {

		// all have
		ValueChangeSet(leftFrontDoor, data.general.leftFrontDoor);
		ValueChangeSet(leftRearDoor, data.general.leftRearDoor);
		ValueChangeSet(rightFrontDoor, data.general.rightFrontDoor);
		ValueChangeSet(rightRearDoor, data.general.rightRearDoor);
		ValueChangeSet(hoodDoor, data.general.hoodDoor);
		ValueChangeSet(trunkDoor, data.general.trunkDoor);
		ValueChangeSet(theme, data.general.theme);

		if (m_tripAClear) {
			if (data.general.tripA <= 1) {
				m_tripAClear = false;
			}
		}

		if (m_tripBClear) {
			if (data.general.tripB <= 1) {
				m_tripBClear = false;
			}
		}

		ValueChangeSet(speed, data.general.speed);
		ValueChangeSet(odo, data.general.odo);
		ValueChangeSet(gear, data.general.gear);
		ValueChangeSet(gearErrorOperation, data.general.gearErrorOperation);
		ValueChangeSet(powerStatus, data.general.powerStatus);
		ValueChangeSet(tripA, data.general.tripA);
		ValueChangeSet(tripB, data.general.tripB);
		ValueChangeSet(range, data.general.range);
		setDate(data.general.dateTime);
		setTime(data.general.dateTime);

		ValueChangeSet(soc, data.special.soc);
		ValueChangeSet(antiTheftIcon, data.special.antiTheftIcon);
		ValueChangeSet(energyRecoverIcon, data.special.energyRecoverIcon);
		ValueChangeSet(energyRecover, data.special.energyRecover);
		ValueChangeSet(batteryWarningIcon, data.special.batteryWarningIcon);
		ValueChangeSet(ready, data.special.ready);
		ValueChangeSet(remoteIndication, data.special.remoteIndication);
		ValueChangeSet(highVoltageIndication, data.special.highVoltageIndication);
		ValueChangeSet(tirePressureIndication, data.special.tirePressureIndication);
		ValueChangeSet(powerBattryTemp, data.special.powerBattryTemp);
		ValueChangeSet(seatbeltWarning, data.special.seatbeltWarning);
		ValueChangeSet(brakingError, data.special.brakingError);
		ValueChangeSet(EBDError, data.special.EBDError);
		ValueChangeSet(handbrakeError, data.special.handbrakeError);
		ValueChangeSet(motorHotError, data.special.motorHotError);
		ValueChangeSet(chargingReminder, data.special.chargingReminder);
                ValueChangeSet(timeFormat, data.special.timeFormat);
		ValueChangeSet(leftFrontTirePressure, data.special.leftFrontTirePressure);
		ValueChangeSet(rightFrontTirePressure, data.special.rightFrontTirePressure);
		ValueChangeSet(leftRearTirePressure, data.special.leftRearTirePressure);
		ValueChangeSet(rightRearTirePressure, data.special.rightRearTirePressure);
		ValueChangeSet(tirePressureStatus, data.special.tirePressureStatus);
		ValueChangeSet(leftFrontTPStatus, data.special.leftFrontTPStatus);
		ValueChangeSet(LCDLight, data.special.LCDLight);
		ValueChangeSet(rightFrontTPStatus, data.special.rightFrontTPStatus);
		ValueChangeSet(batteryErrIcon, data.special.batteryErrIcon);
		ValueChangeSet(leftRearTPStatus, data.special.leftRearTPStatus);
		ValueChangeSet(frontFogLamp, data.special.frontFogLamp);
		ValueChangeSet(rightRearTPStatus, data.special.rightRearTPStatus);
		ValueChangeSet(chargeStatus, data.special.chargeStatus);
		ValueChangeSet(backFogLamp, data.special.backFogLamp);
		ValueChangeSet(chargeCurrent, data.special.chargeCurrent);
		ValueChangeSet(chargeMode, data.special.chargeMode);
		ValueChangeSet(chargeHotStatus, data.special.chargeHotStatus);
		ValueChangeSet(intelligenceKeyStatus, data.special.intelligenceKeyStatus);
		ValueChangeSet(drivingMode, data.special.drivingMode);
		ValueChangeSet(batteryStatus, data.special.batteryStatus);
		ValueChangeSet(quickChange, data.special.quickChange);
		ValueChangeSet(brakeFluidLow, data.special.brakeFluidLow);
		ValueChangeSet(parkErr, data.special.parkErr);
		ValueChangeSet(insulationErr, data.special.insulationErr);
		ValueChangeSet(motorErr, data.special.motorErr);
		ValueChangeSet(leaveCar, data.special.leaveCar);
		ValueChangeSet(takePGear, data.special.takePGear);
		ValueChangeSet(takeBrake, data.special.takeBrake);
		ValueChangeSet(drivingMotorErr, data.special.drivingMotorErr);
		ValueChangeSet(chargingConnect, data.special.chargingConnect);
		ValueChangeSet(motorHotText, data.special.motorHotText);
		ValueChangeSet(batteryErrText, data.special.batteryErrText);
		ValueChangeSet(breakLight, data.special.breakLight);
		ValueChangeSet(invasion, data.special.invasion);
		ValueChangeSet(backLightLcd, data.special.backLightLcd);
		ValueChangeSet(frontLight, data.special.frontLight);
		ValueChangeSet(rightLight, data.special.rightLight);
		ValueChangeSet(leftLight, data.special.leftLight);
		ValueChangeSet(takeWheel, data.special.takeWheel);
		ValueChangeSet(steeringColumn, data.special.steeringColumn);
		ValueChangeSet(steeringColumnLockErr, data.special.steeringColumnLockErr);
		ValueChangeSet(unUseKey, data.special.unUseKey);
		ValueChangeSet(unIntelligenceKey, data.special.unIntelligenceKey);
		ValueChangeSet(keyInCar, data.special.keyInCar);
		ValueChangeSet(keyBatteryLow, data.special.keyBatteryLow);
		ValueChangeSet(elSteeringLock, data.special.elSteeringLock);
		ValueChangeSet(intelligenceKeyStatus, data.special.intelligenceKeyStatus);
		ValueChangeSet(speedWarning, data.general.speedWarning);
		ValueChangeSet(airbagIcon, data.special.airbagIcon);
                ValueChangeSet(mirrorFold, data.special.mirrorFold);
                ValueChangeSet(EPSwarning, data.special.EPSwarning);
                ValueChangeSet(pepsPowerStatus,data.special.pepsPowerStatus);
                ValueChangeSet(radarTest,data.special.radarTest);
		ValueChangeSet(mcuVer1,data.special.mcuVer1);
		ValueChangeSet(mcuVer2,data.special.mcuVer2);
		ValueChangeSet(mcuVer3,data.special.mcuVer3);

		buttonRightDeal(data.special.rightRotateBtn);
		buttonLeftDeal(data.special.leftRotateBtn);
		buttonOkDeal(data.special.okBtn);
	}
}

#ifdef HUATAI_DEBUG
void HtCarStatus::sendUpFrame()
{
	setSerial();
}
#endif

void HtCarStatus::setSerial()
{
	UpFrame upFrame;
	memset(&upFrame, 0, sizeof(UpFrame));

	upFrame.head = 0xAA;
	upFrame.length = sizeof(SettingsInfo) + 2;

	upFrame.settingsInfo.backLight = m_backLight;
	upFrame.settingsInfo.dateTime = m_dateTimeSet;
	upFrame.settingsInfo.tripAClear = m_tripAClear;
        upFrame.settingsInfo.tripBClear = m_tripBClear;
	upFrame.settingsInfo.restoreFactory = m_restoreFactory;
	upFrame.settingsInfo.rearviewMirrorStatus = m_rearviewMirrorStatus;
	upFrame.settingsInfo.timeFormat = m_timeFormatSet;
	upFrame.settingsInfo.overspeedWarning = m_overspeedWarning;
	upFrame.settingsInfo.themeSet = m_themeSet;

	upFrame.crc = crc16Check((uint8_t *)(&(upFrame.settingsInfo)), sizeof(SettingsInfo));
	upFrame.tail = 0x55;

	m_serial->sendSerial(QByteArray((char *)&upFrame, sizeof(UpFrame)));
}

#ifdef TIMER_FREQ
void HtCarStatus::timerEvent(QTimerEvent *event)
{
	Q_UNUSED(event);
	setSerial();
}
#endif
