import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5 as QML
import QtGraphicalEffects 1.0 as Q

Item {

    id:item_Change

    property real parentwidth
    property var picsource
    property real picwid: parentwidth / 4
    property alias buttonH: button.height
    property alias textH: textw.height
    width: picwid * 5 + dp(parentwidth / 100)
    Row {
        spacing: dp(parentwidth / 100)
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
                objectName: "normal_Button"
                Image {
                    id: pic
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    cache: true
                    source: picsource
                    smooth: true
                }
//                Connections{
//                    target: filterpic
//                    onImageUpdate:{
//                        pic.visible = true
//                        pic.source=""
//                        pic.source="image://filterpic"
//                    }
//                }

                onClicked: {
                   console.log(picsource)
                   filterpic.greyPic(picsource);
                    pic1.visible = true
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
                    id: pic1
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
//                    visible: false
                    smooth: true
                }
//                Connections{
//                    target: filterpic
//                    onImageUpdate:{
//                        pic.visible = true
//                        pic.source=""
//                        pic.source="image://filterpic"
//                    }
//                }
                Q.FastBlur {
                    anchors.fill: pic1
                    source: pic1
                    radius: 64
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
                    id: pic2
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                    visible: false
                    smooth: true
                }
                Q.FastBlur {
                    anchors.fill: pic2
                    source: pic2
                    radius: 64
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "Moon"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button3.horizontalCenter
            }
            QML.Button {
                id: button3
                width: picwid
                height: width
                Image {
                    id: pic3
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                    visible: false
                    smooth: true
                }
                Q.FastBlur {
                    anchors.fill: pic3
                    source: pic3
                    radius: 64
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
                id: button4
                width: picwid
                height: width
                Image {
                    id: pic4
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: picsource
                    visible: false
                    smooth: true
                }
                Q.FastBlur {
                    anchors.fill: pic4
                    source: pic4
                    radius: 64
                }
            }
        }
    }
}
