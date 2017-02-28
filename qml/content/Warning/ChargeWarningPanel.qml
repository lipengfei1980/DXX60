import QtQuick 2.3

Item {
	id: chargeWarningPanel

	Image {
		id: chargeLineText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 557 : 201
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/chargeLineText.png"
	}
}
