import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.15

Item {
    property int icon_z: 0
    property int frequence: 0

    property var item: modelData

    property int pictureNum: item && item.images_num || ""
    property var sources: item && item.images || ""

    property var userName: item && item.username || ""
    property var headImagePath: item && item.profile_image || ""
    property var heartNum: item && item.heart_num || ""
    property var discribe: item && item.descibe || ""

    property bool flag_heart: false

    Component {
        id: component
        Image {
            MouseArea{
                anchors.fill: parent
                onDoubleClicked: {
                    if (flag_heart === false) {
                        icon_z = 2
                        flag_heart=true
                        time.running = true
                        heart.color = "red"
                        heartNum++
                        frequence++
                    }
                }
            }
//            Timer {
//                id: time_click
//                interval: 300
//                onTriggered: {
//                    if (flag_heart === false) {
//                        area.clickNum = 0
//                        icon_z = 2
//                        //flag_heart = true
//                        time.running = true
//                        heart.color = "red"
//                        heartNum++
//                        frequence++
//                    }
//                }
//            }

//            MouseArea {
//                id:area
//                anchors.fill: parent
//                property int clickNum: 0
//                onClicked: {
//                    clickNum++
//                    if (clickNum == 1) {
//                        time_click.start()
//                        console.log(icon_z)
//                    }
//                    if (clickNum == 2) {
//                        //time_click.clickNum = 0
//                        time_click.stop()
//                        console.log(icon_z)

//                    }
//                }
//            }
       }
    }

    //add pictures to swipeview
    function addPictures() {

        var sourceArray = sources
        for (var i = 0; i < sourceArray.length; i++) {
            console.log(i)
            console.log(sourceArray[i])
            swipeview.addItem(component.createObject(swipeview, {
                                                         "source": sourceArray[i],
                                                         "fillMode"/*width: page.width,height: dp(300),*/ : Image.PreserveAspectFit
                                                     }))
        }
    }

    width: page.width
    height: dp(500)
    Rectangle {
        id: rect1
        height: dp(70)
        width: page.width
        color: "white"
        RoundedImage {
            id: profileimage
            source: headImagePath
            fillMode: Image.PreserveAspectCrop
            width: dp(45)
            height: dp(45)
            radius: profileimage.width / 2
            anchors.verticalCenter: rect1.verticalCenter
            x: 20
        }
        AppText {
            id: username
            text: userName
            color: "black"
            anchors.leftMargin: dp(20)
            anchors.left: profileimage.right
            anchors.verticalCenter: rect1.verticalCenter
        }
        IconButton {
            id: tip
            color: "pink"
            size: dp(30)
            icon: IconType.ellipsisv
            anchors.right: rect1.right
            anchors.verticalCenter: rect1.verticalCenter
        }
    }

    Rectangle {
        id: rect2
        width: rect1.width
        color: "white"
        height: dp(300)
        anchors.top: rect1.bottom
        Icon {
            id: heart_click
            anchors.centerIn: parent
            icon: IconType.heart
            color: "#fff"
            z:icon_z
            size: dp(200)
        }
        SwipeView {
            id: swipeview
            width: page.width
            height: dp(300)
            anchors.fill: parent
            Component.onCompleted: {
                addPictures()
            }
        }
    }

    Timer {
        id: time
        interval: 400
        onTriggered: {
            icon_z = 0
        }
    }

    Rectangle {
        id: rect3

        anchors.top: rect2.bottom
        width: parent.width
        height: dp(60)
        IconButton {
            id: heart
            icon: IconType.heart
            size: dp(25)
            color: "pink"
            anchors.leftMargin: dp(10)
            anchors.verticalCenter: rect3.verticalCenter
            onClicked: {
                frequence++
                if (frequence % 2 == 0) {
                    heart.color = "pink"
                    heartNum--
                    flag_heart = false
                    console.log("reduce the heart num")
                } else {
                    heart.color = "red"
                    heartNum++
                    flag_heart = true
                    console.log("add the heart num ")
                    console.log(heart.color)
                }
            }
        }

        IconButton {
            id: comment
            anchors.left: heart.right
            anchors.leftMargin: dp(10)
            size: dp(25)
            color: "pink"
            anchors.verticalCenter: heart.verticalCenter
            icon: IconType.commento
        }

        IconButton {
            id: collect
            anchors.left: comment.right
            anchors.leftMargin: dp(10)
            size: dp(25)
            color: "pink"
            anchors.verticalCenter: heart.verticalCenter
            icon: IconType.staro
        }

        PageIndicator {
            count: pictureNum
            currentIndex: swipeview.currentIndex
            anchors.centerIn: rect3
        }

        IconButton {
            id: share
            anchors.right: rect3.right
            anchors.rightMargin: dp(10)
            size: dp(25)
            color: "pink"
            anchors.verticalCenter: heart.verticalCenter
            icon: IconType.share
        }
    }

    Rectangle {
        id: rect4
        anchors.top: rect3.bottom
        x: dp(10)
        width: page.width
        height: dp(60)
        AppText {
            id: heartnum
            text: qsTr(heartNum + " hearts")
            color: "black"
            font.pixelSize: dp(16)
        }
        AppText {
            id: profile
            anchors.top: heartnum.bottom
            text: discribe
            color: "black"
            font.pixelSize: dp(13)
        }
    }
}
