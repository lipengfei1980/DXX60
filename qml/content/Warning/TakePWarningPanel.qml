import QtQuick 2.3

Item {
	id: takePWarningPanel

	Image {
		id: takePgear
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 541 : 185
		y: 107
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/takePgear.png"
	}
}
