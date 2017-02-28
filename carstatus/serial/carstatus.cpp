#include <QDebug>
#include <QDateTime>

#include <serial.h>
#include <carstatus.h>

CarStatus::CarStatus(const QString &serialDev, QObject *parent) :
	QObject(parent)
{
	m_serial = new Serial(serialDev, this);
	connect(m_serial, SIGNAL(serialChanged(CarInfo)), this, SLOT(getSerial(CarInfo)));
}

// all have
void CarStatus::setTime(uint v)
{
	QDateTime time;
	time.setTimeSpec(Qt::UTC);
	time.setTime_t(v);
	m_time = time.toString("hh:mm");
	emit timeChanged(m_time);
}

void CarStatus::setDate(uint v)
{
	QDateTime date;
	date.setTimeSpec(Qt::UTC);
	date.setTime_t(v);
	m_date = date.toString("yyyy-MM-dd");
	emit dateChanged(m_date);
}
