import QtQuick 2.0

Item {

    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#f7f7f5"

        Rectangle{
            id: div_content
            color: "#f7f7f5"
            Rectangle {
                id: div_monday
                x: 20
                y: 30
                width: 142
                height: 477
                color: "#ffffff"
                radius: 10

                Text {
                    id: label_monday
                    x: 8
                    y: -27
                    width: 126
                    height: 21
                    color: "#0783c9"
                    text: qsTr("Monday")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 18
                }

                Rectangle {
                    id: rectangle
                    x: 0
                    y: 0
                    width: 142
                    height: 195
                    color: "#b5d9f9"
                    radius: 10

                    Text {
                        id: name_class
                        x: 8
                        y: 48
                        width: 126
                        height: 28
                        color: "#000000"
                        text: qsTr("IT001.MTCL")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 18
                    }

                    Text {
                        id: element1
                        x: 8
                        y: 82
                        width: 126
                        height: 22
                        color: "#3e3f43"
                        text: qsTr("7h30 - 9h35")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                    }
                }
            }

            Rectangle {
                id: div_thuesday
                x: 171
                y: 30
                width: 142
                height: 477
                color: "#ffffff"
                radius: 10
                Text {
                    id: label_thuesday
                    x: 8
                    y: -28
                    width: 126
                    height: 21
                    color: "#0783c9"
                    text: qsTr("Thuesday")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: div_webday
                x: 319
                y: 30
                width: 142
                height: 477
                color: "#ffffff"
                radius: 10
                Text {
                    id: label_webday
                    x: 8
                    y: -27
                    width: 126
                    height: 21
                    color: "#0783c9"
                    text: qsTr("Wednesday")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }

                Rectangle {
                    id: rectangle1
                    x: 0
                    y: 199
                    width: 142
                    height: 186
                    color: "#84ef7a"
                    radius: 10

                    Text {
                        id: element2
                        x: 8
                        y: 70
                        width: 126
                        height: 22
                        color: "#3e3f43"
                        text: qsTr("13h - 15h30")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }

            Rectangle {
                id: div_Thursday
                x: 467
                y: 30
                width: 142
                height: 477
                color: "#ffffff"
                radius: 10
                Text {
                    id: label_Thursday
                    x: 8
                    y: -28
                    width: 126
                    height: 21
                    color: "#0783c9"
                    text: qsTr("Thursday")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: div_friday
                x: 615
                y: 30
                width: 142
                height: 477
                color: "#ffffff"
                radius: 10
                Text {
                    id: label_friday
                    x: 8
                    y: -28
                    width: 126
                    height: 21
                    color: "#0783c9"
                    text: qsTr("Friday")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Text {
                id: l1
                x: 2
                y: 30
                text: qsTr("L1")
                font.pixelSize: 14
            }

            Text {
                id: l2
                x: 2
                y: 90
                text: qsTr("L2")
                font.pixelSize: 14
            }

            Text {
                id: l3
                x: 2
                y: 150
                text: qsTr("L3")
                font.pixelSize: 14
            }

            Text {
                id: l4
                x: 2
                y: 210
                text: qsTr("L4")
                font.pixelSize: 14
            }

            Text {
                id: l5
                x: 3
                y: 270
                text: qsTr("L5")
                font.pixelSize: 14
            }

            Text {
                id: l6
                x: 3
                y: 330
                text: qsTr("L6")
                font.pixelSize: 14
            }

            Text {
                id: l7
                x: 3
                y: 390
                text: qsTr("L7")
                font.pixelSize: 14
            }

            Text {
                id: l8
                x: 3
                y: 449
                text: qsTr("L8")
                font.pixelSize: 14
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:515;width:764}
}
##^##*/
