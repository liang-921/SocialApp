import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0 as QuickControls2
import QtQuick.Layouts 1.3

Page {

    id: page_4
    title: "User ninkname"

    //  添加好友
    rightBarItem: IconButtonBarItem {
        icon: IconType.userplus
        iconSize: dp(25)
        onClicked: {
            // navigationStack.push(editpageComponent)
        }
    }

    Component{
        id:otherComponent
        OtherPersonPage{}
    }

    AppTabBar {
        id: appTabBar
        anchors.topMargin: dp(20)
        contentContainer: swipeView
        AppTabButton {
            Row {
                spacing: dp(10)
                anchors.centerIn: parent
                Text {
                    id: text_1
                    text: "attention"
                    font.pixelSize: dp(20)
                }
                Text {
                    text: "12"
                    font.pixelSize: dp(20)
                }
            }
        }
        AppTabButton {
            Row {
                spacing: dp(10)
                anchors.centerIn: parent
                Text {
                    id: text_2
                    text: "fans"
                    font.pixelSize: dp(20)
                }
                Text {
                    text: "10"
                    font.pixelSize: dp(20)
                }
            }
        }
    }

    QuickControls2.SwipeView {
        id: swipeView
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        Item {
            SearchBar {
                id: searchBar_1
                pullEnabled: true
                width: page_4.width
                placeHolderText: "Search User Name or Accounts"
            }
            AppListView {
                delegate: components
                anchors.top: searchBar_1.bottom
                model: 12
                Component {
                    id: components
                    RowLayout {
                        Layout.preferredHeight: roundImage_1.height
                        spacing: dp(30)
                        RoundedImage {
                            id: roundImage_1
                            Layout.preferredWidth: dp(50)
                            Layout.preferredHeight: dp(50)
                            Layout.leftMargin: 60
                            Layout.topMargin: 20
                            fillMode: Image.PreserveAspectCrop
                            source: "../../assets/4.png"
                            radius: width / 2
                        }
                        Text {
                            font.pixelSize: dp(20)
                            text: "roy_wang"
                            Layout.topMargin: 20
                            Layout.leftMargin: 60
                        }
                        QuickControls2.Button {
                            Layout.preferredWidth: dp(100)
                            Layout.preferredHeight: dp(25)
                            Layout.leftMargin: 60
                            Layout.topMargin: 20
                            Rectangle {
                                id: rec_1
                                color: "lightpink"
                                anchors.fill: parent
                                Text {
                                    id: text_1
                                    text: "Follow"
                                    anchors.centerIn: parent
                                    font.pixelSize: dp(15)
                                }
                            }
                            z:2
                            onClicked: {
                                if (text_1.text === "Follow") {
                                    console.log("true")
                                    text_1.text = "Followed"
                                    rec_1.color = "lightgray"
                                } else {
                                    text_1.text = "Follow"
                                    rec_1.color = "lightpink"
                                }
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:   {
                                page_4.navigationStack.push(otherComponent)
                            }
                        }
                    }
                }
            }
        }

        Item {
            SearchBar {
                id: searchBar_2
                pullEnabled: true
                width: page_4.width
                placeHolderText: "Search User Name or Accounts"
            }

            AppListView {
                id: view_1
                anchors.top: searchBar_2.bottom
                delegate: components_1
                model: 10
                Component {
                    id: components_1
                    RowLayout {
                        id: row_1
                        spacing: dp(30)
                        Layout.preferredHeight: roundImage_2.height
                        RoundedImage {
                            id: roundImage_2
                            Layout.preferredWidth: dp(50)
                            Layout.preferredHeight: dp(50)
                            Layout.leftMargin: 60
                            Layout.topMargin: 20
                            fillMode: Image.PreserveAspectCrop
                            source: "../../assets/4.png"
                            radius: width / 2
                        }
                        Text {
                            font.pixelSize: dp(20)
                            text: "roy_wang"
                            Layout.topMargin: 20
                            Layout.leftMargin: 60
                        }
                        QuickControls2.Button {
                            z:2
                            Layout.preferredWidth: dp(100)
                            Layout.preferredHeight: dp(25)
                            Layout.leftMargin: 60
                            Layout.topMargin: 20
                            Rectangle {
                                id: rec_2
                                color: "lightpink"
                                anchors.fill: parent
                                Text {
                                    id: text_2
                                    text: "Follow"
                                    anchors.centerIn: parent
                                    font.pixelSize: dp(15)
                                }
                            }
                            onClicked: {
                                if (text_2.text == "Follow") {
                                    console.log("true")
                                    text_2.text = "Followed"
                                    rec_2.color = "lightgray"
                                } else {
                                    text_2.text = "Follow"
                                    rec_2.color = "lightpink"
                                }
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:   {
                                page_4.navigationStack.push(otherComponent)
                            }
                        }
                    }
                }
            }
        }
    }
}
