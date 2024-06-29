import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Pane {
    Column {
        anchors.fill: parent

        RowLayout {
            Rectangle {
                Layout.preferredWidth: 100
                Layout.preferredHeight: 100
                color: "green"
            }

            Column {
                Layout.fillWidth: true

                Text {
                    text: "test"
                    color: "white"
                    font.pointSize: 20
                }
                Text {
                    text: "test2"
                    color: "white"
                }
            }
        }

        Rectangle {
            width: 1
            height: 25
            color: Qt.rgba(0,0,0,0)
        }

        Rectangle {
            width: parent.width
            height: balanceInfoColumn.height + 10
            radius: 10
            color: Qt.rgba(0,0,0,0)

            border { width: 1; color: "white" }

            Column {
                id: balanceInfoColumn
                x: 10
                y: 5

                Text {
                    text: "BALANCE"
                    color: "white"
                    font.pointSize: 10
                }
                Row {
                    Text {
                        text: "20.29"
                        color: "white"
                        font.pointSize: 12
                    }

                    Rectangle {
                        width: 8
                        height: 1
                        color: Qt.rgba(0,0,0,0)
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "test2"
                        color: "white"
                        font.pointSize: 9
                    }
                }
            }
        }

        Rectangle {
            width: 1
            height: 20
            color: Qt.rgba(0,0,0,0)
        }

        Column {
            spacing: 5
            width: parent.width

            Button {
                width: parent.width
                contentItem: ButtonContentComponent {
                    text: "Create"
                }
            }

            Button {
                width: parent.width
                contentItem: ButtonContentComponent {
                    text: "FAQ"
                }
            }

            Button {
                width: parent.width
                contentItem: ButtonContentComponent {
                    text: "Appearance"
                }
            }

            Button {
                width: parent.width
                contentItem: ButtonContentComponent {
                    text: "Log Out"
                }
            }
        }

        Rectangle {
            width: 1
            height: 25
            color: Qt.rgba(0,0,0,0)
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "white"
        }

        Rectangle {
            width: 1
            height: 10
            color: Qt.rgba(0,0,0,0)
        }

        Text {
            text: "COMMUNITY"
            color: "white"
            font.pointSize: 10
        }

        Rectangle {
            width: 1
            height: 10
            color: Qt.rgba(0,0,0,0)
        }

        RowLayout {
            width: parent.width
            Button {
                Layout.fillWidth: true
                text: "Channel"
            }
            Button {
                Layout.fillWidth: true
                text: "Twitter"
            }
            Button {
                Layout.fillWidth: true
                text: "Github"
            }
        }
    }

    component ButtonContentComponent: Text {
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignHCenter
        color: "white"
        font.pointSize: 12
    }
}
