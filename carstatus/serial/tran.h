#ifndef SERIALTRAN_H
#define SERIALTRAN_H

#include <QObject>
#include <QString>

#include <serial.h>

class SerialTran : public QObject
{
    Q_OBJECT

    // all have
    Q_PROPERTY(uint dateTime MEMBER m_dateTime NOTIFY dateTimeChanged)
    Q_PROPERTY(bool okBtn MEMBER m_okBtn NOTIFY okBtnChanged)
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
    Q_PROPERTY(bool leftFrontDoor MEMBER m_leftFrontDoor NOTIFY leftFrontDoorChanged)
    Q_PROPERTY(bool leftRearDoor MEMBER m_leftRearDoor NOTIFY leftRearDoorChanged)
    Q_PROPERTY(bool rightFrontDoor MEMBER m_rightFrontDoor NOTIFY rightFrontDoorChanged)
    Q_PROPERTY(bool rightRearDoor MEMBER m_rightRearDoor NOTIFY rightRearDoorChanged)
    Q_PROPERTY(bool hoodDoor MEMBER m_hoodDoor NOTIFY hoodDoorChanged)
    Q_PROPERTY(bool trunkDoor MEMBER m_trunkDoor NOTIFY trunkDoorChanged)
    Q_PROPERTY(bool powerStatus MEMBER m_powerStatus NOTIFY powerStatusChanged)
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
    Q_PROPERTY(bool chargeLine MEMBER m_chargeLine NOTIFY chargeLineChanged)
    Q_PROPERTY(uint insulation MEMBER m_insulation NOTIFY insulationChanged)
    Q_PROPERTY(bool chargeLight MEMBER m_chargeLight NOTIFY chargeLightChanged)
    Q_PROPERTY(uint soc MEMBER m_soc NOTIFY socChanged)
    Q_PROPERTY(uint pControllerErr MEMBER m_pControllerErr NOTIFY pControllerErrChanged)
    Q_PROPERTY(bool ready MEMBER m_ready NOTIFY readyChanged)
    Q_PROPERTY(bool ebdLight MEMBER m_ebdLight NOTIFY ebdLightChanged)
	Q_PROPERTY(bool absLight MEMBER m_absLight NOTIFY absLightChanged)
    Q_PROPERTY(bool sysErr MEMBER m_sysErr NOTIFY sysErrChanged)
	Q_PROPERTY(bool sysLose MEMBER m_sysLose NOTIFY sysLoseChanged)
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
	Q_PROPERTY(uint radarTest MEMBER m_radarTest NOTIFY radarTestChanged)
	Q_PROPERTY(uint radarDistance MEMBER m_radarDistance NOTIFY radarDistanceChanged)
    Q_PROPERTY(uint mcuVer1 MEMBER m_mcuVer1 NOTIFY mcuVer1Changed)
    Q_PROPERTY(uint mcuVer2 MEMBER m_mcuVer2 NOTIFY mcuVer2Changed)
    Q_PROPERTY(uint mcuVer3 MEMBER m_mcuVer3 NOTIFY mcuVer3Changed)
    Q_PROPERTY(uint seconds MEMBER m_seconds NOTIFY secondsChanged)

    // settings info
    Q_PROPERTY(uint dateTimeSet MEMBER m_dateTimeSet NOTIFY dateTimeSetChanged)
    Q_PROPERTY(bool tripClear MEMBER m_tripClear NOTIFY tripClearChanged)
    Q_PROPERTY(uint setBackLight MEMBER m_setBackLight NOTIFY setBackLightChanged)
    Q_PROPERTY(uint setLcdNightLight MEMBER m_setLcdNightLight NOTIFY setLcdNightLightChanged)
    Q_PROPERTY(uint setTheme MEMBER m_setTheme NOTIFY setThemeChanged)
    Q_PROPERTY(uint setOverSpeed MEMBER m_setOverSpeed NOTIFY setOverSpeedChanged)

public:
    explicit SerialTran(const QString &serialDev, QObject *parent = 0);
    Q_INVOKABLE void sendDownFrame();

signals:
    // all have
    void dateTimeChanged(uint);
    void okBtnChanged(bool);
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
    void leftFrontDoorChanged(bool);
    void leftRearDoorChanged(bool);
    void rightFrontDoorChanged(bool);
    void rightRearDoorChanged(bool);
    void hoodDoorChanged(bool);
    void trunkDoorChanged(bool);
    void powerStatusChanged(bool);
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
    void chargeLineChanged(bool);
    void insulationChanged(uint);
    void chargeLightChanged(bool);
    void socChanged(uint);
    void pControllerErrChanged(uint);
    void readyChanged(bool);
    void ebdLightChanged(bool);
	void absLightChanged(bool);
    void sysErrChanged(bool);
	void sysLoseChanged(bool);
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
    void pepsPowerStatusChanged(uint);
	void radarDistanceChanged(uint);
	void radarTestChanged(uint);
    void mcuVer1Changed(uint);
    void mcuVer2Changed(uint);
    void mcuVer3Changed(uint);
    void secondsChanged(uint);

    // settings info
    void dateTimeSetChanged(uint);
    void tripClearChanged(bool);
    void setBackLightChanged(uint);
    void setLcdNightLightChanged(uint);
    void setThemeChanged(uint);
    void setOverSpeedChanged(uint);

private slots:
    void getSerial(SettingsInfo data);

private:
    // all have
    uint m_dateTime;
    bool m_okBtn;
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
    bool m_leftFrontDoor;
    bool m_leftRearDoor;
    bool m_rightFrontDoor;
    bool m_rightRearDoor;
    bool m_hoodDoor;
    bool m_trunkDoor;
    bool m_powerStatus;
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
    bool m_chargeLine;
    uint m_insulation;
    bool m_chargeLight;
    uint m_soc;
    uint m_pControllerErr;
    bool m_ready;
    bool m_ebdLight;
    bool m_absLight;
    bool m_sysErr;
	bool m_sysLose;
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
	uint m_radarDistance;
	uint m_radarTest;
    uint m_mcuVer1;
    uint m_mcuVer2;
    uint m_mcuVer3;
    uint m_seconds;

    // settings info
    uint m_dateTimeSet;
    bool m_tripClear;
    uint m_setBackLight;
    uint m_setLcdNightLight;
    uint m_setTheme;
    uint m_setOverSpeed;

    Serial *m_serial;
};

#endif // SERIALTRAN_H
