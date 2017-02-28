import QtQuick 2.3

Item {
	id: menuPanel
	x: 25

	state: CarStatus.menuPanelState
	MenuMain {
		id: menuMain
		state: menuPanel.state
	}

	EnergyPanel {
		id: energyPanel
	}

	SetLcdLight {
		id: setLcdLight
	}

	SetOverSpeed {
		id: setOverSpeed
	}

//	TirePressPanel {
//		id: tirePressPanel
//	}

	SetTheme {
		id: setTheme
	}

	SetMusic {
		id: setMusic
	}

	ExitPanel {
		id: exitPanel
	}
}
