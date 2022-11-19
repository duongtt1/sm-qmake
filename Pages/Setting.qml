import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#ffffff"

        Rectangle {
            id: rectangle2
            x: 13
            y: 36
            width: 743
            height: 36
            color: "#f7f7f5"
            radius: 10

            Text {
                id: element
                x: 39
                y: 9
                width: 176
                height: 20
                text: qsTr("General")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            Image {
                id: image
                x: 9
                y: 7
                width: 24
                height: 24
                fillMode: Image.PreserveAspectFit
                source: "../Resources/icon/settings.png"
            }
        }

        Text {
            id: element1
            x: 13
            y: 16
            text: qsTr("Text")
            font.pixelSize: 12
        }
    }
}
