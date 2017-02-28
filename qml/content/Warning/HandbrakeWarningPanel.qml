import QtQuick 2.3

Item {
	id: handbrakeWarningPanel

	Image {
		id: point
		x: 246
		y: 209
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/warningPoint.png"
		ParallelAnimation{
			running: true
			NumberAnimation {targets: point;properties: "x";duration: 500; from:246; to:230;}
			NumberAnimation {targets: point;properties: "y";duration: 500; from:209; to:227;}
			loops: Animation.Infinite
		}
	}
	Image {
		id: handBrake
		x: 228
		y: 108
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/handBrake.png"
	}
}
