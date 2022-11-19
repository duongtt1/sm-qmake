import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQml 2.0

Item {
    width: 1024
    height: 600


    property int q_answer: 0
    property string time_display: ""
    property int i_timer: 900
    property int idx_quetions: 1
    property string nametask: "BT1"
    property var arr_idx: ListModel {
        ListElement{
            idx: "1"
        }
        ListElement{
            idx: "2"
        }
        ListElement{
            idx: "3"
        }
        ListElement{
            idx: "4"
        }
        ListElement{
            idx: "5"
        }
    }

    property var arr_quetions: [{
            "id":"1",
            "quetions": "Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình \n nào?",
            "a": "Ngôn ngữ DEC PDP",
            "b": "Ngôn ngữ C",
            "c": "Ngôn ngữ D",
            "d": "Ngôn ngữ A"
        },{
            "id":"2",
            "quetions": "Cách khai báo biến nào sau đây là đúng?",
            "a": "int: x, y, z",
            "b": "x, y, z: float",
            "c": "double x, y, z;",
            "d": "x = 0, y = 1, z = 2;"
        },{
            "id":"3",
            "quetions": "Cách nào sau đây là chính xác khi so sánh giá trị của 2 biến?",
            "a": "x >= y",
            "b": "x - y",
            "c": "x << y",
            "d": "x += y"
        },{
            "id":"4",
            "quetions": "Cách viết nào sau đây là đúng với cú pháp khai báo của câu lệnh if?",
            "a": "if biểu_thức",
            "b": "if <biểu thức>",
            "c": "if {biểu thức}",
            "d": "if (biểu thức)"
        },{
            "id":"5",
            "quetions": "Lệnh cout trong C++ có tác dụng gì?",
            "a": "Là stream đầu ra chuẩn trong C++.",
            "b": "Là lệnh chú thích trong C++",
            "c": "Là stream đầu vào chuẩn của C++.",
            "d": " Là stream đầu vào chuẩn của C++."
        }]
    property var result: []

    Rectangle {
        id: rectangle
        x: 724
        y: 0
        width: 300
        height: 600
        color: "#ffffff"

        Rectangle {
            id: rectangle1
            x: 8
            y: 8
            width: 284
            height: 63
            color: "#1976d2"
            radius: 10

            Label {
                id: label
                x: 8
                y: 8
                width: 154
                height: 20
                color: "#e3f2fd"
                text: "Time remaining "
                font.pointSize: 12

                Label {
                    id: label1
                    x: 0
                    y: 17
                    width: 146
                    height: 30
                    color: "#e3f2fd"
                    text: Math.floor(i_timer/60 ) + " : " + Math.floor(i_timer%60)
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                }
                Timer {
                        interval: 1000;
                        running: true;
                        repeat: true
                        onTriggered: {
                            i_timer = i_timer-1
                        }
                    }
            }
        }

        Rectangle {
            id: rectangle2
            x: 8
            y: 87
            width: 284
            height: 64
            color: "#ffffff"
            radius: 10
            border.color: "#1976d2"

            AnimatedImage {
                id: animatedImage
                x: 8
                y: 8
                width: 48
                height: 48
                source: "../Resources/icon/pdf-file.png"
            }

            Label {
                id: label2
                x: 62
                y: 14
                width: 214
                height: 32
                color: "#1976d2"
                text: nametask
                font.bold: true
                font.pointSize: 18
            }
        }

        Label {
            id: label3
            x: 8
            y: 157
            width: 284
            height: 36
            text: qsTr("Answer Sheet")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 14
        }

        Component {
            id: com_number
            Rectangle {
                width: 32
                height: 32
                color: "#ffffff"
                radius: 10
                border.color: "#1976d2"
                Label {
                    x: 4
                    y: 8
                    width: 24
                    height: 16
                    text: idx
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 14
                    font.bold: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            idx_quetions = idx
                            q_answer = 0
                        }
                    }
                }

            }
        }

        Rectangle {
            id: rectangle3
            x: 8
            y: 200
            width: 284
            height: 310
            color: "#fdfafa"
            radius: 15

            GridView{
                anchors.fill: parent
                anchors.rightMargin: 8
                anchors.bottomMargin: 8
                anchors.leftMargin: 8
                anchors.topMargin: 8
                x: 8
                y: 8
                cellWidth: 53
                cellHeight: 53
                model: arr_idx
                delegate: com_number
            }

        }

        Rectangle {
            id: rectangle4
            x: 8
            y: 533
            width: 130
            height: 42
            color: "#efecec"
            radius: 15

            Label {
                id: label4
                x: 8
                y: 8
                width: 114
                height: 26
                color: "#1976d2"
                text: qsTr("Cancel")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    main_stackview.replace('qrc:/Pages/DetailClass.qml');
//                    loader_detail_class.source = "qrc:/Components/Assignments.qml"
                }
            }
        }

        Rectangle {
            id: rectangle6
            x: 167
            y: 533
            width: 125
            height: 42
            color: "#1976d2"
            radius: 15

            Label {
                id: label5
                x: 8
                y: 8
                width: 114
                height: 26
                color: "#ffffff"
                text: qsTr("Submit")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 15
            }
        }
    }

    Rectangle {
        id: rectangle9
        x: 0
        y: 0
        width: 724
        height: 600
        color: "#ffffff"
        border.color: "#1976d2"

        Label {
            id: label9
            x: 8
            y: 8
            width: 699
            height: 38
            color: "#1976d2"
            text: qsTr("Quetions: " + arr_quetions[idx_quetions-1]["id"])
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
        }

        Rectangle {
            id: rectangle10
            x: 8
            y: 52
            width: 708
            height: 540
            color: "#ffffff"

            Rectangle {
                id: rectangle11
                x: 8
                y: 8
                width: 692
                height: 298
                color: "#ffffff"
                border.color: "#1976d2"

                TextArea {
                    id: textArea
                    x: 8
                    y: 8
                    width: 676
                    height: 282
                    text: arr_quetions[idx_quetions-1]["quetions"]
//                    text: "Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình \n nào?"
                    font.pointSize: 12
                    placeholderText: qsTr("Text Area")
                }
            }

            Rectangle {
                id: rectangle13
                x: 8
                y: 312
                width: 692
                height: 228
                color: "#ffffff"
                border.color: "#1976d2"

                Rectangle {
                    id: rectangle14
                    x: 8
                    y: 125
                    width: 676
                    height: 40
                    color: q_answer === 3 ? "#1976d2" : "#f0f2f5"
                    radius: 10
                    border.color: "#ffffff"

                    Label {
                        id: label12
                        x: 8
                        y: 4
                        width: 32
                        height: 32
                        color: q_answer === 3 ? "#ffffff" : "#1976d2"
                        text: qsTr("C")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 18
                        font.bold: true
                    }

                    Label {
                        id: label16
                        x: 46
                        y: 8
                        width: 638
                        height: 24
                        color: q_answer === 3 ? "#ffffff" : "#000000"
                        text: arr_quetions[idx_quetions-1]["c"]
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            q_answer = 3;
                        }
                    }
                }

                Rectangle {
                    id: rectangle15
                    x: 8
                    y: 71
                    width: 676
                    height: 40
                    color: q_answer === 2 ? "#1976d2" : "#f0f2f5"
                    radius: 10
                    border.color: "#ffffff"

                    Label {
                        id: label11
                        x: 8
                        y: 4
                        width: 32
                        height: 32
                        color: q_answer === 2 ? "#ffffff" : "#1976d2"
                        text: qsTr("B")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 18
                        font.bold: true
                    }

                    Label {
                        id: label15
                        x: 46
                        y: 8
                        width: 638
                        height: 24
                        color: q_answer === 2 ? "#ffffff" : "#000000"
                        text: arr_quetions[idx_quetions-1]["b"]
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            q_answer = 2;
                        }
                    }
                }

                Rectangle {
                    id: rectangle16
                    x: 8
                    y: 13
                    width: 676
                    height: 40
                    color: q_answer === 1 ? "#1976d2" : "#f0f2f5"
                    radius: 10
                    border.color: "#ffffff"

                    Label {
                        id: label10
                        x: 8
                        y: 4
                        width: 32
                        height: 32
                        color: q_answer === 1 ? "#ffffff" : "#1976d2"
                        text: qsTr("A")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 18
                    }

                    Label {
                        id: label14
                        x: 46
                        y: 4
                        width: 630
                        height: 32
                        color: q_answer === 1 ? "#ffffff" : "#000000"
                        text: arr_quetions[idx_quetions-1]["a"]
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            q_answer = 1;
                        }
                    }
                }

                Rectangle {
                    id: rectangle17
                    x: 8
                    y: 177
                    width: 676
                    height: 40
                    color: q_answer === 4 ? "#1976d2" : "#f0f2f5"
                    radius: 10
                    border.color: "#ffffff"

                    Label {
                        id: label13
                        x: 8
                        y: 4
                        width: 32
                        height: 32
                        color: q_answer === 4 ? "#ffffff" : "#1976d2"
                        text: qsTr("D")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 18
                        font.bold: true
                    }

                    Label {
                        id: label17
                        x: 46
                        y: 8
                        width: 633
                        height: 24
                        color: q_answer === 4 ? "#ffffff" : "#000000"
                        text: arr_quetions[idx_quetions-1]["d"]
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            q_answer = 4;
                        }
                    }
                }
            }
        }
    }
}
