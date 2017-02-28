import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "All Car Have"
	Column {
		spacing: 2
		Row {
			Text {
				text: "speed: "
			}
			TextField {
				id: speed
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.speed =  text * 1
			}
		}
		Row {
			Text {
				text: "ignOnMusic: "
			}
			TextField {
				id: ignOnMusic
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.ignOnMusic =  text * 1
			}
		}
        Row {
            Text {
				text: "rpm: "
            }
            TextField {
				id: rpm
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.rpm = text * 1
            }
        }
		Row {
			Text {
				text: "odo: "
			}
			TextField {
                id: odo
				Component.onCompleted: text = 0
                onTextChanged: SerialTran.odo = text * 1
			}
		}
		Row {
			Text {
				text: "gear: "
			}
			TextField {
                id: gear
				Component.onCompleted: text = 0
                onTextChanged: SerialTran.gear = text * 1
			}
		}
		Row {
			Text {
				text: "trip: "
			}
			TextField {
				id: trip
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.trip = text * 1
			}
		}
		Row {
			Text {
				text: "waterTemp: "
			}
			TextField {
				id: waterTemp
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.waterTemp = text * 1
			}
		}
        Row {
            Text {
				text: "powerMeter: "
            }
            TextField {
				id: powerMeter
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.powerMeter = text * 1
            }
        }
        Row {
            Text {
				text: "mileage: "
            }
            TextField {
				id: mileage
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.mileage = text * 1
            }
        }
		Row {
			Text {
				text: "dateTime: "
			}
			TextField {
				id: dateTime
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.dateTime = text * 1
			}
		}
		Row {
			Text {
				text: "lcdNightLight: "
			}
			TextField {
				id: lcdNightLight
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.lcdNightLight = text * 1
			}
		}
		Row {
			Text {
				text: "theme: "
			}
			TextField {
				id: theme
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.theme = text * 1
			}
		}
		Row {
			Text {
				text: "lcdLight: "
			}
			TextField {
				id: lcdLight
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.lcdLight = text * 1
			}
		}
        CheckBox {
			text: "powerStatus"
			onClicked: SerialTran.powerStatus = checked
        }
		CheckBox {
			text: "leftFrontDoor"
			onClicked: SerialTran.leftFrontDoor = checked
		}
		CheckBox {
			text: "leftRearDoor"
			onClicked: SerialTran.leftRearDoor = checked
		}
		CheckBox {
			text: "rightFrontDoor"
			onClicked: SerialTran.rightFrontDoor = checked
		}
		CheckBox {
			text: "rightRearDoor"
			onClicked: SerialTran.rightRearDoor = checked
		}
		CheckBox {
			text: "hoodDoor"
			onClicked: SerialTran.hoodDoor = checked
		}
		CheckBox {
			text: "trunkDoor"
			onClicked: SerialTran.trunkDoor = checked
		}
		CheckBox {
			text: "lowBeam"
			onClicked: SerialTran.lowBeam = checked
		}
		CheckBox {
			text: "highBeam"
			onClicked: SerialTran.highBeam = checked
		}
		CheckBox {
			text: "okBtn"
			onClicked: SerialTran.okBtn = checked
		}
		CheckBox {
			text: "leftSignal"
			onClicked: SerialTran.leftSignal = checked
		}
		CheckBox {
			text: "rightSignal"
			onClicked: SerialTran.rightSignal = checked
		}
		CheckBox {
			text: "backFogLight"
			onClicked: SerialTran.backFogLight = checked
		}
		CheckBox {
			text: "frontFogLight"
			onClicked: SerialTran.frontFogLight = checked
		}
		CheckBox {
			text: "lowBeamText"
			onClicked: SerialTran.lowBeamText = checked
		}
		CheckBox {
			text: "overSpeedWarning"
			onClicked: SerialTran.overSpeedWarning = checked
		}
		CheckBox {
			text: "vacuumPumpText"
			onClicked: SerialTran.vacuumPumpText = checked
		}
		CheckBox {
			text: "handbrakeText"
			onClicked: SerialTran.handbrakeText = checked
		}
		CheckBox {
			text: "waterPumpText"
			onClicked: SerialTran.waterPumpText = checked
		}
		CheckBox {
			text: "chargerHotText"
			onClicked: SerialTran.chargerHotText = checked
		}
		CheckBox {
			text: "chargeLineText"
			onClicked: SerialTran.chargeLineText = checked
		}
		CheckBox {
			text: "powerOnText"
			onClicked: SerialTran.powerOnText = checked
		}
		CheckBox {
			text: "esclText"
			onClicked: SerialTran.esclText = checked
		}
		CheckBox {
			text: "pepsText"
			onClicked: SerialTran.pepsText = checked
		}
		CheckBox {
			text: "keyPowerLowText"
			onClicked: SerialTran.keyPowerLowText = checked
		}
		CheckBox {
			text: "missKetText"
			onClicked: SerialTran.missKetText = checked
		}
		CheckBox {
			text: "keyOutsideText"
			onClicked: SerialTran.keyOutsideText = checked
		}
		CheckBox {
			text: "keyPowerOnText"
			onClicked: SerialTran.keyPowerOnText = checked
		}
	}
}
