import Felgo 3.0
import QtQuick 2.0

Item {

    AppImage {
        id: image
        anchors.fill: parent
        // important to automatically rotate the image taken from the camera
        autoTransform: true
        fillMode: Image.PreserveAspectFit
    }

    AppButton {
        anchors.centerIn: parent
        text: "Display CameraPicker"
        onClicked: {
            nativeUtils.displayCameraPicker("test")
        }
    }

    Connections {
        target: nativeUtils
        onCameraPickerFinished: {
            if (accepted)
                image.source = path
        }
    }
}
