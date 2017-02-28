#ifndef C50CARSTATUS_H
#define C50CARSTATUS_H

#include <QTimer>
#include <QTimerEvent>

#include <carstatus.h>

/*
 * times for key debounce and long button
 */
#define KEY_DEBOUNCE_TIME 2     // 2 * 20ms = 40ms
#define KEY_LONG_TIME 50		// 50 * 20ms = 1000ms

class HtCarStatus : public CarStatus
{
	Q_OBJECT
	// not all have
	Q_PROPERTY(uint soc MEMBER m_soc NOTIFY socChanged)
	Q_PROPERTY(bool ready MEMBER m_ready NOTIFY readyChanged)
	Q_PROPERTY(uint energyRecover MEMBER m_energyRecover NOTIFY energyRecoverChanged)
	Q_PROPERTY(uint powerBattryTemp MEMBER m_powerBattryTemp NOTIFY powerBattryTempChanged)
	Q_PROPERTY(bool energyRecoverIcon MEMBER m_energyRecoverIcon NOTIFY energyRecoverIconChanged)
	Q_PROPERTY(bool batteryWarningIcon MEMBER m_batteryWarningIcon NOTIFY batteryWarningIconChanged)
	Q_PROPERTY(bool remoteIndication MEMBER m_remoteIndication NOTIFY remoteIndicationChanged)
	Q_PROPERTY(bool highVoltageIndication MEMBER m_highVoltageIndication NOTIFY highVoltageIndicationChanged)
	Q_PROPERTY(bool tirePressureIndication MEMBER m_tirePressureIndication NOTIFY tirePressureIndicationChanged)
	Q_PROPERTY(bool seatbeltWarning MEMBER m_seatbeltWarning NOTIFY seatbeltWarningChanged)
	Q_PROPERTY(bool brakingError MEMBER m_brakingError NOTIFY brakingErrorChanged)
	Q_PROPERTY(bool EBDError MEMBER m_EBDError NOTIFY EBDErrorChanged)
	Q_PROPERTY(bool handbrakeError MEMBER m_handbrakeError NOTIFY handbrakeErrorChanged)
	Q_PROPERTY(bool motorHotError MEMBER m_motorHotError NOTIFY motorHotErrorChanged)
	Q_PROPERTY(bool chargingReminder MEMBER m_chargingReminder NOTIFY chargingReminderChanged)
	Q_PROPERTY(bool timeFormat MEMBER m_timeFormat NOTIFY timeFormatChanged)
	Q_PROPERTY(uint maintenanceMileage MEMBER m_maintenanceMileage NOTIFY maintenanceMileageChanged)
	Q_PROPERTY(uint leftFrontTirePressure MEMBER m_leftFrontTirePressure NOTIFY leftFrontTirePressureChanged)
	Q_PROPERTY(uint rightFrontTirePressure MEMBER m_rightFrontTirePressure NOTIFY rightFrontTirePressureChanged)
	Q_PROPERTY(uint leftRearTirePressure MEMBER m_leftRearTirePressure NOTIFY leftRearTirePressureChanged)
	Q_PROPERTY(uint rightRearTirePressure MEMBER m_rightRearTirePressure NOTIFY rightRearTirePressureChanged)
	Q_PROPERTY(bool tirePressureStatus MEMBER m_tirePressureStatus NOTIFY tirePressureStatusChanged)
	Q_PROPERTY(uint leftFrontTPStatus MEMBER m_leftFrontTPStatus NOTIFY leftFrontTPStatusChanged)
	Q_PROPERTY(uint LCDLight MEMBER m_LCDLight NOTIFY LCDLightChanged)
	Q_PROPERTY(uint rightFrontTPStatus MEMBER m_rightFrontTPStatus NOTIFY rightFrontTPStatusChanged)
	Q_PROPERTY(bool batteryErrIcon MEMBER m_batteryErrIcon NOTIFY batteryErrIconChanged)
	Q_PROPERTY(uint leftRearTPStatus MEMBER m_leftRearTPStatus NOTIFY leftRearTPStatusChanged)
	Q_PROPERTY(bool frontFogLamp MEMBER m_frontFogLamp NOTIFY frontFogLampChanged)
	Q_PROPERTY(uint rightRearTPStatus MEMBER m_rightRearTPStatus NOTIFY rightRearTPStatusChanged)
	Q_PROPERTY(uint chargeStatus MEMBER m_chargeStatus NOTIFY chargeStatusChanged)
	Q_PROPERTY(bool backFogLamp MEMBER m_backFogLamp NOTIFY backFogLampChanged)
	Q_PROPERTY(uint chargeCurrent MEMBER m_chargeCurrent NOTIFY chargeCurrentChanged)
	Q_PROPERTY(uint chargeMode MEMBER m_chargeMode NOTIFY chargeModeChanged)
	Q_PROPERTY(uint chargeHotStatus MEMBER m_chargeHotStatus NOTIFY chargeHotStatusChanged)
	Q_PROPERTY(bool intelligenceKeyStatus MEMBER m_intelligenceKeyStatus NOTIFY intelligenceKeyStatusChanged)
	Q_PROPERTY(uint speedWarning MEMBER m_speedWarning NOTIFY speedWarningChanged)
	Q_PROPERTY(bool antiTheftIcon MEMBER m_antiTheftIcon NOTIFY antiTheftIconChanged)
	Q_PROPERTY(bool airbagIcon MEMBER m_airbagIcon NOTIFY airbagIconChanged)
	Q_PROPERTY(bool mirrorFold MEMBER m_mirrorFold NOTIFY mirrorFoldChanged)
	Q_PROPERTY(bool EPSwarning MEMBER m_EPSwarning NOTIFY EPSwarningChanged)
	Q_PROPERTY(bool brakeFluidLow MEMBER m_brakeFluidLow NOTIFY brakeFluidLowChanged)
	Q_PROPERTY(bool parkErr MEMBER m_parkErr NOTIFY parkErrChanged)
	Q_PROPERTY(bool insulationErr MEMBER m_insulationErr NOTIFY insulationErrChanged)
	Q_PROPERTY(bool motorErr MEMBER m_motorErr NOTIFY motorErrChanged)
	Q_PROPERTY(bool leaveCar MEMBER m_leaveCar NOTIFY leaveCarChanged)
	Q_PROPERTY(bool takePGear MEMBER m_takePGear NOTIFY takePGearChanged)
	Q_PROPERTY(uint drivingMode MEMBER m_drivingMode NOTIFY drivingModeChanged)
	Q_PROPERTY(bool takeBrake MEMBER m_takeBrake NOTIFY takeBrakeChanged)
	Q_PROPERTY(bool drivingMotorErr MEMBER m_drivingMotorErr NOTIFY drivingMotorErrChanged)
	Q_PROPERTY(bool chargingConnect MEMBER m_chargingConnect NOTIFY chargingConnectChanged)
	Q_PROPERTY(bool motorHotText MEMBER m_motorHotText NOTIFY motorHotTextChanged)
	Q_PROPERTY(bool batteryErrText MEMBER m_batteryErrText NOTIFY batteryErrTextChanged)
	Q_PROPERTY(bool quickChange MEMBER m_quickChange NOTIFY quickChangeChanged)
	Q_PROPERTY(uint batteryStatus MEMBER m_batteryStatus NOTIFY batteryStatusChanged)
	Q_PROPERTY(bool breakLight MEMBER m_breakLight NOTIFY breakLightChanged)
	Q_PROPERTY(bool invasion MEMBER m_invasion NOTIFY invasionChanged)
	Q_PROPERTY(bool backLightLcd MEMBER m_backLightLcd NOTIFY backLightLcdChanged)
	Q_PROPERTY(bool frontLight MEMBER m_frontLight NOTIFY frontLightChanged)
	Q_PROPERTY(bool rightLight MEMBER m_rightLight NOTIFY rightLightChanged)
	Q_PROPERTY(bool leftLight MEMBER m_leftLight NOTIFY leftLightChanged)
	Q_PROPERTY(bool takeWheel MEMBER m_takeWheel NOTIFY takeWheelChanged)
	Q_PROPERTY(bool steeringColumn MEMBER m_steeringColumn NOTIFY steeringColumnChanged)
	Q_PROPERTY(bool steeringColumnLockErr MEMBER m_steeringColumnLockErr NOTIFY steeringColumnLockErrChanged)
	Q_PROPERTY(bool unUseKey MEMBER m_unUseKey NOTIFY unUseKeyChanged)
	Q_PROPERTY(bool unIntelligenceKey MEMBER m_unIntelligenceKey NOTIFY unIntelligenceKeyChanged)
	Q_PROPERTY(bool keyInCar MEMBER m_keyInCar NOTIFY keyInCarChanged)
	Q_PROPERTY(bool keyBatteryLow MEMBER m_keyBatteryLow NOTIFY keyBatteryLowChanged)
	Q_PROPERTY(bool elSteeringLock MEMBER m_elSteeringLock NOTIFY elSteeringLockChanged)
	Q_PROPERTY(uint mcuVer1 MEMBER m_mcuVer1 NOTIFY mcuVer1Changed)
	Q_PROPERTY(uint mcuVer2 MEMBER m_mcuVer2 NOTIFY mcuVer2Changed)
	Q_PROPERTY(uint mcuVer3 MEMBER m_mcuVer3 NOTIFY mcuVer3Changed)

