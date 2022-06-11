import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3

import Felgo 3.0
import "../widgets"
import "../model"

Page {
    id: page

    title:qsTr(username)


    Component{
        id:sendmessageComponent
        SendMessagePage{}
    }

    DataModel{
        id:dataModel
    }

    property var userInform: dataModel.userInform || null
    property var username:userInform ? userInform.username : null

    rightBarItem: IconButtonBarItem {
        icon: IconType.pencilsquareo
        color: "pink"
        iconSize: dp(30)
        onClicked: {
            navigationStack.push(sendmessageComponent)
        }
    }

    SearchBar {
        id: searchBar
        pullEnabled: true
        //        target: MessageRow
    }

    Label {
        id: label
        x: dp(20)
//        anchors.top:searchBar.bottom
        y: searchBar.y + searchBar.height + 10
        font.pixelSize: dp(22)
        text: "Message"
        color: "black"
    }

    AppListView{
        anchors.top: label.bottom
        anchors.topMargin: parent.height/50
        x:dp(10)
        spacing: dp(8)

        model:[
            {
               source1:"../../assets/3.png",
                text1:"moon",
                text2: "10 send"
            },
            {
               source1:"../../assets/3.png",
                text1:"moon",
                text2: "10 send"
            }
        ]
        delegate:  MessageRow{
            id:row
            onSelected: console.log(index)
        }
    }
}
