import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NsView
import NsModels
import "." as App

ApplicationWindow {
    id: applicationWindow
    height: 700
    width: 440
    title: "NFT Shop"
    visible: true

    property UserModel userModel: null
    property string paneColor: "#1f1f1f"

    function updateUserUi() {
        if (!userModel) {
            console.error("!userModel")
            return
        }
    }

    /*
    LoginWindow {
        id: loginWindow
        transientParent: applicationWindow

        onAuthCompeted: user => {
            if (!user) {
                console.error("Cant get user")
            }
            applicationWindow.userModel = user
            applicationWindow.userModel.parent = applicationWindow
            loginWindow.close()

            updateUserUi()
        }
    }*/

    Action {
        id: backToMainPage
        onTriggered: {
            contentStackView.pop(contentStackView.initialItem, StackView.Immediate)
            contentStackView.currentItem.refresh();
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            spacing: 1

            ToolButton {
                action: backToMainPage
            }

            Rectangle {
                Layout.fillWidth: true
            }

            ToolButton {

            }

            ToolButton {

            }

            ToolButton {

            }
        }
    }

    StackView {
        id: contentStackView
        anchors.fill: parent

        initialItem: App.MainPage {
            id: mainPage
            anchors.fill: parent
        }
    }
}
