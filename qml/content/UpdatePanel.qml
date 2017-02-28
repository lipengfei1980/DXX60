import QtQuick 2.3
import QtQml 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Item {
	id: updatePanel
	x:240
	y:-29

	property bool animationFinised: false
	property string value: CarStatus.updataProgress


	onValueChanged: {
		bar.value = CarStatus.updataProgress
	}

	Image {
		id: background
		opacity:0.0
		source: "qrc:/updatePanel/images/updatePanel/background.png"
	}

	Column {
		id: prograssBar

		anchors.horizontalCenter: background.horizontalCenter
		anchors.verticalCenter: background.verticalCenter
		spacing: 6

		opacity: 0.0
		scale: 0.0

		Text {
			id: types
			width: bar.width
			horizontalAlignment: Text.AlignHCenter
			font.pixelSize: 24
			font.family: FontName.fontCurrentMicroSoftYahei
			color: "steelblue"
			text: qsTr(CarStatus.updataTypes)
		}

		ProgressBar {
			id: bar
			minimumValue: 0
			maximumValue: 100
			style: ProgressBarStyle {
				background: Rectangle {
					opacity: 1
					radius: 20
					gradient: Gradient {
						GradientStop { position: 0.0; color: "gray" }
						GradientStop { position: 0.1; color: "gray" }
						GradientStop { position: 0.4; color: "lightgray" }
						GradientStop { position: 0.7; color: "gray" }
						GradientStop { position: 1.0; color: "gray" }
					}
					implicitWidth: 300
					implicitHeight: 28
				}
				progress: Rectangle {
					radius: 20
					gradient: Gradient {
						GradientStop { position: 0.0; color: "blue" }
						GradientStop { position: 0.1; color: "steelblue" }
						GradientStop { position: 0.4; color: "lightsteelblue" }
						GradientStop { position: 0.7; color: "steelblue" }
						GradientStop { position: 1.0; color: "blue" }
					}
				}
			}
		}
		Text {
			id: ver
			width: bar.width
			horizontalAlignment: Text.AlignHCenter
			font.pixelSize: 24
			font.family: FontName.fontCurrentMicroSoftYahei
			color: "steelblue"
			text: qsTr(CarStatus.updataVer)
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: background; opacity: 0.0 }
			PropertyChanges { target: prograssBar; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: background; opacity: 1.0 }
			PropertyChanges { target: prograssBar; opacity: 1.0 }

		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation {
				ScriptAction { script: { CarStatus.active = false; updatePanel.animationFinised = false; } }
				NumberAnimation { target: prograssBar; property: "opacity"; from: 0.0; to: 1.0; }
				ParallelAnimation {
					NumberAnimation { target: background; property: "opacity"; from: 0.0; to: 1.0; duration: 1000 }
					NumberAnimation { target: prograssBar; property: "scale"; from: 0.0; to: 1.0; duration: 1000 }
				}
				ScriptAction { script: { CarStatus.active = true; updatePanel.animationFinised = true; } }
			}
		},
		Transition {
			from: "show"
			to:""
			SequentialAnimation {
				ScriptAction { script: { CarStatus.active = false; updatePanel.animationFinised = true; } }
				ParallelAnimation {
					NumberAnimation { target: prograssBar; property: "scale"; from: 1.0; to: 0.0; duration: 1000 }
					NumberAnimation { target: background; property: "opacity"; from: 1.0; to: 0.0; duration: 1000 }
				}
				NumberAnimation { target: prograssBar; property: "opacity"; from: 1.0; to: 0.0; }
				ScriptAction { script: { CarStatus.active = true } }
				PauseAnimation { duration: 200 }
				ScriptAction { script: { updatePanel.animationFinised = false } }
			}
		}
	]
}
