import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.2
import QtMultimedia 5.0
import "../model"


Page {
    useSafeArea: false
    id: page

    //navigationBarHidden:hide

    title: "Edit"

    //    titleItem: Text {
    //        id: te
    //        text: qsTr("Edit")
    //        font.pixelSize: dp(20)
    //    }


    DataModel{
        id:dataModel
    }

    property var userInform: dataModel.userInform || null
    property var head_portrait: userInform ? userInform.profile_image : null
    property var username:userInform ? userInform.username : null
    property var personal_signature:userInform ? userInform.personal_signature : null

    leftBarItem: IconButtonBarItem {
        icon: IconType.close
        iconSize: dp(30)
        onClicked: {
            NativeDialog.confirm("Please Confirm", "Are you sure to not save?",
                  function (ok) {
                       if (ok) navigationStack.pop(editComponent)
                  }
            )
        }
    }
    rightBarItem: IconButtonBarItem {
        icon: IconType.check
        iconSize: dp(30)
        onClicked: {
            saveJson.resetUserName(input_1.text)
            navigationStack.pop(editComponent)
        }
    }

    ColumnLayout {
        spacing: dp(10)
        RoundedImage {
            id: roungImage
            Layout.topMargin: dp(30)
            Layout.preferredHeight: dp(100)
            Layout.preferredWidth: dp(100)
            source: head_portrait
            fillMode: Image.PreserveAspectCrop
            Layout.alignment: Qt.AlignHCenter
            radius: dp(100)
        }
        AppButton {
            Layout.preferredHeight: dp(40)
            Layout.preferredWidth: dp(200)
            Layout.topMargin: dp(10)
            Layout.alignment: Qt.AlignHCenter
            backgroundColor: "#FFFFED"
            Text {
                font.pixelSize: dp(15)
                text: qsTr("Change head portrait")
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: rec_1
            Layout.preferredHeight: dp(30)
            Layout.preferredWidth: page.width
            Layout.topMargin: dp(10)
            Layout.alignment: Qt.AlignLeft
            Text {
                text: "Name:"
                font.pixelSize: dp(15)
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            id: rec_2
            color: "white"
            Layout.preferredHeight: dp(40)
            Layout.preferredWidth: page.width
            border.color: "black"
            border.width: dp(1)
            radius: dp(10)
            AppTextInput {
                id: input_1
                anchors.fill: parent
                placeholderText: "name"
                placeholderColor: "lightgrey"
            }
        }
        Rectangle {
            id: rec_3
            Layout.preferredHeight: dp(30)
            Layout.preferredWidth: page.width
            Text {
                text: "Accounts:"
                font.pixelSize: dp(15)
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            id: rec_4
            color: "white"
            Layout.preferredHeight: dp(40)
            Layout.preferredWidth: page.width
            border.color: "black"
            border.width: dp(1)
            radius: dp(10)
            AppTextInput {
                id: input_2
                anchors.fill: parent
                placeholderText: "accounts"
                placeholderColor: "lightgrey"
            }
        }
        Rectangle {
            id: rec_5
            Layout.preferredHeight: dp(30)
            Layout.preferredWidth: page.width
            Text {
                text: "Mail:"
                font.pixelSize: dp(15)
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            id: rec_6
            color: "white"
            Layout.preferredHeight: dp(40)
            Layout.preferredWidth: page.width
            border.color: "black"
            border.width: dp(1)
            radius: dp(10)
            AppTextInput {
                id: input_
                anchors.fill: parent
                placeholderText: "mail"
                placeholderColor: "lightgrey"
            }
        }
        Rectangle {
            id: rec_7
            Layout.preferredHeight: dp(30)
            Layout.preferredWidth: page.width
            Text {
                text: "Person Signature:"
                font.pixelSize: dp(15)
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            id: rec_8
            color: "white"
            Layout.preferredHeight: dp(40)
            Layout.preferredWidth: page.width
            border.color: "black"
            border.width: dp(1)
            radius: dp(10)
            AppTextInput {
                id: input_4
                anchors.fill: parent
                placeholderText: "person signature"
                placeholderColor: "lightgrey"
            }
        }
    }
}

/*
Page {

    AppImage {
        id: image
        anchors.fill: parent
        // important to automatically rotate the image taken from the camera
        autoTransform: true
        fillMode: Image.PreserveAspectFit
    }

    AppButton {
        anchors.centerIn: parent
        text: "Display CameraPicker"
        onClicked: {
            nativeUtils.displayCameraPicker("test")
        }
    }

    Connections {
        target: nativeUtils
        onCameraPickerFinished: {
            if (accepted)
                image.source = path
        }
    }
}*/

