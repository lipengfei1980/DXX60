import QtQuick 2.3

Item {
	id: keyPowerOnWarningPanel
	x:(CarStatus.dashboardStatus == "dormancyPanel") ? 356 : 0

	Image {
		id: keyPowerOnText
		x: 163
		y: 107
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/keyPowerOnText.png"
	}
	Image {
		id: key
		x: 198
		y: 227
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/key.png"
		ParallelAnimation{
			running: true
			NumberAnimation {targets: key;properties: "x";duration: 500; from:198; to:233;}
			NumberAnimation {targets: key;properties: "y";duration: 500; from:227; to:192;}
			loops: Animation.Infinite
		}
	}
}
