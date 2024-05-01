import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 500
    height: 500
    visible: true
    flags: Qt.SubWindow

    ColumnLayout {
        id: regLayout
        anchors.centerIn: parent
        spacing: 10

        readonly property var elementWidth: 200
        readonly property var elementHeight: 30


        TextField {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Login"
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter
        }

        TextField {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Password"
            echoMode: TextInput.Password
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            spacing: 10

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "Registration"
            }

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "Login"
            }
        }
    }
}