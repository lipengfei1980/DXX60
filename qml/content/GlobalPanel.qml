import QtQuick 2.3

Item {
	id: globalPanel
	opacity: 0.0

//	TireShowPanel {
//		id: tireShowPanel
//	}

	MenuPanel {
		id: menuPanel
//		onStateChanged: {
//			if(state === "show"){
//				tireShowPanel.visible = false
//			} else{
//				tireShowPanel.visible = true
//			}
//		}
	}

	Image {
		id: infoLeft
		x: 206 - 80 + 10
		y: 363
		opacity: 1.0
		source: "qrc:/globalPanel/images/globalPanel/leftGlobalTip.png"
	}
	Image {
		id: infoRight
		x: 206 + 95 - 10
		y: 363
		opacity: 1.0
		source: "qrc:/globalPanel/images/globalPanel/rightGlobalTip.png"
	}

	property int tripValue: CarStatus.trip
	DigitValue {
		id:tripValueL
		anchors.right: tripValuePoint.left
		anchors.rightMargin: -5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 25
		visible:tripValue != 65535
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
		value: tripValue / 10
		spacing: -2
	}

	Rectangle {
		id: tripValueLfuhao1
		anchors.right: tripValueLfuhao2.left
		anchors.rightMargin: 5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 33
		width: 10
		height: 2
		visible:tripValue == 65535
		color: "white"
	}
	Rectangle {
		id: tripValueLfuhao2
		anchors.right: tripValueLfuhao3.left
		anchors.rightMargin: 5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 33
		width: 10
		height: 2
		visible:tripValue == 65535
		color: "white"
	}
	Rectangle {
		id: tripValueLfuhao3
		anchors.right: tripValuePoint.left
		anchors.rightMargin: 0
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 33
		width: 10
		height: 2
		visible:tripValue == 65535
		color: "white"
	}

	Image {
		id: tripValuePoint
		anchors.right: tripValueR.left
		anchors.rightMargin: -5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 20
		source: "qrc:/globalPanel/images/globalPanel/infoPoint.png"
	}

	Rectangle {
		id: tripValueLfuhao4
		anchors.left: tripValuePoint.right
		anchors.leftMargin: 0
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 33
		width: 10
		height: 2
		visible:tripValue == 65535
		color: "white"
	}

	DigitValue {
		id: tripValueR
		anchors.right: infoLeft.right
		anchors.rightMargin: 704
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 25
		visible:tripValue != 65535
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
		value: tripValue % 10
	}

	DigitValue {
		id: odoValue
		anchors.right: infoLeft.right
		anchors.rightMargin: 704
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: -2
		visible:CarStatus.odo !== 16777215
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
		value:CarStatus.odo
		spacing: -2
	}

	Rectangle {
		id: odofuhao1
		anchors.right: odofuhao2.left
		anchors.rightMargin: 5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 6
		width: 10
		height: 2
		visible:CarStatus.odo === 16777215
		color: "white"
	}
	Rectangle {
		id: odofuhao2
		anchors.right: odofuhao3.left
		anchors.rightMargin: 5
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 6
		width: 10
		height: 2
		visible:CarStatus.odo === 16777215
		color: "white"
	}
	Rectangle {
		id: odofuhao3
		anchors.right: infoLeft.right
		anchors.rightMargin: 704
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 6
		width: 10
		height: 2
		visible:CarStatus.odo === 16777215
		color: "white"
	}

	DigitValue {
		id: carTemp
		anchors.right: infoRight.right
		anchors.rightMargin: 183
		anchors.bottom: infoRight.bottom
		anchors.bottomMargin: 11
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
		value: CarStatus.insideTemp
		spacing: -2
	}
	Rectangle {
		id: carTempfuhao
		anchors.right: carTemp.left
		anchors.bottom: outsideTemp.bottom
		anchors.bottomMargin: 6
		width: 4
		height: 2
		visible: CarStatus.carTemp < 40
		color: "white"
	}

	DigitValue {
		id: outsideTemp
		anchors.right: infoLeft.right
		anchors.rightMargin: 573
		anchors.bottom: infoLeft.bottom
		anchors.bottomMargin: 11
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
		value: CarStatus.outTemp
		spacing: -2
	}
	Rectangle {
		id: outsideTempfuhao
		anchors.right: outsideTemp.left
		anchors.bottom: outsideTemp.bottom
		anchors.bottomMargin: 6
		width: 4
		height: 2
		visible: CarStatus.outsideTemp < 40
		color:"white"
	}

	DigitValue {
		id: mileage
		anchors.right: infoRight.right
		anchors.rightMargin: 27
		anchors.bottom: infoRight.bottom
		anchors.bottomMargin: 11
		visible:CarStatus.mileage !== 0
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
		value:CarStatus.mileage
		spacing: -2
	}

	Rectangle {
		id: mileage1
		anchors.right: mileage2.left
		anchors.rightMargin: 5
		anchors.bottom: infoRight.bottom
		anchors.bottomMargin: 18
		width: 10
		height: 2
		visible:CarStatus.mileage === 0
		color: "white"
	}
	Rectangle {
		id: mileage2
		anchors.right: infoRight.right
		anchors.rightMargin: 30
		anchors.bottom: infoRight.bottom
		anchors.bottomMargin: 18
		width: 10
		height: 2
		visible:CarStatus.mileage === 0
		color: "white"
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: globalPanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: globalPanel; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				PauseAnimation {duration: 2500}
				NumberAnimation {target: globalPanel;property: "opacity";}
			}
		}
	]
}
