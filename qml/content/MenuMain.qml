import QtQuick 2.3

Item {
	id: menuMain

	Item {
		id: rightFrontLine
		opacity: 0.0
		x: 1119
		y: 231
		width: 1
		height: 0
		clip: true
		Image {
			id: rightfront
			x: 889 - rightFrontLine.x
			y: 95 - rightFrontLine.y
			opacity: 1.0
			source: "qrc:/rightPanel/images/rightPanel/rightFrontLine.png"
		}
	}
	Item{
		id: leftRearLine
		opacity: 0.0
		x: 874
		y: 123
		width: 3
		height: 0
		clip: true
		Image {
			id: leftrear
			x: 876 - leftRearLine.x
			y: 114 - leftRearLine.y
			opacity: 1.0
			source: "qrc:/rightPanel/images/rightPanel/leftRearLine.png"
		}
	}

	Image {
		id: leftfront
		x: 997.5
		y: 181
		opacity: 0.0
		scale:0.0
		source: "qrc:/rightPanel/images/rightPanel/leftFrontLine.png"
	}
	Image {
		id: rightrear
		x: 997.5
		y: 181
		opacity: 0.0
		scale:0.0
		source: "qrc:/rightPanel/images/rightPanel/rightRearLine.png"
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: leftfront; opacity: 0.0; x: 997.5; y: 181; scale:0.0 }
			PropertyChanges { target: rightrear; opacity: 0.0; x: 997.5; y: 181; scale:0.0 }
			PropertyChanges { target: leftRearLine; opacity: 0.0; height: 0.0; width: 3 }
			PropertyChanges { target: rightFrontLine; opacity: 0.0; height: 0.0; x: 1119; y: 231; width:1.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: leftfront; opacity: 1.0; x: 871; y: 90; scale:1.0 }
			PropertyChanges { target: rightrear; opacity: 1.0; x: 1085; y: 223; scale:1.0 }
			PropertyChanges { target: leftRearLine; opacity: 1.0; height: 137; width: 220 }
			PropertyChanges { target: rightFrontLine; opacity: 1.0; height: 137; x: 901; y: 94; width:220 }		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				ScriptAction{script: {CarStatus.keyActive = false;}}
				ParallelAnimation{
					NumberAnimation {target: leftfront ;properties: "opacity, x, y, scale"; duration: 500;}
					NumberAnimation {target: rightrear ;properties: "opacity, x, y, scale"; duration: 500;}
				}

				ParallelAnimation {
					NumberAnimation {target: leftRearLine ;property: "opacity"; duration: 500;}
					NumberAnimation {target: rightFrontLine ;property: "opacity"; duration: 500;}
					SequentialAnimation {
						NumberAnimation {target: leftRearLine ;property: "height"; duration: 250;}
						NumberAnimation {target: leftRearLine ;property: "width"; duration: 250;}
					}
					SequentialAnimation {
						NumberAnimation {target: rightFrontLine ;properties: "y, height"; duration: 250;}
						NumberAnimation {target: rightFrontLine ;properties: "x, width"; duration: 250;}
					}
				}
				ScriptAction{script: {CarStatus.keyActive = true;}}
			}
		},
		Transition {
			from: "show"
			to: ""
			SequentialAnimation{
				ScriptAction{script: {CarStatus.keyActive = false;}}
				ParallelAnimation {
					NumberAnimation {target: leftRearLine ;property: "opacity"; duration: 500;}
					NumberAnimation {target: rightFrontLine ;property: "opacity"; duration: 500;}
					SequentialAnimation {
						NumberAnimation {target: leftRearLine ;property: "width"; duration: 250;}
						NumberAnimation {target: leftRearLine ;property: "height"; duration: 250;}
					}
					SequentialAnimation {
						NumberAnimation {target: rightFrontLine ;properties: "x, width"; duration: 250;}
						NumberAnimation {target: rightFrontLine ;properties: "y, height"; duration: 250;}
					}
				}
				ParallelAnimation{
					NumberAnimation {target: leftfront ;properties: "opacity, x, y, scale"; duration: 500;}
					NumberAnimation {target: rightrear ;properties: "opacity, x, y, scale"; duration: 500;}
				}
				ScriptAction{script: {CarStatus.keyActive = true;}}
			}
		}
	]
}
