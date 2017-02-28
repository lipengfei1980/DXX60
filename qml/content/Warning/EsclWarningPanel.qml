import QtQuick 2.3

Item {
	id: esclWarningPanel

	Image {
		id: esclText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 581 : 225
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/esclText.png"
	}
}
