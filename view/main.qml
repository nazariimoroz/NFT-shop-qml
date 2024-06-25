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

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            spacing: 1

            ToolButton {

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

        initialItem: MainPage {
            id: mainPage
            anchors.fill: parent
        }
    }

    component MainPage: Pane {
        topPadding: 0
        ColumnLayout {
            anchors.fill: parent

            TabBar {
                id: bar
                Layout.fillWidth: true
                TabButton {
                    text: "Explore"
                }
                TabButton {
                    text: "Pearls"
                }
            }

            StackLayout {
                id: barStack
                currentIndex: bar.currentIndex

                Pane {
                    id: explorePane
                    padding: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Flickable {
                        anchors.fill: parent
                        contentHeight: nftColumn.height

                        Column {
                            id: nftColumn
                            width: parent.width

                            NftsSwiper {
                                width: parent.width
                                height: 300
                            }

                            Rectangle {
                                height: 30
                                width: parent.width
                                color: Qt.rgba(0, 0, 0, 0)
                            }

                            Label {
                                text: "<h1>Top Collections</h1>"
                            }

                            TabBar {
                                id: collectionsBar
                                width: parent.width

                                background: Rectangle {
                                    radius: 10
                                    color: "#1f1f1f"
                                }

                                Repeater {
                                    model: ["1 day", "7 days", "30 days", "All time"]

                                    TabButton {
                                        id: tabButton
                                        text: modelData

                                        property var currentIndex: TabBar.index

                                        background: Rectangle {
                                            radius: 10
                                            color: (collectionsBar.currentIndex == tabButton.currentIndex) ? Qt.lighter(collectionsBar.background.color) : collectionsBar.background.color

                                        }
                                    }

                                }


                            }

                            Rectangle {
                                height: 10
                                width: parent.width
                                color: Qt.rgba(0, 0, 0, 0)
                            }

                            StackLayout {
                                id: collectionsBarStack
                                currentIndex: collectionsBar.currentIndex
                                width: parent.width
                                height: currentIndex === -1 ? 500 : collectionsBarStack.children[currentIndex].height

                                Repeater {
                                    model: 4
                                    Pane {
                                        padding: 0
                                        Layout.fillHeight: false
                                        Layout.minimumHeight: flickable.height

                                        Flickable {
                                            id: flickable
                                            width: parent.width
                                            height: nftsRow.height
                                            contentWidth: nftsRow.width
                                            contentHeight: nftsRow.height

                                            flickableDirection: Flickable.HorizontalFlick

                                            Row {
                                                id: nftsRow
                                                spacing: 8

                                                Repeater {
                                                    model: 4

                                                    Column {
                                                        spacing: 8

                                                        Repeater {
                                                            model: 6

                                                            Rectangle {
                                                                radius: 10
                                                                implicitWidth: nftColumn.width
                                                                implicitHeight: 80
                                                                color: Qt.lighter(applicationWindow.paneColor)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    component NftsSwiper: Pane {
        property var swiper: _swipeView

        SwipeView {
            id: _swipeView
            width: parent.width
            height: parent.height

            Repeater {
                model: 3

                Rectangle {
                    border.pixelAligned: true
                    border.width: 1
                    color: "green"
                }
            }
        }

        PageIndicator {
            count: _swipeView.count
            currentIndex: _swipeView.currentIndex

            anchors.top: _swipeView.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
