import QtQuick 2.3

Item {
	id: setOverSpeed
	state: CarStatus.setOverSpeedState
	opacity: 0.0
	property int overSpeedShow: setOverSpeed.state === "set" ? CarStatus.setOverSpeed : CarStatus.overSpeed

	Image {
		id: overSpeedBg
		x: 898
		y: 124
		source: "qrc:/menuPanel/images/menuPanel/overSpeed.png"
	}

	Image{
		id: overSpeed
		anchors.centerIn: overSpeedBg
		visible: true
		source:{
			switch(overSpeedShow){
			case 60:"qrc:/menuPanel/images/menuPanel/60.png";break;
			case 70:"qrc:/menuPanel/images/menuPanel/70.png";break;
			case 80:"qrc:/menuPanel/images/menuPanel/80.png";break;
			case 90:"qrc:/menuPanel/images/menuPanel/90.png";break;
			case 100:"qrc:/menuPanel/images/menuPanel/100.png";break;
			case 110:"qrc:/menuPanel/images/menuPanel/110.png";break;
			case 120:"qrc:/menuPanel/images/menuPanel/120.png";break;
			case 130:"qrc:/menuPanel/images/menuPanel/130.png";break;
			case 140:"qrc:/menuPanel/images/menuPanel/140.png";break;
			case 255:"qrc:/menuPanel/images/menuPanel/OFF.png";break;
			default:"qrc:/menuPanel/images/menuPanel/OFF.png";break;
			}/*
			if(CarStatus.theme === 1 || CarStatus.theme === 0){
				switch(overSpeedShow){
				case 60:"qrc:/menuPanel/images/menuPanel/60.png";break;
				case 70:"qrc:/menuPanel/images/menuPanel/70.png";break;
				case 80:"qrc:/menuPanel/images/menuPanel/80.png";break;
				case 90:"qrc:/menuPanel/images/menuPanel/90.png";break;
				case 100:"qrc:/menuPanel/images/menuPanel/100.png";break;
				case 110:"qrc:/menuPanel/images/menuPanel/110.png";break;
				case 120:"qrc:/menuPanel/images/menuPanel/120.png";break;
				case 130:"qrc:/menuPanel/images/menuPanel/130.png";break;
				case 140:"qrc:/menuPanel/images/menuPanel/140.png";break;
				case 255:"qrc:/menuPanel/images/menuPanel/OFF.png";break;
				default:"qrc:/menuPanel/images/menuPanel/OFF.png";break;
				}
			}
			else if(CarStatus.theme === 2){
				switch(overSpeedShow){
				case 60:"qrc:/theme2/images/theme2/menuPanel/60.png";break;
				case 70:"qrc:/theme2/images/theme2/menuPanel/70.png";break;
				case 80:"qrc:/theme2/images/theme2/menuPanel/80.png";break;
				case 90:"qrc:/theme2/images/theme2/menuPanel/90.png";break;
				case 100:"qrc:/theme2/images/theme2/menuPanel/100.png";break;
				case 110:"qrc:/theme2/images/theme2/menuPanel/110.png";break;
				case 120:"qrc:/theme2/images/theme2/menuPanel/120.png";break;
				case 130:"qrc:/theme2/images/theme2/menuPanel/130.png";break;
				case 140:"qrc:/theme2/images/theme2/menuPanel/140.png";break;
				case 255:"qrc:/theme2/images/theme2/menuPanel/OFF.png";break;
				default:"qrc:/theme2/images/theme2/menuPanel/OFF.png";break;
				}
			}
			else if(CarStatus.theme === 3){
				switch(overSpeedShow){
				case 60:"qrc:/theme3/images/theme3/menuPanel/60.png";break;
				case 70:"qrc:/theme3/images/theme3/menuPanel/70.png";break;
				case 80:"qrc:/theme3/images/theme3/menuPanel/80.png";break;
				case 90:"qrc:/theme3/images/theme3/menuPanel/90.png";break;
				case 100:"qrc:/theme3/images/theme3/menuPanel/100.png";break;
				case 110:"qrc:/theme3/images/theme3/menuPanel/110.png";break;
				case 120:"qrc:/theme3/images/theme3/menuPanel/120.png";break;
				case 130:"qrc:/theme3/images/theme3/menuPanel/130.png";break;
				case 140:"qrc:/theme3/images/theme3/menuPanel/140.png";break;
				case 255:"qrc:/theme3/images/theme3/menuPanel/OFF.png";break;
				default:"qrc:/theme3/images/theme3/menuPanel/OFF.png";break;
				}
			}*/
		}
		Timer {
			id: flicker
			interval: 500
			running: setOverSpeed.state === "set"
			repeat: true
			onTriggered: {
				overSpeed.visible = !overSpeed.visible
			}
			onRunningChanged: {
				if(running === false)
					overSpeed.visible = true;
			}
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: setOverSpeed; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: setOverSpeed; opacity: 1.0 }
		},
		State {
			name: "set"
			PropertyChanges { target: setOverSpeed; opacity: 1.0 }
		}
	]
}
