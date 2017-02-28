import QtQuick 2.3

Item {
	id: energyPanel
	state: CarStatus.energyPanelState
	opacity: 0.0
	property int themeValue: CarStatus.theme
	Image {
		id: kW100km
		x: 941
		y: 126
		opacity: 1.0
		source: "qrc:/menuPanel/images/menuPanel/kW_100km.png"
	}

	DigitValue {
		id: energyShowFrontNum
		anchors.right: dot.left
		anchors.rightMargin: -30
		scale:0.8
		y:172
		icon0: "qrc:/menuPanel/images/menuPanel/0.png"
		icon1: "qrc:/menuPanel/images/menuPanel/1.png"
		icon2: "qrc:/menuPanel/images/menuPanel/2.png"
		icon3: "qrc:/menuPanel/images/menuPanel/3.png"
		icon4: "qrc:/menuPanel/images/menuPanel/4.png"
		icon5: "qrc:/menuPanel/images/menuPanel/5.png"
		icon6: "qrc:/menuPanel/images/menuPanel/6.png"
		icon7: "qrc:/menuPanel/images/menuPanel/7.png"
		icon8: "qrc:/menuPanel/images/menuPanel/8.png"
		icon9: "qrc:/menuPanel/images/menuPanel/9.png"
		value: CarStatus.energyConsumption / 10
//		visible: (CarStatus.theme === 0 || CarStatus.theme === 1)
		spacing: -13
	}

//	DigitValue {
//		id: energyShowFrontNumTheme2
//		anchors.right: dot.left
//		anchors.rightMargin: -30
//		scale:0.8
//		y:172
//		icon0: "qrc:/theme2/images/theme2/menuPanel/0.png"
//		icon1: "qrc:/theme2/images/theme2/menuPanel/1.png"
//		icon2: "qrc:/theme2/images/theme2/menuPanel/2.png"
//		icon3: "qrc:/theme2/images/theme2/menuPanel/3.png"
//		icon4: "qrc:/theme2/images/theme2/menuPanel/4.png"
//		icon5: "qrc:/theme2/images/theme2/menuPanel/5.png"
//		icon6: "qrc:/theme2/images/theme2/menuPanel/6.png"
//		icon7: "qrc:/theme2/images/theme2/menuPanel/7.png"
//		icon8: "qrc:/theme2/images/theme2/menuPanel/8.png"
//		icon9: "qrc:/theme2/images/theme2/menuPanel/9.png"
//		value: CarStatus.energyConsumption / 10
//		visible: CarStatus.theme === 2
//		spacing: -13
//	}

//	DigitValue {
//		id: energyShowFrontNumTheme3
//		anchors.right: dot.left
//		anchors.rightMargin: -30
//		scale:0.8
//		y:172
//		icon0: "qrc:/theme3/images/theme3/menuPanel/0.png"
//		icon1: "qrc:/theme3/images/theme3/menuPanel/1.png"
//		icon2: "qrc:/theme3/images/theme3/menuPanel/2.png"
//		icon3: "qrc:/theme3/images/theme3/menuPanel/3.png"
//		icon4: "qrc:/theme3/images/theme3/menuPanel/4.png"
//		icon5: "qrc:/theme3/images/theme3/menuPanel/5.png"
//		icon6: "qrc:/theme3/images/theme3/menuPanel/6.png"
//		icon7: "qrc:/theme3/images/theme3/menuPanel/7.png"
//		icon8: "qrc:/theme3/images/theme3/menuPanel/8.png"
//		icon9: "qrc:/theme3/images/theme3/menuPanel/9.png"
//		value: CarStatus.energyConsumption / 10
//		visible: CarStatus.theme === 3
//		spacing: -13
//	}
	Image {
		id: dot
		anchors.right: kW100km.right
		anchors.rightMargin: 110
		y:185
		source: "qrc:/menuPanel/images/menuPanel/dot.png"
	}

	DigitValue {
		id: energyShowRearNum
		anchors.left: dot.right
		anchors.leftMargin: -18
		scale:0.8
		y:172
		icon0: "qrc:/menuPanel/images/menuPanel/0.png"
		icon1: "qrc:/menuPanel/images/menuPanel/1.png"
		icon2: "qrc:/menuPanel/images/menuPanel/2.png"
		icon3: "qrc:/menuPanel/images/menuPanel/3.png"
		icon4: "qrc:/menuPanel/images/menuPanel/4.png"
		icon5: "qrc:/menuPanel/images/menuPanel/5.png"
		icon6: "qrc:/menuPanel/images/menuPanel/6.png"
		icon7: "qrc:/menuPanel/images/menuPanel/7.png"
		icon8: "qrc:/menuPanel/images/menuPanel/8.png"
		icon9: "qrc:/menuPanel/images/menuPanel/9.png"
		value:  CarStatus.energyConsumption % 10
//		visible: (CarStatus.theme === 0 || CarStatus.theme === 1)
		spacing: -13
	}

//	DigitValue {
//		id: energyShowRearNumTheme2
//		anchors.left: dot.right
//		anchors.leftMargin: -18
//		scale:0.8
//		y:172
//		icon0: "qrc:/theme2/images/theme2/menuPanel/0.png"
//		icon1: "qrc:/theme2/images/theme2/menuPanel/1.png"
//		icon2: "qrc:/theme2/images/theme2/menuPanel/2.png"
//		icon3: "qrc:/theme2/images/theme2/menuPanel/3.png"
//		icon4: "qrc:/theme2/images/theme2/menuPanel/4.png"
//		icon5: "qrc:/theme2/images/theme2/menuPanel/5.png"
//		icon6: "qrc:/theme2/images/theme2/menuPanel/6.png"
//		icon7: "qrc:/theme2/images/theme2/menuPanel/7.png"
//		icon8: "qrc:/theme2/images/theme2/menuPanel/8.png"
//		icon9: "qrc:/theme2/images/theme2/menuPanel/9.png"
//		value:  CarStatus.energyConsumption % 10
//		visible: CarStatus.theme === 2
//		spacing: -13
//	}

//	DigitValue {
//		id: energyShowRearNumTheme3
//		anchors.left: dot.right
//		anchors.leftMargin: -18
//		scale:0.8
//		y:172
//		icon0: "qrc:/theme3/images/theme3/menuPanel/0.png"
//		icon1: "qrc:/theme3/images/theme3/menuPanel/1.png"
//		icon2: "qrc:/theme3/images/theme3/menuPanel/2.png"
//		icon3: "qrc:/theme3/images/theme3/menuPanel/3.png"
//		icon4: "qrc:/theme3/images/theme3/menuPanel/4.png"
//		icon5: "qrc:/theme3/images/theme3/menuPanel/5.png"
//		icon6: "qrc:/theme3/images/theme3/menuPanel/6.png"
//		icon7: "qrc:/theme3/images/theme3/menuPanel/7.png"
//		icon8: "qrc:/theme3/images/theme3/menuPanel/8.png"
//		icon9: "qrc:/theme3/images/theme3/menuPanel/9.png"
//		value:  CarStatus.energyConsumption % 10
//		visible: CarStatus.theme === 3
//		spacing: -13
//	}

	states: [
		State {
			name: ""
			PropertyChanges { target: energyPanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: energyPanel; opacity: 1.0 }
		}
	]
}
