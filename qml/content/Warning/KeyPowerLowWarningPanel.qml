import QtQuick 2.3

Item {
	id: keyPowerWarningPanel

	Image {
		id: keyPowerLowText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 585 : 229
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/keyPowerLowText.png"
	}
}
