import QtQuick
import QtQuick.Controls

Pane {
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
