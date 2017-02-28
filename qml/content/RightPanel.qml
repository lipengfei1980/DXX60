import QtQuick 2.3

Item {
	id:rightPanel
	opacity:0.0
	scale: 1.1
	x: -50
	y: -30

	property bool socFlag

	Image {
		id: soc
		x: 1083
		y: 240
		opacity: 0.0
		source: "qrc:/rightPanel/images/rightPanel/socBg.png"
	}

	Item{
		id:socB
		x:1080 + 2
		y:0
		opacity: 0.0
		width: 200
		height:422

		Item{
			id:rect
			width: 210
			height: CarStatus.socHight
			clip:true
			smooth: true
			anchors.bottom: parent.bottom
			anchors.bottomMargin: -70
			transform:
				Rotation {
				id: socB1
				origin.x: 641 - rect.x; origin.y: 211 - rect.y;
				angle: 14
			}
			Image {//x:100  ,y:141
				id: socBar
				x:0
				anchors.bottom: parent.bottom
				anchors.bottomMargin: 120+31
				source: {
					if(CarStatus.theme === 0 || CarStatus.theme === 1)
						return "qrc:/rightPanel/images/rightPanel/socBar.png";
					else if(CarStatus.theme === 2)
						return "qrc:/theme2/images/theme2/rightPanel/socBar.png";
					else if(CarStatus.theme === 3)
						return "qrc:/theme3/images/theme3/rightPanel/socBar.png";
				}
				property int socValue: CarStatus.soc
				property int themeValue: CarStatus.theme
				onSocValueChanged: {
					if(rightPanel.socFlag && socValue >= 20){
						rightPanel.socFlag = false;
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							socBar.source = "qrc:/rightPanel/images/rightPanel/socBar.png";
						else if(CarStatus.theme === 2)
							socBar.source = "qrc:/theme2/images/theme2/rightPanel/socBar.png";
						else if(CarStatus.theme === 3)
							socBar.source = "qrc:/theme3/images/theme3/rightPanel/socBar.png";
					}

					if(socValue < 15){
						rightPanel.socFlag = true;
						socBar.source = "qrc:/rightPanel/images/rightPanel/socBarRed.png"
					}
				}
				onThemeValueChanged: {
					if (false == rightPanel.socFlag) {
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							socBar.source = "qrc:/rightPanel/images/rightPanel/socBar.png";
						else if(CarStatus.theme === 2)
							socBar.source = "qrc:/theme2/images/theme2/rightPanel/socBar.png";
						else if(CarStatus.theme === 3)
							socBar.source = "qrc:/theme3/images/theme3/rightPanel/socBar.png";
					}
				}

				transform:
					Rotation {
					origin.x: 641 - socBar.x; origin.y: 211 -240;
					angle: -14
				}
			}
		}
	}

	Image {
		id: rightPoint
		opacity: 0.0
		x: CarStatus.rightPointX
		y: CarStatus.rightPointY
		source: "qrc:/rightPanel/images/rightPanel/socPoint.png"

	}

	Image {
		id: socBg
		x: 1110 + 2
		y: 241
		opacity: 0.0
		source: "qrc:/rightPanel/images/rightPanel/socKedu.png"
	}

	Image {
		id: socLight
		x: 1151 - 5
		y: 317
		opacity: 0.0
		source: rightPanel.socFlag ? "qrc:/rightPanel/images/rightPanel/socWarning.png" : "qrc:/rightPanel/images/rightPanel/socLight.png"
	}

	Item {
		id: rightLine
		x: 352
		y: 242
		width: 419
		height: 184
		clip:true
		Image {
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 772 - rightLine.x;
				else if(CarStatus.theme ===2 || CarStatus.theme ===3)
					return 762 - rightLine.x;
			}

			source:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return "qrc:/rightPanel/images/rightPanel/rightLine.png";
				else if(CarStatus.theme ===2)
					return "qrc:/theme2/images/theme2/rightPanel/rightLine.png";
				else if(CarStatus.theme ===3)
					return "qrc:/theme3/images/theme3/rightPanel/rightLine.png";
			}
		}
	}

	Image {
		id: socFlag
		x: 1060
		y: 223
		opacity: 0.0
		source: "qrc:/rightPanel/images/rightPanel/F.png"
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: rightPanel; opacity: 0.0 }
			PropertyChanges { target: rightLine; x: 352 }
			PropertyChanges { target: soc; opacity: 0.0 }
			PropertyChanges { target: rightPoint; opacity: 0.0 }
			PropertyChanges { target: socBg; opacity: 0.0 }
			PropertyChanges { target: socFlag; opacity: 0.0 }
			PropertyChanges { target: socBar; opacity: 0.0 }
			PropertyChanges { target: socB; opacity: 0.0 }
			PropertyChanges { target: socLight; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: rightPanel; opacity: 1.0 }
			PropertyChanges { target: rightLine; x: 771 }
			PropertyChanges { target: soc; opacity: 1.0 }
			PropertyChanges { target: rightPoint; opacity: 1.0 }
			PropertyChanges { target: socBg; opacity: 1.0 }
			PropertyChanges { target: socFlag; opacity: 1.0 }
			PropertyChanges { target: socBar; opacity: 1.0 }
			PropertyChanges { target: socB; opacity: 1.0 }
			PropertyChanges { target: socLight; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				NumberAnimation {target: rightPanel ;properties: "opacity";}
				PauseAnimation {duration: 2500}
				NumberAnimation {target: rightLine ;properties: "x"; duration: 500;}
				NumberAnimation {target: soc ;properties: "opacity"; duration: 500;}
				ParallelAnimation{
					NumberAnimation {target: rightPoint ;properties: "opacity";}
					NumberAnimation {target: socBg ;properties: "opacity";}
					NumberAnimation {target: socFlag ;properties: "opacity";}
					NumberAnimation {target: socLight ;properties: "opacity";}
					NumberAnimation {target: socBar ;properties: "opacity";}
					NumberAnimation {target: socB ;properties: "opacity";}
				}
			}
		}
	]
}
