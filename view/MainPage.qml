import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "." as App

Pane {
    topPadding: 0

    Flickable {
        width: parent.width
        height: parent.height
        contentHeight: mainColumn.height

        Column {
            id: mainColumn
            width: parent.width

            TabBar {
                id: bar
                width: parent.width

                TabButton {
                    text: "Explore"
                }
                TabButton {
                    text: "Pearls"
                }
            }

            StackLayout {
                id: barStack
                width: parent.width
                currentIndex: bar.currentIndex
                height: currentIndex === -1 ? 500 : barStack.children[currentIndex].height

                App.ExplorePage {
                    id: explorePane
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}