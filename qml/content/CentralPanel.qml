import QtQuick 2.3

Item {
	id: centralPanel
	opacity:0.0
	y: CarStatus.theme === 3 ? 8 : 0

	Image {
		id: circle
		x: 384
		y: {
			if(CarStatus.theme === 0 || CarStatus.theme === 1)
				return 15;
			else if(CarStatus.theme === 2)
				return 10;
			else if(CarStatus.theme === 3)
				return 2;
		}
		opacity: 0.0
		source: {
			if(CarStatus.theme === 0 || CarStatus.theme === 1)
				return "qrc:/centralPanel/images/centralPanel/midCircle.png";
			else if(CarStatus.theme === 2)
				return "qrc:/theme2/images/theme2/centralPanel/midCircle.png";
			else if(CarStatus.theme === 3)
				return "qrc:/theme3/images/theme3/centralPanel/midCircle.png";
		}
	}

	Item{
		id:rect
		x:400
		y:0
		width:241
		height:422
		clip: true
		transform: Rotation {
			id: rpmBarRotation
			origin.x: 641 - rect.x; origin.y: 211 - rect.y;
			angle: 18
		}
		Image {
			id: rpmBar
			x: {
				if(CarStatus.theme === 0 || CarStatus.theme === 1)
					return 461 - rect.x;
				else if(CarStatus.theme ===2)
					return 427 - rect.x;
				else if(CarStatus.theme ===3)
					return 456 - rect.x;
			}
			y: {
				if(CarStatus.theme === 0 || CarStatus.theme === 1)
					return 31 - rect.y;
				else if(CarStatus.theme ===2)
					return 22 - rect.y;
				else if(CarStatus.theme ===3)
					return 23 - rect.y;
			}
			opacity: 0.0
			source: {
				if(CarStatus.theme === 0 || CarStatus.theme === 1)
					return "qrc:/centralPanel/images/centralPanel/rpmBar.png";
				else if(CarStatus.theme ===2)
					return "qrc:/theme2/images/theme2/centralPanel/rpmBar.png";
				else if(CarStatus.theme ===3)
					return "qrc:/theme3/images/theme3/centralPanel/rpmBar.png";
			}
			transform: Rotation {
				id: rpmBarRotation1
				origin.x: {
					if(CarStatus.theme === 0 || CarStatus.theme === 1)
						return 641 - rpmBar.x - rect.x;
					else if(CarStatus.theme === 2)
						return 642 - rpmBar.x - rect.x;
					else if(CarStatus.theme === 3)
						return 642 - rpmBar.x - rect.x;
				}
				origin.y: {
					if(CarStatus.theme === 0 || CarStatus.theme === 1)
						return 211 - rpmBar.y - rect.y;
					else if(CarStatus.theme === 2)
						return 213 - rpmBar.y - rect.y;
					else if(CarStatus.theme === 3)
						return 209 - rpmBar.y - rect.y;
				}

				angle: {
					if(CarStatus.theme === 0 || CarStatus.theme === 1)
						return 180 - rpmBarRotation.angle + CarStatus.rpmAngle + 0.2 - 2;
					else if(CarStatus.theme === 2)
						return 180 - rpmBarRotation.angle + CarStatus.rpmAngle + 0.1;
					else if(CarStatus.theme === 3)
						return 180 - rpmBarRotation.angle + CarStatus.rpmAngle + 0.1;
				}

			}
		}
	}

	Item {
		id: rpmkedu
		x: {
			if(CarStatus.theme !== 2)
				return 448;
			else if(CarStatus.theme ===2)
				return 461;
		}
		y: {
			if(CarStatus.theme === 0 || CarStatus.theme === 1)
				return 18;
			else if(CarStatus.theme ===2)
				return 32;
			else if(CarStatus.theme ===3)
				return 17;
		}
		width: 190 +10
		height: 386//193
		clip:true
		transform: Rotation {
			id:rotation
			origin.x: {
				if(CarStatus.theme !== 2)
					return 641 - rpmkedu.x;
				else if(CarStatus.theme ===2)
					return 642 - rpmkedu.x;
			}
			origin.y: {
				if(CarStatus.theme !== 2)
					return 211 - rpmkedu.y;
				else if(CarStatus.theme ===2)
					return 213 - rpmkedu.y;
			}
			angle: {
				if(CarStatus.theme !== 2)
					return -160 - 2;
				else if(CarStatus.theme ===2)
					return -160;
			}
		}
		Image {
			id: rpmCursor
			transform: Rotation {
				origin.x: {
					if(CarStatus.theme !== 2)
						return 641 - rpmkedu.x;
					else if(CarStatus.theme ===2)
						return 642 - rpmkedu.x;
				}
				origin.y: {
					if(CarStatus.theme !== 2)
						return 211 - rpmkedu.y;
					else if(CarStatus.theme ===2)
						return 213 - rpmkedu.y;
				}
				angle: {
					if(CarStatus.theme !== 2)
						return -rotation.angle - 2;
					else if(CarStatus.theme ===2)
						return -rotation.angle;
				}
			}
			opacity:0.0
			visible: CarStatus.theme !== 3
			source:{
				if(CarStatus.theme !== 2)
					return "qrc:/centralPanel/images/centralPanel/kedu.png";
				else if(CarStatus.theme === 2)
					return "qrc:/theme2/images/theme2/centralPanel/kedu.png";
			}
		}
	}
	Image {
		id: keduBg//111111111111111111111
		x: {
			if(CarStatus.theme === 2)
				return 450;
			else if(CarStatus.theme === 3)
				return 445;
			else
				return 0;
		}
		y: {
			if(CarStatus.theme === 2)
				return 21;
			else if(CarStatus.theme === 3)
				return 13;
			else
				return 0;
		}
		opacity: 0.0
		visible: CarStatus.theme === 2 || CarStatus.theme === 3
		source: {
			if(CarStatus.theme === 2)
				return "qrc:/theme2/images/theme2/centralPanel/keduBg.png";
			else if(CarStatus.theme === 3)
				return "qrc:/theme3/images/theme3/centralPanel/keduBg.png";
			else
				return "";
		}
	}

	Image {
		id: powerLayer
		x: 704 - 0.5
		y: 210 + 0.5
		opacity: 0.0
		visible: CarStatus.theme === 0 || CarStatus.theme === 1
		source: "qrc:/centralPanel/images/centralPanel/powerBg.png"
	}

	Item{
		id:powerBarBg1
		x:704 - 0.5
		y:210 + 0.5
		width: 178
		height: 180
		clip: true
		transform: Rotation {
			id:powerBarRotation1
			origin.x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 641 - powerBarBg1.x;
				else if(CarStatus.theme === 2)
					return 642 - powerBarBg1.x;
				else if(CarStatus.theme === 3)
					return 642 - powerBarBg1.x;
			}
			origin.y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 210 - powerBarBg1.y;
				else if(CarStatus.theme === 2)
					return 214 - powerBarBg1.y;
				else if(CarStatus.theme === 3)
					return 209 - powerBarBg1.y;
			}
			angle: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 35;
				else if(CarStatus.theme === 2)
					return 29;
				else if(CarStatus.theme === 3)
					return 28;
			}
		}
		Image {
			id:powerBar1
			x:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 0;
				else if(CarStatus.theme === 2)
					return 676 - powerBarBg1.x;
				else if(CarStatus.theme === 3)
					return 456 - powerBarBg1.x;
			}
			y:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 0;
				else if(CarStatus.theme === 2)
					return 161 - powerBarBg1.y;
				else if(CarStatus.theme === 3)
					return 23 - powerBarBg1.y;
			}
			opacity: 0.0
			visible: CarStatus.powerMeter <= 60
			transform: Rotation {
				origin.x: {
					if(CarStatus.theme !== 2)
						return 641 - powerBarBg1.x - powerBar1.x;
					else if(CarStatus.theme ===2)
						return 642 - powerBarBg1.x - powerBar1.x;
				}
				origin.y: {
					if(CarStatus.theme === 1 || CarStatus.theme === 0)
						return 210 - powerBarBg1.y - powerBar1.y;
					else if(CarStatus.theme === 2)
						return 214 - powerBarBg1.y - powerBar1.y;
					else if(CarStatus.theme === 3)
						return 209 - powerBarBg1.y - powerBar1.y;
				}
				angle: {
					if(CarStatus.theme === 1 || CarStatus.theme === 0)
						return CarStatus.powerMeterAngle;
					else if(CarStatus.theme === 2)
						return CarStatus.powerMeterAngle2;
					else if(CarStatus.theme === 3)
						return CarStatus.powerMeterAngle4;
				}
			}
			source: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return "qrc:/centralPanel/images/centralPanel/powerBar.png";
				else if(CarStatus.theme ===2)
					return "qrc:/theme2/images/theme2/centralPanel/powerBar.png";
				else if(CarStatus.theme ===3)
					return "qrc:/theme3/images/theme3/centralPanel/powerBar.png";
			}
		}
	}

	Item{
		id:powerBarBg
		x:650
		y:31
		width: 210
		height: 180
		clip: true
		transform: Rotation {
			id:powerBarRotation
			origin.x: {
				if(CarStatus.theme !== 2)
					return 641 - powerBarBg.x;
				else if(CarStatus.theme ===2)
					return 642 - powerBarBg.x;
			}
			origin.y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 210 - powerBarBg.y;
				else if(CarStatus.theme === 2)
					return 214 - powerBarBg.y;
				else if(CarStatus.theme === 3)
					return 209 - powerBarBg.y;
			}
			angle: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 35;
				else if(CarStatus.theme === 2)
					return 29;
				else if(CarStatus.theme === 3)
					return 27;
			}
		}
		Image {
			id:powerBar
			x:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 704 - powerBarBg.x;
				else if(CarStatus.theme === 2)
					return 676 - powerBarBg.x;
				else if(CarStatus.theme === 3)
					return 456 - powerBarBg.x;
			}
			y:{
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 210 - powerBarBg.y;
				else if(CarStatus.theme === 2)
					return 161 - powerBarBg.y;
				else if(CarStatus.theme === 3)
					return 23 - powerBarBg.y;
			}
			opacity: 0.0
			visible: CarStatus.powerMeter > 60
			transform: Rotation {
				origin.x: {
					if(CarStatus.theme !== 2)
						return 641 - powerBarBg.x - powerBar.x;
					else if(CarStatus.theme ===2)
						return 642 - powerBarBg.x - powerBar.x;
				}
				origin.y: {
					if(CarStatus.theme === 1 || CarStatus.theme === 0)
						return 210 - powerBarBg.y - powerBar.y;
					else if(CarStatus.theme === 2)
						return 214 - powerBarBg.y - powerBar.y;
					else if(CarStatus.theme === 3)
						return 209 - powerBarBg.y - powerBar.y;
				}
				angle: {
					if(CarStatus.theme === 1 || CarStatus.theme === 0)
						return CarStatus.powerMeterAngle1
					else if(CarStatus.theme === 2)
						return CarStatus.powerMeterAngle3;
					else if(CarStatus.theme === 3)
						return CarStatus.powerMeterAngle5;
				}
			}
			source: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return "qrc:/centralPanel/images/centralPanel/powerBar.png";
				else if(CarStatus.theme ===2)
					return "qrc:/theme2/images/theme2/centralPanel/powerBar.png";
				else if(CarStatus.theme ===3)
					return "qrc:/theme3/images/theme3/centralPanel/powerBar.png";
			}
		}
	}

	Item {
		id: power
		x: 755
		y: 208
		height: 105
		width: 70
		clip:(CarStatus.theme !== 2) ? true : false
		Item {
			id: powerClip
			x: {
				if(CarStatus.theme !== 2)
					return 694 - power.x;
				else if(CarStatus.theme ===2)
					return 716 - power.x;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme !== 2)
					return 210 - power.y;
				else if(CarStatus.theme ===2)
					return 184 - power.y;
			}
			width: 120
			height: 164
			clip: true
			transform: Rotation {
				id:powerRotation
				origin.x: 641 - power.x - powerClip.x; origin.y: 211 - power.y - powerClip.y;
				angle: 45
			}
			Image {
				transform: Rotation {
					origin.x: 641 - power.x - powerClip.x; origin.y: 211 - power.y - powerClip.y;
					angle: -powerRotation.angle
				}
				visible: CarStatus.theme !== 3
				source: {
					if(CarStatus.theme !== 2)
						return "qrc:/centralPanel/images/centralPanel/power_kedu.png";
					else if(CarStatus.theme === 2)
						return "qrc:/theme2/images/theme2/centralPanel/power_kedu.png";
				}
			}
		}
	}

	Item {
		id: power2
		x: 694
		y: 46
		width: 120
		height: 164
		clip: (CarStatus.theme !== 2) ? true : false
		transform: Rotation {
			id:powerRotation2
			origin.x: 641 - power2.x; origin.y: 211 - power2.y;
			angle: -5
		}
		Image {
			id: powerClip2
			x: {
				if(CarStatus.theme !== 2)
					return 694 - power2.x;
				else if(CarStatus.theme ===2)
					return 716 - power2.x;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme !== 2)
					return 210 - power2.y;
				else if(CarStatus.theme ===2)
					return 184 - power2.y;
			}
			visible: CarStatus.theme !== 3
			transform: Rotation {
				origin.x: 641 - power2.x - powerClip2.x; origin.y: 211 - power2.y - powerClip2.y;
				angle: -powerRotation2.angle
			}
			source: {
				if(CarStatus.theme !== 2)
					return "qrc:/centralPanel/images/centralPanel/power_kedu.png";
				else if(CarStatus.theme === 2)
					return "qrc:/theme2/images/theme2/centralPanel/power_kedu.png";
			}
		}

	}

	Image {
		id: powerkeduBg//111111111111111111111
		x: {
			if(CarStatus.theme === 2)
				return 673;
			else if(CarStatus.theme === 3)
				return 674;
			else
				return 0;
		}
		y: {
			if(CarStatus.theme === 2)
				return 158;
			else if(CarStatus.theme === 3)
				return 153;
			else
				return 0;
		}
		opacity: 1.0
		visible: CarStatus.theme === 2 || CarStatus.theme === 3
		source: {
			if(CarStatus.theme === 2)
				return "qrc:/theme2/images/theme2/centralPanel/power_keduBg.png";
			else if(CarStatus.theme === 3)
				return "qrc:/theme3/images/theme3/centralPanel/power_keduBg.png";
			else
				return "";
		}
	}

	Image {
		id: barBg
		x: 464
		y: 36
		opacity: 0.0
		visible: CarStatus.theme === 2
		source: "qrc:/theme2/images/theme2/centralPanel/barBg.png"
	}

	Item {
		id: rpmNum
		transform: Rotation {
			origin.x: 641; origin.y: 211;
			angle: -2
		}
		y: CarStatus.theme === 2 ? 5 : 0
		Image {
			id:rpm10
			x: 676
			y: 50
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm10.png"
		}
		Image {
			id:rpm9
			x: 637
			y: 42
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm9.png"
		}
		Image {
			id:rpm8
			x: 586
			y: 50
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm8.png"
		}
		Image {
			id:rpm7
			x: 541
			y: 70
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm7.png"
		}
		Image {
			id:rpm6
			x: 504
			y: 102
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm6.png"
		}
		Image {
			id:rpm5
			x: 483
			y: 145
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm5.png"
		}
		Image {
			id:rpm4
			x: 471
			y: 190
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm4.png"
		}
		Image {
			id:rpm3
			x: 482
			y: 243
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm3.png"
		}
		Image {
			id:rpm2
			x: 503
			y: 284
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm2.png"
		}
		Image {
			id:rpm1
			x: 538
			y: 322
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm1.png"
		}
		Image {
			id:rpm0
			x: 577
			y: 344
			opacity: 0.0
			source: "qrc:/centralPanel/images/centralPanel/rpm0.png"
		}
	}

	Image {
		id: point
		x: 551
		y: 304
		opacity: 0.0
		source: "qrc:/centralPanel/images/centralPanel/point.png"
		transform: Rotation {
			id: pointRotation
			origin.x: 641 - point.x;
			origin.y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 211 - point.y;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 210 - point.y;
			}
			angle: CarStatus.rpmAngle - 2
		}
	}

	Item {
		id: powerNum
		Image {
			id:power90
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 776;
				else if(CarStatus.theme === 2)
					return 791;
				else if(CarStatus.theme === 3)
					return 793;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 207;
				else if(CarStatus.theme === 2)
					return 163;
				else if(CarStatus.theme === 3)
					return 160;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/power90.png"
		}
		Image {
			id:power60
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 774;
				else if(CarStatus.theme === 2)
					return 797;
				else if(CarStatus.theme === 3)
					return 799;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 237;
				else if(CarStatus.theme === 2)
					return 204;
				else if(CarStatus.theme === 3)
					return 202;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/power60.png"
		}
		Image {
			id:power30
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 763;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 792;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 267;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 243;
//				else if(CarStatus.theme ===3)
//					return 153 - power.y;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/power30.png"
		}
		Image {
			id:power0
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 755;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 785;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 294;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 282;
//				else if(CarStatus.theme ===3)
//					return 153 - power.y;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/power0.png"
		}
		Image {
			id:powerM10
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 725;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 749;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 311;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 315;
//				else if(CarStatus.theme ===3)
//					return 153 - power.y;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/powerM10.png"
		}
		Image {
			id:powerM20
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 698;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 715;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 330;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 344;
//				else if(CarStatus.theme ===3)
//					return 153 - power.y;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/powerM20.png"
		}
		Image {
			id:powerM30
			x: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 667;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 675;
	//			else if(CarStatus.theme ===3)
	//				return 17;
			}
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 347;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 365;
//				else if(CarStatus.theme ===3)
//					return 153 - power.y;
			}
			opacity: 0.0
			source:"qrc:/centralPanel/images/centralPanel/powerM30.png"
		}
	}

	property int gearValue: CarStatus.gear
	property int gearValueShow: 1
	//	档位定义如下：0:Void,1:P 档,2:N 档,
	//	3:R 档,4:D 档,5:Void ,6:E 档,7:Void
	onGearValueChanged: {
		switch(gearValue){
		case 1:
			gearValueShow = 1
			break;
		case 2:
			gearValueShow = 2
			break;
		case 3:
			gearValueShow = 3
			break;
		case 4:
			gearValueShow = 4
			break;
		case 6:
			gearValueShow = 5
			break;
		default:
			gearValueShow = 2
			break;
		}
	}

	Image {
		id: gear
		x: 627
		y: 260
		opacity: 0.0
		source: {
			switch(gearValueShow){
			case 1:"qrc:/centralPanel/images/centralPanel/P.png";break;
			case 2:"qrc:/centralPanel/images/centralPanel/N.png";break;
			case 3:"qrc:/centralPanel/images/centralPanel/R.png";break;
			case 4:"qrc:/centralPanel/images/centralPanel/D.png";break;
			case 5:"qrc:/centralPanel/images/centralPanel/E.png";break;
			default:"qrc:/centralPanel/images/centralPanel/N.png";break;
			}
		}
	}

	DigitValue {
		id: speed
		y: -2
		opacity: 0.0
		visible: CarStatus.theme === 1 || CarStatus.theme === 0
		anchors.bottom: lineBg.top
		anchors.bottomMargin: -25
		anchors.horizontalCenter: lineBg.horizontalCenter
		icon0: "qrc:/centralPanel/images/centralPanel/0.png"
		icon1: "qrc:/centralPanel/images/centralPanel/1.png"
		icon2: "qrc:/centralPanel/images/centralPanel/2.png"
		icon3: "qrc:/centralPanel/images/centralPanel/3.png"
		icon4: "qrc:/centralPanel/images/centralPanel/4.png"
		icon5: "qrc:/centralPanel/images/centralPanel/5.png"
		icon6: "qrc:/centralPanel/images/centralPanel/6.png"
		icon7: "qrc:/centralPanel/images/centralPanel/7.png"
		icon8: "qrc:/centralPanel/images/centralPanel/8.png"
		icon9: "qrc:/centralPanel/images/centralPanel/9.png"
		value:  CarStatus.speed > 180 ? 180 : CarStatus.speed
		spacing: ((CarStatus.speed >= 10 && CarStatus.speed <= 19) || CarStatus.speed >= 100) ? -10 : 0
	}

	DigitValue {
		id: speedTheme2
		y: -2
		opacity: 0.0
		visible: CarStatus.theme === 2 || CarStatus.theme === 3
		anchors.bottom: lineBg.top
		anchors.bottomMargin: -25
		anchors.horizontalCenter: lineBg.horizontalCenter
		icon0: "qrc:/theme2/images/theme2/centralPanel/0.png"
		icon1: "qrc:/theme2/images/theme2/centralPanel/1.png"
		icon2: "qrc:/theme2/images/theme2/centralPanel/2.png"
		icon3: "qrc:/theme2/images/theme2/centralPanel/3.png"
		icon4: "qrc:/theme2/images/theme2/centralPanel/4.png"
		icon5: "qrc:/theme2/images/theme2/centralPanel/5.png"
		icon6: "qrc:/theme2/images/theme2/centralPanel/6.png"
		icon7: "qrc:/theme2/images/theme2/centralPanel/7.png"
		icon8: "qrc:/theme2/images/theme2/centralPanel/8.png"
		icon9: "qrc:/theme2/images/theme2/centralPanel/9.png"
		value:  CarStatus.speed > 180 ? 180 : CarStatus.speed
		spacing: ((CarStatus.speed >= 10 && CarStatus.speed <= 19)) ? -10 : 2
	}

	Image {
		id: km
		x: 524
		y: {
			if(CarStatus.theme === 1 || CarStatus.theme === 0)
				return 100;
			else if(CarStatus.theme === 2 || CarStatus.theme === 3)
				return 103;
		}

		opacity: 0.0
		source: {
			if(CarStatus.theme === 1 || CarStatus.theme === 0)
				return "qrc:/centralPanel/images/centralPanel/km.png";
			else if(CarStatus.theme === 2 || CarStatus.theme === 3)
				return "qrc:/theme2/images/theme2/centralPanel/km.png"
		}

	}

	Item {
		id: lineBg
		x: 641
		y: 211
		width: 0
		height: 50
		clip: true
		Image {
			id: backG
			x: 543 - lineBg.x
			y: {
				if(CarStatus.theme === 1 || CarStatus.theme === 0)
					return 201 - lineBg.y;
				else if(CarStatus.theme === 2 || CarStatus.theme === 3)
					return 204 - lineBg.y;
			}

			source: {
				if(CarStatus.theme === 0 || CarStatus.theme === 1)
					return "qrc:/centralPanel/images/centralPanel/midLine.png";
				else if(CarStatus.theme === 2)
					return "qrc:/theme2/images/theme2/centralPanel/midLine.png";
				else if(CarStatus.theme === 3)
					return "qrc:/theme3/images/theme3/centralPanel/midLine.png";
			}

		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: centralPanel; opacity: 0.0 }
			PropertyChanges { target: circle; opacity: 0.0 }
			PropertyChanges { target: powerLayer; opacity: 0.0 }
			PropertyChanges { target: point; opacity: 0.0 }
			PropertyChanges { target: rpmCursor; opacity: 0.0 }
			PropertyChanges { target: rotation; angle: -160 }
			PropertyChanges { target: rpm10; opacity: 0.0 }
			PropertyChanges { target: rpm9; opacity: 0.0 }
			PropertyChanges { target: rpm8; opacity: 0.0 }
			PropertyChanges { target: rpm7; opacity: 0.0 }
			PropertyChanges { target: rpm6; opacity: 0.0 }
			PropertyChanges { target: rpm5; opacity: 0.0 }
			PropertyChanges { target: rpm4; opacity: 0.0 }
			PropertyChanges { target: rpm3; opacity: 0.0 }
			PropertyChanges { target: rpm2; opacity: 0.0 }
			PropertyChanges { target: rpm1; opacity: 0.0 }
			PropertyChanges { target: rpm0; opacity: 0.0 }
			PropertyChanges { target: powerRotation; angle: 45 }
			PropertyChanges { target: power90; opacity: 0.0 }
			PropertyChanges { target: powerRotation2; angle: 0 }
			PropertyChanges { target: power60; opacity: 0.0 }
			PropertyChanges { target: power30; opacity: 0.0 }
			PropertyChanges { target: power0; opacity: 0.0 }
			PropertyChanges { target: powerM10; opacity: 0.0 }
			PropertyChanges { target: powerM20; opacity: 0.0 }
			PropertyChanges { target: powerM30; opacity: 0.0 }
			PropertyChanges { target: lineBg; width: 0 }
			PropertyChanges { target: lineBg; x: 641 }
			PropertyChanges { target: km; opacity: 0.0 }
			PropertyChanges { target: speed; opacity: 0.0 }
			PropertyChanges { target: speedTheme2; opacity: 0.0 }
			PropertyChanges { target: gear; opacity: 0.0 }
			PropertyChanges { target: rpmBar; opacity: 0.0 }
			PropertyChanges { target: powerBar; opacity: 0.0 }
			PropertyChanges { target: powerBar1; opacity: 0.0 }
			PropertyChanges { target: barBg; opacity: 0.0 }
			PropertyChanges { target: keduBg; opacity: 0.0 }
			PropertyChanges { target: pointRotation; angle: -2 }
//			PropertyChanges { target: powerBarRotation; angle: 35 }
//			PropertyChanges { target: rpmBarRotation1; angle: 0 }
		},
		State {
			name: "show"
			PropertyChanges { target: centralPanel; opacity: 1.0 }
			PropertyChanges { target: circle; opacity: 1.0 }
			PropertyChanges { target: powerLayer; opacity: 1.0 }
			PropertyChanges { target: point; opacity: 1.0 }
			PropertyChanges { target: rpmCursor; opacity: 1.0 }
			PropertyChanges { target: rotation; angle: 19 }
			PropertyChanges { target: rpm10; opacity: 1.0 }
			PropertyChanges { target: rpm9; opacity: 1.0 }
			PropertyChanges { target: rpm8; opacity: 1.0 }
			PropertyChanges { target: rpm7; opacity: 1.0 }
			PropertyChanges { target: rpm6; opacity: 1.0 }
			PropertyChanges { target: rpm5; opacity: 1.0 }
			PropertyChanges { target: rpm4; opacity: 1.0 }
			PropertyChanges { target: rpm3; opacity: 1.0 }
			PropertyChanges { target: rpm2; opacity: 1.0 }
			PropertyChanges { target: rpm1; opacity: 1.0 }
			PropertyChanges { target: rpm0; opacity: 1.0 }
			PropertyChanges { target: powerRotation; angle: 0 }
			PropertyChanges { target: power90; opacity: 1.0 }
			PropertyChanges { target: powerRotation2; angle: 71 }
			PropertyChanges { target: power60; opacity: 1.0 }
			PropertyChanges { target: power30; opacity: 1.0 }
			PropertyChanges { target: power0; opacity: 1.0 }
			PropertyChanges { target: powerM10; opacity: 1.0 }
			PropertyChanges { target: powerM20; opacity: 1.0 }
			PropertyChanges { target: powerM30; opacity: 1.0 }
			PropertyChanges { target: lineBg; width: 201 }
			PropertyChanges { target: lineBg; x: 543 }
			PropertyChanges { target: km; opacity: 1.0 }
			PropertyChanges { target: speed; opacity: 1.0 }
			PropertyChanges { target: speedTheme2; opacity: 1.0 }
			PropertyChanges { target: gear; opacity: 1.0 }
			PropertyChanges { target: rpmBar; opacity: 1.0 }
			PropertyChanges { target: powerBar; opacity: 1.0 }
			PropertyChanges { target: powerBar1; opacity: 1.0 }
			PropertyChanges { target: barBg; opacity: 1.0 }
			PropertyChanges { target: keduBg; opacity: 1.0 }
			PropertyChanges { target: pointRotation; angle: CarStatus.rpmAngle - 2 }
//			PropertyChanges { target: powerBarRotation; angle: CarStatus.powerMeterAngle }
//			PropertyChanges { target: rpmBarRotation1; angle: 180 - rpmBarRotation.angle + CarStatus.rpmAngle }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
				NumberAnimation {target: centralPanel; property: "opacity";}
				ParallelAnimation{
					NumberAnimation {target: circle; property: "opacity"; duration: 200}
					NumberAnimation {target: barBg; property: "opacity"; duration: 200}
					NumberAnimation {target: powerLayer; property: "opacity"; duration: 200}
				}
				NumberAnimation {target: point; property: "opacity"; duration: 300}
				ParallelAnimation{
					SequentialAnimation{
						ParallelAnimation{
							NumberAnimation {target: pointRotation; property: "angle"; from:-2; to: 180-2; duration: 1000}//
							NumberAnimation {target: rpmCursor; property: "opacity"; duration: 100}
							NumberAnimation {target: rotation; property: "angle"; duration: 1000}
						}
						NumberAnimation {target: rpm10; property: "opacity";}
						ParallelAnimation{
							NumberAnimation {target: pointRotation; property: "angle"; to: -2; duration: 1000}
							SequentialAnimation{
								NumberAnimation {target: rpm9; property: "opacity";duration: 100}
								NumberAnimation {target: rpm8; property: "opacity";duration: 100}
								NumberAnimation {target: rpm7; property: "opacity";duration: 100}
								NumberAnimation {target: rpm6; property: "opacity";duration: 100}
								NumberAnimation {target: rpm5; property: "opacity";duration: 100}
								NumberAnimation {target: rpm4; property: "opacity";duration: 100}
								NumberAnimation {target: rpm3; property: "opacity";duration: 100}
								NumberAnimation {target: rpm2; property: "opacity";duration: 100}
								NumberAnimation {target: rpm1; property: "opacity";duration: 100}
								NumberAnimation {target: rpm0; property: "opacity";duration: 100}
							}
						}
					}
					SequentialAnimation{
						ParallelAnimation{
							NumberAnimation {target: powerRotation; property: "angle";duration: 400}
						}
						NumberAnimation {target: power90; property: "opacity";duration: 100}
						ParallelAnimation{
							NumberAnimation {target: powerRotation2; property: "angle";duration: 1800}
							SequentialAnimation{
								NumberAnimation {target: power60; property: "opacity";duration: 300}
								NumberAnimation {target: power30; property: "opacity";duration: 300}
								NumberAnimation {target: power0; property: "opacity";duration: 300}
								NumberAnimation {target: powerM10; property: "opacity";duration: 300}
								NumberAnimation {target: powerM20; property: "opacity";duration: 300}
								NumberAnimation {target: powerM30; property: "opacity";duration: 300}
							}
						}
					}
				}
				ParallelAnimation {
					NumberAnimation {target: lineBg; property: "width";duration: 500}
					NumberAnimation {target: lineBg; property: "x";duration: 500}
				}
				NumberAnimation {target: km; property: "opacity";duration: 500}
				ParallelAnimation{
					NumberAnimation {target: speed; property: "opacity";}
					NumberAnimation {target: speedTheme2; property: "opacity";}
					NumberAnimation {target: gear; property: "opacity";}
					NumberAnimation {target: powerBar; property: "opacity";}
					NumberAnimation {target: powerBar1; property: "opacity";}
					NumberAnimation {target: keduBg; property: "opacity";}
				}
				ParallelAnimation{
					NumberAnimation {target: pointRotation; property: "angle";duration: 500}
					NumberAnimation {target: rpmBarRotation1; property: "angle"; from: 0;to:(CarStatus.theme === 0 || CarStatus.theme === 1) ? 180 - rpmBarRotation.angle + CarStatus.rpmAngle + 0.2 - 2 : 180 - rpmBarRotation.angle + CarStatus.rpmAngle + 0.1;duration: 500}
//					NumberAnimation {target: powerBarRotation; property: "angle"; from: 35;to: CarStatus.powerMeterAngle;duration: 500}
				}
				NumberAnimation {target: rpmBar; property: "opacity";}
			}
		}
	]

}
