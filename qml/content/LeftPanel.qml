import QtQuick 2.3
import Carstatus 1.0

Item {
	id:leftPanel
	opacity:0.0
	scale: 1.1
	x: -75
	y: -30
	property bool waterTemp
	Image {
		id: waterTemp
		x: 100
		y: 240
		opacity: 0.0
		source: "qrc:/leftPanel/images/leftPanel/tempBg.png"
	}

	Item{
		id:waterTempo
		x:0 + 2
		y:0
		opacity: 0.0
		width: 100
		height:422

		Item{
			id:rect
			width: 210
			height: CarStatus.waterTempHight
			clip:true
			smooth: true
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 82
			transform:
				Rotation {
				id: waterTemp1
				origin.x: 641 - rect.x; origin.y: 211 - rect.y;
				angle: -11
			}
			Image {//x:100  ,y:141
				id: waterBar
				x:100
				anchors.bottom: parent.bottom
				source: {
					if(CarStatus.theme === 1 || CarStatus.theme === 0)
						return "qrc:/leftPanel/images/leftPanel/tempBar.png";
					else if(CarStatus.theme ===2)
						return "qrc:/theme2/images/theme2/leftPanel/tempBar.png";
					else if(CarStatus.theme ===3)
						return "qrc:/theme3/images/theme3/leftPanel/tempBar.png";
				}
				property int waterTempValue: CarStatus.waterTemp
				property int themeValue: CarStatus.theme
				onWaterTempValueChanged: {
					if(leftPanel.waterTemp && waterTempValue < 115){
						leftPanel.waterTemp = false;
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							waterBar.source = "qrc:/leftPanel/images/leftPanel/tempBar.png";
						else if(CarStatus.theme ===2)
							waterBar.source = "qrc:/theme2/images/theme2/leftPanel/tempBar.png";
						else if(CarStatus.theme ===3)
							waterBar.source = "qrc:/theme3/images/theme3/leftPanel/tempBar.png";
					}

					if(waterTempValue > 120){
						leftPanel.waterTemp = true;
						waterBar.source = "qrc:/leftPanel/images/leftPanel/tempBarRed.png"
					}
				}

				onThemeValueChanged: {
					if (false == leftPanel.waterTemp) {
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							waterBar.source = "qrc:/leftPanel/images/leftPanel/tempBar.png";
						else if(CarStatus.theme ===2)
							waterBar.source = "qrc:/theme2/images/theme2/leftPanel/tempBar.png";
						else if(CarStatus.theme ===3)
							waterBar.source = "qrc:/theme3/images/theme3/leftPanel/tempBar.png";
					}
				}

				transform:
					Rotation {
					origin.x: 641 - waterBar.x; origin.y: 211 -241;
					angle: 11
				}
			}
		}
		Image {
			id: leftPoint
			x: CarStatus.leftPointX
			y: CarStatus.leftPointY
			source: "qrc:/leftPanel/images/leftPanel/tempPoint.png"
		}
	}

	Image {
		id: waterBg
		x: 98 + 2
		y: 241
		opacity: 0.0
		source: "qrc:/leftPanel/images/leftPanel/tempKedu.png"
	}

	Item {
		id: leftLine
		x: 500
		y: 242
		width: 419
		height: 184
		clip:true
		Image {
			x: {
				if(CarStatus.theme !== 2)
					return 82 - leftLine.x;
				else if(CarStatus.theme ===2)
					return 99 - leftLine.x;
			}
			y: {
				if(CarStatus.theme !== 2)
					return 0;
				else if(CarStatus.theme ===2)
					return 251 - leftLine.y;
			}
			source:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return "qrc:/leftPanel/images/leftPanel/leftLine.png";
				else if(CarStatus.theme ===2)
					return "qrc:/theme2/images/theme2/leftPanel/leftLine.png";
				else if(CarStatus.theme ===3)
					return "qrc:/theme3/images/theme3/leftPanel/leftLine.png";
			}
		}
	}

	Image {
		id: waterTempLight
		x: 111 + 5
		y: 323
		opacity: 0.0
		source: leftPanel.waterTemp ? "qrc:/leftPanel/images/leftPanel/waterTempWarning.png" : "qrc:/leftPanel/images/leftPanel/waterTempLight.png"
	}

	Image {
		id: tempFlag
		x: 104
		y: 219
		opacity: 0.0
		source: "qrc:/leftPanel/images/leftPanel/H.png"
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: leftPanel; opacity: 0.0 }
			PropertyChanges { target: waterTemp; opacity: 0.0 }
			PropertyChanges { target: waterBg; opacity: 0.0 }
			PropertyChanges { target: tempFlag; opacity: 0.0 }
			PropertyChanges { target: waterTempLight; opacity: 0.0 }
			PropertyChanges { target: waterBar; opacity: 0.0 }
			PropertyChanges { target: waterTempo; opacity: 0.0 }
			PropertyChanges { target: leftLine; x: 500 }
		},
		State {
			name: "show"
			PropertyChanges { target: leftPanel; opacity: 1.0 }
			PropertyChanges { target: waterTemp; opacity: 1.0 }
			PropertyChanges { target: waterBg; opacity: 1.0 }
			PropertyChanges { target: tempFlag; opacity: 1.0 }
			PropertyChanges { target: waterTempLight; opacity: 1.0 }
			PropertyChanges { target: waterBar; opacity: 1.0 }
			PropertyChanges { target: waterTempo; opacity: 1.0 }
			PropertyChanges { target: leftLine; x: 81 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				NumberAnimation {target: leftPanel ;properties: "opacity";}
				PauseAnimation {duration: 2500}
				NumberAnimation {target: leftLine ;properties: "x";duration: 500;}
				NumberAnimation {target: waterTemp ;properties: "opacity";duration: 500;}
				ParallelAnimation{
					NumberAnimation {target: waterBg ;properties: "opacity";}
					NumberAnimation {target: tempFlag ;properties: "opacity";}
					NumberAnimation {target: waterTempLight ;properties: "opacity";}
					NumberAnimation {target: waterBar ;properties: "opacity";}
					NumberAnimation {target: waterTempo ;properties: "opacity";}
				}
			}
		}
	]
}
