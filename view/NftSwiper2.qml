import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "." as App

Pane {
    id: rootPane
    padding: 0

    property var flickable: _flickable

    property color nftElementColor
    property real nftElementWidth
    property real nftElementHeight

    Flickable {
        id: _flickable
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

                        App.NftSwiper2Element {
                            implicitWidth: rootPane.nftElementWidth
                            implicitHeight: rootPane.nftElementHeight
                            color: rootPane.nftElementColor
                        }
                    }
                }
            }
        }
    }

}
