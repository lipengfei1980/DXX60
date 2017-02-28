import QtQuick 2.3

Item {
	id: setMusic
	state: CarStatus.musicSetState
	opacity: 0.0
	property int musicShow: setMusic.state === "set" ? CarStatus.musicSet : CarStatus.ignOnMusic

	Image {
		id: themeBg
		x: 954
		y: 124
		source: "qrc:/menuPanel/images/menuPanel/music.png"
	}

	Image{
		id: musicSet
		x: 937
		y: {
			if(musicShow === 0 || musicShow === 1)
				return 158;
			else if(musicShow === 2)
				return 187;
			else
				return 213;
		}
		source: {
			if(musicShow === 0 || musicShow === 1)
				return "qrc:/menuPanel/images/menuPanel/setNoMusic.png";
			else if(musicShow === 2)
				return "qrc:/menuPanel/images/menuPanel/setMusic1.png";
			else
				return "qrc:/menuPanel/images/menuPanel/setMusic2.png";
		}

		Timer {
			id: flicker
			interval: 500
			running: setMusic.state === "set"
			repeat: true
			onTriggered: {
				musicSet.visible = !musicSet.visible
			}
			onRunningChanged: {
				if(running === false)
					musicSet.visible = true;
			}
		}
	}

	Image {
		id: theme1
		x: 961
		y: 163
		visible: musicShow !== 1 && musicShow !== 0
		source: "qrc:/menuPanel/images/menuPanel/noMusic.png"
	}
	Image {
		id: theme2
		x: 961
		y: 191
		visible: musicShow !== 2
		source: "qrc:/menuPanel/images/menuPanel/music1.png"
	}
	Image {
		id: theme3
		x: 962
		y: 219
		visible: musicShow !== 3
		source: "qrc:/menuPanel/images/menuPanel/music2.png"
	}
	states: [
		State {
			name: ""
			PropertyChanges { target: setMusic; opacity: 0.0 }
		},
		State {
			name: "show"
			PropertyChanges { target: setMusic; opacity: 1.0 }
		},
		State {
			name: "set"
			PropertyChanges { target: setMusic; opacity: 1.0 }
		}
	]
}
