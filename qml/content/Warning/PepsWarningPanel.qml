import QtQuick 2.3

Item {
	id: pepsWarningPanel

	Image {
		id: pepsText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 581 : 225
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/pepsText.png"
	}
}
