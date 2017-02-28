import QtQuick 2.3

Item {
	id: keyOutsideWarningPanel

	Image {
		id: keyOutsideText
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 570 : 216
		y: 153
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/keyOutsideText.png"
	}
}
