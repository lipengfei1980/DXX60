import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Rectangle {
	width: 780
	height: 800

	CheckBox {
		x: 10
		y: 10
		checked: true
		text: "Open Serial"
		onClicked: HtCarStatus.active = checked
		Component.onCompleted: HtCarStatus.active = true
	}

	AllHave {
		id: allHave
		x: 10
		y: 40
	}

	NotAllHave {
		id: notAllHave
        x: 200
		y: 10
	}

	Send {
		id: send
		x: 400
		y: 10
	}
}
