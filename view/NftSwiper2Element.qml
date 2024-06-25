import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootRect
    radius: 10
    clip: true

    Row {
        Rectangle {
            width: rootRect.height
            height: rootRect.height
            bottomLeftRadius: 10
            topLeftRadius: 10
        }

        Rectangle {
            width: 6
            height: parent.height
            color: Qt.rgba(0,0,0,0)
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter

            Text {
                text: "test"
                color: "white"
                font.pointSize: 15
            }
            Text {
                text: "asdf"
            }
        }


    }
}