#include <wait.h>
#include <unistd.h>
#include <signal.h>

#include <QtQml>

#include <QTime>
#include <QFile>
#include <QtDebug>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QTextStream>
#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>

#include <carstatus.h>
#include <fontName.h>

static pid_t pid;
static bool exit_loop = true;

static void signal_handler(int signo)
{
	if (signo == SIGINT)
		qDebug() << "main receive signal: SIGINT\n";
	if (signo == SIGTERM)
		qDebug() << "main receive signal: SIGTERM\n";

	if (kill(pid, SIGTERM) < 0)
		qDebug() << "main kill server fail\n";

	exit_loop = false;
}

#ifdef DEBUG_INFO_TO_FILE
QString msgBuffer;
#define  TIME_STAMP  QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss:zzz")

void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
	Q_UNUSED(context);

	QString txt;
	switch (type) {
	case QtDebugMsg:
		txt = QString("Debug: %1; stamp:%2\n").arg(msg).arg(TIME_STAMP);
		break;
	case QtWarningMsg:
		txt = QString("Warning: %1; stamp:%2\n").arg(msg).arg(TIME_STAMP);
		break;
	case QtCriticalMsg:
		txt = QString("Critical: %1; stamp:%2\n").arg(msg).arg(TIME_STAMP);
		break;
	case QtFatalMsg:
		txt = QString("Fatal: %1; stamp:%2\n").arg(msg).arg(TIME_STAMP);
		abort();
	}

	msgBuffer.append(txt);
	if (msgBuffer.length() > 500) {

		QFile outFile("/var/HuaTai/huatai.log");
		outFile.open(QIODevice::WriteOnly | QIODevice::Append);

		QTextStream ts(&outFile);
		ts << msgBuffer;

		msgBuffer.clear();
	}
}
#endif

int server_main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);
#ifdef DEBUG_INFO_TO_FILE
	qInstallMessageHandler(customMessageHandler);
#endif

	QCommandLineParser parser;
	QCommandLineOption serialOption(QStringList() << "s" << "serial port device name", "specify serial port device", "serial", "ttyS2");
	parser.addOption(serialOption);
	parser.process(app);

	QString serial = "ttymxc1";
	if (parser.isSet(serialOption))
		serial = parser.value(serialOption);

	MFontName fontName;
	CarStatus carStatus(serial);

	QQuickView viewer;
	viewer.rootContext()->setContextProperty("CarStatus", &carStatus);
	viewer.rootContext()->setContextProperty("FontName", &fontName);
	viewer.setSource(QUrl("qrc:/qml/qml/mainViewer.qml"));
	qmlRegisterType<CarStatus>("Carstatus", 1, 0, "Carstatus");
	app.connect(viewer.engine(),&QQmlEngine::quit, &QGuiApplication::quit);
	viewer.show();

	return app.exec();
}

int main(int argc, char **argv)
{
	if (signal(SIGINT, signal_handler) == SIG_ERR ||
			signal(SIGTERM, signal_handler) == SIG_ERR) {
		qDebug() << "main process register signal handler fail\n";
		return 0;
	}

	do {
		qDebug() << "main start fork server\n";
		pid = fork();
		if (pid == 0) {
			if (signal(SIGINT, SIG_DFL) == SIG_ERR ||
					signal(SIGTERM, SIG_DFL) == SIG_ERR) {
				qDebug() << "server process register signal handler fail\n";
				return 0;
			}
			return server_main(argc, argv);
		}
		else if (pid > 0) {
			int status;
			wait(&status);
			qDebug() << "server exit with status: " << status ;
		}
		else {
			qDebug() << "main fork server fail: " << pid ;
			break;
		}
	} while (exit_loop);

	return 0;
}
