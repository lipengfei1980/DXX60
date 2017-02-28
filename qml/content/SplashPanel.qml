import QtQuick 2.3

Rectangle {
	id: splashPanel
	state: ""
	opacity: 0.0

	Image {
		id: logo
		x: 426
		y: 24
		opacity: 1.0
		source: "qrc:/common/images/common/logo.png"
	}

	Item {
		id: verBg
		opacity: 1.0

		Image {
			id: verBgIcon
			x: 1072
			y: 176
			source: "qrc:/dormancyPanel/images/dormancyPanel/verBg.png"
		}
		DigitValue {
			id: ver1
			anchors.left: verBgIcon.left
			anchors.leftMargin: 36
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: 2
		}
		DigitValue {
			id: ver2
			anchors.left: verBgIcon.left
			anchors.leftMargin: 48
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: 0
		}
		DigitValue {
			id: ver3
			anchors.left: verBgIcon.left
			anchors.leftMargin: 60
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: 8
		}

		DigitValue {
			id: mcuVer1
			anchors.left: verBgIcon.left
			anchors.leftMargin: 36 + 47
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: CarStatus.mcuVer1
		}
		DigitValue {
			id: mcuVer2
			anchors.left: verBgIcon.left
			anchors.leftMargin: 48 + 47
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: CarStatus.mcuVer2
		}
		DigitValue {
			id: mcuVer3
			anchors.left: verBgIcon.left
			anchors.leftMargin: 60 + 47
			anchors.verticalCenter: verBgIcon.verticalCenter
			showNum: 1
			icon0: "qrc:/common/images/common/0.png"
			icon1: "qrc:/common/images/common/1.png"
			icon2: "qrc:/common/images/common/2.png"
			icon3: "qrc:/common/images/common/3.png"
			icon4: "qrc:/common/images/common/4.png"
			icon5: "qrc:/common/images/common/5.png"
			icon6: "qrc:/common/images/common/6.png"
			icon7: "qrc:/common/images/common/7.png"
			icon8: "qrc:/common/images/common/8.png"
			icon9: "qrc:/common/images/common/9.png"
			value: CarStatus.mcuVer3
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: splashPanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: splashPanel; opacity: 1.0 }
		}
	]

	Component.onCompleted: {
		state = "show";
	}
}
