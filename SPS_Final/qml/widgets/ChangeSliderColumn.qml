import QtQuick 2.0
import Felgo 3.0

Item {
    property int sValue: als.value

    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        AppSlider{
            id:als
            from:-100
            to:100
            stepSize: 1
            trackColor: "lightpink"
            knobColor: "#000"
            tintedTrackColor: "lightgrey"
        }
        Text{
            anchors.horizontalCenter: als.horizontalCenter
            text: als.value
            font.pixelSize: dp(20)
            font.bold:true
        }
    }
}
