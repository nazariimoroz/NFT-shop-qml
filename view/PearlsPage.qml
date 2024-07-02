import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: explorePane
    padding: 0
    implicitHeight: 100

    Column {
        width: parent.width
        spacing: 5

        Text {
            width: parent.width
            text: "Drops curated by Getgems team"
            color: Qt.rgba(1,1,1,1)
            wrapMode: Text.Wrap
            font.pointSize: 20
            font.bold: true
        }
        Text {
            width: parent.width
            text: "Diamdefinitiones ridens gubergren curae lacinia platea nascetur.  Inimicusnibh persecuti solum ea habeo quot blandit mel fringilla.  Maecenasefficitur lorem posuere maximus movet pro enim.  Donecpercipit detraxit enim quas.  Parturientmolestie convenire quod euismod facilisis deterruisset patrioque.  Vocibusaccommodare constituto ne dictas potenti egestas rhoncus intellegat possit imperdiet eam placerat feugait suas gravida.
Noluissemassa ornatus tellus dictumst dictumst hac explicari vix dignissim sententiae porttitor phasellus turpis.  Inciderintsigniferumque eirmod novum."
            color: Qt.rgba(1,1,1,1)
            wrapMode: Text.Wrap
            font.pointSize: 10
        }
        Button {
            text: "Subscribe via Telegram"
            width: parent.width
        }
    }
}