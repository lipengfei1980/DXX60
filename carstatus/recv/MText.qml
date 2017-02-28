import QtQuick 2.0

Grid{
	property alias mtext1: text1.text
	property string mtext2;
	property alias mtext3: text3.text;
	property color color1;

	rows: 1;
	Text {
		id: text1
		color:color1
	}

	Text {
		id: text2
		color: "#e53473"
		text: mtext2 + ";  "
	}

	Text {
		id: text3
		color: "#2ccc1e"
	}
}
