import QtQuick 2.3

Item {
	id: pushPowerWarningPanel

	Image {
		id: pushPowerOnText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 558 : 202
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/pushPowerOnText.png"
	}
}
