import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.3

Item {

    property var item: modelData

    property int pictureNum: item && item.images_num || ""
    property var sources: item && item.images || ""

    Image{
        id:no1_image
        source: sources[0]
        asynchronous: true
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
//        Text{
//            id:text
//            color: "red"
//            text: pictureNum
//            anchors.right: no1_image.right
//            anchors.top: no1_image.top
//            z:2
//        }
        Icon{
            icon: IconType.copy
            color: "pink"
            size: dp(15)
            anchors.topMargin: dp(4)
            anchors.rightMargin: dp(4)
            anchors.right: no1_image.right
            anchors.top: no1_image.top
        }
    }
}
