import QtQuick 2.3

Item {
	id: overSpeedWarningPanel
	Item
	{
		id:overspeed
		visible: true
		Image {
			id: overSpeedIcon
			x: 213
			y: 201
			opacity: 1.0
			source: "qrc:/warningPanel/images/warningPanel/overspeedBg.png"
		}
		Image {
			id: speed140
			x: 266
			y: 238
			visible: CarStatus.overSpeed === 140
			source: "qrc:/warningPanel/images/warningPanel/140.png"
		}
		Image {
			id: speed130
			x: 266
			y: 238
			visible: CarStatus.overSpeed === 130
			source: "qrc:/warningPanel/images/warningPanel/130.png"
		}
		Image {
			id: speed120
			x: 266
			y: 238
			visible: CarStatus.overSpeed === 120
			source: "qrc:/warningPanel/images/warningPanel/120.png"
		}
		Image {
			id: speed110
			x: 270
			y: 238
			visible: CarStatus.overSpeed === 110
			source: "qrc:/warningPanel/images/warningPanel/110.png"
		}
		Image {
			id: speed100
			x: 266
			y: 238
			visible: CarStatus.overSpeed === 100
			source: "qrc:/warningPanel/images/warningPanel/100.png"
		}
		Image {
			id: speed90
			x: 274
			y: 238
			visible: CarStatus.overSpeed === 90
			source: "qrc:/warningPanel/images/warningPanel/90.png"
		}
		Image {
			id: speed80
			x: 274
			y: 238
			visible: CarStatus.overSpeed === 80
			source: "qrc:/warningPanel/images/warningPanel/80.png"
		}
		Image {
			id: speed70
			x: 274
			y: 238
			visible: CarStatus.overSpeed === 70
			source: "qrc:/warningPanel/images/warningPanel/70.png"
		}
		Image {
			id: speed60
			x: 274
			y: 238
			visible: CarStatus.overSpeed === 60
			source: "qrc:/warningPanel/images/warningPanel/60.png"
		}
		property bool overSpeedValue: CarStatus.overSpeedWarning
		onOverSpeedValueChanged: {
			if(overSpeedValue){
				flicker.running = true;
				overspeed.visible = true;
			}
			else {
				flicker.running = false;
				overspeed.visible = true;
			}
		}
		Timer {
			id: flicker
			interval: 1000
			running: false
			repeat: true
			onTriggered: {
				overspeed.visible = !overspeed.visible;
			}
		}
	}
	Image {
		id: overSpeed
		x: 227
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/overSpeedText.png"
	}
}
