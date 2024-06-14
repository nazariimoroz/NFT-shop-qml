import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NsView

Rectangle {
    id: navigationMenu
    color: "red"
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    width: 40

    property var unfoldedWidth: 200
    property real unfoldingDuration: 100

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
            from: "";
            to: "unfolded"; reversible: true
            PropertyAnimation {
                property: "width"
                duration: navigationMenu.unfoldingDuration
                easing.type: Easing.InOutQuad
            }
        }
    ]

    ListView {
        id: navMenuElements
        anchors.fill: parent
        anchors.margins: 3
        spacing: 3

        model: ListModel {
            ListElement {
            }
            ListElement {
            }
            ListElement {
            }
        }

        delegate: NavMenuElementDelegate {
            foldWidth: navMenuElements.width
            foldHeight: navMenuElements.width

            unfoldWidth: navigationMenu.unfoldedWidth - navMenuElements.anchors.margins * 2
            unfoldHeight: { unfoldHeight = foldHeight }

            animDuration: navigationMenu.unfoldingDuration

            color: "black"

            Connections {
                target: navigationMenu
                function onStateChanged(newState) {
                    state = newState
                }
            }
        }
    }
}

