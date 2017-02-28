import QtQuick 2.3

Item {
	id: cardoorWarningPanel
	x:-15
	y:15
	Image {
		id: car
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 620 : 264
		y: 83
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/carDoor.png"
	}
	Image {
		id: rrDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 691 : 335
		y: 184
		visible:CarStatus.rightRearDoor
		source: "qrc:/warningPanel/images/warningPanel/rrdoor.png"
	}
	Image {
		id: rfDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 691 : 335
		y: 143
		visible:CarStatus.rightFrontDoor
		source: "qrc:/warningPanel/images/warningPanel/rfdoor.png"
	}
	Image {
		id: lrDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 609 : 253
		y: 184
		visible:CarStatus.leftRearDoor
		source: "qrc:/warningPanel/images/warningPanel/lrdoor.png"
	}
	Image {
		id: lfDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 609 : 253
		y: 143
		visible:CarStatus.leftFrontDoor
		source: "qrc:/warningPanel/images/warningPanel/lfdoor.png"
	}
	Image {
		id: hoodDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 632 : 276
		y: 88
		visible:CarStatus.hoodDoor
		source: "qrc:/warningPanel/images/warningPanel/hoodDoor.png"
	}
	Image {
		id: trunkDoor
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 636 : 280
		y: 244
		visible:CarStatus.trunkDoor
		source: "qrc:/warningPanel/images/warningPanel/trunkDoor.png"
	}
}
