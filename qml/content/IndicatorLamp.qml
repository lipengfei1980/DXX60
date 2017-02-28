import QtQuick 2.3

Item {
	id: indicatorLamp
	opacity: 0.0

	property bool carDoor: CarStatus.leftFrontDoor || CarStatus.leftRearDoor ||
						   CarStatus.rightRearDoor || CarStatus.rightFrontDoor ||
						   CarStatus.hoodDoor || CarStatus.trunkDoor
	property bool light: false

	Item{
		id: rightLightId
		x: 25
//		Image {
//			id: tirePressLight
//			x: 1193 + 10
//			y: 177
//			visible: light || (CarStatus.tirePressLight && ( (CarStatus.tpTemp && !CarStatus.ttLose) || CarStatus.tpLow || CarStatus.tpHigh || CarStatus.tpLeakage))
//			source: "qrc:/indicatorLamp/images/indicatorLamp/tirePressLight.png"
//		}
		Image {
			id: pControllerErr
			x: 1209
			y: 102
			visible: CarStatus.pControllerErr
			source: "qrc:/indicatorLamp/images/indicatorLamp/pControllerErr.png"

			property int pErrValue: CarStatus.pControllerErr
			onPErrValueChanged: {
				switch( pErrValue ) {
				case 1:
					flicker.running = true;
					pControllerErr.visible = true;
					break;
				case 2:
					flicker.running = false;
					pControllerErr.visible = true;
					break;
				default:
					flicker.running = false;
					pControllerErr.visible = false;
					break;
				}
			}
			Timer {
				id: flicker
				interval: 500
				running: false
				repeat: true
				onTriggered: {
					pControllerErr.visible = !pControllerErr.visible;
				}
			}
		}

		Image {
			id: limitedPower
			x: 1177
			y: 69
			visible: light || CarStatus.limitedPower
			source: "qrc:/indicatorLamp/images/indicatorLamp/limitedPower.png"
		}
		Image {
			id: meterHotLight
			x: 1147
			y: 32
			visible: light || CarStatus.meterHotLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/meterHotLight.png"
		}
		Image {
			id: sysErr
			x: 1093
			y: 27
			visible: light || CarStatus.sysErr
			source: "qrc:/indicatorLamp/images/indicatorLamp/sysErr.png"
		}
		Image {
			id: cardoor
			x: 1051
			y: 21
			visible: light || CarStatus.anyDoor
			source: "qrc:/indicatorLamp/images/indicatorLamp/cardoor.png"
		}
		Image {
			id: airBagLight
			x: 1003
			y: 23
			visible: light || CarStatus.airBagLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/airBagLight.png"
		}
		Image {
			id: copilotSeatbelt
			x: 955
			y: 22
			visible: light || CarStatus.copilotSeatbelt
			source: "qrc:/indicatorLamp/images/indicatorLamp/copilotSeatbelt.png"
		}
		Image {
			id: backFogLight
			x: 909
			y: 26
			visible: light || CarStatus.backFogLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/backFogLight.png"
		}
		Image {
			id: frontFogLight
			x: 861
			y: 26
			visible: light || CarStatus.frontFogLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/frontFogLight.png"
		}
		Image {
			id: rightSignal
			x: 815
			y: 21
			visible: light || CarStatus.rightSignal
			source: "qrc:/indicatorLamp/images/indicatorLamp/rightSignal.png"
		}
		Image {
			id: dcdcErrLight
			x: 1202
			y: 140
			visible: light || CarStatus.dcdcErrLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/dcdcErr.png"
		}
	}

	Item{
		id:leftLightId
		x: -30
		// module 左
		Image {
			id: pepsKeyLight
			x: 64
			y: 181
			visible: light || (CarStatus.pepsKeyLight && (CarStatus.pepsPowerStatus !== 3))
			source: "qrc:/indicatorLamp/images/indicatorLamp/pepsKeyLight.png"
		}
		Image {
			id: batteryErr
			x: 51
			y: 141
			visible: light || CarStatus.batteryErr
			source: "qrc:/indicatorLamp/images/indicatorLamp/batteryErr.png"

			property int batteryErrValue: CarStatus.batteryErr
			onBatteryErrValueChanged: {
				switch(batteryErrValue){
				case 1:
					flicker1.interval = 1000;
					flicker1.running = true;
					batteryErr.visible = true;
					break;
				case 2:
					flicker1.interval = 500;
					flicker1.running = true;
					batteryErr.visible = true;
					break;
				case 3:
					flicker1.running = false;
					batteryErr.visible = true;
					break;
				default:
					flicker1.running = false;
					batteryErr.visible = false;
					break;
				}
			}
			Timer {
				id: flicker1
				running: false
				interval: 500
				repeat: true
				onTriggered: {
					batteryErr.visible = !batteryErr.visible;
				}
			}
		}
		Image {
			id: batteryCutoff
			x: 54
			y: 101
			visible: light || CarStatus.batteryCutoff
			source: "qrc:/indicatorLamp/images/indicatorLamp/batteryCutoff.png"
		}
		Image {
			id: batteryLow
			x: 71
			y: 67
			visible: CarStatus.batteryLow//0：熄灭，1：闪亮1s间隔，2：闪亮0.5s间隔，3：常亮
			source: "qrc:/indicatorLamp/images/indicatorLamp/batteryLow.png"

			property int batteryLowValue: CarStatus.batteryLow
			onBatteryLowValueChanged: {
				switch(batteryLowValue){
				case 1:
					flicker2.interval = 1000;
					flicker2.running = true;
					batteryLow.visible = true;
					break;
				case 2:
					flicker2.interval = 500;
					flicker2.running = true;
					batteryLow.visible = true;
					break;
				case 3:
					flicker2.running = false;
					batteryLow.visible = true;
					break;
				default:
					flicker2.running = false;
					batteryLow.visible = false;
					break;
				}
			}
			Timer {
				id: flicker2
				running: false
				interval: 500
				repeat: true
				onTriggered: {
					batteryLow.visible = !batteryLow.visible;
				}
			}
		}
		Image {
			id: insulation
			x: 94
			y: 39
			visible: CarStatus.insulation//0：熄灭，1：闪亮1s间隔，2：闪亮0.5s间隔，3：常亮
			source: "qrc:/indicatorLamp/images/indicatorLamp/insulation.png"

			property int insulationValue: CarStatus.insulation
			onInsulationValueChanged: {
				switch(insulationValue){
				case 1:
					flicker3.interval = 1000;
					flicker3.running = true;
					insulation.visible = true;
					break;
				case 2:
					flicker3.interval = 500;
					flicker3.running = true;
					insulation.visible = true;
					break;
				case 3:
					flicker3.running = false;
					insulation.visible = true;
					break;
				default:
					flicker3.running = false;
					insulation.visible = false;
					break;
				}
			}
			Timer {
				id: flicker3
				running: false
				interval: 500
				repeat: true
				onTriggered: {
					insulation.visible = !insulation.visible;
				}
			}
		}
		Image {
			id: epsErrLight
			x: 148
			y: 28
			visible: light || CarStatus.epsErrLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/epsErrLight.png"
		}
		Image {
			id: absLight
			x: 198
			y: 25
			visible: light || CarStatus.absLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/absLight.png"
		}
		Image {
			id: mainSeatbelt
			x: 293
			y: 22
			visible: light || CarStatus.mainSeatbelt
			source: "qrc:/indicatorLamp/images/indicatorLamp/mainSeatbelt.png"
		}
		Image {
			id: lowBeam
			x: 336
			y: 27
			visible: light || CarStatus.lowBeam
			source: "qrc:/indicatorLamp/images/indicatorLamp/lowBeam.png"
		}
		Image {
			id: highBeam
			x: 385
			y: 27
			visible: light || CarStatus.highBeam
			source: "qrc:/indicatorLamp/images/indicatorLamp/highBeam.png"
		}
		Image {
			id: leftSignal
			x: 432
			y: 21
			visible: light || CarStatus.leftSignal
			source: "qrc:/indicatorLamp/images/indicatorLamp/leftSignal.png"
		}
		Image {
			id: ebdErr
			x: 245
			y: 26
			visible: light || CarStatus.ebdLight
			source: "qrc:/indicatorLamp/images/indicatorLamp/ebdErr.png"
		}
	}
	Image {
		id: ready
		x: 606
		y: 131
		visible: light || CarStatus.ready
		source: "qrc:/indicatorLamp/images/indicatorLamp/ready.png"
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: indicatorLamp; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: indicatorLamp; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				PauseAnimation {duration: 1000}
				ScriptAction{script: {
						indicatorLamp.light = true;
						insulation.visible = true;
						batteryLow.visible = true;
						batteryErr.visible = true;
						pControllerErr.visible = true;
						flicker3.running = false;
						flicker2.running = false;
						flicker1.running = false;
						flicker.running = false;
					}
				}
				NumberAnimation {target: indicatorLamp;property: "opacity";}
				PauseAnimation {duration: 3000}
				ScriptAction{script: {
						indicatorLamp.light = false;
						insulation.visible = false;
						batteryLow.visible = false;
						batteryErr.visible = false;
						pControllerErr.visible = false;
					}
				}
				PauseAnimation {duration: 1000}
				ScriptAction{script: {
						switch(insulation.insulationValue){
						case 1:
							flicker3.interval = 1000;
							flicker3.running = true;
							insulation.visible = true;
							break;
						case 2:
							flicker3.interval = 500;
							flicker3.running = true;
							insulation.visible = true;
							break;
						case 3:
							flicker3.running = false;
							insulation.visible = true;
							break;
						default:
							flicker3.running = false;
							insulation.visible = false;
							break;
						}
						switch(batteryLow.batteryLowValue){
						case 1:
							flicker2.interval = 1000;
							flicker2.running = true;
							batteryLow.visible = true;
							break;
						case 2:
							flicker2.interval = 500;
							flicker2.running = true;
							batteryLow.visible = true;
							break;
						case 3:
							flicker2.running = false;
							batteryLow.visible = true;
							break;
						default:
							flicker2.running = false;
							batteryLow.visible = false;
							break;
						}
						switch(batteryErr.batteryErrValue){
						case 1:
							flicker1.interval = 1000;
							flicker1.running = true;
							batteryErr.visible = true;
							break;
						case 2:
							flicker1.interval = 500;
							flicker1.running = true;
							batteryErr.visible = true;
							break;
						case 3:
							flicker1.running = false;
							batteryErr.visible = true;
							break;
						default:
							flicker1.running = false;
							batteryErr.visible = false;
							break;
						}
						switch( pControllerErr.pErrValue ) {
						case 1:
							flicker.running = true;
							pControllerErr.visible = true;
							break;
						case 2:
							flicker.running = false;
							pControllerErr.visible = true;
							break;
						default:
							flicker.running = false;
							pControllerErr.visible = false;
							break;
						}
					}
				}
			}
		}
	]
}
