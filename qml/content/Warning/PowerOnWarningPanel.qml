import QtQuick 2.3

Item {
	id: powerOnWarningPanel

	Image {
		id: powerOnText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 497 : 141
		y: 105
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/powerOnText.png"
	}
}
