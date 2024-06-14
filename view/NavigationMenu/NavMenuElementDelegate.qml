import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: navMenuElementDelegate
    clip: true

    required property real foldWidth
    required property real foldHeight

    required property real unfoldWidth
    required property real unfoldHeight

    required property real animDuration

    Component.onCompleted: {
        width = foldWidth
        height = foldHeight
    }

    states: State {
        name: "unfolded"
        PropertyChanges {
            navMenuElementDelegate {
                width: navMenuElementDelegate.unfoldWidth
                height: navMenuElementDelegate.unfoldHeight
            }
        }
    }

    transitions: Transition {
        from: ""; to: "unfolded"
        reversible: true
        PropertyAnimation {
            property: "width"
            duration: navMenuElementDelegate.animDuration
            easing.type: Easing.InOutQuad
        }
    }

    Row {
        spacing: 2
        anchors.fill: parent

        Rectangle {
            width: { width = navMenuElementDelegate.foldWidth }
            height: { height = navMenuElementDelegate.foldHeight }
        }

        Text {
            text: "Hello World"
            color: "red"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}