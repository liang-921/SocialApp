import QtQuick 2.12
import QtQuick.Controls 2.5
import Felgo 3.0

Item {
    id:row

    signal selected(int index)

    Rectangle {
      color: cellArea.pressed ? "#eee" : "#fff"
      anchors.fill: parent

      Behavior on color {
        ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
      }
    }

    MouseArea {
      id: cellArea

      enabled: row.enabled
      anchors.fill: parent

      onClicked: selected(typeof index !== "undefined" ? index : 0)
    }

    height: id.height
    Row {
        id: pictext
        spacing: id.width / 5
        RoundedImage {
            id: id
            width: dp(70)
            height: dp(70)
            fillMode: Image.PreserveAspectCrop
            source: "../../assets/3.png"
            radius: width / 2
        }
        Column {
            spacing: id.height / 16
            anchors.verticalCenter: id.verticalCenter
            Text {
                id: id_text
                font.pixelSize: dp(20)
                text: "moon"
                color: "black"
            }
            Text {
                id: time_text
                font.pixelSize: dp(18)
                text: "10 send"
                color: "grey"
            }
        }
    }
}
