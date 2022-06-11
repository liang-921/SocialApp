import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5 as QML

Item {
    property real pagewidth
    property real colorwidth: dp(40)
    property var picColor: "#000"
    property real colorPwidth: dp(60)


    signal selected(var select_color)
    Flow{
        anchors.fill:parent
        spacing: pagewidth/40
        anchors.margins: dp(4)
        Rectangle{
            id:r1
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#fff"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r1.color)}
            }
        }

        Rectangle{
            id:r2
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#000"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r2.color)}
            }
        }

        Rectangle{
            id:r3
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#d3d3d3"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r3.color)}
            }
        }
        Rectangle{
            id:r4
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#ff0000"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r4.color)}
            }
        }
        Rectangle{
            id:r5
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#FFB6C1"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r5.color)}
            }
        }
        Rectangle{
            id:r6
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#BA55D3"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r6.color)}
            }
        }
        Rectangle{
            id:r7
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#87CEFA"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r7.color)}
            }
        }
        Rectangle{
            id:r8
            width:colorwidth
            height: width
            border.width: dp(3)
            border.color: "lightgrey"
            radius: colorwidth/2
            color: "#90EE90"
            MouseArea{
                anchors.fill:parent
                onClicked: {selected(r8.color)}
            }
        }
    }

}
