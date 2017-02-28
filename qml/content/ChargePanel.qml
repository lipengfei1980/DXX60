import QtQuick 2.3

Item {
	id: chargePanel
	opacity: 0.0

	property bool loaderVisible: chargePanel.parent.visible
	property int socValue: CarStatus.soc
	onLoaderVisibleChanged: {
		if(loaderVisible)
			chargePanel.state = "show";
		else
			chargePanel.state = "";
	}

	Item{
		id: chargeStatus
		property bool socFlag
		visible: CarStatus.chargePanelVisible
		Image {
			id: bg
			x: 0
			y: 0
			opacity: 1.0
			source: "qrc:/chargePanel/images/chargePanel/Bg.png"
		}
		Image {
			id: chargeBg
			x: 333
			y: 135
			opacity: 1.0
			source: "qrc:/chargePanel/images/chargePanel/socBg.png"
		}
		Image {
			id: carBg
			x: 407
			y: 85
			opacity: 1.0
			source: "qrc:/chargePanel/images/chargePanel/carBg.png"
		}
		Image {
			id: soc0
			x: 663
			y: 187
			opacity: 1.0
			visible: socValue < 10 && socValue > 6
			source: "qrc:/chargePanel/images/chargePanel/0%.png"
		}
		Image {
			id: soc1
			x: 657
			y: 187
			opacity: 1.0
			visible: socValue < 20 && socValue >= 10
			source: "qrc:/chargePanel/images/chargePanel/10%.png"
		}
		Image {
			id: soc2
			x: 646
			y: 187
			opacity: 1.0
			visible: socValue < 30 && socValue >= 20
			source: "qrc:/chargePanel/images/chargePanel/20%.png"
		}
		Image {
			id: soc3
			x: 569
			y: 187
			opacity: 1.0
			visible: socValue < 40 && socValue >= 30
			source: "qrc:/chargePanel/images/chargePanel/30%.png"
		}
		Image {
			id: soc4
			x: 569
			y: 187
			opacity: 1.0
			visible: socValue < 50 && socValue >= 40
			source: "qrc:/chargePanel/images/chargePanel/40%.png"
		}
		Image {
			id: soc5
			x: 569
			y: 187
			opacity: 1.0
			visible: socValue < 60 && socValue >= 50
			source: "qrc:/chargePanel/images/chargePanel/50%.png"
		}
		Image {
			id: soc6
			x: 569
			y: 187
			opacity: 1.0
			visible: socValue < 70 && socValue >= 60
			source: "qrc:/chargePanel/images/chargePanel/60%.png"
		}
		Image {
			id: soc7
			x: 564
			y: 188
			opacity: 1.0
			visible: socValue < 80 && socValue >= 70
			source: "qrc:/chargePanel/images/chargePanel/70%.png"
		}
		Image {
			id: soc8
			x: 542
			y: 187
			opacity: 1.0
			visible: socValue < 90 && socValue >= 80
			source: "qrc:/chargePanel/images/chargePanel/80%.png"
		}
		Image {
			id: soc9
			x: 522
			y: 187
			opacity: 1.0
			visible: socValue < 98 && socValue >= 90
			source: "qrc:/chargePanel/images/chargePanel/90%.png"
		}
		Image {
			id: soc10
			x: 501
			y: 187
			opacity: 1.0
			visible: socValue >= 98
			source: "qrc:/chargePanel/images/chargePanel/100%.png"
		}

		DigitValue {
			id: socText
			opacity: 1.0
			scale:1.4
			anchors.right: carBg.right
			anchors.bottom: carBg.bottom
			anchors.bottomMargin: 160
			anchors.rightMargin: 480
			icon0: "qrc:/chargePanel/images/chargePanel/SOC0.png"
			icon1: "qrc:/chargePanel/images/chargePanel/SOC1.png"
			icon2: "qrc:/chargePanel/images/chargePanel/SOC2.png"
			icon3: "qrc:/chargePanel/images/chargePanel/SOC3.png"
			icon4: "qrc:/chargePanel/images/chargePanel/SOC4.png"
			icon5: "qrc:/chargePanel/images/chargePanel/SOC5.png"
			icon6: "qrc:/chargePanel/images/chargePanel/SOC6.png"
			icon7: "qrc:/chargePanel/images/chargePanel/SOC7.png"
			icon8: "qrc:/chargePanel/images/chargePanel/SOC8.png"
			icon9: "qrc:/chargePanel/images/chargePanel/SOC9.png"
			value:  CarStatus.soc > 100 ? 100 : CarStatus.soc
		}

		DigitValue {
			id: currentValue
			anchors.right: carBg.right
			anchors.bottom: carBg.bottom
			anchors.bottomMargin: 170
			anchors.rightMargin: 50
			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
			value: (((CarStatus.chargeCurrent * 0.1 - 400) < 0) ? (400 - CarStatus.chargeCurrent * 0.1).toFixed(0) : 0)
			spacing: -2
		}
		DigitValue {
			id: socText1
			anchors.right: carBg.right
			anchors.bottom: carBg.bottom
			anchors.bottomMargin: 113
			anchors.rightMargin: 75
			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
			value:  CarStatus.soc > 100 ? 100 : CarStatus.soc
		}
//		Image {
//			id: chargeBar_over
//			x: 461
//			y: 30
//			visible: chargeStatus.socValue >= 98
//			source: "qrc:/chargePanel/images/chargePanel/chargeOverBar.png"
//		}
//		Image {
//			id: chargeBar_blue
//			x: 635
//			y: 75
//			visible:chargeStatus.socValue >= 15 && chargeStatus.socValue < 98
//			source: "qrc:/chargePanel/images/chargePanel/chargeBarBlue.png"
//			transform: Rotation {
//				id: blueBarRotation
//				origin.x: 641 - chargeBar_blue.x; origin.y: 211 - chargeBar_blue.y;
//				angle: 360
//			}
//			NumberAnimation {target: blueBarRotation;property: "angle";duration: 4000;from: 360;to: 0;running: true;loops: Animation.Infinite;}
//		}
//		Image {
//			id: chargeBar_red
//			x: 454
//			y: 84
//			visible:chargeStatus.socValue < 15
//			source: "qrc:/chargePanel/images/chargePanel/chargeBarRed.png"
//			transform: Rotation {
//				id: redBarRotation
//				origin.x: 641 - chargeBar_red.x; origin.y: 211 - chargeBar_red.y;
//				angle: 360
//			}
//			NumberAnimation {target: redBarRotation;property: "angle";duration: 4000;from: 360;to: 0;running: true;loops: Animation.Infinite;}
//		}

//		onSocValueChanged: {
//			if(socValue >= 20 && socValue < 98){
//				chargeStatus.socFlag = false;
//				chargeBar_blue.visible = true;
//				chargeBar_red.visible = false;
//				flash.running = false;
//				battery_bar.color = "green";
//			}

//			if(socValue >= 15 && socValue < 20){
//				if(chargeStatus.socFlag){
//					flash.running = true;
//					chargeBar_red.visible = true;
//					chargeBar_blue.visible = false;
//					battery_bar.color = "red";
//				}
//				else{
//					chargeBar_blue.visible = true;
//					chargeBar_red.visible = false;
//					flash.running = false;
//					battery_bar.color = "green";
//				}
//			}

//			if(socValue < 15){
//				chargeStatus.socFlag = true;
//				flash.running = true;
//				chargeBar_red.visible = true;
//				chargeBar_blue.visible = false;
//				battery_bar.color = "red";
//			}
//			if(socValue >= 98){
//				chargeStatus.socFlag = false;
//				chargeBar_blue.visible = false;
//				chargeBar_red.visible = false;
//				flash.running = false;
//				battery_bar.color = "green";
//			}
//		}

//		Image {
//			id: chargeBg1
//			x: 532
//			y: 101
//			opacity: 1.0
//			source: "qrc:/chargePanel/images/chargePanel/chargeBg.png"
//		}
//		Rectangle {
//			id: battery_bar
//			x: 566
//			y: 233
//			width: {
//				if(chargeStatus.socValue <= 6)
//					return 0;
//				else if(chargeStatus.socValue >= 98)
//					return 67;
//				else
//					return 67 / 93 * chargeStatus.socValue;
//			}
////				chargeStatus.socValue > 100 ? 67 : 67 /100 * chargeStatus.socValue
//			height: 26
//			color: chargeStatus.socValue < 20 ? "red" : "green"
//		}

//		Image {
//			id: charge_flash
//			x: 594
//			y: 232
//			visible: false
//			source: "qrc:/chargePanel/images/chargePanel/flash.png"
//		}

//		Timer {
//			id: flash
//			interval: 500
//			repeat: true
//			onTriggered: {
//				charge_flash.visible = !charge_flash.visible
//			}
//			onRunningChanged: {
//				if(running !== false)
//					charge_flash.visible = true;
//				else
//					charge_flash.visible = false;
//			}
//		}

//		Image {
//			id: charge_battery
//			x: 564
//			y: 231
//			opacity: 1.0
//			source: "qrc:/chargePanel/images/chargePanel/battery.png"
//		}
//		Image {
//			id: charging
//			x: 569
//			y: 172
//			visible: CarStatus.chargeLight && chargeStatus.socValue < 100
//			source: "qrc:/chargePanel/images/chargePanel/charging.png"
//			onVisibleChanged: {
//				if ( visible )
//					doting.running = true;
//				else {
//					doting.running = false;
//					dot1.visible = false;
//					dot2.visible = false;
//					dot3.visible = false;
//					doting.steps = 0;
//				}
//			}
//		}
//		Image {
//			id: dot1
//			x: 702
//			y: 183
//			visible: false
//			source: "qrc:/chargePanel/images/chargePanel/point.png"
//		}
//		Image {
//			id: dot2
//			x: 709
//			y: 183
//			visible: false
//			source: "qrc:/chargePanel/images/chargePanel/point.png"
//		}
//		Image {
//			id: dot3
//			x: 716
//			y: 183
//			visible: false
//			source: "qrc:/chargePanel/images/chargePanel/point.png"
//		}
//		Timer {
//			id: doting
//			property int steps: 0
//			interval: 500
//			repeat: true
//			running: true
//			onTriggered: {
//				switch( steps ) {
//				case 0:
//					dot1.visible = true;
//					dot2.visible = false;
//					dot3.visible = false;
//					++steps;
//					break;
//				case 1:
//					dot1.visible = true;
//					dot2.visible = true;
//					dot3.visible = false;
//					++steps;
//					break;
//				case 2:
//					dot1.visible = true;
//					dot2.visible = true;
//					dot3.visible = true;
//					++steps;
//					break;
//				case 3:
//					dot1.visible = false;
//					dot2.visible = false;
//					dot3.visible = false;
//					steps = 0;
//					break;
//				default:
//					break;
//				}
//			}
//		}

//		Image {
//			id: chargeLineOn
//			x: 566
//			y: 172
//			visible: CarStatus.chargeLine && !charging.visible && !chargeOver.visible
//			source: "qrc:/chargePanel/images/chargePanel/chargeLineOk.png"
//		}
//		Image {
//			id: chargeOver
//			x: 577
//			y: 171
//			visible: chargeStatus.socValue >= 98
//			source: "qrc:/chargePanel/images/chargePanel/chargeOver.png"
//		}

//		Image {
//			id: current
//			x: 1075/* + 45*/ - 200
//			y: 375
//			source: "qrc:/chargePanel/images/chargePanel/current.png"
//		}


//		Image {
//			id: infoLeft
//			x: 206 - 80 - 20
//			y: 363
//			opacity: 1.0
//			source: "qrc:/globalPanel/images/globalPanel/leftGlobalTip.png"
//		}
//		Image {
//			id: infoRight
//			x: 206 + 50
//			y: 363
//			opacity: 1.0
//			source: "qrc:/globalPanel/images/globalPanel/rightGlobalTip.png"
//		}

//		DigitValue {
//			id:tripValueL
//			anchors.right: tripValuePoint.left
//			anchors.rightMargin: -5
//			anchors.bottom: infoLeft.bottom
//			anchors.bottomMargin: 25
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value: CarStatus.trip / 10
//			spacing: -2
//		}

//		Image {
//			id: tripValuePoint
//			anchors.right: tripValueR.left
//			anchors.rightMargin: -5
//			anchors.bottom: infoLeft.bottom
//			anchors.bottomMargin: 20
//			source: "qrc:/globalPanel/images/globalPanel/infoPoint.png"
//		}

//		DigitValue {
//			id: tripValueR
//			anchors.right: infoLeft.right
//			anchors.rightMargin: 704
//			anchors.bottom: infoLeft.bottom
//			anchors.bottomMargin: 25
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value: CarStatus.trip % 10
//		}

//		DigitValue {
//			id: odoValue
//			anchors.right: infoLeft.right
//			anchors.rightMargin: 704
//			anchors.bottom: infoLeft.bottom
//			anchors.bottomMargin: -2
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value:CarStatus.odo
//			spacing: -2
//		}

//		DigitValue {
//			id: carTemp
//			anchors.right: infoRight.right
//			anchors.rightMargin: 183
//			anchors.bottom: infoRight.bottom
//			anchors.bottomMargin: 11
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value: CarStatus.insideTemp
//			spacing: -2
//		}
//		Rectangle {
//			id: carTempfuhao
//			anchors.right: carTemp.left
//			anchors.bottom: outsideTemp.bottom
//			anchors.bottomMargin: 6
//			width: 4
//			height: 2
//			visible: CarStatus.carTemp < 40
//			color: "white"
//		}

//		DigitValue {
//			id: outsideTemp
//			anchors.right: infoLeft.right
//			anchors.rightMargin: 573
//			anchors.bottom: infoLeft.bottom
//			anchors.bottomMargin: 11
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value: CarStatus.outTemp
//			spacing: -2
//		}
//		Rectangle {
//			id: outsideTempfuhao
//			anchors.right: outsideTemp.left
//			anchors.bottom: outsideTemp.bottom
//			anchors.bottomMargin: 6
//			width: 4
//			height: 2
//			visible: CarStatus.outsideTemp < 40
//			color:"white"
//		}

//		DigitValue {
//			id: mileage
//			anchors.right: infoRight.right
//			anchors.rightMargin: 27
//			anchors.bottom: infoRight.bottom
//			anchors.bottomMargin: 11
//			icon0: "qrc:/globalPanel/images/globalPanel/info0.png"
//			icon1: "qrc:/globalPanel/images/globalPanel/info1.png"
//			icon2: "qrc:/globalPanel/images/globalPanel/info2.png"
//			icon3: "qrc:/globalPanel/images/globalPanel/info3.png"
//			icon4: "qrc:/globalPanel/images/globalPanel/info4.png"
//			icon5: "qrc:/globalPanel/images/globalPanel/info5.png"
//			icon6: "qrc:/globalPanel/images/globalPanel/info6.png"
//			icon7: "qrc:/globalPanel/images/globalPanel/info7.png"
//			icon8: "qrc:/globalPanel/images/globalPanel/info8.png"
//			icon9: "qrc:/globalPanel/images/globalPanel/info9.png"
//			value:CarStatus.mileage
//			spacing: -2
//		}
	}

	Image {
		id: batteryCutoff
		x: 76 -30
		y: 110
		visible: CarStatus.batteryCutoff
		source: "qrc:/indicatorLamp/images/indicatorLamp/batteryCutoff.png"
	}
	Image {
		id: cardoor
		x: 1051 + 25
		y: 21
		visible: CarStatus.anyDoor
		source: "qrc:/indicatorLamp/images/indicatorLamp/cardoor.png"
	}
	Image {
		id: batteryErr
		x: 51 -30
		y: 141
		visible: CarStatus.batteryErr
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
		id: batteryLow
		x: 71 -30
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
		x: 94 -30
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
		id: ebdErr
		x: 245 -30
		y: 26
		visible: CarStatus.ebdLight
		source: "qrc:/indicatorLamp/images/indicatorLamp/ebdErr.png"
	}
	Image {
		id: dcdcErrLight
		x: 1202 + 25
		y: 140
		visible: CarStatus.dcdcErrLight
		source: "qrc:/indicatorLamp/images/indicatorLamp/dcdcErr.png"
	}
	Image {
		id: chargeLight
		x: 612 -30
		y: 23
		visible: CarStatus.chargeLight
		source: "qrc:/chargePanel/images/chargePanel/chargeLight.png"
	}
	Image {
		id: chargeLine
		x: 662 + 25
		y: 25
		visible: CarStatus.chargeLine
		source: "qrc:/chargePanel/images/chargePanel/chargeLine.png"
	}
	Image {
		id: leftSignal
		x: 432 -30
		y: 21
		visible: CarStatus.leftSignal
		source: "qrc:/indicatorLamp/images/indicatorLamp/leftSignal.png"
	}
	Image {
		id: rightSignal
		x: 815 + 25
		y: 21
		visible: CarStatus.rightSignal
		source: "qrc:/indicatorLamp/images/indicatorLamp/rightSignal.png"
	}
	Image {
		id: backFogLight
		x: 909 + 25
		y: 26
		visible: CarStatus.backFogLight
		source: "qrc:/indicatorLamp/images/indicatorLamp/backFogLight.png"
	}
	Image {
		id: frontFogLight
		x: 861 + 25
		y: 26
		visible: CarStatus.frontFogLight
		source: "qrc:/indicatorLamp/images/indicatorLamp/frontFogLight.png"
	}
	Image {
		id: lowBeam
		x: 336 -30
		y: 27
		visible: CarStatus.lowBeam
		source: "qrc:/indicatorLamp/images/indicatorLamp/lowBeam.png"
	}
	Image {
		id: highBeam
		x: 385 -30
		y: 27
		visible: CarStatus.highBeam
		source: "qrc:/indicatorLamp/images/indicatorLamp/highBeam.png"
	}

	WarningPanel{
		id:warningPanel
		state: chargePanel.state
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: chargePanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: chargePanel; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				ScriptAction{script: {CarStatus.active = false;}}
				ScriptAction{script: {CarStatus.active = true;}}
				NumberAnimation {target: chargePanel;properties: "opacity";duration: 500;}
			}
		}
	]
}
