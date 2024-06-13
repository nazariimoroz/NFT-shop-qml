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

    Text { id: userNameText }
    Text { id: userBioText; anchors.top: userNameText.bottom }

}
