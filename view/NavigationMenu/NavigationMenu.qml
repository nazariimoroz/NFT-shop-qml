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
    clip: true

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

    Rectangle {
        id: navMenuThreeDots
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 3
        color: "#00000000"

        Component.onCompleted: {
            height = width * 2
            anchors.right = undefined
        }
    }

    Rectangle {
        id: navMenuAvatar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 3
        color: "#00000000"

        Component.onCompleted: {
            height = width
            anchors.left = undefined
        }

        Image {
            id: navMenuAvatarImage
            anchors.fill: parent
            source: "qrc:/images/defaultAvatar"
        }
    }

    Text {
        id: navMenuUsername
        anchors.top: navMenuAvatar.bottom
        text: "TEXT USER NAME"

        font.bold: true
        font.pointSize: 10

        Component.onCompleted: {
            x = navigationMenu.unfoldedWidth - width - 3
        }
    }

    ListView {
        id: navMenuElements
        anchors.top: navMenuThreeDots.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
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

