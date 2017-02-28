import QtQuick 2.3

Item {
	id: seatbeltWarningPanel

	Image {
		id: seatbelt
		x: 223
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/Seatbelt.png"
	}
	Image {
		id: point
		x: 288
		y: 223
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/warningPoint.png"
		ParallelAnimation{
			running: true
			NumberAnimation {targets: point;properties: "x";duration: 500; from:288; to:259;}
			NumberAnimation {targets: point;properties: "y";duration: 500; from:223; to:246;}
			loops: Animation.Infinite
		}
	}
}
