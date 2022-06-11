import QtQuick 2.0
import QtQuick.Layouts 1.1
import Felgo 3.0

import "../model"

/*

// EXAMPLE USAGE:
// add the following piece of code inside your App { } to display the Login Page

// property to store whether user is logged
property bool userLoggedIn: false

// login page is always visible if user is not logged in
LoginPage {
  z: 1 // show login above actual app pages
  visible: opacity > 0
  enabled: visible
  opacity: userLoggedIn ? 0 : 1 // hide if user is logged in
  onLoginSucceeded: userLoggedIn = true

  Behavior on opacity { NumberAnimation { duration: 250 } } // page fade in/out
}

*/
Page {
    id: loginPage

    navigationBarHidden: true

    signal loginSucceeded

    property var pictureHeight: loginPage.height

    Component{
        id:mainpage
        SkipPage{}
    }

    DataModel{
        id:dataModel
    }

//    property var userInform_2: dataModel.userInform_2 || null
//    property var account_2 : userInform_2.id_str
//    property var passwrod_2: userInform_2.passward

    property var userInform: dataModel.userInform || null
    property var account : userInform.id_str
    property var passwrod: userInform.passward

    Image {
        id: backgroundimage

        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        source: "../../assets/wy.jpg"
        z: 1

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: 0.5
        }

        Image {
            id: image2
            anchors.top: parent.bottom
            width: parent.width
            fillMode: Image.PreserveAspectCrop
            height: parent.height
            source: "../../assets/wy.jpg"
            Rectangle {
                anchors.fill: parent
                color: "black"
                opacity: 0.5
            }
        }

        onYChanged: {
            if (backgroundimage.y == -800) {
                backgroundimage.y = 0
            }
        }

        Component.onCompleted: {
            animation.running = "true"
        }
    }

    NumberAnimation {
        id: animation

        target: backgroundimage
        property: "y"
        from: 0
        to: -860
        duration: 20000
        loops: Animation.Infinite
        easing.type: Easing.Linear
    }

    // login form content
    ColumnLayout {
        z: 2
        id: content
        anchors.centerIn: parent

        AppText {
            text: "Login"
            font.pixelSize: dp(70)
            color: "white"
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 30
        }

        Rectangle {
            id: rect1
            Layout.preferredHeight: 160
            radius: Layout.preferredHeight / 2
            Layout.preferredWidth: loginPage.width * 0.8
            Layout.bottomMargin: 20
            color: "white"
            border.width: 2
            border.color: "white"

            AppTextField {
                id: txtUsername
                width: rect1.width - rect1.height
                anchors.centerIn: rect1
                x: rect1.x + rect1.height / 2
                showClearButton: true
                font.pixelSize: sp(14)
                underlineColor: "white"
                placeholderText: "Account"
            }
        }

        Rectangle {
            id: rect2
            Layout.preferredHeight: 160
            radius: Layout.preferredHeight / 2
            Layout.preferredWidth: loginPage.width * 0.8
            Layout.bottomMargin: 30
            color: "white"
            border.width: 2
            border.color: "white"

            AppTextField {
                id: txtpassward
                width: rect2.width - rect2.height
                anchors.centerIn: rect2
                x: rect1.x + rect1.height / 2
                showClearButton: true
                inputMode: inputModePassword
                font.pixelSize: sp(14)
                underlineColor: "white"
                placeholderText: "Passward"
            }
        }

        Rectangle {
            id: rect3
            Layout.preferredWidth: rect1.height * 2
            Layout.preferredHeight: rect1.height
            Layout.alignment: Qt.AlignHCenter

            radius: rect3.width / 2
            color: "white"

            IconButton {
                anchors.fill: rect3
                icon: IconType.arrowright
                size: dp(35)
                color: "#696969"
                onClicked: {
                    console.log("logining...")

//                    if(txtUsername.text===account&&txtpassward.text===passwrod){
//                        NavigationItem.visible=false
//                         loginPage.visible = false
                        loginPage.navigationStack.push(mainpage)


//                    }else{
//                        NativeDialog.confirm("The account number you entered does not match the password", "Are you sure to enter again?",
//                              function (ok) {
//                                  // if (ok) navigationStack.pop(editComponent)
//                              }
//                        )
//                    }
               }
            }
        }
    }

    AppButton {
        text: qsTr("No account yet? Register now")
        flat: true
        textColor: "white"
        z: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        onClicked: {
            loginPage.forceActiveFocus() // move focus away from text fields
            // call your server code to register here
            console.debug("registering...")
            //loginPage.navigationStack.push(mainPageComponent)
        }
    }
}
