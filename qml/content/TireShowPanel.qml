import QtQuick 2.3

Item {
	id: tireShowPanel
	opacity: 0.0
	state: CarStatus.tireShowState
	x: 25 + 10

	Item{
		id: carTp
		Image {
			id: cartpInfo
			x: 924
			y: 83
			opacity: 0.0
			source: "qrc:/rightPanel/images/rightPanel/car.png"
		}

		Item{
			id: tpLineBg
			x: 920
			y: 125
			width: 139
			height: 100
			clip: true
			Image{
				id: tpLine
				x: 863 - tpLineBg.x
				y: 128 - tpLineBg.y
				source: "qrc:/rightPanel/images/rightPanel/tpLine.png"
			}
		}
		Item{
			id: tpLineBg1
			x: 920
			y: 125
			width: 139
			height: 100
			clip: true
			Image{
				id: tpLine1
				x: 863 - tpLineBg1.x
				y: 128 - tpLineBg1.y
				source: "qrc:/rightPanel/images/rightPanel/tpLine.png"
			}
		}
		Image {
			id: tpInfo
			x: 895
			y: 113
			opacity: 0.0
			source:"qrc:/rightPanel/images/rightPanel/tpInfo.png"

			DigitValue {
				id: lfTP
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:-3
				visible:CarStatus.lfTPStatus === 0 &&  CarStatus.lfTP !== 255
				icon0: "qrc:/rightPanel/images/rightPanel/TP0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TP1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TP2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TP3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TP4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TP5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TP6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TP7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TP8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TP9.png"
				value: (CarStatus.lfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: lfTPRed
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:-3
				visible:CarStatus.lfTPStatus !== 0 && CarStatus.lfTP !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (CarStatus.lfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: lfTPRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:-3
				visible:CarStatus.lfTPStatus !== 0 && CarStatus.lfTP !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (CarStatus.lfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			Rectangle {
				id: lfTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 225
				y:5
				width: 8
				height: 2
				visible: CarStatus.lfTP === 255
				color: "white"
			}
			Rectangle {
				id: lfTPLose2
				anchors.right: lfTPLose1.left
				anchors.rightMargin: 5
				y:5
				width: 8
				height: 2
				visible: CarStatus.lfTP === 255
				color: "white"
			}
			property int lfTTValue: CarStatus.lfTT
			DigitValue {
				id: lfTT
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:20
				visible:!CarStatus.lfTTStatus && tpInfo.lfTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
				icon0: "qrc:/rightPanel/images/rightPanel/TPTB0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPTB1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPTB2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPTB3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPTB4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPTB5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPTB6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPTB7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPTB8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPTB9.png"
				value: (tpInfo.lfTTValue > 40) ? (tpInfo.lfTTValue - 40) : (40 -tpInfo.lfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lfTTTheme2
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:20
				visible:!CarStatus.lfTTStatus && tpInfo.lfTTValue !== 255 && CarStatus.theme === 2
				icon0: "qrc:/theme2/images/theme2/rightPanel/TPTB0.png"
				icon1: "qrc:/theme2/images/theme2/rightPanel/TPTB1.png"
				icon2: "qrc:/theme2/images/theme2/rightPanel/TPTB2.png"
				icon3: "qrc:/theme2/images/theme2/rightPanel/TPTB3.png"
				icon4: "qrc:/theme2/images/theme2/rightPanel/TPTB4.png"
				icon5: "qrc:/theme2/images/theme2/rightPanel/TPTB5.png"
				icon6: "qrc:/theme2/images/theme2/rightPanel/TPTB6.png"
				icon7: "qrc:/theme2/images/theme2/rightPanel/TPTB7.png"
				icon8: "qrc:/theme2/images/theme2/rightPanel/TPTB8.png"
				icon9: "qrc:/theme2/images/theme2/rightPanel/TPTB9.png"
				value: (tpInfo.lfTTValue > 40) ? (tpInfo.lfTTValue - 40) : (40 -tpInfo.lfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lfTTTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:20
				visible:!CarStatus.lfTTStatus && tpInfo.lfTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPTB0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPTB1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPTB2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPTB3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPTB4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPTB5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPTB6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPTB7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPTB8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPTB9.png"
				value: (tpInfo.lfTTValue > 40) ? (tpInfo.lfTTValue - 40) : (40 -tpInfo.lfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lfTTRed
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:20
				visible:CarStatus.lfTTStatus &&  tpInfo.lfTTValue !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (tpInfo.lfTTValue > 40) ? (tpInfo.lfTTValue - 40) : (40 -tpInfo.lfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lfTTRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:20
				visible:CarStatus.lfTTStatus &&  tpInfo.lfTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (tpInfo.lfTTValue > 40) ? (tpInfo.lfTTValue - 40) : (40 -tpInfo.lfTTValue )
				spacing: -1.5
			}
			Rectangle {
				id: lfTTfuhao
				anchors.right: {
					if(!CarStatus.lfTTStatus){
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							return lfTT.left;
						if(CarStatus.theme === 2)
							return lfTTTheme2.left;
						if(CarStatus.theme === 3)
							return lfTTTheme3.left;
					}
					else{
						if(CarStatus.theme !== 3)
							return lfTTRed.left;
						if(CarStatus.theme === 3)
							return lfTTRedTheme3.left;
					}
				}
				y:28
				width: 4
				height: 2
				visible: (tpInfo.lfTTValue >= 40 )? false : true
				color: {
					if(!CarStatus.lfTTStatus){
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							return "#0188ce";
						if(CarStatus.theme === 2)
							return "#00faff";
						if(CarStatus.theme === 3)
							return "#805fff";
					}
					else{
						if(CarStatus.theme !== 3)
							return "red";
						if(CarStatus.theme === 3)
							return "#ff9540";
					}
				}
			}
			Rectangle {
				id: lfTTLose1
				anchors.right: parent.right
				anchors.rightMargin: 225
				y:28
				width: 8
				height: 2
				visible: tpInfo.lfTTValue === 255
				color: "white"
			}
			Rectangle {
				id: lfTTLose2
				anchors.right: lfTPLose1.left
				anchors.rightMargin: 5
				y:28
				width: 8
				height: 2
				visible: tpInfo.lfTTValue === 255
				color: "white"
			}

			DigitValue {
				id: rfTP
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:-3
				visible:CarStatus.rfTPStatus === 0 && CarStatus.rfTP !== 255
				icon0: "qrc:/rightPanel/images/rightPanel/TP0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TP1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TP2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TP3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TP4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TP5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TP6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TP7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TP8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TP9.png"
				value: (CarStatus.rfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: rfTPRed
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:-3
				visible:CarStatus.rfTPStatus !== 0 && CarStatus.rfTP !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (CarStatus.rfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: rfTPRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:-3
				visible:CarStatus.rfTPStatus !== 0 && CarStatus.rfTP !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (CarStatus.rfTP*1.373).toFixed(0)
				spacing: -1.5
			}
			Rectangle {
				id: rfTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 28
				y:5
				width: 8
				height: 2
				visible: CarStatus.rfTP === 255
				color: "white"
			}
			Rectangle {
				id: rfTPLose2
				anchors.right: rfTPLose1.left
				anchors.rightMargin: 5
				y:5
				width: 8
				height: 2
				visible: CarStatus.rfTP === 255
				color: "white"
			}

			property int rfTTValue : CarStatus.rfTT
			DigitValue {
				id: rfTT
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:20
				visible:!CarStatus.rfTTStatus &&  tpInfo.rfTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
				icon0: "qrc:/rightPanel/images/rightPanel/TPTB0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPTB1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPTB2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPTB3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPTB4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPTB5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPTB6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPTB7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPTB8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPTB9.png"
				value: (tpInfo.rfTTValue > 40) ? (tpInfo.rfTTValue - 40) : (40 -tpInfo.rfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rfTTTheme2
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:20
				visible:!CarStatus.rfTTStatus &&  tpInfo.rfTTValue !== 255 && CarStatus.theme === 2
				icon0: "qrc:/theme2/images/theme2/rightPanel/TPTB0.png"
				icon1: "qrc:/theme2/images/theme2/rightPanel/TPTB1.png"
				icon2: "qrc:/theme2/images/theme2/rightPanel/TPTB2.png"
				icon3: "qrc:/theme2/images/theme2/rightPanel/TPTB3.png"
				icon4: "qrc:/theme2/images/theme2/rightPanel/TPTB4.png"
				icon5: "qrc:/theme2/images/theme2/rightPanel/TPTB5.png"
				icon6: "qrc:/theme2/images/theme2/rightPanel/TPTB6.png"
				icon7: "qrc:/theme2/images/theme2/rightPanel/TPTB7.png"
				icon8: "qrc:/theme2/images/theme2/rightPanel/TPTB8.png"
				icon9: "qrc:/theme2/images/theme2/rightPanel/TPTB9.png"
				value: (tpInfo.rfTTValue > 40) ? (tpInfo.rfTTValue - 40) : (40 -tpInfo.rfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rfTTTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:20
				visible:!CarStatus.rfTTStatus &&  tpInfo.rfTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPTB0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPTB1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPTB2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPTB3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPTB4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPTB5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPTB6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPTB7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPTB8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPTB9.png"
				value: (tpInfo.rfTTValue > 40) ? (tpInfo.rfTTValue - 40) : (40 -tpInfo.rfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rfTTRed
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:20
				visible:CarStatus.rfTTStatus &&  tpInfo.rfTTValue !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (tpInfo.rfTTValue > 40) ? (tpInfo.rfTTValue - 40) : (40 -tpInfo.rfTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rfTTRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:20
				visible:CarStatus.rfTTStatus &&  tpInfo.rfTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (tpInfo.rfTTValue > 40) ? (tpInfo.rfTTValue - 40) : (40 -tpInfo.rfTTValue )
				spacing: -1.5
			}
			Rectangle {
				id: rfTTfuhao
				anchors.right: {
					if(!CarStatus.rfTTStatus){
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							return rfTT.left;
						if(CarStatus.theme === 2)
							return rfTTTheme2.left;
						if(CarStatus.theme === 3)
							return rfTTTheme3.left;
					}
					else{
						if(CarStatus.theme !== 3)
							return rfTTRed.left;
						if(CarStatus.theme === 3)
							return rfTTRedTheme3.left;
					}
				}
				y:28
				width: 4
				height: 2
				visible: (tpInfo.rfTTValue >= 40 )? false : true
				color: {
					if(!CarStatus.rfTTStatus){
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							return "#0188ce";
						if(CarStatus.theme === 2)
							return "#00faff";
						if(CarStatus.theme === 3)
							return "#805fff";
					}
					else{
						if(CarStatus.theme !== 3)
							return "red";
						if(CarStatus.theme === 3)
							return "#ff9540";
					}
				}
			}
			Rectangle {
				id: rfTTLose1
				anchors.right: parent.right
				anchors.rightMargin: 28
				y:28
				width: 8
				height: 2
				visible: tpInfo.rfTTValue === 255
				color: "white"
			}
			Rectangle {
				id: rfTTLose2
				anchors.right: rfTPLose1.left
				anchors.rightMargin: 5
				y:28
				width: 8
				height: 2
				visible: tpInfo.rfTTValue === 255
				color: "white"
			}


			DigitValue {
				id: lrTP
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:89
				visible:CarStatus.lrTPStatus === 0 && CarStatus.lrTP !== 255
				icon0: "qrc:/rightPanel/images/rightPanel/TP0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TP1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TP2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TP3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TP4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TP5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TP6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TP7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TP8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TP9.png"
				value: (CarStatus.lrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: lrTPRed
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:89
				visible:CarStatus.lrTPStatus !== 0 && CarStatus.lrTP !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (CarStatus.lrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: lrTPRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:89
				visible:CarStatus.lrTPStatus !== 0 && CarStatus.lrTP !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (CarStatus.lrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			Rectangle {
				id: lrTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 225
				y:97
				width: 8
				height: 2
				visible: CarStatus.lrTP === 255
				color: "white"
			}
			Rectangle {
				id: lrTPLose2
				anchors.right: lrTPLose1.left
				anchors.rightMargin: 5
				y:97
				width: 8
				height: 2
				visible: CarStatus.lrTP === 255
				color: "white"
			}
			property int lrTTValue: CarStatus.lrTT

			DigitValue {
				id: lrTT
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:111
				visible:!CarStatus.lrTTStatus && tpInfo.lrTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
				icon0: "qrc:/rightPanel/images/rightPanel/TPTB0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPTB1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPTB2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPTB3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPTB4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPTB5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPTB6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPTB7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPTB8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPTB9.png"
				value: (tpInfo.lrTTValue > 40) ? (tpInfo.lrTTValue - 40) : (40 -tpInfo.lrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lrTTTheme2
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:111
				visible:!CarStatus.lrTTStatus && tpInfo.lrTTValue !== 255 && CarStatus.theme === 2
				icon0: "qrc:/theme2/images/theme2/rightPanel/TPTB0.png"
				icon1: "qrc:/theme2/images/theme2/rightPanel/TPTB1.png"
				icon2: "qrc:/theme2/images/theme2/rightPanel/TPTB2.png"
				icon3: "qrc:/theme2/images/theme2/rightPanel/TPTB3.png"
				icon4: "qrc:/theme2/images/theme2/rightPanel/TPTB4.png"
				icon5: "qrc:/theme2/images/theme2/rightPanel/TPTB5.png"
				icon6: "qrc:/theme2/images/theme2/rightPanel/TPTB6.png"
				icon7: "qrc:/theme2/images/theme2/rightPanel/TPTB7.png"
				icon8: "qrc:/theme2/images/theme2/rightPanel/TPTB8.png"
				icon9: "qrc:/theme2/images/theme2/rightPanel/TPTB9.png"
				value: (tpInfo.lrTTValue > 40) ? (tpInfo.lrTTValue - 40) : (40 -tpInfo.lrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lrTTTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:111
				visible:!CarStatus.lrTTStatus && tpInfo.lrTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPTB0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPTB1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPTB2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPTB3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPTB4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPTB5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPTB6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPTB7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPTB8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPTB9.png"
				value: (tpInfo.lrTTValue > 40) ? (tpInfo.lrTTValue - 40) : (40 -tpInfo.lrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lrTTRed
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:111
				visible:CarStatus.lrTTStatus && tpInfo.lrTTValue !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (tpInfo.lrTTValue > 40) ? (tpInfo.lrTTValue - 40) : (40 -tpInfo.lrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: lrTTRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 222
				y:111
				visible:CarStatus.lrTTStatus && tpInfo.lrTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (tpInfo.lrTTValue > 40) ? (tpInfo.lrTTValue - 40) : (40 -tpInfo.lrTTValue )
				spacing: -1.5
			}
			Rectangle {
				id: lrTTfuhao
				anchors.right: {
					if(!CarStatus.lrTTStatus){
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							return lrTT.left;
						if(CarStatus.theme === 2)
							return lrTTTheme2.left;
						if(CarStatus.theme === 3)
							return lrTTTheme3.left;
					}
					else{
						if(CarStatus.theme !== 3)
							return lrTTRed.left;
						if(CarStatus.theme === 3)
							return lrTTRedTheme3.left;
					}
				}
				y:119
				width: 4
				height: 2
				visible: (tpInfo.lrTTValue >= 40 )? false : true
				color: {
					if(!CarStatus.lrTTStatus){
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							return "#0188ce";
						if(CarStatus.theme === 2)
							return "#00faff";
						if(CarStatus.theme === 3)
							return "#805fff";
					}
					else{
						if(CarStatus.theme !== 3)
							return "red";
						if(CarStatus.theme === 3)
							return "#ff9540";
					}
				}
			}
			Rectangle {
				id: lrTTLose1
				anchors.right: parent.right
				anchors.rightMargin: 225
				y:119
				width: 8
				height: 2
				visible: tpInfo.lrTTValue === 255
				color: "white"
			}
			Rectangle {
				id: lrTTLose2
				anchors.right: lrTPLose1.left
				anchors.rightMargin: 5
				y:119
				width: 8
				height: 2
				visible: tpInfo.lrTTValue === 255
				color: "white"
			}

			DigitValue {
				id: rrTP
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:89
				visible:CarStatus.rrTPStatus === 0 && CarStatus.rrTP !== 255
				icon0: "qrc:/rightPanel/images/rightPanel/TP0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TP1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TP2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TP3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TP4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TP5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TP6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TP7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TP8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TP9.png"
				value:(CarStatus.rrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: rrTPRed
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:89
				visible:CarStatus.rrTPStatus !== 0 && CarStatus.rrTP !== 255 && (CarStatus.theme !== 3)
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value:(CarStatus.rrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			DigitValue {
				id: rrTPRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:89
				visible:CarStatus.rrTPStatus !== 0 && CarStatus.rrTP !== 255 && (CarStatus.theme === 3)
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value:(CarStatus.rrTP*1.373).toFixed(0)
				spacing: -1.5
			}
			Rectangle {
				id: rrTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 28
				y:97
				width: 8
				height: 2
				visible: CarStatus.rrTP === 255
				color: "white"
			}
			Rectangle {
				id: rrTPLose2
				anchors.right: rrTPLose1.left
				anchors.rightMargin: 5
				y:97
				width: 8
				height: 2
				visible: CarStatus.rrTP === 255
				color: "white"
			}

			property int rrTTValue: CarStatus.rrTT
			DigitValue {
				id: rrTT
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:111
				visible:!CarStatus.rrTTStatus && tpInfo.rrTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
				icon0: "qrc:/rightPanel/images/rightPanel/TPTB0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPTB1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPTB2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPTB3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPTB4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPTB5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPTB6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPTB7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPTB8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPTB9.png"
				value: (tpInfo.rrTTValue > 40) ? (tpInfo.rrTTValue - 40) : (40 -tpInfo.rrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rrTTTheme2
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:111
				visible:!CarStatus.rrTTStatus && tpInfo.rrTTValue !== 255 && CarStatus.theme === 2
				icon0: "qrc:/theme2/images/theme2/rightPanel/TPTB0.png"
				icon1: "qrc:/theme2/images/theme2/rightPanel/TPTB1.png"
				icon2: "qrc:/theme2/images/theme2/rightPanel/TPTB2.png"
				icon3: "qrc:/theme2/images/theme2/rightPanel/TPTB3.png"
				icon4: "qrc:/theme2/images/theme2/rightPanel/TPTB4.png"
				icon5: "qrc:/theme2/images/theme2/rightPanel/TPTB5.png"
				icon6: "qrc:/theme2/images/theme2/rightPanel/TPTB6.png"
				icon7: "qrc:/theme2/images/theme2/rightPanel/TPTB7.png"
				icon8: "qrc:/theme2/images/theme2/rightPanel/TPTB8.png"
				icon9: "qrc:/theme2/images/theme2/rightPanel/TPTB9.png"
				value: (tpInfo.rrTTValue > 40) ? (tpInfo.rrTTValue - 40) : (40 -tpInfo.rrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rrTTTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:111
				visible:!CarStatus.rrTTStatus && tpInfo.rrTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPTB0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPTB1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPTB2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPTB3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPTB4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPTB5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPTB6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPTB7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPTB8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPTB9.png"
				value: (tpInfo.rrTTValue > 40) ? (tpInfo.rrTTValue - 40) : (40 -tpInfo.rrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rrTTRed
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:111
				visible:CarStatus.rrTTStatus && tpInfo.rrTTValue !== 255 && CarStatus.theme !== 3
				icon0: "qrc:/rightPanel/images/rightPanel/TPR0.png"
				icon1: "qrc:/rightPanel/images/rightPanel/TPR1.png"
				icon2: "qrc:/rightPanel/images/rightPanel/TPR2.png"
				icon3: "qrc:/rightPanel/images/rightPanel/TPR3.png"
				icon4: "qrc:/rightPanel/images/rightPanel/TPR4.png"
				icon5: "qrc:/rightPanel/images/rightPanel/TPR5.png"
				icon6: "qrc:/rightPanel/images/rightPanel/TPR6.png"
				icon7: "qrc:/rightPanel/images/rightPanel/TPR7.png"
				icon8: "qrc:/rightPanel/images/rightPanel/TPR8.png"
				icon9: "qrc:/rightPanel/images/rightPanel/TPR9.png"
				value: (tpInfo.rrTTValue > 40) ? (tpInfo.rrTTValue - 40) : (40 -tpInfo.rrTTValue )
				spacing: -1.5
			}
			DigitValue {
				id: rrTTRedTheme3
				anchors.right: parent.right
				anchors.rightMargin: 25
				y:111
				visible:CarStatus.rrTTStatus && tpInfo.rrTTValue !== 255 && CarStatus.theme === 3
				icon0: "qrc:/theme3/images/theme3/rightPanel/TPR0.png"
				icon1: "qrc:/theme3/images/theme3/rightPanel/TPR1.png"
				icon2: "qrc:/theme3/images/theme3/rightPanel/TPR2.png"
				icon3: "qrc:/theme3/images/theme3/rightPanel/TPR3.png"
				icon4: "qrc:/theme3/images/theme3/rightPanel/TPR4.png"
				icon5: "qrc:/theme3/images/theme3/rightPanel/TPR5.png"
				icon6: "qrc:/theme3/images/theme3/rightPanel/TPR6.png"
				icon7: "qrc:/theme3/images/theme3/rightPanel/TPR7.png"
				icon8: "qrc:/theme3/images/theme3/rightPanel/TPR8.png"
				icon9: "qrc:/theme3/images/theme3/rightPanel/TPR9.png"
				value: (tpInfo.rrTTValue > 40) ? (tpInfo.rrTTValue - 40) : (40 -tpInfo.rrTTValue )
				spacing: -1.5
			}
			Rectangle {
				id: rrTTfuhao
				anchors.right: {
					if(!CarStatus.rrTTStatus){
						if(CarStatus.theme === 1 || CarStatus.theme === 0)
							return rrTT.left;
						if(CarStatus.theme === 2)
							return rrTTTheme2.left;
						if(CarStatus.theme === 3)
							return rrTTTheme3.left;
					}
					else{
						if(CarStatus.theme !== 3)
							return rrTTRed.left;
						if(CarStatus.theme === 3)
							return rrTTRedTheme3.left;
					}
				}
				y:119
				width: 4
				height: 2
				visible: (tpInfo.rrTTValue >= 40 )? false : true
				color: {
					if(!CarStatus.rrTTStatus){
						if(CarStatus.theme === 0 || CarStatus.theme === 1)
							return "#0188ce";
						if(CarStatus.theme === 2)
							return "#00faff";
						if(CarStatus.theme === 3)
							return "#805fff";
					}
					else{
						if(CarStatus.theme !== 3)
							return "red";
						if(CarStatus.theme === 3)
							return "#ff9540";
					}
				}
			}
			Rectangle {
				id: rrTTLose1
				anchors.right: parent.right
				anchors.rightMargin: 28
				y:119
				width: 8
				height: 2
				visible: tpInfo.rrTTValue === 255
				color: "white"
			}
			Rectangle {
				id: rrTTLose2
				anchors.right: rrTPLose1.left
				anchors.rightMargin: 5
				y:119
				width: 8
				height: 2
				visible: tpInfo.rrTTValue === 255
				color: "white"
			}
		}

		Image {
			id: rrTire
			x: 1028
			y: 203
			visible: CarStatus.rrTPStatus !== 0 || CarStatus.rrTPlow || CarStatus.rrTTStatus || CarStatus.rrTP === 255 || CarStatus.rrTT === 255
			source: "qrc:/rightPanel/images/rightPanel/Tire.png"
		}
		Image {
			id: lrTire
			x: 924
			y: 203
			visible: CarStatus.lrTPStatus !== 0 || CarStatus.lrTPlow  || CarStatus.lrTTStatus || CarStatus.lrTP === 255 || CarStatus.lrTT === 255
			source: "qrc:/rightPanel/images/rightPanel/Tire.png"
		}
		Image {
			id: rfTire
			x: 1028
			y: 111
			visible: CarStatus.rfTPStatus !== 0 || CarStatus.rfTPlow  || CarStatus.rfTTStatus || CarStatus.rfTP === 255 || CarStatus.rfTT === 255
			source: "qrc:/rightPanel/images/rightPanel/Tire.png"
		}
		Image {
			id: lfTire
			x: 924
			y: 111
			visible: CarStatus.lfTPStatus !== 0 || CarStatus.lfTPlow  || CarStatus.lfTTStatus || CarStatus.lfTP === 255 || CarStatus.lfTT === 255
			source: "qrc:/rightPanel/images/rightPanel/Tire.png"
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: tireShowPanel; opacity: 0.0 }
			PropertyChanges { target: cartpInfo; opacity: 0.0 }
			PropertyChanges { target: tpLineBg; x: 920 }
			PropertyChanges { target: tpLineBg1; x: 920 }
			PropertyChanges { target: tpInfo; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: tireShowPanel; opacity: 1.0 }
			PropertyChanges { target: cartpInfo; opacity: 1.0 }
			PropertyChanges { target: tpLineBg; x: 850 }
			PropertyChanges { target: tpLineBg1; x: 990 }
			PropertyChanges { target: tpInfo; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				NumberAnimation {target: tireShowPanel;property: "opacity";}
				ParallelAnimation {
					NumberAnimation {target: tpLineBg ;properties: "x"; duration:500;}
					NumberAnimation {target: tpLineBg1 ;properties: "x"; duration:500;}
					NumberAnimation {target: carTp ;properties: "opacity";}
				}
				NumberAnimation {target: tpInfo ;properties: "opacity";}
			}
		}
	]
}
