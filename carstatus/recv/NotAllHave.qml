import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "Not All Car Have"

	Column {
		spacing: 2

		MText {
			mtext1: "speedWarning: "
			mtext2: HtCarStatus.speedWarning
		}
		MText {
			mtext1: "soc: "
			mtext2: HtCarStatus.soc
		}
		MText {
			mtext1: "ready: "
			mtext2: HtCarStatus.ready
		}
		MText {
			mtext1: "energyRecover: "
			mtext2: HtCarStatus.energyRecover
		}
		MText {
            mtext1: "energyRecoverIcon: "
            mtext2: HtCarStatus.energyRecoverIcon
		}
		MText {
            mtext1: "batteryWarningIcon: "
            mtext2: HtCarStatus.batteryWarningIcon
		}
		MText {
            mtext1: "remoteIndication: "
            mtext2: HtCarStatus.remoteIndication
		}
		MText {
            mtext1: "highVoltageIndication: "
            mtext2: HtCarStatus.highVoltageIndication
		}
		MText {
			mtext1: "buttonRight: "
			mtext2: HtCarStatus.buttonRight
		}
		MText {
			mtext1: "buttonLeft: "
			mtext2: HtCarStatus.buttonLeft
		}
		MText {
			mtext1: "buttonOk: "
			mtext2: HtCarStatus.buttonOk
		}
		MText {
            mtext1: "tirePressureIndication: "
            mtext2: HtCarStatus.tirePressureIndication
		}
		MText {
            mtext1: "powerBattryTemp: "
            mtext2: HtCarStatus.powerBattryTemp
        }
		MText {
			mtext1: "version: "
			mtext2: HtCarStatus.mcuVer1 + "." + HtCarStatus.mcuVer2 + "." + HtCarStatus.mcuVer3
		}
        //add for v3.0
        MText {
            mtext1: "seatbeltWarning: "
            mtext2: HtCarStatus.seatbeltWarning
        }
        MText {
            mtext1: "brakingError: "
            mtext2: HtCarStatus.brakingError
        }
        MText {
            mtext1: "EBDError: "
            mtext2: HtCarStatus.EBDError
        }
        MText {
            mtext1: "handbrakeError: "
            mtext2: HtCarStatus.handbrakeError
        }
        MText {
			mtext1: "motorHotError: "
			mtext2: HtCarStatus.motorHotError
        }
        MText {
            mtext1: "chargingReminder: "
            mtext2: HtCarStatus.chargingReminder
        }
        MText {
            mtext1: "timeFormat: "
            mtext2: HtCarStatus.timeFormat
		}
        MText {
            mtext1: "leftFrontTirePressure: "
            mtext2: HtCarStatus.leftFrontTirePressure
        }
        MText {
            mtext1: "rightFrontTirePressure: "
            mtext2: HtCarStatus.rightFrontTirePressure
        }
        MText {
            mtext1: "leftRearTirePressure: "
            mtext2: HtCarStatus.leftRearTirePressure
        }
        MText {
            mtext1: "rightRearTirePressure: "
            mtext2: HtCarStatus.rightRearTirePressure
        }
        MText {
            mtext1: "tirePressureStatus: "
            mtext2: HtCarStatus.tirePressureStatus
        }
        MText {
            mtext1: "leftFrontTPStatus: "
            mtext2: HtCarStatus.leftFrontTPStatus
        }
        MText {
            mtext1: "LCDLight: "
            mtext2: HtCarStatus.LCDLight
        }
        MText {
            mtext1: "rightFrontTPStatus: "
            mtext2: HtCarStatus.rightFrontTPStatus
        }
        MText {
			mtext1: "batteryErrIcon: "
			mtext2: HtCarStatus.batteryErrIcon
        }
        MText {
            mtext1: "leftRearTPStatus: "
            mtext2: HtCarStatus.leftRearTPStatus
        }
        MText {
            mtext1: "frontFogLamp: "
            mtext2: HtCarStatus.frontFogLamp
        }
        MText {
            mtext1: "rightRearTPStatus: "
            mtext2: HtCarStatus.rightRearTPStatus
        }
        MText {
            mtext1: "chargeStatus: "
            mtext2: HtCarStatus.chargeStatus
        }
        MText {
            mtext1: "backFogLamp: "
            mtext2: HtCarStatus.backFogLamp
        }
        MText {
            mtext1: "chargeCurrent: "
            mtext2: HtCarStatus.chargeCurrent
        }
        MText {
            mtext1: "chargeMode: "
            mtext2: HtCarStatus.chargeMode
        }
        MText {
            mtext1: "chargeHotStatus: "
            mtext2: HtCarStatus.chargeHotStatus
        }
        MText {
            mtext1: "intelligenceKeyStatus: "
            mtext2: HtCarStatus.intelligenceKeyStatus
        }
        MText {
			mtext1: "airbagIcon: "
			mtext2: HtCarStatus.airbagIcon
        }
		MText {
			mtext1: "mirrorFold: "
			mtext2: HtCarStatus.mirrorFold
		}
		MText {
			mtext1: "EPSwarning: "
			mtext2: HtCarStatus.EPSwarning
		}
	}
}
