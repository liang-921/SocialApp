import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls 2.2
import Felgo 3.0

import "../widgets"
import "../model"
import "../pages"

ListPage {
    id: page
    title: qsTr(username)

    property real iconwidth: page.width / 12
    property real iconheight: 120
    property real iconsize: dp(30)
    property int pictureNum: 3
    property var sourceArray: []

    DataModel{
        id:dataModel
    }

    property var userInform: dataModel.userInform || null
    property var head_portrait: userInform ? userInform.profile_image : null
    property var username:userInform ? userInform.username : null
    property var invitation_num: userInform ? userInform.invitation_num : null
    property var invitation:userInform ? userInform.invitation : null

    property var jsonData: invitation

    model: JsonListModel{
        id:listModel
        source: jsonData
        keyField: jsonData.v_id
    }

    delegate: Rectangle{
        width: page.width
        height: dp(500)
        border.color: "lightgray"
        border.width: dp(1)
        Card{
               item:listModel.get(index)
        }

    }

    Component {
        id: messageComponent
        MessagesPage {}
    }
    Component {
        id: change1Component
        Change1PicPage {}
    }
    Component {
        id: personComponent
        PersonPage {}
    }

    Component{
        id:followComponent
        AttentionMainPage{}
    }
}
