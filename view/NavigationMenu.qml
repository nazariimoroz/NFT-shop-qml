import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: navigationMenu
    color: "red"
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    width: 40

    property var unfoldedWidth: 200
    property alias unfoldingDuration: noneToUndoldedAnim.duration

    MouseArea {
        id: mouseArea;
        anchors.fill: parent;
        hoverEnabled: true
    }

    states: [
        State {
            name: "unfolded"
            when: mouseArea.containsMouse === true
            PropertyChanges {
                navigationMenu {
                    width: unfoldedWidth
                }
            }
        }
    ]

    transitions: [
        Transition {
            from: ""; to: "unfolded"; reversible: true
            PropertyAnimation { id: noneToUndoldedAnim; property: "width"; duration: 100; easing.type: Easing.InOutQuad }
        }
    ]
}

