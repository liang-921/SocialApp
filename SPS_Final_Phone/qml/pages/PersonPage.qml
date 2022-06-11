import Felgo 3.0
import QtQuick 2.8
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0 as QuickControls2
import "../model"
import "../widgets"

Page {

    id: page_2

    DataModel {
        id: dataModel
    }

    //    Component{
    //        id:postPersonComponent
    //        PostPersonPage{
    //        }
    //    }
    property var userInform: dataModel.userInform || null
    property var head_portrait: userInform ? userInform.profile_image : null
    property var username: userInform ? userInform.username : null
    property var personal_signature: userInform ? userInform.personal_signature : null
    property var postnum: userInform ? userInform.invitation_num : null
    property var follow_num: userInform ? userInform.follow_nums : null
    property var fans_num: userInform ? userInform.fans_nums : null
    property var invitation: userInform ? userInform.invitation : null
    property var invitation_num: userInform ? userInform.invitation_num : null

    property var jsonData: invitation

    title: username

    leftBarItem: IconButtonBarItem {
        icon: IconType.arrowleft
        iconSize: dp(30)
        color: "lightpink"
        onClicked: {
            navigationStack.pop(personComponent)
        }
    }

    Component {
        id: editComponent
        EditPage {}
    }

    Component {
        id: fansAndAttention
        FansandAttentionPage {}
    }

    rightBarItem: IconButtonBarItem {
        icon: IconType.user
        iconSize: dp(30)
        color: "lightpink"
        onClicked: {
            navigationStack.push(editComponent)
        }
    }

    ColumnLayout {
        id: column_2
        spacing: dp(10)

        Item {
            id: topSpacer
            Layout.preferredWidth: page_2.width
            Layout.preferredHeight: dp(3)
        }
        RowLayout {
            id: row
            Layout.leftMargin: dp(10)
            Layout.preferredWidth: page_2.width
            Layout.preferredHeight: dp(120)

            Rectangle {
                id: rec_1
                RoundedImage {
                    id: roundImage
                    width: dp(90)
                    height: dp(90)
                    fillMode: Image.PreserveAspectCrop
                    source: head_portrait
                    radius: width / 2
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            PictureViewer.show(page_2, roundImage.source)
                            appTabBar.z = 0
                        }
                    }
                }
                Text {
                    id: nameText
                    text: qsTr(username)
                    anchors.top: roundImage.bottom
                    anchors.topMargin: dp(5)
                    anchors.horizontalCenter: roundImage.horizontalCenter
                    font.pixelSize: dp(20)
                }
            }

            RowLayout {
                id: row_2
                Layout.alignment: rec_1.verticalCenter | Qt.AlignRight
                Layout.rightMargin: dp(30)
                spacing: dp(40)
                Column {
                    spacing: dp(4)
                    AppText {
                        anchors.horizontalCenter: post.horizontalCenter
                        text: postnum
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
                    spacing: dp(4)
                    AppText {
                        font.pixelSize: dp(18)
                        anchors.horizontalCenter: attention.horizontalCenter
                        text: follow_num
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(fansAndAttention)
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
                                page.navigationStack.push(fansAndAttention)
                            }
                        }
                    }
                }
                Column {
                    spacing: dp(4)
                    AppText {
                        font.pixelSize: dp(18)
                        anchors.horizontalCenter: fans.horizontalCenter
                        text: fans_num
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                page.navigationStack.push(fansAndAttention)
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
                                page.navigationStack.push(fansAndAttention)
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.preferredWidth: page.width
            Layout.preferredHeight: dp(30)
            Layout.leftMargin: dp(10)
            Text {
                id: text
                text: personal_signature
                anchors.fill: parent
                font.pixelSize: dp(18)
                color: "gray"
            }
        }
    }

    AppTabBar {
        id: appTabBar
        anchors.topMargin: dp(20)
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
        AppTabButton {
            Icon {
                icon: IconType.bookmarko
                color: "lightpink"
                size: dp(30)
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

        Item {
            GridView {
                id: multiPics
                anchors.fill: parent
                cellWidth: page_2.width / 3
                cellHeight: page_2.width / 3
                model: JsonListModel {
                    id: model_2
                    source: jsonData
                    keyField: jsonData.v_id
                }
                delegate: Rectangle {
                    color: "lightyellow"
                    width: multiPics.cellWidth - 5
                    height: multiPics.cellHeight - 5
                    border.color: "lightgray"
                    border.width: dp(2)
                    PostImage {
                        anchors.fill: parent
                        item: model_2.get(index)
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                //                                listView.visible=true
                                //                                listView.z=3
                                navigationStack.push(allpost)
                                listView.positionViewAtIndex(index,
                                                             listView.Center)
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            color: "lightgray"
        }
        Rectangle {
            color: "Gray"
        }
    }

    Page {
        id: allpost
        visible: false
        ListView {
            //visible: false
            id: listView
            anchors.fill: parent
            model: JsonListModel {
                id: listModel
                source: jsonData
                keyField: jsonData.v_id
            }

            delegate: Rectangle {
                width: page.width
                height: dp(500)
                border.color: "lightgray"
                border.width: dp(1)
                AllMyPosts {
                    item: listModel.get(index)
                }
            }
        }
    }
}
