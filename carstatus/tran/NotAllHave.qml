import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "Not All Car Have"
	Column {
        spacing: 2
		Row {
			Text {
				text: "carTemp: "
			}
			TextField {
				id: carTemp
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.carTemp = text * 1
			}
		}
		Row {
			Text {
				text: "outsideTemp: "
			}
			TextField {
				id: outsideTemp
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.outsideTemp = text * 1
			}
		}
		Row {
			Text {
				text: "chargeCurrent: "
			}
			TextField {
				id: chargeCurrent
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.chargeCurrent = text * 1
			}
		}
		Row {
			Text {
				text: "batteryErr(0,1,2): "
			}
			TextField {
				id: batteryErr
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.batteryErr = text * 1
			}
		}
		Row {
			Text {
				text: "batteryLow(0,1,2): "
			}
			TextField {
				id: batteryLow
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.batteryLow = text * 1
			}
        }
        Row {
            Text {
				text: "insulation(0,1,2): "
            }
            TextField {
				id: insulation
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.insulation = text * 1
            }
        }
        Row {
            Text {
				text: "soc(0-254): "
            }
            TextField {
				id: soc
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.soc = text * 1
            }
        }
        Row {
            Text {
				text: "energyConsumption: "
            }
            TextField {
				id: energyConsumption
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.energyConsumption = text * 1
            }
        }
        Row {
            Text {
				text: "overSpeed(0-200): "
            }
            TextField {
				id: overSpeed
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.overSpeed = text * 1
            }
		}
		Row {
            Text {
				text: "lfTP(0-7): "
            }
            TextField {
				id: lfTP
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.lfTP = text * 1
            }
			Text {
				text: "lfTT: "
			}
			TextField {
				id: lfTT
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.lfTT = text * 1
			}
        }
        Row {
            Text {
				text: "rfTP(0-7): "
            }
            TextField {
				id: rfTP
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.rfTP = text * 1
            }
			Text {
				text: "rfTT: "
			}
			TextField {
				id: rfTT
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.rfTT = text * 1
			}
        }
        Row {
            Text {
				text: "lrTP(0-7): "
            }
            TextField {
				id: lrTP
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.lrTP = text * 1
            }
			Text {
				text: "lrTT: "
			}
			TextField {
				id: lrTT
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.lrTT = text * 1
			}
        }
        Row {
            Text {
				text: "rrTP(0-7): "
            }
            TextField {
				id: rrTP
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.rrTP = text * 1
            }
			Text {
				text: "rrTT: "
			}
			TextField {
				id: rrTT
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.rrTT = text * 1
			}
        }
        Row {
            Text {
				text: "lfTPStatus: "
            }
            TextField {
				id: lfTPStatus
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.lfTPStatus = text * 1
            }
			Text {
				text: "lrTPStatus: "
			}
			TextField {
				id: lrTPStatus
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.lrTPStatus = text * 1
			}
        }
        Row {
            Text {
				text: "rfTPStatus: "
            }
            TextField {
				id: rfTPStatus
                Component.onCompleted: text = 0
				onTextChanged: SerialTran.rfTPStatus = text * 1
            }
			Text {
				text: "rrTPStatus: "
			}
			TextField {
				id: rrTPStatus
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.rrTPStatus = text * 1
			}
		}
		Row {
			Text {
				text: "pepsPowerStatus(0-3): "
			}
			TextField {
				id: pepsPowerStatus
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.pepsPowerStatus = text * 1
			}
		}
		Row {
			Text {
				text: "radarTest(0-3): "
			}
			TextField {
				id: radarTest
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.radarTest = text * 1
			}
		}
		Row {
			Text {
				text: "radarDistance(0-3): "
			}
			TextField {
				id: radarDistance
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.radarDistance = text * 1
			}
		}
		Row {
			Text {
				text: "McuVersion(0-4): "
			}
			TextField {
				id: mcuVer1
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.mcuVer1 = text * 1
			}
			TextField {
				id: mcuVer2
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.mcuVer2 = text * 1
			}
			TextField {
				id: mcuVer3
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.mcuVer3 = text * 1
			}
		}
		Row {
			Text {
				text: "seconds: "
			}
			TextField {
				id: seconds
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.seconds = text * 1
			}
		}
		Row {
			Text {
				text: "pControllerErr: "
			}
			TextField {
				id: pControllerErr
				Component.onCompleted: text = 0
				onTextChanged: SerialTran.pControllerErr = text * 1
			}
		}
		Row {
			spacing: 50
			CheckBox {
				text: "epsErrLight"
				onClicked: SerialTran.epsErrLight = checked
			}
			CheckBox {
				text: "pushPowerOnText"
				onClicked: SerialTran.pushPowerOnText = checked
			}
		}
		Row{
			spacing: 50
			CheckBox {
				text: "waterTempLight"
				onClicked: SerialTran.waterTempLight = checked
			}
			CheckBox {
				text: "takePgear"
				onClicked: SerialTran.takePgear = checked
			}
		}
		Row{
			spacing: 50
			CheckBox {
				text: "airBagLight"
				onClicked: SerialTran.airBagLight = checked
			}
			CheckBox {
				text: "wavCharging"
				onClicked: SerialTran.sysLose = checked
			}
		}
        CheckBox {
			text: "dcdcErrLight"
			onClicked: SerialTran.dcdcErrLight = checked
        }
        CheckBox {
			text: "batteryCutoff"
			onClicked: SerialTran.batteryCutoff = checked
        }
        CheckBox {
			text: "mainSeatbelt"
			onClicked: SerialTran.mainSeatbelt = checked
        }
        CheckBox {
			text: "copilotSeatbelt"
			onClicked: SerialTran.copilotSeatbelt = checked
        }
        CheckBox {
			text: "pepsKeyLight"
			onClicked: SerialTran.pepsKeyLight = checked
        }
        CheckBox {
			text: "meterHotLight"
			onClicked: SerialTran.meterHotLight = checked
        }
        CheckBox {
			text: "tirePressLight"
			onClicked: SerialTran.tirePressLight = checked
        }
        CheckBox {
			text: "chargeLine"
			onClicked: SerialTran.chargeLine = checked
        }
        CheckBox {
			text: "chargeLight"
			onClicked: SerialTran.chargeLight = checked
		}
        CheckBox {
			text: "ready"
			onClicked: SerialTran.ready = checked
        }
        CheckBox {
			text: "ebdLight"
			onClicked: SerialTran.ebdLight = checked
        }
        CheckBox {
			text: "absLight"
			onClicked: SerialTran.absLight = checked
        }
		CheckBox {
			text: "sysErr"
			onClicked: SerialTran.sysErr = checked
		}
		CheckBox {
			text: "limitedPower"
			onClicked: SerialTran.limitedPower = checked
		}
		CheckBox {
			text: "lfTPlow"
			onClicked: SerialTran.lfTPlow = checked
		}
		CheckBox {
			text: "rfTPlow"
			onClicked: SerialTran.rfTPlow = checked
		}
		CheckBox {
			text: "lrTPlow"
			onClicked: SerialTran.lrTPlow = checked
		}
		CheckBox {
			text: "rrTPlow"
			onClicked: SerialTran.rrTPlow = checked
		}
		CheckBox {
			text: "lfTTStatus"
			onClicked: SerialTran.lfTTStatus = checked
		}
		CheckBox {
			text: "rfTTStatus"
			onClicked: SerialTran.rfTTStatus = checked
		}
		CheckBox {
			text: "lrTTStatus"
			onClicked: SerialTran.lrTTStatus = checked
		}
		CheckBox {
			text: "rrTTStatus"
			onClicked: SerialTran.rrTTStatus = checked
		}
	}
}
