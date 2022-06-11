import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.4 as QML
import QtQuick.Layouts 1.3
import an.qml.Controls 1.0

import "../widgets"

Page {
    id: page

    property var sourceP: ""
    property int ligthSlider: 0
    property int penWidth: 1
    property var penColor: "red"
    property int rotat_count: 0


    title: "Edit And Draw"

    rightBarItem: IconButtonBarItem {
        icon: IconType.check
        iconSize: dp(21)
        color: "lightpink"
        onClicked: {
            NativeDialog.confirm("Please Confirm", "Are you sure to not save?",
                                 function (ok) {
                                     if (ok) {
                                         navigationStack.pop()
                                     } else {

                                         //navigationStack.pop()
                                     }
                                 })
            //navigationStack.pop()
        }
    }
//QML.ScrollView{
//    width: parent.width
//    contentWidth: parent.width
//    contentHeight: dp(1000)
//    height: parent.height

    Image {
        id: img
        width: page.width
        height: page.height / 2
        fillMode: Image.PreserveAspectFit
        source: sourceP
    }
    Qml_Painting {
        id: painter
        anchors.fill: img
        pen_Color: penColor
        visible: false
        pen_Width: penWidth
    }

    QML.StackView {
        id: stack
        width: page.width
        height: dp(page.height / 3)
        anchors.top: img.bottom
        anchors.topMargin: dp(100)
        initialItem: init
    }

//}
    Component {
        id: init
        Rectangle {
            QML.SwipeView {
                id: swipe
                anchors.fill: parent
                currentIndex: tabbar.currentIndex
                QML.ScrollView {
                    width: page.width - dp(40)
                    contentWidth: filter.width + dp(80)
                    height: filter.buttonH + filter.textH + dp(5)
                    clip: true
                    x: dp(20)
                    QML.ScrollBar.horizontal.policy: QML.ScrollBar.AlwaysOff
                    FilterPicRow {
                        id: filter
                        x: dp(20)
                        parentwidth: page.width
                        picsource: img.source
                    }
                }
                QML.ScrollView {
                    width: page.width - dp(40)
                    contentWidth: setup.width + dp(80)
                    height: setup.buttonH + setup.textH + dp(5)
                    clip: true
                    x: dp(50)
                    QML.ScrollBar.horizontal.policy: QML.ScrollBar.AlwaysOff
                    SetupPicRow {
                        id: setup
                        x: dp(20)
                        parentwidth: page.width
                        onPushPage: {
                            if (name === "剪切旋转") {
                                stack.push(cut)
                            } else if (name === "亮度") {
                                stack.push(light)
                            } else if (name === "曝光") {
                                stack.push(expose)
                            } else if (name === "对比度") {
                                stack.push(compare)
                            } else if (name === "饱和度") {
                                stack.push(fullrate)
                            } else if (name === "色温") {
                                stack.push(tempture)
                            } else if (name === "涂鸦") {
                                stack.push(paint)
                            }
                        }
                    }
                }
            }
            AppTabBar {
                id: tabbar
                anchors.bottom: swipe.top
                anchors.bottomMargin: dp(30)
                contentContainer: swipe
                AppTabButton {
                    Text {
                        text: qsTr("Filter")
                        anchors.centerIn: parent
                        font.bold: true
                    }
                }
                AppTabButton {
                    Text {
                        text: qsTr("Set Up")
                        anchors.centerIn: parent
                        font.bold: true
                    }
                }
            }
        }
    }

    Component {
        id: cut
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            Row {
                id: icon
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: page.width / 5
                IconButton {
                    icon: IconType.crop
                    color: "black"
                    size: dp(50)
                }
                IconButton {
                    icon: IconType.rotateright
                    color: "black"
                    size: dp(50)
                    onClicked: {
                        img.rotation = 90 * rotat_count
                        rotat_count++
                    }
                }
            }
            PageButton1Row {
                id: pagecutbutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: icon.bottom
                anchors.topMargin: dp(page.height / 20)
            }
        }
    }

    Component {
        id: light
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            ChangeSliderColumn {
                id: lslider
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PageButton1Row {
                id: pagelightbutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: lslider.bottom
                anchors.topMargin: dp(page.height / 20)
                onSaveChange: {
                    lightSlider = lslider.sValue
                }
            }
        }
    }

    Component {
        id: paint
        Rectangle {
            id: rectPic
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.bottom
            Component.onCompleted: {
                painter.visible = true
            }
            Column {
                id: pen
                spacing: dp(40)
                IconButton {
                    icon: IconType.reply
                    color: "lightpink"
                    x: page.width - dp(100)
                    size: dp(20)
                    onClicked: {
                        painter.undo()

                    }
                }
                ColorPickerFlow {
                    id: colorPicker
                    x: dp(20)
                    width: page.width
                    anchors.horizontalCenter: page.horizontalCenter
                    pagewidth: page.width
                    onSelected: {
                        penColor = select_color
                    }
                }
                Row {
                    anchors.top: colorPicker.bottom
                    anchors.topMargin: dp(50)//dp(page.height / 24)
                    anchors.horizontalCenter: colorPicker.horizontalCenter
                    AppSlider {
                        id: brushfont
                        from: 1
                        to: 100
                        stepSize: 1
                        trackColor: "lightpink"
                        knobColor: "#000"
                        tintedTrackColor: "lightgrey"
                        onValueChanged: {
                            penWidth = brushfont.value
                        }
                    }
                    Text {
                        anchors.verticalCenter: brushfont.verticalCenter
                        text: brushfont.value
                        font.pixelSize: dp(20)
                        font.bold: true
                    }
                }
            }
            PageButton1Row {
                id: pagepaintbutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: pen.bottom
                anchors.topMargin: dp(100)//dp(page.height / 15)
                onEndChange: {
                    painter.clear()
                    painter.visible = false
                }
                onSaveChange: {
                    painter.visible = false
                }
            }
        }
    }

    Component {
        id: expose
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            ChangeSliderColumn {
                id: lslider
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PageButton1Row {
                id: pageexposebutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: lslider.bottom
                anchors.topMargin: dp(page.height / 20)
                onSaveChange: {

                }
            }
        }
    }

    Component {
        id: compare
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            ChangeSliderColumn {
                id: lslider
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PageButton1Row {
                id: pagecamparebutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: lslider.bottom
                anchors.topMargin: dp(page.height / 20)
                onSaveChange: {

                }
            }
        }
    }

    Component {
        id: tempture
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            ChangeSliderColumn {
                id: lslider
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PageButton1Row {
                id: pagetempturebutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: lslider.bottom
                anchors.topMargin: dp(page.height / 20)
                onSaveChange: {

                }
            }
        }
    }

    Component {
        id: fullrate
        Rectangle {
            width: page.width
            height: dp(page.height / 3)
            anchors.bottom: page.Bottom
            ChangeSliderColumn {
                id: lslider
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PageButton1Row {
                id: pagefullratebutton
                pagewidth: page.width
                pageheight: page.height
                stackItem: stack
                anchors.top: lslider.bottom
                anchors.topMargin: dp(page.height / 20)
                onSaveChange: {

                }
            }
        }
    }
}
