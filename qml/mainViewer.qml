import QtQuick 2.3
import "content"

Rectangle {
	id: gardenia
	width: 1280
	height: 422
	color: "black"

	property int powerStatus: CarStatus.powerStatus
	property int lastPowerStatus: 2
	property int chargeLine: CarStatus.chargeLine

//	onChargeLineChanged: {
//		statusCtrl();
//	}

//	onPowerStatusChanged: {
//		statusCtrl();
//	}

	function statusCtrl(){
//		console.log("last power",lastPowerStatus,"new power", powerStatus);
//		console.log("chargePanel.ctrlVisible",chargePanel.ctrlVisible);
//		if(dashboardPanel.active == true){		// disable dashboardPanel
//			dashboardPanel.ctrlVisible = false;
//			//stop dashboardPanel timer
//			dashboardPanelTimer.running = false;
//		} else{
//			//stop dashboardPanel timer
//			dashboardPanelTimer.running = false;
//		}


//		if(splashPanel.active == true){			// disable splashPanel
//			splashPanel.ctrlVisible = false;
//		} else{
//			// nothing to do
//		}

//		if(dormancyPanel.active == true){		// disable dormancyPanel
//			dormancyPanel.ctrlVisible = false;
//		} else{
//			// nothing to do
//		}


		switch(powerStatus) {
		case 0:	// show dormancyPanel or chargePanel, not to show logo
			if(dashboardPanel.active == true){		// disable dashboardPanel
				dashboardPanel.ctrlVisible = false;
				//stop dashboardPanel timer
				dashboardPanelTimer.running = false;
				console.log("111111111111111111111111111");
			} else{
				//stop dashboardPanel timer
				dashboardPanelTimer.running = false;
			}

			if(splashPanel.active == true){			// disable splashPanel
				CarStatus.musicStatus = false;
				splashPanel.ctrlVisible = false;
			} else{
				// nothing to do
			}

			switch(chargeLine){
			case 0:// show dormancyPanel
				if(chargePanel.active == true){			// disable chargePanel
					chargePanel.ctrlVisible = false;
					//stop chargePanel timer
					chargePanelTimer.running = false;
				} else{
					//stop chargePanel timer
					chargePanelTimer.running = false;
				}

				if(dormancyPanel.active == false){		// enable dormancyPanel
					dormancyPanel.active = true;
					dormancyPanel.ctrlVisible = true;
				} else{
					dormancyPanel.ctrlVisible = true;
				}
				break;
			case 1:// show chargePanel
				if(dormancyPanel.active == true){		// disable dormancyPanel
					dormancyPanel.ctrlVisible = false;
				} else{
					// nothing to do
				}

				if(chargePanel.active == false){		// enable chargePanel
					chargePanel.active = true;
					chargePanel.ctrlVisible = true;
					dashboardPanelTimer.running = false;

				} else{
					chargePanel.ctrlVisible = true;
					dashboardPanelTimer.running = false;
				}
				break;
			default:
				// nothing to do
				break;
			}
			break;
		case 1:// show chargePanel or dashboardPanel, maybe to show logo
			if(dormancyPanel.active == true){		// disable dormancyPanel
				dormancyPanel.ctrlVisible = false;
			} else{
				// nothing to do
			}

			switch(chargeLine){
			case 0:// show dashboardPanel
				if(chargePanel.active == true){			// disable chargePanel
					chargePanel.ctrlVisible = false;
					//stop chargePanel timer
					chargePanelTimer.running = false;
				} else{
					//stop chargePanel timer
					chargePanelTimer.running = false;
				}

				if( (lastPowerStatus == 0 || lastPowerStatus == 2) && powerStatus == 1){//show logo

					CarStatus.musicStatus = true;

					if(dashboardPanel.active == true){		// disable dashboardPanel
						dashboardPanel.ctrlVisible = false;
						//stop dashboardPanel timer
						dashboardPanelTimer.running = false;
					} else{
						//stop dashboardPanel timer
						dashboardPanelTimer.running = false;
					}

					if(splashPanel.active == false){		// enable splashPanel
						splashPanel.active = true;
						splashPanel.ctrlVisible = true;
					} else{
						splashPanel.ctrlVisible = true;
					}

					if(dashboardPanel.active == false){		// enable dashboardPanel and timer
						dashboardPanel.active = true;
						dashboardPanelTimer.running = true;

					} else{
						dashboardPanelTimer.running = true;
					}

				}else{//not show logo
					if(splashPanel.active == true){			// disable splashPanel
						CarStatus.musicStatus = false;
						splashPanel.ctrlVisible = false;
					} else{
						// nothing to do
					}

					if(dashboardPanel.active == false){		// enable dashboardPanel
						dashboardPanel.active = true;
						dashboardPanel.ctrlVisible = true;

					} else{
						dashboardPanel.ctrlVisible = true;
					}
				}

				break;
			case 1:// show chargePanel
				if(dashboardPanel.active == true){		// disable dashboardPanel
					dashboardPanel.ctrlVisible = false;
					//stop dashboardPanel timer
					dashboardPanelTimer.running = false;
				} else{
					//stop dashboardPanel timer
					dashboardPanelTimer.running = false;
				}

				if( (lastPowerStatus == 0 || lastPowerStatus == 2) && powerStatus == 1){//show logo
					CarStatus.musicStatus = true;

					if(chargePanel.active == true){			// disable chargePanel
						chargePanel.ctrlVisible = false;
						//stop chargePanel timer
						chargePanelTimer.running = false;
					} else{
						//stop chargePanel timer
						chargePanelTimer.running = false;
					}

					if(splashPanel.active == false){		// enable splashPanel
						splashPanel.active = true;
						splashPanel.ctrlVisible = true;
					} else{
						splashPanel.ctrlVisible = true;
					}

					if(chargePanel.active == false){		// enable chargePanel and timer
						chargePanel.active = true;
						chargePanelTimer.running = true;

					} else{
						chargePanelTimer.running = true;
					}
				}else{//not show logo
					if(splashPanel.active == true){			// disable splashPanel
						CarStatus.musicStatus = false;
						splashPanel.ctrlVisible = false;
					} else{
						// nothing to do
					}

					if(chargePanel.active == false){		// enable chargePanel
						chargePanel.active = true;
						chargePanel.ctrlVisible = true;

					} else{
						chargePanel.ctrlVisible = true;
					}
				}

				break;
			default:
				// nothing to do
				break;
			}
			break;

		default:
			break;
		}
		if(lastPowerStatus != powerStatus)
			lastPowerStatus = powerStatus;
	}

	Loader{
		id: dormancyPanel
		property bool ctrlVisible: false
		active: false
		source: "qrc:/qml/qml/content/DormancyPanel.qml"
		asynchronous: true
		visible: (status == Loader.Ready) && ctrlVisible
	}



	Loader{
		id:chargePanel
		property bool ctrlVisible: false
		active: false
		source: "qrc:/qml/qml/content/ChargePanel.qml"
		asynchronous: true
		visible: (status == Loader.Ready) && ctrlVisible
		onVisibleChanged: {
			if(visible == true){
				if(splashPanel.active == true){			// disable splashPanel
					splashPanel.ctrlVisible = false;
				} else{
					// nothing to do
				}
			}
		}
	}

	Timer{
		id: dashboardPanelTimer
		interval: 1500; running: false; repeat: false
		onTriggered: {
			dashboardPanelTimer.running = false;
			dashboardPanel.ctrlVisible = true;
		}
	}

	Timer{
		id: chargePanelTimer
		interval: 1500; running: false; repeat: false
		onTriggered: {
			chargePanelTimer.running = false;
			chargePanel.ctrlVisible = true;
		}
	}

	Loader{
		id:dashboardPanel
		property bool ctrlVisible: false
		active: false
		source: "qrc:/qml/qml/content/DashboardPanel.qml"
		asynchronous: true
		visible: (status == Loader.Ready) && ctrlVisible
		onVisibleChanged: {
			if(visible == true){
				if(splashPanel.active == true){			// disable splashPanel
					splashPanel.ctrlVisible = false;
				} else{
					// nothing to do
				}
			}
		}
	}

	Loader{
		id:splashPanel
		property bool ctrlVisible: false
		active: false
		source: "qrc:/qml/qml/content/SplashPanel.qml"
		asynchronous: true
		visible: (status == Loader.Ready) && ctrlVisible
	}

	Component.onCompleted: {
		CarStatus.statusChanged.connect(statusCtrl);
	}
}
