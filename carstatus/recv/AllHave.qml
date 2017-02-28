import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "All Car Have"

	Column {
		spacing: 2

		MText {
            mtext1: "powerMemter: "
            mtext2: HtCarStatus.powerMemter
		}
		MText {
			mtext1: "speed: "
			mtext2: HtCarStatus.speed
		}
		MText {
            mtext1: "odo: "
            mtext2: HtCarStatus.odo
		}
		MText {
            mtext1: "gear: "
            mtext2: HtCarStatus.gear
		}
		MText {
            mtext1: "gearErrorOperation: "
            mtext2: HtCarStatus.gearErrorOperation
		}
		MText {
			mtext1: "date: "
			mtext2: HtCarStatus.date
		}
		MText {
			mtext1: "time: "
			mtext2: HtCarStatus.time
		}
		MText {
            mtext1: "powerStatus: "
            mtext2: HtCarStatus.powerStatus
		}
		MText {
            mtext1: "tripA: "
            mtext2: HtCarStatus.tripA
		}
        MText {
            mtext1: "tripB: "
            mtext2: HtCarStatus.tripB
        }
        MText {
            mtext1: "range: "
            mtext2: HtCarStatus.range
        }
		MText {
			mtext1: "leftFrontDoor: "
			mtext2: HtCarStatus.leftFrontDoor
		}
		MText {
			mtext1: "leftRearDoor: "
			mtext2: HtCarStatus.leftRearDoor
		}
		MText {
			mtext1: "rightFrontDoor: "
			mtext2: HtCarStatus.rightFrontDoor
		}
		MText {
			mtext1: "rightRearDoor: "
			mtext2: HtCarStatus.rightRearDoor
		}
		MText {
			mtext1: "hoodDoor: "
			mtext2: HtCarStatus.hoodDoor
		}
		MText {
			mtext1: "trunkDoor: "
			mtext2: HtCarStatus.trunkDoor
        }
		MText {
			mtext1: "theme: "
			mtext2: HtCarStatus.theme
		}
	}
}
