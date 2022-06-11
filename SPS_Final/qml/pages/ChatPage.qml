import Felgo 3.0
import QtQuick 2.0

Page{
    id:page
    //username
    title: qsTr("UserName")

    Rectangle{
        id:content
        color: "white"
        width: parent.width
        Text{
            text: textinput.text
        }
        anchors.top: parent.top
        anchors.bottom:footer.top
    }

    Rectangle{
        id:footer
        color: "white"
        width: page.width
        height: 150
        radius: 50
        anchors.bottom: parent.bottom
        border.color: "black"
        border.width: 5

        IconButton{
            id:cameras
            anchors.left:footer.left
            anchors.leftMargin: 10
            anchors.verticalCenter: footer.verticalCenter
            icon:IconType.camera
            size: dp(25)
            color: "pink"
            onClicked: {
                console.log("open the camera")
                nativeUtils.displayCameraPicker("test")
            }
        }

        AppTextField{
            id:textinput
            anchors.left : cameras.right
            anchors.right: microphone.left
            height: footer.height
            anchors.verticalCenter: footer.verticalCenter
        }

        IconButton{
            id:microphone
            color: "pink"
            anchors.right: chosepicture.left
            size: dp(25)
            anchors.verticalCenter: footer.verticalCenter
            icon: IconType.microphone
            onClicked: {
                console.log("open the microphone")
            }
        }

        IconButton{
            id:chosepicture
            anchors.right: send.left
            size: dp(25)
            anchors.verticalCenter: footer.verticalCenter
            icon:IconType.pictureo
            color: "pink"
            onClicked: {
                console.log("open the photo album")
            }
        }

        IconButton{
            id:send
            icon:IconType.paperplane
            size: dp(25)
            anchors.right: footer.right
            color: "pink"
            anchors.verticalCenter: footer.verticalCenter
            onClicked: {
                console.log("send the message")
            }
        }
    }

    Connections {
      target: nativeUtils
      onCameraPickerFinished: {
        if(accepted) image.source = path
      }
    }
}
