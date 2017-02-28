import QtQuick 2.3

Row {
	id: digitValue

	property int value: 0

	property int num6: 0
	property int num5: 0
	property int num4: 0
	property int num3: 0
	property int num2: 0
	property int num1: 0

	property int showNum: 1

	property bool completed: false

	property var imageSource: new Array
	property var icon0: ""
	property var icon1: ""
	property var icon2: ""
	property var icon3: ""
	property var icon4: ""
	property var icon5: ""
	property var icon6: ""
	property var icon7: ""
	property var icon8: ""
	property var icon9: ""

	onValueChanged: {
		num6 = value / 100000;
		num5 = (value % 100000) / 10000;
		num4 = (value % 10000) / 1000;
		num3 = (value % 1000) / 100;
		num2 = (value % 100) / 10;
		num1 = value % 10;
	}

	Image {
		id: num6Image
		visible: showNum == 6 ? true :
								((num6 == 0) ? false : true)
		source: completed ? digitValue.imageSource[num6] : ""
	}
	Image {
		id: num5Image
		visible: showNum >= 5 ? true :
								((num6 == 0 && num5 ==0) ? false : true)
		source: completed ? digitValue.imageSource[num5] : ""
	}
	Image {
		id: num4Image
		visible: showNum >= 4 ? true :
								((num6 == 0 && num5 ==0 && num4 ==0) ? false : true)
		source: completed ? digitValue.imageSource[num4] : ""
	}
	Image {
		id: num3Image
		visible: showNum >= 3 ? true :
								((num6 == 0 && num5 ==0 && num4 ==0 && num3 ==0) ? false : true)
		source: completed ? digitValue.imageSource[num3] : ""
	}
	Image {
		id: num2Image
		visible: showNum >= 2 ? true :
								(num6 == 0 && num5 ==0 && num4 ==0 && num3 ==0 && num2 ==0) ? false : true
		source: completed ? digitValue.imageSource[num2] : ""
	}
	Image {
		id: num1Image
		source: completed ? digitValue.imageSource[num1] : ""
	}
	Component.onCompleted: {
		if (!completed) {
			imageSource[0] = icon0;
			imageSource[1] = icon1;
			imageSource[2] = icon2;
			imageSource[3] = icon3;
			imageSource[4] = icon4;
			imageSource[5] = icon5;
			imageSource[6] = icon6;
			imageSource[7] = icon7;
			imageSource[8] = icon8;
			imageSource[9] = icon9;
			completed = true;
		}
	}
}

