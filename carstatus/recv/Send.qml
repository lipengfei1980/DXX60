import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "Settings"

	Column {
		spacing: 2

		CheckBox {
            text: "tripAClear"
            onClicked: HtCarStatus.tripAClear = checked
            Component.onCompleted: HtCarStatus.tripAClear = checked
		}
		CheckBox {
            text: "tripBClear"
            onClicked: HtCarStatus.tripBClear = checked
            Component.onCompleted: HtCarStatus.tripBClear = checked
		}
        CheckBox {
            text: "restoreFactory"
            onClicked: HtCarStatus.restoreFactory = checked
            Component.onCompleted: HtCarStatus.restoreFactory = checked
        }
		Row {
			Text {
				text: "rearviewMirrorStatus: "
			}
			TextField {
				id: rearviewMirrorStatus
				Component.onCompleted: text = 0
				onTextChanged: HtCarStatus.rearviewMirrorStatus = text * 1
			}
		}
		Row {
			Text {
				text: "timeFormatSet: "
			}
			TextField {
				id: timeFormatSet
				Component.onCompleted: text = 0
				onTextChanged: HtCarStatus.timeFormatSet = text * 1
			}
		}
		Row {
			Text {
				text: "dateTimeSet: "
			}
			TextField {
				id: dateTime
				Component.onCompleted: text = 0
				onTextChanged: HtCarStatus.dateTimeSet = text * 1
			}
		}
        Row {
            Text {
                text: "backLight: "
            }
            TextField {
                id: backLight
                Component.onCompleted: text = 0
                onTextChanged: HtCarStatus.backLight = text * 1
            }
        }
		Row {
			Text {
				text: "themeSet: "
			}
			TextField {
				id: themeSet
				Component.onCompleted: text = 0
				onTextChanged: HtCarStatus.themeSet = text * 1
			}
		}
        Row {
            Text {
                text: "overspeedWarning: "
            }
            TextField {
                id: overspeedWarning
                Component.onCompleted: text = 0
				onTextChanged: HtCarStatus.overspeedWarning = text * 1
            }
        }
		Button {
			text: "send"
			width: 100
			onClicked: HtCarStatus.sendUpFrame()
		}
	}
}
