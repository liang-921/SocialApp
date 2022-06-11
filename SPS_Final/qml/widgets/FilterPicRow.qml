import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5 as QML

Item {
    property real parentwidth
    property var picsource
    property real picwid: parentwidth / 4
    property alias buttonH: button.height
    property alias textH: textw.height
    width:picwid*5+dp(parentwidth/100)
    Row {
        spacing: dp(parentwidth/100)
        Column {
            spacing: dp(5)
            Text {
                id: textw
                text: "Normal"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button.horizontalCenter
            }
            QML.Button {
                id: button
                width: picwid
                height: width
                Image {
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                }
            }
        }

        Column {
            spacing: dp(5)
            Text {
                text: "Inkwell"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button1.horizontalCenter
            }
            QML.Button {
                id: button1
                width: picwid
                height: width
                Image {
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "Gindham"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button2.horizontalCenter
            }
            QML.Button {
                id: button2
                width: picwid
                height: width
                Image {
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "Moon2wsz"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button3.horizontalCenter
            }
            QML.Button {
                id: button3
                width: picwid
                height: width
                Image {
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "Lark"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button4.horizontalCenter
            }
            QML.Button {
                id:button4
                width: picwid
                height: width
                Image {
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                }
            }
        }
    }
}
