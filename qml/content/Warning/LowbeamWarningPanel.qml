import QtQuick 2.3

Item {
	id: lowbeamWarningPanel

	Image {
		id: carBeam
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 574 : 218
		y: 134
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/lowBeam.png"
		Timer {
			id: flicker
			interval: 500
			running: true
			repeat: true
			onTriggered: {
				carBeam.visible = !carBeam.visible
			}
			onRunningChanged: {
				if(running === false)
					carBeam.visible = true;
			}
		}
	}
	Image {
		id: car
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 597 : 241
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/car.png"
	}
}
