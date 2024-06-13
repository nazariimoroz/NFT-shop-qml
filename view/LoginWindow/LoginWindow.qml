import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NsView
import NsModels

Window {
    id: loginWindow
    width: 500
    height: 500
    visible: true
    flags: Qt.SubWindow
    title: "Authentication"
    signal authCompeted(UserModel user)

    LoginWindowController {
        id: loginWindowController

        onAuthComplete: user => loginWindow.authCompeted(user)
    }

    ColumnLayout {
        id: regLayout
        anchors.centerIn: parent
        spacing: 10

        readonly property var elementWidth: 200
        readonly property var elementHeight: 30

        TextField {
            id: nameTextField
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Name"
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter

            onEditingFinished: loginWindowController.name = nameTextField.text
        }

        TextField {
            id: usernameTextField
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Username"
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter

            onEditingFinished: loginWindowController.username = usernameTextField.text
        }

        TextField {
            id: emailTextField
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Email"
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter

            onEditingFinished: loginWindowController.email = emailTextField.text
        }

        TextField {
            id: passwordTextField
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: regLayout.elementWidth
            Layout.preferredHeight: regLayout.elementHeight
            placeholderText: "Password"
            echoMode: TextInput.Password
            cursorVisible: false
            verticalAlignment: TextInput.AlignVCenter

            onEditingFinished: loginWindowController.password = passwordTextField.text
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

                onClicked: loginWindowController.tryRegistration()
            }

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "Login"

                onClicked: loginWindowController.tryLogin()
            }
        }
    }
}
