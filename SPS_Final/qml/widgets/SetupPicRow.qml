import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5 as QML
import QtGraphicalEffects 1.0 as Q

Item {
    property real parentwidth
    property var picsource
    property alias buttonH: button.height
    property alias textH: textw.height
    property real sizeIcon: dp(50)

    property real conut: 7

    width: button.width* conut + dp(parentwidth / 120)

    signal pushPage(string name)

    Row {
        spacing: dp(parentwidth / 120)
        Column {
            spacing: dp(5)
            Text {
                id: textw
                text: "剪切旋转"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.crop
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("剪切旋转")
                }
            }
        }

        Column {
            spacing: dp(5)
            Text {
                text: "涂鸦"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button6.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button6
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.pencil
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("涂鸦")
                }
            }
        }

        Column {
            spacing: dp(5)
            Text {
                text: "亮度"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button1.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button1
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.suno
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("亮度")
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "曝光"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button2.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button2
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.certificate
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("曝光")
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "对比度"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button3.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button3
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.starhalfempty
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("对比度")
                }
            }
        }

        //sediao  tint
        Column {
            spacing: dp(5)
            Text {
                text: "饱和度"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button4.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button4
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.circle
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("饱和度")
                }
            }
        }
        Column {
            spacing: dp(5)
            Text {
                text: "色温"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: button5.horizontalCenter
                font.bold:true
            }
            AppButton {
                id: button5
                height: width
                radius: width/ 2
                borderWidth: dp(1)
                borderColor: "black"
                backgroundColor: "#fff"
                backgroundColorPressed: "#fff"
                Icon {
                    anchors.fill: parent
                    icon: IconType.eyedropper
                    size: sizeIcon
                }
                onClicked: {
                    pushPage("色温")
                }
            }
        }
    }
}
