import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.4 as QML

import "../widgets"

Page {
    id: page_change
    title: "Preview"

//    signal qmlSignal(string url)

    property var imageSourceArray: []

    Component{
        id:imageComponent
        Image{
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    navigationStack.push(change2picpage)
                }
            }
        }
    }

    function addImages(){
        imageSourceArray=["../../assets/1.png",
                         "../../assets/2.png",
                         "../../assets/3.png"]

        for(var i=0;i<imageSourceArray.length;i++){
            console.log(i)
            console.log(imageSourceArray[i])

            picture.addItem(imageComponent.createObject(picture,
                        {source:imageSourceArray[i],fillMode:Image.PreserveAspectFit}))
        }
    }

    Component {
        id: change2picpage
        Change2PicPage {
            sourceP: imageSourceArray[picture.currentIndex]
        }
    }
    Component{
        id:releaseNewPost
        ReleaseNewPost{
            sendImages: imageSourceArray[0]
        }
    }

    rightBarItem:TextButtonBarItem {
        text: "Release"
        color: "lightpink"
        onClicked: {
            page.navigationStack.push(releaseNewPost)
        }
    }

    QML.SwipeView {
        id: picture
        width: parent.width
        height: parent.height / 2
        y: dp(5)
        Component.onCompleted: {
            addImages()
        }
    }

    QML.ScrollView {
        width: page_change.width - dp(40)
        contentWidth: fuzzyfilter.width + dp(40)
        height: fuzzyfilter.buttonH + fuzzyfilter.textH + dp(5)
        clip: true
        anchors.top: picture.bottom
        anchors.topMargin: dp(60)
        x: dp(20)
        QML.ScrollBar.horizontal.policy: QML.ScrollBar.AlwaysOff
        FuzzyFilterRow {
            id: fuzzyfilter
            parentwidth: page_change.width
            picsource: imageSourceArray[picture.currentIndex]

//            Component.onCompleted: {
//                console.log("send Signal!")
//                page_change.onQmlSignal(fuzzyfilter.picsource)
//            }
        }
    }
}
