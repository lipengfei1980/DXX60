import QtQuick 2.3

Item {
	id: chargerHotWarningPanel

	Image {
		id: chargerHotText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 570 : 214
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/chargerHotText.png"
	}
}