	// settings info
	Q_PROPERTY(bool tripAClear MEMBER m_tripAClear NOTIFY tripAClearChanged)
	Q_PROPERTY(bool tripBClear MEMBER m_tripBClear NOTIFY tripBClearChanged)
	Q_PROPERTY(uint backLight MEMBER m_backLight NOTIFY backLightChanged)
	Q_PROPERTY(uint themeSet MEMBER m_themeSet NOTIFY themeSetChanged)
	Q_PROPERTY(uint dateTimeSet MEMBER m_dateTimeSet NOTIFY dateTimeSetChanged)
	Q_PROPERTY(bool restoreMaintenanceMileage MEMBER m_restoreMaintenanceMileage NOTIFY restoreMaintenanceMileageChanged)
	Q_PROPERTY(bool restoreFactory MEMBER m_restoreFactory NOTIFY restoreFactoryChanged)
	Q_PROPERTY(uint rearviewMirrorStatus MEMBER m_rearviewMirrorStatus NOTIFY rearviewMirrorStatusChanged)
	Q_PROPERTY(uint timeFormatSet MEMBER m_timeFormatSet NOTIFY timeFormatSetChanged)
	Q_PROPERTY(uint overspeedWarning MEMBER m_overspeedWarning NOTIFY overspeedWarningChanged)

#ifdef HUATAI_DEBUG
	Q_PROPERTY(bool buttonRight MEMBER m_buttonRight NOTIFY buttonRightChanged)
	Q_PROPERTY(bool buttonLeft MEMBER m_buttonLeft NOTIFY buttonLeftChanged)
	Q_PROPERTY(QString buttonOk MEMBER m_buttonOk NOTIFY buttonOkChanged)
#endif

public:
	explicit HtCarStatus(const QString &serialDev, QObject *parent = 0);

#ifdef HUATAI_DEBUG
	Q_INVOKABLE void sendUpFrame();
#endif

protected:
#ifdef TIMER_FREQ
	void timerEvent(QTimerEvent *event);
#endif

signals:
	// not all have
	void socChanged(uint);
	void readyChanged(bool);
	void energyRecoverChanged(uint);
	void powerBattryTempChanged(uint);
	void energyRecoverIconChanged(bool);
	void batteryWarningIconChanged(bool);
	void remoteIndicationChanged(bool);
	void highVoltageIndicationChanged(bool);
	void tirePressureIndicationChanged(bool);
	void seatbeltWarningChanged(bool);
	void brakingErrorChanged(bool);
	void EBDErrorChanged(bool);
	void handbrakeErrorChanged(bool);
	void motorHotErrorChanged(bool);
	void chargingReminderChanged(bool);
	void timeFormatChanged(bool);
	void maintenanceMileageChanged(uint);
	void leftFrontTirePressureChanged(uint);
	void rightFrontTirePressureChanged(uint);
	void leftRearTirePressureChanged(uint);
	void rightRearTirePressureChanged(uint);
	void tirePressureStatusChanged(bool);
	void leftFrontTPStatusChanged(uint);
	void LCDLightChanged(uint);
	void rightFrontTPStatusChanged(uint);
	void batteryErrIconChanged(bool);
	void leftRearTPStatusChanged(uint);
	void frontFogLampChanged(bool);
	void rightRearTPStatusChanged(uint);
	void chargeStatusChanged(uint);
	void backFogLampChanged(bool);
	void chargeCurrentChanged(uint);
	void chargeModeChanged(uint);
	void chargeHotStatusChanged(uint);
	void intelligenceKeyStatusChanged(bool);
	void speedWarningChanged(uint);
	void antiTheftIconChanged(bool);
	void airbagIconChanged(bool);
	void mirrorFoldChanged(bool);
	void EPSwarningChanged(bool);
	void brakeFluidLowChanged(bool);
	void parkErrChanged(bool);
	void insulationErrChanged(bool);
	void motorErrChanged(bool);
	void leaveCarChanged(bool);
	void takePGearChanged(bool);
	void drivingModeChanged(uint);
	void takeBrakeChanged(bool);
	void drivingMotorErrChanged(bool);
	void chargingConnectChanged(bool);
	void motorHotTextChanged(bool);
	void batteryErrTextChanged(bool);
	void quickChangeChanged(bool);
	void batteryStatusChanged(uint);
	void breakLightChanged(bool);
	void invasionChanged(bool);
	void backLightLcdChanged(bool);
	void frontLightChanged(bool);
	void rightLightChanged(bool);
	void leftLightChanged(bool);
	void takeWheelChanged(bool);
	void steeringColumnChanged(bool);
	void steeringColumnLockErrChanged(bool);
	void unUseKeyChanged(bool);
	void unIntelligenceKeyChanged(bool);
	void keyInCarChanged(bool);
	void keyBatteryLowChanged(bool);
	void elSteeringLockChanged(bool);
	void mcuVer1Changed(uint);
	void mcuVer2Changed(uint);
	void mcuVer3Changed(uint);

