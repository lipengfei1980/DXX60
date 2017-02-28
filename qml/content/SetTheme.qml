import QtQuick 2.3

Item {
	id: setTheme
	state: CarStatus.setThemeState
	opacity: 0.0
	property int themeShow: setTheme.state === "set" ? CarStatus.setTheme : CarStatus.theme

	Image {
		id: themeBg
		x: 954
		y: 124
		source: "qrc:/menuPanel/images/menuPanel/theme.png"
	}

	Image{
		id: settheme
		x: 937
		y: {
			if(themeShow === 1 || themeShow === 0)
				return 160;
			else if(themeShow === 2)
				return 188;
			else
				return 216;
		}
		source: {
			if(themeShow === 1 || themeShow === 0)
				return "qrc:/menuPanel/images/menuPanel/settheme1.png";
			else if(themeShow === 2)
				return "qrc:/menuPanel/images/menuPanel/settheme2.png";
			else
				return "qrc:/menuPanel/images/menuPanel/settheme3.png";
		}

		Timer {
			id: flicker
			interval: 500
			running: setTheme.state === "set"
			repeat: true
			onTriggered: {
				settheme.visible = !settheme.visible
			}
			onRunningChanged: {
				if(running === false)
					settheme.visible = true;
			}
		}
	}

	Image {
		id: theme1
		x: 976
		y: 162
		visible: themeShow !== 1
		source: "qrc:/menuPanel/images/menuPanel/theme1.png"
	}
	Image {
		id: theme2
		x: 976
		y: 190
		visible: themeShow !== 2
		source: "qrc:/menuPanel/images/menuPanel/theme2.png"
	}
	Image {
		id: theme3
		x: 976
		y: 218
		visible: themeShow !== 3
		source: "qrc:/menuPanel/images/menuPanel/theme3.png"
	}
	states: [
		State {
			name: ""
			PropertyChanges { target: setTheme; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: setTheme; opacity: 1.0 }
		},
		State {
			name: "set"
			PropertyChanges { target: setTheme; opacity: 1.0 }
		}
	]
}
