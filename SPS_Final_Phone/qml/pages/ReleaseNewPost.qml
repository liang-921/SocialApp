import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5 as QML
import QtQuick.Layouts 1.2

Page {
    id:page

    title:qsTr("Release New")

    property var picSource: [
        "../../assets/1.png",
        "../../assets/0.png",
    ]
    property real picwid: dp(120)
    property real pichei: dp(120)

    property var sendImages:""

    rightBarItem: IconButtonBarItem {
        icon: IconType.check
        iconSize: dp(21)
        color: "lightpink"
        onClicked:{
        }
    }

    Rectangle{
        y:dp(20)
        color: "#fff"
        height: page.height/2+add.height*4
        width: page.width
        border.width: dp(1)
        border.color: "lightpink"
        Row{
            id:idrow
            anchors.top: parent.top
            anchors.topMargin: dp(10)
            x:dp(10)
            spacing: dp(10)
            RoundedImage{
                id:handimg
                width: dp(50)
                height: width
                radius: width/2
                source: "../../assets/3.png"
                fillMode: Image.PreserveAspectCrop
            }
            Text{
                anchors.verticalCenter: handimg.verticalCenter
                text:qsTr("UserName")
                font.pixelSize:dp(18)
            }
        }
        AppFlickable {
             id: flick
             anchors.top: idrow.bottom
             anchors.topMargin: dp(page.height/120)
             width: page.width-dp(10)
             height: parent.height/2
             contentWidth: width
             contentHeight: edit.height
             x: dp(10)
             AppTextEdit {
                 id: edit
                 width:parent.width
                 height: Math.max(edit.contentHeight, flick.height)
                 verticalAlignment: TextEdit.AlignTop
                 flickable: flick
                 wrapMode: TextEdit.Wrap
                 cursorInView: true
                 cursorInViewBottomPadding: dp(25)
                 cursorInViewTopPadding: dp(25)
                 color:"#000"
                 font.pixelSize: dp(20)
                 placeholderText: qsTr("Sharing.......")
                 cursorColor: "#000"

             }
         }
        ScrollIndicator {
             flickable: flick
        }
        Rectangle{
            id:pic
            width:page.width
            height: pichei
            anchors.top: flick.bottom
            x:dp(20)
            Image{
                width: picwid
                height: pichei
                source: sendImages
                fillMode: Image.PreserveAspectCrop
                Icon{
                    id:icon
                    anchors.left:parent.left
                    anchors.leftMargin: dp(5)
                    anchors.top: parent.top
                    anchors.topMargin: dp(5)
                    icon:IconType.copy
                    color: "pink"
                    visible: false
                }
                Component.onCompleted: {
                    if(picSource.length){
                        console.log(picSource.length)
                         icon.visible=true
                    }
                }
            }
        }
        RowLayout{
            id:add
            anchors.top: pic.bottom
            anchors.topMargin: dp(18)
            x:dp(20)
            spacing: dp(10)
            Rectangle{
                width:dp(90)
                height: dp(30)
                radius:dp(15)
                color: "lightgrey"
                Row{
                    anchors.centerIn: parent
                    spacing: dp(5)
                    Icon{
                       id:tag
                       icon:IconType.tag//mapmarker
                       size:dp(15)
                       color: "grey"
                    }
                    Text{
                        anchors.verticalCenter: tag.verticalCenter
                        text: qsTr("Add #")
                        font.pixelSize: dp(15)
                    }
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {

                    }
                }
            }
            Rectangle{
                width:dp(90)
                height: dp(30)
                radius:dp(15)
                color: "lightgrey"
                Row{
                    anchors.centerIn: parent
                    spacing: dp(5)
                    Icon{
                       id:map
                       icon:IconType.mapmarker
                       size:dp(15)
                       color: "grey"
                    }
                    Text{
                        anchors.verticalCenter: map.verticalCenter
                        text: qsTr("Local")
                        font.pixelSize: dp(15)
                    }
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {

                    }
                }
            }
        }
    }

}
