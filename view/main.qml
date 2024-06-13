import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NsView
import NsModels

ApplicationWindow {
    id: applicationWindow
    height: 480
    width: 640
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
        userNameText.text = userModel.name
        userBioText.text = userModel.bio
    }

    Component.onCompleted: {
        loginWindow.show()
    }

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
    }

    /* ALL FRONT HERE */
    Rectangle {
        id: rootRectangle
        anchors.fill: parent
        color: applicationWindow.rootRectangleBaseColor

        Rectangle {
            id: navigationMenu
            color: "red"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 40

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
                            width: 200
                        }
                        rootRectangle {
                            color: applicationWindow.rootRectangleFadedColor
                        }
                    }
                }
            ]

            transitions: [
                Transition {
                    from: ""; to: "unfolded"; reversible: true
                    ParallelAnimation {
                        PropertyAnimation { property: "width"; duration: 100; easing.type: Easing.InOutQuad }
                        ColorAnimation { duration: 100; }
                    }
                }
            ]
        }


    }

    Text { id: userNameText }
    Text { id: userBioText; anchors.top: userNameText.bottom }

}
