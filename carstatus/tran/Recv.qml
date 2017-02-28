import QtQuick 2.2
import QtQuick.Controls 1.2

GroupBox {
	title: "Settings"
	Column {
		spacing: 2

		MText {
			mtext1: "dateTimeSet: "
			mtext2: SerialTran.dateTimeSet
		}
		MText {
			mtext1: "tripClear: "
			mtext2: SerialTran.tripClear
		}
		MText {
			mtext1: "setLcdNightLight: "
			mtext2: SerialTran.setLcdNightLight
		}
        MText {
			mtext1: "setBackLight: "
			mtext2: SerialTran.setBackLight
        }
		MText {
			mtext1: "setTheme: "
			mtext2: SerialTran.setTheme
		}

        MText {
			mtext1: "setOverSpeed: "
			mtext2: SerialTran.setOverSpeed
		}
	}
}
