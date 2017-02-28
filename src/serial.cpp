#include <QDebug>
#include <QSerialPort>

#include <serial.h>

#define SERIAL_READ_BUFFER_SIZE 2048	// 2048 Byte

Serial::Serial(const QString &serialDev, QObject *parent) :
	QObject(parent)
{
	m_serial = new QSerialPort(this);
	m_serial->setPortName(serialDev);
	m_frameType = NULL_TYPE;

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
			&& m_serial->setFlowControl(QSerialPort::NoFlowControl)
			&& m_serial->clear(QSerialPort::AllDirections)) {
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

	while (m_recv.length() >= FRAMETPYES_LEN && m_frameType == NULL_TYPE) {
		if( (uint8_t)0xAA != (uint8_t)m_recv[0] ) {
			/* finding HEAD 0xAA */
			bool found0xAA = false;

			for (int i = 0; i < m_recv.length(); ++i) {
				if ((uint8_t)0xAA == (uint8_t)m_recv[i]) {
					m_recv.remove(0, i);
					/* finded HEAD 0xAA */
					QByteArray bf = m_recv.left(FRAMETPYES_LEN);
					if(bf.at(FRAMETPYES_LEN - 1) == CAR_INFO_TYPE) {
						m_frameType = CAR_INFO_TYPE;
						qDebug() << "m_serial->CAR_INFO_TYPE();";

						found0xAA = true;
						break;
					}

					if(bf.at(FRAMETPYES_LEN - 1) == MCU_UPDATA_TYPE) {
						m_frameType = MCU_UPDATA_TYPE;
						qDebug() << "m_serial->MCU_UPDATA_TYPE();";

						found0xAA = true;
						break;
					}
					/* Frame types err, finding HEAD 0xAA again */
					if( m_frameType == NULL_TYPE ) {
						qDebug() << "m_serial->NULL_TYPE();";

						continue;
					}
				}
			}
			if (!found0xAA) m_recv.clear();
		} else {
			/* finded HEAD 0xAA */
			QByteArray bf = m_recv.left(FRAMETPYES_LEN);
			if(bf.at(FRAMETPYES_LEN - 1) == CAR_INFO_TYPE) {
				m_frameType = CAR_INFO_TYPE;
				qDebug() << "m_serial->CAR_INFO_TYPE();";

				break;
			}

			if(bf.at(FRAMETPYES_LEN - 1) == MCU_UPDATA_TYPE) {
				m_frameType = MCU_UPDATA_TYPE;
				qDebug() << "m_serial->MCU_UPDATA_TYPE();";

				break;
			}
			/* Frame types err, finding HEAD 0xAA again */
			if( m_frameType == NULL_TYPE ) {
				m_recv.remove(0, 1);
				qDebug() << "m_serial->NULL_TYPE();";
				qDebug() << "m_framType :" << m_frameType;
				continue;
			}
		}
	}

	if( m_frameType == CAR_INFO_TYPE ) {
		if( m_recv.length() >= (int)sizeof(DownFrame) ) {
			/* deal Frame tail */
			if ((uint8_t)0x55 != (uint8_t)m_recv[DOWNFRAME_BYTELEN-1]) {
				/* Frame tail err, finding HEAD 0xAA again */
				m_recv.remove(0, 1);
				m_frameType = NULL_TYPE;
			}
			else {
				/* Frame tail, all right */
				QByteArray bf = m_recv.left(DOWNFRAME_BYTELEN);
				m_recv.remove(0, DOWNFRAME_BYTELEN);
				DownFrame *downFrame = (DownFrame *)bf.data();

				/* check Frame crc */
				if (downFrame->crc == crc16Check((uint8_t *)(&(downFrame->carInfo)), sizeof(CarInfo)))
				{
					emit serialChanged(downFrame->carInfo);
					m_frameType = NULL_TYPE;
				}
			}
		}
	}

	if( m_frameType == MCU_UPDATA_TYPE ) {
		uint16_t frameDataLens = m_recv.at(FRAMELENS_LEN - 1);
		uint16_t frameTotalLens = frameDataLens + 4;

		if( m_recv.length() >= (int)frameDataLens + 4 ) {
			/* deal Frame tail */
			if ((uint8_t)0x55 != (uint8_t)m_recv[frameTotalLens-1]) {
				/* Frame tail err, finding HEAD 0xAA again */
				m_recv.remove(0, 1);
				m_frameType = NULL_TYPE;
			}
			else {
				/* Frame tail, all right */
				QByteArray bf = m_recv.left(frameTotalLens);
				m_recv.remove(0, frameTotalLens);
				emit mcuUpdataChanged(bf);
				m_frameType = NULL_TYPE;
				qDebug() << "MCU_UPDATA_TYPE";
			}
		}
	}

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
