#ifndef CARSTATUS_H
#define CARSTATUS_H

#include <QString>

#include <serial.h>

class CarStatus : public QObject
{
    Q_OBJECT

	// all have
	Q_PROPERTY(uint powerMemter MEMBER m_powerMemter NOTIFY powerMemterChanged)
	Q_PROPERTY(uint speed MEMBER m_speed NOTIFY speedChanged)
	Q_PROPERTY(uint odo MEMBER m_odo NOTIFY odoChanged)
	Q_PROPERTY(uint gear MEMBER m_gear NOTIFY gearChanged)
	Q_PROPERTY(uint powerStatus MEMBER m_powerStatus NOTIFY powerStatusChanged)
	Q_PROPERTY(uint tripA MEMBER m_tripA NOTIFY tripAChanged)
	Q_PROPERTY(uint tripB MEMBER m_tripB NOTIFY tripBChanged)
	Q_PROPERTY(uint range MEMBER m_range NOTIFY rangeChanged)
	Q_PROPERTY(bool leftFrontDoor MEMBER m_leftFrontDoor NOTIFY leftFrontDoorChanged)
	Q_PROPERTY(bool leftRearDoor MEMBER m_leftRearDoor NOTIFY leftRearDoorChanged)
	Q_PROPERTY(bool rightFrontDoor MEMBER m_rightFrontDoor NOTIFY rightFrontDoorChanged)
	Q_PROPERTY(bool rightRearDoor MEMBER m_rightRearDoor NOTIFY rightRearDoorChanged)
	Q_PROPERTY(bool hoodDoor MEMBER m_hoodDoor NOTIFY hoodDoorChanged)
	Q_PROPERTY(bool trunkDoor MEMBER m_trunkDoor NOTIFY trunkDoorChanged)
	Q_PROPERTY(uint theme MEMBER m_theme NOTIFY themeChanged)
	Q_PROPERTY(bool gearErrorOperation MEMBER m_gearErrorOperation NOTIFY gearErrorOperationChanged)
	Q_PROPERTY(QString date MEMBER m_date NOTIFY dateChanged)
	Q_PROPERTY(QString time MEMBER m_time NOTIFY timeChanged)

	Q_PROPERTY(bool active MEMBER m_active NOTIFY activeChanged)

public:
    explicit CarStatus(const QString &serialDev, QObject *parent = 0);

signals:
	// all have
    void powerMemterChanged(uint);
    void speedChanged(uint);
    void odoChanged(uint);
    void gearChanged(uint);
    void gearErrorOperationChanged(bool);
    void powerStatusChanged(uint);
    void tripAChanged(uint);
    void tripBChanged(uint);
    void rangeChanged(uint);
    void leftFrontDoorChanged(bool);
    void leftRearDoorChanged(bool);
    void rightFrontDoorChanged(bool);
    void rightRearDoorChanged(bool);
    void hoodDoorChanged(bool);
    void trunkDoorChanged(bool);
	void themeChanged(uint);
    void timeChanged(QString);
    void dateChanged(QString);

    void activeChanged(bool);

protected slots:
    virtual void setSerial() = 0;
    virtual void getSerial(CarInfo data) = 0;

protected:
    virtual void initValues() = 0;

	// set date and time to string
    void setTime(uint);
    void setDate(uint);

	// all have
    uint m_powerMemter;
    uint m_speed;
    uint m_odo;
    uint m_gear;
    bool m_gearErrorOperation;
    uint m_powerStatus;
    uint m_tripA;
    uint m_tripB;
    uint m_range;
    bool m_leftFrontDoor;
    bool m_leftRearDoor;
    bool m_rightFrontDoor;
    bool m_rightRearDoor;
    bool m_hoodDoor;
    bool m_trunkDoor;
	uint m_theme;
    QString m_time;
    QString m_date;

    bool m_active;

    Serial *m_serial;
};

#endif // CARSTATUS_H
