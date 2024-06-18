import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NsView
import NsModels

ApplicationWindow {
    id: applicationWindow
    height: 700
    width: 440
    title: "NFT Shop"
    visible: true

    property UserModel userModel: null
    function updateUserUi() {
        if(!userModel)  {
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

    /* ALL FRONT HERE */
    Rectangle {
        id: rootRectangle
        anchors.fill: parent

        readonly property real navMenuFoldedSize: 50
        readonly property real navMenuUnfoldedSize: 250

        states: [
            State {
                name: "shaded"
                PropertyChanges {
                    shadeRectangle {
                        color: Qt.rgba(1,1,1,0.2)
                    }
                }
            }
        ]

        transitions: [
            Transition {
                from: ""; to: "shaded"; reversible: true
                ColorAnimation { duration: 100 }
            }
        ]

        NavigationMenu {
            id: navigationMenu
            width: rootRectangle.navMenuFoldedSize
            unfoldedWidth: rootRectangle.navMenuUnfoldedSize
            unfoldingDuration: 100
            z: 100

            onStateChanged: state => {
                switch(state) {
                    case "unfolded":
                        rootRectangle.state = "shaded"
                        break;
                    default:
                        rootRectangle.state = ""
                        break;
                }
            }
        }

        Rectangle {
            id: shadeRectangle
            z: 99
            anchors.fill: parent
            color: Qt.rgba(1,1,1,0)
        }

        Pane {
            id: contentRectangle

            width: parent.width - rootRectangle.navMenuFoldedSize
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            StackView {
                id: contentSwipeView
                anchors.fill: parent

                initialItem: MainContent {}
            }

            component MainContent: Pane {
                width: parent ? parent.width : 0
                height: parent ? parent.height : 0
            }
        }
    }
}
