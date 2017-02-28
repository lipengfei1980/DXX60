#include <QDebug>
#include <QSerialPort>

#include <serial.h>

#define SERIAL_READ_BUFFER_SIZE 2048	// 2048 Byte

Serial::Serial(const QString &serialDev, QObject *parent) :
	QObject(parent)
{
	m_serial = new QSerialPort(this);
	m_serial->setPortName(serialDev);

	/*
	 * the serial port should be protected against receiving too much data,
	 * which may eventually cause the application to run out of memory.
	 */
	m_serial->setReadBufferSize(SERIAL_READ_BUFFER_SIZE);

	if (m_serial->open(QIODevice::ReadWrite)
			&& m_serial->setBaudRate(BAUD_RATE)
			&& m_serial->setDataBits(QSerialPort::Data8)
			&& m_serial->setParity(QSerialPort::NoParity)
			&& m_serial->setStopBits(QSerialPort::OneStop)
			&& m_serial->setFlowControl(QSerialPort::NoFlowControl)) {
		qDebug() << "Succeed to open serial port.";
	} else {
		qDebug() << "Fail to open serial port: " << serialDev
				 << "\n" << m_serial->errorString();
		return;
	}

	connect(m_serial, SIGNAL(readyRead()), this, SLOT(readSerial()));
}

void Serial::readSerial()
{
	m_recv += m_serial->readAll();

#ifdef HUATAI_RECV
	while (m_recv.length() >= (int)sizeof(DownFrame)) {

		if ((uint8_t)0xAA != (uint8_t)m_recv[0]) {
			bool found0xAA = false;
			for (int i = 0; i < m_recv.length(); ++i) {
				if ((uint8_t)0xAA == (uint8_t)m_recv[i]) {
					m_recv.remove(0, i);
					found0xAA = true;
					break;
				}
			}

			if (!found0xAA) m_recv.clear();
		}
		else {
			if ((uint8_t)0x55 != (uint8_t)m_recv[DOWNFRAME_BYTELEN-1]) {
				m_recv.remove(0, 1);
			}
			else {
				QByteArray bf = m_recv.left(DOWNFRAME_BYTELEN);
				m_recv.remove(0, DOWNFRAME_BYTELEN);
				DownFrame *downFrame = (DownFrame *)bf.data();

				if (downFrame->crc == crc16Check((uint8_t *)(&(downFrame->carInfo)), sizeof(CarInfo)))
					emit serialChanged(downFrame->carInfo);
			}
		}
	}
#endif

#ifdef HUATAI_TRAN
	while (m_recv.length() >= (int)sizeof(UpFrame)) {
		if ((uint8_t)0xAA != (uint8_t)m_recv[0]) {
			bool found0xAA = false;
			for (int i = 0; i < m_recv.length(); ++i) {
				if ((uint8_t)0xAA == (uint8_t)m_recv[i]) {
					m_recv.remove(0, i);
					found0xAA = true;
					break;
				}
			}
			if (!found0xAA) m_recv.clear();
		}
		else {
			if ((uint8_t)0x55 != (uint8_t)m_recv[UPFRAME_BYTELEN-1]) {
				m_recv.remove(0, 1);
			}
			else {
				QByteArray bf = m_recv.left(UPFRAME_BYTELEN);
				m_recv.remove(0, UPFRAME_BYTELEN);
				UpFrame *upFrame = (UpFrame *)bf.data();
				if (upFrame->crc == crc16Check((uint8_t *)(&(upFrame->settingsInfo)), sizeof(SettingsInfo)))
					emit serialChanged(upFrame->settingsInfo);
			}
		}
	}
#endif
}

bool Serial::sendSerial(const QByteArray &data)
{
	if (m_serial->write(data) != -1) {
		qDebug() << "Send serial port data succeeded.";
		return true;
	}
	else {
		qDebug() << "Send serial port data failed.";
		return false;
	}
}
