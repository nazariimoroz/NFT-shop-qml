import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "." as App

Pane {
    id: explorePane
    padding: 0
    implicitHeight: nftColumn.height

    Column {
        id: nftColumn
        width: parent.width

        App.NftSwiper {
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

                App.NftSwiper2 {
                    Layout.fillHeight: false
                    Layout.minimumHeight: flickable.height

                    nftElementColor: Qt.lighter("#1f1f1f")
                    nftElementWidth: nftColumn.width
                    nftElementHeight: 80
                }

            }
        }
    }
}
