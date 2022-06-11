import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Felgo 3.0

Page {
    id: sendmessage

    //    navigationBarHidden:true
    title: "New Message"

    Component {
        id: chatpage
        ChatPage {}
    }

    rightBarItem: TextButtonBarItem {
        id: chat
        text: qsTr("Chat")
        color: searchbar.text === "" ? "grey" : "pink"
        Layout.rightMargin: 20
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        onClicked: {
            if (searchbar.text != "") {
                console.log("return chat page")
                navigationStack.push(chatpage)
            }
        }
    }

    SearchBar {
        id: searchbar
        pullEnabled: false
        target: applistview
    }
    Text {
        id: recommend
        anchors.top: searchbar.bottom
        x: 30
        text: qsTr("Recommend")
        font.pixelSize: dp(20)
    }

    AppListView {
        id: applistview

        spacing: 20
        anchors.top: recommend.bottom
        anchors.topMargin: dp(20)

        model: ListModel {
            id: listModel
            ListElement {
                profilesource: "../../assets/3.png"
                remarks: "wy"
                name: "roy___wang"
            }
            ListElement {
                profilesource: "../../assets/1.png"
                remarks: "kw"
                name: "karry___wang"
            }
            ListElement {
                profilesource: "../../assets/4.png"
                remarks: "js"
                name: "jackson___wang"
            }
        }

        delegate: component

        Component {
            id: component
            RowLayout {
                spacing: dp(30)
                RoundedImage {
                    id: profile
                    source: profilesource
                    fillMode: Image.PreserveAspectCrop
                    Layout.preferredWidth: dp(65)
                    Layout.preferredHeight: dp(65)
                    Layout.leftMargin: dp(20)
                    radius: dp(width / 2)
                }
                Column {
                    id: columns
                    Layout.preferredWidth: dp(65)
                    Layout.preferredHeight: dp(65)
                    spacing: profile.height / 16
                    Text {
                        id: remark
                        font.pixelSize: dp(20)
                        text: remarks
                        color: "black"
                    }
                    Text {
                        text: name
                        color: "grey"
                        font.pixelSize: dp(18)
                    }
                }
                IconButton {
                    id: iconbutton
                    Layout.leftMargin: columns.width*2
                    icon: IconType.circlethin
                    size: dp(30)
                    color: "pink"
                    onClicked: {
                        icon === IconType.circlethin ? icon = IconType.checkcircle : icon
                                                       = IconType.circlethin
                        if (icon === IconType.checkcircle) {
                            searchbar.text = remark.text
                        }
                    }
                }
            }
        }
    }
}
