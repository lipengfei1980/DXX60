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
	void serialChanged(CarInfo data);
	void mcuUpdataChanged(QByteArray data);

private slots:
	void readSerial();
private:
	QByteArray m_recv;
	QSerialPort *m_serial;
	FRAME_TYPES m_frameType;
};

#endif // SERIAL_H
