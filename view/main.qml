import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import PsView

ApplicationWindow {
    id: applicationWindow
    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Component.onCompleted: {
        loginWindow.show();
    }


    GridLayout {
        anchors.fill: parent
        rows: 3
    }


    LoginWindow {
        id: loginWindow
        transientParent: applicationWindow
    }
}