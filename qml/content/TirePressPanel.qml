import QtQuick 2.3

Item {
	id: tirePressPanel
	state: CarStatus.tirePressPanelState
	opacity: 0.0

	property int lfTTValue: CarStatus.lfTT
	property int rfTTValue : CarStatus.rfTT
	property int lrTTValue: CarStatus.lrTT
	property int rrTTValue: CarStatus.rrTT

	Item{
		id:lineBg
		x:998
		y:160
		width:1
		height:80
		clip:true
		Image {
			id: tirepressLine
			x: 902 - lineBg.x
			y: 174 - lineBg.y
			opacity: 0.0
			source: "qrc:/menuPanel/images/menuPanel/tirepressLine.png"
		}
	}

	Image {
		id: tirepress
		x: 915
		y: 124
		opacity: 1.0
		source: "qrc:/menuPanel/images/menuPanel/tirepress.png"
	}
	Item{
		id: carTp
		opacity: 0.0
		Image {
			id: tpInfo
			x: 934
			y: 159
			opacity: 1.0
			source: "qrc:/menuPanel/images/menuPanel/tirepressinfo.png"

			DigitValue {
				id: lfTP
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
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
			}
			DigitValue {
				id: lfTPRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
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
			}
			DigitValue {
				id: lfTPRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
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
			}
			Rectangle {
				id: lfTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 164
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
			DigitValue {
				id: lfTT
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:20
				visible:!CarStatus.lfTTStatus && lfTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
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
				value: (lfTTValue > 40) ? (lfTTValue - 40) : (40 -lfTTValue )
			}
			
			DigitValue {
				id: lfTTTheme2
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:20
				visible:!CarStatus.lfTTStatus && lfTTValue !== 255 && CarStatus.theme === 2
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
				value: (lfTTValue > 40) ? (lfTTValue - 40) : (40 -lfTTValue )
			}
			DigitValue {
				id: lfTTTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:20
				visible:!CarStatus.lfTTStatus && lfTTValue !== 255 && CarStatus.theme === 3
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
				value: (lfTTValue > 40) ? (lfTTValue - 40) : (40 -lfTTValue )
			}
			DigitValue {
				id: lfTTRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:20
				visible:CarStatus.lfTTStatus && lfTTValue !== 255 && CarStatus.theme !== 3
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
				value: (lfTTValue > 40) ? (lfTTValue - 40) : (40 -lfTTValue )
			}
			DigitValue {
				id: lfTTRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:20
				visible:CarStatus.lfTTStatus && lfTTValue !== 255 && CarStatus.theme === 3
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
				value: (lfTTValue > 40) ? (lfTTValue - 40) : (40 -lfTTValue )
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
				visible: (lfTTValue >= 40 )? false : true
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
				anchors.rightMargin: 164
				y:28
				width: 8
				height: 2
				visible: lfTTValue === 255
				color: "white"
			}
			Rectangle {
				id: lfTTLose2
				anchors.right: lfTPLose1.left
				anchors.rightMargin: 5
				y:28
				width: 8
				height: 2
				visible: lfTTValue === 255
				color: "white"
			}

			DigitValue {
				id: rfTP
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
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
			}
			DigitValue {
				id: rfTPRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
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
			}
			DigitValue {
				id: rfTPRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
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
			}
			Rectangle {
				id: rfTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 24
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

			DigitValue {
				id: rfTT
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:20
				visible:!CarStatus.rfTTStatus && rfTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
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
				value: (rfTTValue > 40) ? (rfTTValue - 40) : (40 -rfTTValue )
			}
			DigitValue {
				id: rfTTTheme2
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:20
				visible:!CarStatus.rfTTStatus && rfTTValue !== 255 && CarStatus.theme === 2
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
				value: (rfTTValue > 40) ? (rfTTValue - 40) : (40 -rfTTValue )
			}
			DigitValue {
				id: rfTTTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:20
				visible:!CarStatus.rfTTStatus && rfTTValue !== 255 && CarStatus.theme === 3
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
				value: (rfTTValue > 40) ? (rfTTValue - 40) : (40 -rfTTValue )
			}
			DigitValue {
				id: rfTTRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:20
				visible:CarStatus.rfTTStatus && rfTTValue !== 255 && CarStatus.theme !== 3
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
				value: (rfTTValue > 40) ? (rfTTValue - 40) : (40 -rfTTValue )
			}
			DigitValue {
				id: rfTTRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:20
				visible:CarStatus.rfTTStatus && rfTTValue !== 255 && CarStatus.theme === 3
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
				value: (rfTTValue > 40) ? (rfTTValue - 40) : (40 -rfTTValue )
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
				visible: (rfTTValue >= 40 )? false : true
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
				anchors.rightMargin: 24
				y:28
				width: 8
				height: 2
				visible: rfTTValue === 255
				color: "white"
			}
			Rectangle {
				id: rfTTLose2
				anchors.right: rfTPLose1.left
				anchors.rightMargin: 5
				y:28
				width: 8
				height: 2
				visible: rfTTValue === 255
				color: "white"
			}

			DigitValue {
				id: lrTP
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:89 - 35
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
			}
			DigitValue {
				id: lrTPRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:89 - 35
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
			}
			DigitValue {
				id: lrTPRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:89 - 35
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
			}
			Rectangle {
				id: lrTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 164
				y:62
				width: 8
				height: 2
				visible: CarStatus.lrTP === 255
				color: "white"
			}
			Rectangle {
				id: lrTPLose2
				anchors.right: lrTPLose1.left
				anchors.rightMargin: 5
				y:62
				width: 8
				height: 2
				visible: CarStatus.lrTP === 255
				color: "white"
			}

			DigitValue {
				id: lrTT
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:111 - 35
				visible:!CarStatus.lrTTStatus && lrTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
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
				value: (lrTTValue > 40) ? (lrTTValue - 40) : (40 -lrTTValue )
			}
			DigitValue {
				id: lrTTTheme2
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:111 - 35
				visible:!CarStatus.lrTTStatus && lrTTValue !== 255 && CarStatus.theme === 2
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
				value: (lrTTValue > 40) ? (lrTTValue - 40) : (40 -lrTTValue )
			}
			DigitValue {
				id: lrTTTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:111 - 35
				visible:!CarStatus.lrTTStatus && lrTTValue !== 255 && CarStatus.theme === 3
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
				value: (lrTTValue > 40) ? (lrTTValue - 40) : (40 -lrTTValue )
			}
			DigitValue {
				id: lrTTRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:111 - 35
				visible:CarStatus.lrTTStatus && lrTTValue !== 255 && CarStatus.theme !== 3
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
				value: (lrTTValue > 40) ? (lrTTValue - 40) : (40 -lrTTValue )
			}
			DigitValue {
				id: lrTTRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 161
				y:111 - 35
				visible:CarStatus.lrTTStatus && lrTTValue !== 255 && CarStatus.theme === 3
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
				value: (lrTTValue > 40) ? (lrTTValue - 40) : (40 -lrTTValue )
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
				y:119 - 35
				width: 4
				height: 2
				visible: (lrTTValue >= 40 )? false : true
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
				anchors.rightMargin: 164
				y:84
				width: 8
				height: 2
				visible: lrTTValue === 255
				color: "white"
			}
			Rectangle {
				id: lrTTLose2
				anchors.right: lrTPLose1.left
				anchors.rightMargin: 5
				y:84
				width: 8
				height: 2
				visible: lrTTValue === 255
				color: "white"
			}

			DigitValue {
				id: rrTP
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:89 - 35
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
			}
			DigitValue {
				id: rrTPRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:89 - 35
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
			}
			DigitValue {
				id: rrTPRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:89 - 35
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
			}
			Rectangle {
				id: rrTPLose1
				anchors.right: parent.right
				anchors.rightMargin: 24
				y:62
				width: 8
				height: 2
				visible: CarStatus.rrTP === 255
				color: "white"
			}
			Rectangle {
				id: rrTPLose2
				anchors.right: rrTPLose1.left
				anchors.rightMargin: 5
				y:62
				width: 8
				height: 2
				visible: CarStatus.rrTP === 255
				color: "white"
			}

			DigitValue {
				id: rrTT
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:111 - 35
				visible:!CarStatus.rrTTStatus && rrTTValue !== 255 && (CarStatus.theme === 1 || CarStatus.theme === 0)
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
				value: (rrTTValue > 40) ? (rrTTValue - 40) : (40 -rrTTValue )
			}
			DigitValue {
				id: rrTTTheme2
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:111 - 35
				visible:!CarStatus.rrTTStatus && rrTTValue !== 255 && CarStatus.theme === 2
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
				value: (rrTTValue > 40) ? (rrTTValue - 40) : (40 -rrTTValue )
			}
			DigitValue {
				id: rrTTTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:111 - 35
				visible:!CarStatus.rrTTStatus && rrTTValue !== 255 && CarStatus.theme === 3
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
				value: (rrTTValue > 40) ? (rrTTValue - 40) : (40 -rrTTValue )
			}
			DigitValue {
				id: rrTTRed
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:111 - 35
				visible:CarStatus.rrTTStatus && rrTTValue !== 255 && CarStatus.theme !== 3
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
				value: (rrTTValue > 40) ? (rrTTValue - 40) : (40 -rrTTValue )
			}
			DigitValue {
				id: rrTTRedTheme3
				anchors.right: tpInfo.right
				anchors.rightMargin: 21
				y:111 - 35
				visible:CarStatus.rrTTStatus && rrTTValue !== 255 && CarStatus.theme === 3
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
				value: (rrTTValue > 40) ? (rrTTValue - 40) : (40 -rrTTValue )
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
				y:119 - 35
				width: 4
				height: 2
				visible: (rrTTValue >= 40 )? false : true
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
				anchors.rightMargin: 24
				y:84
				width: 8
				height: 2
				visible: rrTTValue === 255
				color: "white"
			}
			Rectangle {
				id: rrTTLose2
				anchors.right: rrTPLose1.left
				anchors.rightMargin: 5
				y:84
				width: 8
				height: 2
				visible: rrTTValue === 255
				color: "white"
			}
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: tirePressPanel; opacity: 0.0 }
			PropertyChanges { target: carTp; opacity: 0.0 }
			PropertyChanges { target: lineBg; x: 998 }
			PropertyChanges { target: lineBg; width: 1 }
			PropertyChanges { target: tirepressLine; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: tirePressPanel; opacity: 1.0 }
			PropertyChanges { target: carTp; opacity: 1.0 }
			PropertyChanges { target: lineBg; x: 898 }
			PropertyChanges { target: lineBg; width: 201 }
			PropertyChanges { target: tirepressLine; opacity: 1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				NumberAnimation {target: tirePressPanel;properties: "opacity";}
				NumberAnimation {target: tirepressLine;properties: "opacity";}
				ParallelAnimation{
					NumberAnimation {target: lineBg; properties: "x";duration: 500}
					NumberAnimation {target: lineBg; properties: "width";duration: 500}
				}
				NumberAnimation {target: carTp;properties: "opacity";}
			}
		}
	]
}
