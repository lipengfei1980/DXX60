import QtQuick 2.3

Item {
	id: setLcdLight
	state: CarStatus.setLcdLightState
	opacity: 0.0
	property int lcdLight: setLcdLight.state === "set" ? (CarStatus.lowBeam ? CarStatus.setLcdNightLight : CarStatus.setBackLight) : (CarStatus.lowBeam ? CarStatus.lcdNightLight : CarStatus.lcdLight)

	DigitValue {
		id: backLight
		anchors.bottom: setBackLight.bottom
		anchors.bottomMargin: 25
		anchors.horizontalCenter: setBackLight.horizontalCenter
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
		value:  lcdLight
		Timer {
			id: flicker
			interval: 500
			running: setLcdLight.state === "set"
			repeat: true
			onTriggered: {
				backLight.visible = !backLight.visible
			}
			onRunningChanged: {
				if(running === false)
					backLight.visible = true;
			}
		}
	}
	Image {
		id: setBackLight
		x: 892
		y: 124
		source: "qrc:/menuPanel/images/menuPanel/lcd.png"
	}

	Rectangle{
		id:lineBar
		x: 920
		y: 207
		color: "#00a8ff"/*{
			if(CarStatus.theme === 0 || CarStatus.theme === 1)
				return "#00a8ff";
			if(CarStatus.theme === 2)
				return "#00faff";
			if(CarStatus.theme === 3)
				return "#805fff";
		}*/
		width: 	{
			switch(lcdLight){
			case 1:
				return 0 ;
			case 2:
				return 155/9*1;
			case 3:
				return 155/9*2;
			case 4:
				return 155/9*3;
			case 5:
				return 155/9*4;
			case 6:
				return 155/9*5;
			case 7:
				return 155/9*6;
			case 8:
				return 155/9*7;
			case 9:
				return 155/9*8;
			case 10:
				return 155/9*9;
			default:
				return 0;
			}
		}
		height: 4
		Behavior on width { NumberAnimation { duration: 500 } }
	}

	Image {
		id: cricle
		x: {
			switch(lcdLight){
			case 1:
				return 917 + 140/9*0 ;
			case 2:
				return 917 + 140/9*1;
			case 3:
				return 917+ 140/9*2;
			case 4:
				return 917+ 140/9*3;
			case 5:
				return 917+ 140/9*4;
			case 6:
				return 917+ 140/9*5;
			case 7:
				return 917+ 140/9*6;
			case 8:
				return 917+ 140/9*7;
			case 9:
				return 917+ 140/9*8;
			case 10:
				return 917+ 140/9*9;
			default:
				return 917;
			}
		}
		y: 199
		opacity: 1.0
		source: "qrc:/menuPanel/images/menuPanel/lcdPoint.png"
		Behavior on x { NumberAnimation { duration: 500 } }
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: setLcdLight; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: setLcdLight; opacity: 1.0 }
		},
		State {
			name: "set"
			PropertyChanges { target: setLcdLight; opacity: 1.0 }
		}
	]
}
