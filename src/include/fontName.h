#include <QFile>
#include <unistd.h>
#include <QDebug>
#include <QObject>
#include <QFontDatabase>

class MFontName : public QObject
{
	Q_OBJECT
	Q_ENUMS(TIPSREC)

	Q_PROPERTY(QString fontCurrentMicroSoftYahei READ fontCurrentMicroSoftYahei NOTIFY fontCurrentMicroSoftYaheiChanged)
	Q_PROPERTY(QString fontCurrentBombardier READ fontCurrentBombardier NOTIFY fontCurrentBombardierChanged)
	Q_PROPERTY(QString fontCurrentOutlines READ fontCurrentOutlines NOTIFY fontCurrentOutlinesChanged)
	Q_PROPERTY(QString fontCurrentIMPACT READ fontCurrentIMPACT NOTIFY fontCurrentIMPACTChanged)
	Q_PROPERTY(QString fontCurrentarial READ fontCurrentarial NOTIFY fontCurrentarialChanged)
	Q_PROPERTY(QString fontCurrentBebasNeue READ fontCurrentBebasNeue NOTIFY fontCurrentBebasNeueChanged)

signals:
	// fonts
	void fontCurrentMicroSoftYaheiChanged(QString);
	void fontCurrentBombardierChanged(QString);
	void fontCurrentOutlinesChanged(QString);
	void fontCurrentIMPACTChanged(QString);
	void fontCurrentarialChanged(QString);
	void fontCurrentBebasNeueChanged(QString);

public:
	enum TIPSREC{
		TIPS_SINGLE,
		TIPS_IMAGE,
		TIPS_DOUBLE,
		TIPS_TIRE
	};
	explicit MFontName(QObject *parent = 0)
		: QObject(parent)
	{
		m_fontCurrentMicroSoftYahei = loadFontFamilyFromTTF("/usr/lib/fonts/MicroSoftYahei.TTF");
		m_fontCurrentBombardier = loadFontFamilyFromTTF("/usr/lib/fonts/Bombardier.ttf");
		m_fontCurrentOutlines = loadFontFamilyFromTTF("/usr/lib/fonts/Outlines.TTF");
		m_fontCurrentIMPACT = loadFontFamilyFromTTF("/usr/lib/fonts/IMPACT.TTF");
		m_fontCurrentarial = loadFontFamilyFromTTF("/usr/lib/fonts/arial.ttf");
		m_fontCurrentBebasNeue = loadFontFamilyFromTTF("/usr/lib/fonts/BebasNeue.otf");
	}

	QString loadFontFamilyFromTTF(QString str)
	{
		static QString font;
		QFile fontFile(str);
		if(!fontFile.open(QIODevice::ReadOnly)) {
			qWarning() << "font file load fail";
			return QString();
		}
		int loadedFontID = QFontDatabase::addApplicationFontFromData(fontFile.readAll());
		QStringList loadedFontFamilies = QFontDatabase::applicationFontFamilies(loadedFontID);
		if(!loadedFontFamilies.empty())
			font = loadedFontFamilies.at(0);

		fontFile.close();
		return font;
	}

	// fonts
	QString fontCurrentMicroSoftYahei()const { return m_fontCurrentMicroSoftYahei; }
	QString fontCurrentBombardier()const { return m_fontCurrentBombardier; }
	QString fontCurrentOutlines()const { return m_fontCurrentOutlines; }
	QString fontCurrentIMPACT()const { return m_fontCurrentIMPACT; }
	QString fontCurrentarial()const { return m_fontCurrentarial; }
	QString fontCurrentBebasNeue()const { return m_fontCurrentBebasNeue; }

private:
	QString m_fontCurrentMicroSoftYahei;
	QString m_fontCurrentBombardier;
	QString m_fontCurrentOutlines;
	QString m_fontCurrentIMPACT;
	QString m_fontCurrentarial;
	QString m_fontCurrentBebasNeue;
};
