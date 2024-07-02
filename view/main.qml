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
        id: backToMainPageAction

        icon.source: "/images/mainMenu"

        onTriggered: {
            if(contentStackView.currentItem === contentStackView.initialItem)
            {
                contentStackView.currentItem.refresh();
            }
            else {
                contentStackView.pop(contentStackView.initialItem, StackView.Immediate)
            }
        }
    }

    Component {
        id: searchPageComponent

        App.SearchPage {

        }
    }

    Action {
        id: searchPageAction

        icon.source: "/images/searchMagnifyingGlass"

        onTriggered: (source) => {
            if(!(contentStackView.currentItem instanceof App.SearchPage)) {
                backToMainPageAction.trigger(source)
                contentStackView.push(searchPageComponent, {})
            }
            else {
                backToMainPageAction.trigger(source)
            }
        }
    }

    Component {
        id: notificationsPageComponent

        App.NotificationsPage {

        }
    }

    Action {
        id: notificationsPageAction

        icon.source: "/images/notificationBell"

        onTriggered: (source) => {
            if(!(contentStackView.currentItem instanceof App.NotificationsPage)) {
                backToMainPageAction.trigger(source)
                contentStackView.push(notificationsPageComponent, {})
            }
            else {
                backToMainPageAction.trigger(source)
            }
        }
    }

    Component {
        id: userProfilePageComponent
        App.UserProfilePage {

        }
    }

    Action {
        id: userProfilePageAction

        icon.source: contentStackView.currentItem instanceof App.UserProfilePage
            ? "/images/userProfilePageOpened"
            : "/images/userProfilePageClosed"

        onTriggered: (source) => {
            if(!(contentStackView.currentItem instanceof App.UserProfilePage)) {
                backToMainPageAction.trigger(source)
                contentStackView.push(userProfilePageComponent, {})
            }
            else {
                backToMainPageAction.trigger(source)
            }
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            spacing: 1

            ToolButton {
                action: backToMainPageAction
            }

            Rectangle {
                Layout.fillWidth: true
            }

            ToolButton {
                action: searchPageAction
            }

            ToolButton {
                action: notificationsPageAction
            }

            ToolButton {
                action: userProfilePageAction
            }
        }
    }

    StackView {
        id: contentStackView
        anchors.fill: parent

        initialItem: App.MainPage {
            id: mainPage
        }
    }
}
