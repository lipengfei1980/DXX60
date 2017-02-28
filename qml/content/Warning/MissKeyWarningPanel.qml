import QtQuick 2.3

Item {
	id: missKeyWarningPanel

	Image {
		id: missKeyText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 570 : 214
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/missKetText.png"
	}
}
