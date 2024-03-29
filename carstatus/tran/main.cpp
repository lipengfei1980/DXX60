#include <QDebug>
#include <QTimer>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>

#include <tran.h>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QCommandLineParser parser;
	QCommandLineOption serialOption(QStringList() << "s" << "serial port device name", "specify serial port device", "serial", "ttyS2");
	parser.addOption(serialOption);
	parser.process(app);

	QString serial = "ttyS2";
	if (parser.isSet(serialOption))
		serial = parser.value(serialOption);

	SerialTran serialTran(serial);

	QQuickView viewer;
	viewer.rootContext()->setContextProperty("SerialTran", &serialTran);

	viewer.setSource(QUrl("qrc:///main.qml"));
	viewer.show();

	return app.exec();
}