	// settings info
	void tripAClearChanged(bool);
	void tripBClearChanged(bool);
	void backLightChanged(uint);
	void dateTimeSetChanged(uint);
	void restoreMaintenanceMileageChanged(bool);
	void restoreFactoryChanged(bool);
	void rearviewMirrorStatusChanged(uint);
	void timeFormatSetChanged(uint);
	void themeSetChanged(uint);
	void overspeedWarningChanged(uint);

#ifdef HUATAI_DEBUG
	void buttonRightChanged(bool);
	void buttonLeftChanged(bool);
	void buttonOkChanged(QString);
#else
	Q_INVOKABLE void buttonLeft();
	Q_INVOKABLE void buttonRight();
	Q_INVOKABLE void buttonShort();
	Q_INVOKABLE void buttonLong();
#endif

private slots:
	void setSerial();
	void getSerial(CarInfo date);

	// button info
	void buttonRightDeal(bool);
	void buttonLeftDeal(bool);
	void buttonOkDeal(bool);

private:
	void initValues();

	// not all have
	uint m_soc;
	bool m_antiTheftIcon;
	bool m_ready;
	uint m_energyRecover;
	uint m_powerBattryTemp;
	bool m_energyRecoverIcon;
	bool m_batteryWarningIcon;
	bool m_remoteIndication;
	bool m_highVoltageIndication;
	bool m_tirePressureIndication;
	bool m_seatbeltWarning;
	bool m_brakingError;
	bool m_EBDError;
	bool m_handbrakeError;
	bool m_motorHotError;
	bool m_chargingReminder;
	bool m_timeFormat;
	uint m_maintenanceMileage;
	uint m_leftFrontTirePressure;
	uint m_rightFrontTirePressure;
	uint m_leftRearTirePressure;
	uint m_rightRearTirePressure;
	bool m_tirePressureStatus;
	uint m_leftFrontTPStatus;
	uint m_LCDLight;
	uint m_rightFrontTPStatus;
	bool m_batteryErrIcon;
	uint m_leftRearTPStatus;
	bool m_frontFogLamp;
	uint m_rightRearTPStatus;
	uint m_chargeStatus;
	bool m_backFogLamp;
	uint m_chargeCurrent;
	uint m_chargeMode;
	uint m_chargeHotStatus;
	bool m_intelligenceKeyStatus;
	uint m_speedWarning;
	bool m_airbagIcon;
	bool m_mirrorFold;
	bool m_EPSwarning;
	bool m_brakeFluidLow;
	bool m_parkErr;
	bool m_insulationErr;
	bool m_motorErr;
	bool m_leaveCar;
	bool m_takePGear;
	uint m_drivingMode;
	bool m_takeBrake;
	bool m_drivingMotorErr;
	bool m_chargingConnect;
	bool m_motorHotText;
	bool m_batteryErrText;
	bool m_quickChange;
	uint m_batteryStatus;
	bool m_breakLight;
	bool m_invasion;
	bool m_backLightLcd;
	bool m_frontLight;
	bool m_rightLight;
	bool m_leftLight;
	bool m_takeWheel;
	bool m_steeringColumn;
	bool m_steeringColumnLockErr;
	bool m_unUseKey;
	bool m_unIntelligenceKey;
	bool m_keyInCar;
	bool m_keyBatteryLow;
	bool m_elSteeringLock;
	uint m_mcuVer1;
	uint m_mcuVer2;
	uint m_mcuVer3;
	
	// settings info
	bool m_tripAClear;
	bool m_tripBClear;
	uint m_backLight;
	uint m_dateTimeSet;
	bool m_restoreMaintenanceMileage;
	bool m_restoreFactory;
	uint m_rearviewMirrorStatus;
	uint m_timeFormatSet;
	uint m_overspeedWarning;
	uint m_themeSet;

	uint m_buttonRightStep;
	uint m_buttonLeftStep;
	uint m_buttonOkStep;
	bool m_buttonOkStepFlag;
#ifdef HUATAI_DEBUG
	// button info
	bool m_buttonRight;
	bool m_buttonLeft;
	QString m_buttonOk;
#endif
};

#endif // HUATAICARSTATUS_H
