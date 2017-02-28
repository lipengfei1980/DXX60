import QtQuick 2.3

Rectangle {
	id: dashboardPanel
	width: 1280
	height: 422
	color: "black"
	state: ""

	property bool loaderVisible: dashboardPanel.parent.visible
	property bool updateStatus: CarStatus.updateShow
	onLoaderVisibleChanged: {
		if(!updateStatus && loaderVisible)
			dashboardPanel.state = Qt.binding(function() { return CarStatus.dashboardStatus });
		else
			dashboardPanel.state = "";
	}

	onUpdateStatusChanged: {
		if(updateStatus)
			dashboardPanel.state = "updatePanel";
		else if(!updateStatus && loaderVisible)
			dashboardPanel.state = Qt.binding(function() { return CarStatus.dashboardStatus });
	}

	MainPanel {
		id: mainPanel
		state: ""
	}

//	ChargePanel {
//		id: chargePanel
//		state: ""
//	}

//	DormancyPanel {
//		id: dormancyPanel
//		state: ""
//	}

	IndicatorLamp {
		id: indicatorLamp
		state: ""
	}

	GlobalPanel {
		id: globalPanel
		state: ""
	}

	WarningPanel{
		id:warningPanel
		state: ""
	}

	UpdatePanel{
		id:updatePanel
		state: ""
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: mainPanel; state: "" }
			PropertyChanges { target: chargePanel; state: "" }
			PropertyChanges { target: dormancyPanel; state: "" }
			PropertyChanges { target: indicatorLamp; state: "" }
			PropertyChanges { target: globalPanel; state: "" }
			PropertyChanges { target: warningPanel; state: "" }
			PropertyChanges { target: updatePanel; state: "" }
		},
		State {
			name: "mainPanel"
			PropertyChanges { target: chargePanel; state: "" }
			PropertyChanges { target: dormancyPanel; state: "" }
			PropertyChanges { target: mainPanel; state: "show" }
			PropertyChanges { target: indicatorLamp; state: "show" }
			PropertyChanges { target: globalPanel; state: "show" }
			PropertyChanges { target: warningPanel; state: "show" }
			PropertyChanges { target: updatePanel; state: "" }
		},
//		State {
//			name: "chargePanel"
//			PropertyChanges { target: mainPanel; state: "" }
//			PropertyChanges { target: dormancyPanel; state: "" }
//			PropertyChanges { target: indicatorLamp; state: "" }
//			PropertyChanges { target: chargePanel; state: "show" }
//			PropertyChanges { target: globalPanel; state: "" }
//			PropertyChanges { target: warningPanel; state: "show" }
//			PropertyChanges { target: updatePanel; state: "" }
//		},
//		State {
//			name: "dormancyPanel"
//			PropertyChanges { target: mainPanel; state: "" }
//			PropertyChanges { target: chargePanel; state: "" }
//			PropertyChanges { target: indicatorLamp; state: "" }
//			PropertyChanges { target: globalPanel; state: "" }
//			PropertyChanges { target: dormancyPanel; state: "show" }
//			PropertyChanges { target: warningPanel; state: "show" }
//			PropertyChanges { target: updatePanel; state: "" }
//		},
		State {
			name: "updatePanel"
			PropertyChanges { target: mainPanel; state: "" }
			PropertyChanges { target: chargePanel; state: "" }
			PropertyChanges { target: indicatorLamp; state: "" }
			PropertyChanges { target: globalPanel; state: "" }
			PropertyChanges { target: dormancyPanel; state: "" }
			PropertyChanges { target: warningPanel; state: "" }
			PropertyChanges { target: updatePanel; state: "show" }
		}
	]
}
