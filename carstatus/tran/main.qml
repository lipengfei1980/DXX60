import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Rectangle {
	width: 800
    height: 600

	AllHave {
		id: allHave
		x: 5
		y: 0
	}

	NotAllHave {
		id: notAllHave
        x: 310
		y: 0
	}

	CheckBox {
		id: checkBox
        x: 650
		y: 50
		text: "autoSend"
	}

	Button {
        x: 650
		y: 70
		text: "send"
		width: 100
		onClicked: SerialTran.sendDownFrame()
	}

	Timer {
		id: timer
		interval: 100;
		running: checkBox.checked;
		repeat: true
		onTriggered: {
			SerialTran.sendDownFrame()
		}
	}


	Recv {
		id: recv
		x: 550
		y: 590
	}
}
