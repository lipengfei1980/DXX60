import QtQuick 2.3
import Carstatus 1.0
Item {
	id:warningPanel
	opacity:0.0
	x: (CarStatus.dashboardStatus == "dormancyPanel") ? 0 : -25
	Image {
		id: warningbg
		x: (CarStatus.dashboardStatus == "dormancyPanel") ? 484 : 128
		y: (CarStatus.warningIndex == Carstatus.TIPS_IMAGE || CarStatus.warningIndex == Carstatus.TIPS_DOUBLE) ? 99 : 99 + sourceSize.height
		height: CarStatus.warningIndex == Carstatus.TIPS_DOUBLE ? sourceSize.height * 2 : sourceSize.height
		opacity: 1.0
		source: "qrc:/warningPanel/images/warningPanel/warningBg.png"
		visible: CarStatus.warningSrc !== "" && CarStatus.warningSrc !== "qrc:/qml/qml/content/Warning/CardoorWarningPanel.qml"
	}

	Loader{
		id:warning
		property string warningSrc: CarStatus.warningSrc
		active: (warningSrc !== "")
		source: warningSrc
		asynchronous: true
		visible: status == Loader.Ready
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: warningPanel; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: warningPanel; opacity: 1.0 }
		}
	]
}
