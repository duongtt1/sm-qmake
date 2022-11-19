import QtQuick 2.0

    Rectangle {
        id: body
        x: 8
        y: 47
        width: 708
        height: 600
        color: "#ffffff"
        radius: 10

        Rectangle {
            id: class_1
            x: 8
            y: 8
            width: 692
            height: 34
            color: "#f7f7fa"
            radius: 10

            Rectangle {
                id: div_name_class
                x: 8
                y: 8
                width: 99
                height: 18
                color: "#f7f7fa"

                Text {
                    id: name_class_id1
                    x: 0
                    y: 1
                    width: 99
                    height: 17
                    text: qsTr("IT001.MTCL.1")
                    font.pixelSize: 14
                }
            }
        }

        Rectangle {
            id: div_name_class1
            x: 131
            y: 16
            width: 105
            height: 18
            color: "#f7f7fa"
            Text {
                x: 56
                id: name_class_id4
                y: 0
                width: 109
                height: 18
                text: qsTr("qjt-rtgr-rkv")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
            }
        }

        Rectangle {
            id: div_name_class2
            x: 309
            y: 14
            width: 105
            height: 22
            color: "#f7f7fa"
            Text {
                id: name_class_id5
                x: -2
                y: 2
                width: 105
                height: 17
                text: qsTr("online")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
            }
        }

        Rectangle {
            id: div_name_class3
            x: 420
            y: 16
            width: 106
            height: 18
            color: "#f7f7fa"
            Text {
                id: name_class_id6
                x: 0
                y: 0
                width: 105
                height: 17
                text: qsTr("20:30 6/11")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
            }
        }

        Image {
            id: image
            x: 667
            y: 13
            width: 24
            height: 24
            fillMode: Image.PreserveAspectFit
            source: "../Resources/icon/more-2.png"
        }

        Text {
            id: name_class_id7
            x: 532
            y: 17
            width: 83
            height: 17
            text: qsTr("Not start")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }
    }


/*##^##
Designer {
    D{i:0;autoSize:true;height:460;width:708}
}
##^##*/
