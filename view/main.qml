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

    readonly property var rootRectangleBaseColor: "#c9ced3"
    readonly property var rootRectangleFadedColor: "#9fa8b1"

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
        color: applicationWindow.rootRectangleBaseColor

        states: [
            State {
                name: "shaded"
                PropertyChanges {
                    rootRectangle {
                        color: rootRectangleFadedColor
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
            width: 50
            unfoldedWidth: 250
            unfoldingDuration: 100

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

    }
}
