#include <QDebug>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>

#include <htcarstatus.h>

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

	HtCarStatus htCarStatus(serial);

	QQuickView viewer;
	viewer.rootContext()->setContextProperty("HtCarStatus", &htCarStatus);

	viewer.setSource(QUrl("qrc:///main.qml"));
	viewer.show();

	return app.exec();
}
