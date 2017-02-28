import QtQuick 2.3

Item {
	id: dormancyPanel

	state: ""
	opacity: 0.0

	property bool loaderVisible: dormancyPanel.parent.visible
	onLoaderVisibleChanged: {
		if(loaderVisible)
			dormancyPanel.state = "show";
		else
			dormancyPanel.state = "";
	}


	Image {
		id: lowBeam
		x: 334 -30
		y: 21
		visible: CarStatus.lowBeam
		source: "qrc:/indicatorLamp/images/indicatorLamp/lowBeam.png"
	}

	Image {
		id: highBeam
		x: 386 -30
		y: 21
		visible: CarStatus.highBeam
		source: "qrc:/indicatorLamp/images/indicatorLamp/highBeam.png"
	}

	Image {
		id: pepsKeyLight
		x: 70 -30
		y: 180
		visible: CarStatus.pepsKeyLight
		source: "qrc:/indicatorLamp/images/indicatorLamp/pepsKeyLight.png"
	}

	Image {
		id: leftSignal
		x: 467 -30
		y: 16
		visible: CarStatus.leftSignal
		source: "qrc:/indicatorLamp/images/indicatorLamp/leftSignal.png"
	}

	Image {
		id: rightSignal
		x: 789 + 25
		y: 16
		visible: CarStatus.rightSignal
		source: "qrc:/indicatorLamp/images/indicatorLamp/rightSignal.png"
	}

	Image {
		id: cardoor
		x: 1053 + 25
		y: 16
		visible: CarStatus.anyDoor
		source: "qrc:/indicatorLamp/images/indicatorLamp/cardoor.png"
	}

	WarningPanel{
		id:warningPanel
		state: dormancyPanel.state
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: dormancyPanel; opacity: 0.0}
		},
		State {
			name: "show"
			PropertyChanges { target: dormancyPanel; opacity: 1.0}
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			ScriptAction{script: {CarStatus.active = false;}}
		}
	]
}
