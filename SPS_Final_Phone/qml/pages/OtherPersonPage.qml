import Felgo 3.0
import QtQuick 2.8
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0 as QuickControls2

Page {

    id: page_2
    title: qsTr("OtherUserName")

//    rightBarItem: IconButtonBarItem {
//        icon: IconType.user
//        iconSize: dp(30)
//        color: "lightpink"
//        onClicked: {
//            navigationStack.push(editpageComponent)
//        }
//    }

    Component{
        id:otherFandAComponent
        OtherFandAPage{}
    }

    ColumnLayout {
        id: column_2
        spacing: 10
        Item {
            id: topSpacer
            width: parent.width
            height: dp(3)
        }
        Row {
            id: row
            spacing: 90
            Layout.leftMargin: dp(10)

            RoundedImage {
                id: roundImage
                width: dp(100)
                height: dp(100)
                fillMode: Image.PreserveAspectCrop
                source: "../../assets/4.png"
                radius: width / 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        PictureViewer.show(page_2, roundImage.source)
                        appTabBar.z = 0
                    }
                }
            }
            Row {
                anchors.verticalCenter: roundImage.verticalCenter
                spacing: dp(40)
                Column {
                    spacing: 4
                    AppText {
                        anchors.horizontalCenter: post.horizontalCenter
                        text: "0"
                        font.pixelSize: dp(18)
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                swipeView.currentIndex = 0
                            }
                        }
                    }
                    AppText {
                        font.bold: true
                        font.pixelSize: dp(18)
                        id: post
                        text: "post"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                swipeView.currentIndex = 0
                            }
                        }
                    }
                }
                Column {
                    spacing: 4
                    AppText {
                        font.pixelSize: dp(18)
                        anchors.horizontalCenter: attention.horizontalCenter
                        text: "12"
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(otherFandAComponent)
                            }
                        }
                    }
                    AppText {
                        font.pixelSize: dp(18)
                        id: attention
                        text: "attention"
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(otherFandAComponent)
                            }
                        }
                    }
                }
                Column {
                    spacing: 4
                    AppText {
                        font.pixelSize: dp(18)
                        anchors.horizontalCenter: fans.horizontalCenter
                        text: "10"
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(fansandAtteotion)
                            }
                        }
                    }
                    AppText {
                        font.bold: true
                        font.pixelSize: dp(18)
                        id: fans
                        text: "fans"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(otherFandAComponent)
                            }
                        }
                    }
                }
            }
        }
        AppText {
            id: text
            text: "Roy_Wang"
            Layout.topMargin: dp(8)
            Layout.leftMargin: dp(10)
            Layout.bottomMargin: dp(10)
            font.pixelSize: dp(20)
        }
        AppText {
            id: text_1
            text: "<< singer actor>>"
            font.pixelSize: dp(18)
            Layout.leftMargin: dp(10)
            color: "gray"
        }

        RowLayout {
            spacing: dp(50)
            Layout.topMargin: dp(20)
            Layout.bottomMargin: dp(10)
            Layout.leftMargin: dp(20)
            AppButton {
                Layout.preferredWidth: dp(150)
                Layout.preferredHeight: dp(25)
                backgroundColor: "lightpink"
                Text {
                    id: text_3
                    text: "Follow"
                    anchors.centerIn: parent
                    font.pixelSize: dp(15)
                }
                onClicked: {
                    if (text_3.text === "Follow") {
                        console.log("true")
                        text_3.text = "Followed"
                        backgroundColor = "lightgray"
                    } else {
                        text_3.text = "Follow"
                        backgroundColor = "lightpink"
                    }
                }
            }
            AppButton {
                Layout.preferredWidth: dp(150)
                Layout.preferredHeight: dp(25)
                backgroundColor: "lightpink"
                Text {
                    id: text_2
                    text: "Send Message"
                    anchors.centerIn: parent
                    font.pixelSize: dp(15)
                }
                onClicked: {
                    //page_2.navigationStack.push(massage)
                }

            }
        }
    }

    AppTabBar {
        id: appTabBar
        anchors.topMargin: dp(10)
        anchors.top: column_2.bottom
        contentContainer: swipeView
        AppTabButton {
            id: post_Tabbutton
            Icon {
                icon: IconType.delicious
                size: dp(30)
                color: "lightpink"
                anchors.fill: parent
            }
        }
        AppTabButton {
            Icon {
                icon: IconType.hearto
                size: dp(30)
                color: "lightpink"
                anchors.fill: parent
            }
        }
    }

    QuickControls2.SwipeView {
        id: swipeView
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        Rectangle {
            color: "lightyellow"
        }

        Rectangle {
            color: "lightgray"
        }
    }
}
