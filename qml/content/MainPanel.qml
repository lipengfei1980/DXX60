import QtQuick 2.3

Item {
	id: mainPanel

	Image {
		id: bg
		x: 0
		y: 0
		opacity: 0.0
		source: {
			if(CarStatus.theme === 0 || CarStatus.theme === 1)
				return "qrc:/common/images/common/bg.png";
			else if(CarStatus.theme === 2)
				return "qrc:/theme2/images/theme2/common/bg.png";
			else if(CarStatus.theme === 3)
				return "qrc:/theme3/images/theme3/common/bg.png";
		}

	}

	LeftPanel {//2.5 + 1s
		id: leftPanel
		state: mainPanel.state
	}

	RightPanel {//2.5 + 1 + 0.5s
		id: rightPanel
		state: mainPanel.state
	}

	CentralPanel {//2.5 + 1s
		id: centralPanel
		state: mainPanel.state
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: bg; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: bg; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				PauseAnimation {duration: 500}
				ScriptAction{script: {CarStatus.active = false;}}
				NumberAnimation {target: bg; property: "opacity"; duration:500; }
				PauseAnimation {duration: 3000}
				ScriptAction{script: {CarStatus.active = true;}}
			}
		}
	]
}
