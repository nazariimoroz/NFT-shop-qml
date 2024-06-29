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
                model: [ { indexW: 0 }, { indexW: 1 }, { indexW: 2 }, { indexW: 3 } ]

                Column {
                    spacing: 8
                    required property int indexW

                    Repeater {
                        model: 6

                        App.NftSwiper2Element {
                            required property int modelData

                            implicitWidth: rootPane.nftElementWidth
                            implicitHeight: rootPane.nftElementHeight
                            color: rootPane.nftElementColor
                            text: "test_" + ((modelData + 1) + indexW * 6)
                        }
                    }
                }
            }
        }
    }

}
