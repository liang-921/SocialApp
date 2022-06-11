import QtQuick 2.0
import Felgo 3.0

Item {
    property var stackItem
    property real pagewidth
    property real pageheight

    signal saveChange
    signal endChange

    Row {
        AppButton {
            width: pagewidth / 2
            height: pageheight / 80
            borderWidth: dp(1)
            borderColor: "lightpink"
            radius: dp(20)
            Text {
                anchors.centerIn: parent
                text: qsTr("Cancel")
                font.pixelSize: dp(20)
                font.bold: true
            }
            onClicked: {
                endChange()
                stackItem.pop()
            }
        }
        AppButton {
            width: pagewidth / 2
            height: pageheight / 80
            borderWidth: dp(1)
            borderColor: "lightpink"
            radius: dp(20)
            Text {
                anchors.centerIn: parent
                text: qsTr("OK")
                font.pixelSize: dp(20)
                font.bold: true
            }
            onClicked: {
                saveChange()
                stackItem.pop()
            }
        }
    }

}
