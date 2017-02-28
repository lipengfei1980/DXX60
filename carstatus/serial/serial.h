#ifndef SERIAL_H
#define SERIAL_H

#include <QObject>
#include <QByteArray>

#include <protocol.h>

class QSerialPort;

class Serial : public QObject
{
	Q_OBJECT
public:
	explicit Serial(const QString &serialDev, QObject *parent = 0);
	bool sendSerial(const QByteArray &data);

signals:

#ifdef HUATAI_RECV
	void serialChanged(CarInfo data);
#endif

#ifdef HUATAI_TRAN
	void serialChanged(SettingsInfo data);
#endif

private slots:
	void readSerial();

private:
	QByteArray m_recv;
	QSerialPort *m_serial;
};

#endif // SERIAL_H
