import QtQuick 2.3

Item {
	id: exitPanel
	state: CarStatus.exitPanelState
	opacity: 0.0

	Image {
		id: longToExit
		x: 929
		y: 159
		opacity: 1.0
		width: 138
		height: 36
		source: {
			if(CarStatus.theme === 1 || CarStatus.theme === 0)
				return "qrc:/menuPanel/images/menuPanel/longToExit.png";
			else if(CarStatus.theme ===2)
				return "qrc:/theme2/images/theme2/menuPanel/longToExit.png";
			else if(CarStatus.theme ===3)
				return "qrc:/theme3/images/theme3/menuPanel/longToExit.png";
		}
	}
	states: [
		State {
			name: ""
			PropertyChanges { target: exitPanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: exitPanel; opacity: 1.0 }
		}
	]
}
