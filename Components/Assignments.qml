import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0



Item {
    width: 764
    height: 600

    property int idx_task: 0
    property var arr_task: [{
            nametask: '',
            typetask: '',
            statustask: '',
            grade: -1
          }]

    property var arr_assgignment: ListModel {

    }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#ffffff"

        Rectangle {
            id: rectangle3
            x: 0
            y: 0
            width: 581
            height: 601
            color: "#ffffff"

            Component {
                id: com_list_assign
                Rectangle {
                    x: 8
                    y: 8
                    width: 565
                    height: 93
                    color: "#e3f2fd"
                    radius: 10

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            idx_task = index
                        }
                    }

                    AnimatedImage {
                        x: 8
                        y: 15
                        width: 64
                        height: 64
                        source: "../Resources/icon/online-test.png"
                    }

                    Label {
                        x: 78
                        y: 15
                        width: 357
                        height: 34
                        text: nametask
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 16
                    }

                    Label {
                        x: 78
                        y: 49
                        width: 357
                        height: 30
                        text: typetask
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        font.pointSize: 12
                    }

                    Label {
                        x: 454
                        y: 39
                        width: 103
                        height: 23
                        color: statustask === "Done" ? "#b935eb06" : "#ff1134"
                        text: statustask
                        font.bold: true
                        font.pointSize: 12
                    }
                }
            }

            ListView {
                model: arr_assgignment
                anchors.fill: parent
                delegate: com_list_assign
                spacing: 10
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 579
        y: 0
        width: 185
        height: 600
        color: "#48d7d3d3"

        Rectangle {
            id: rectangle2
            x: 8
            y: 8
            width: 169
            height: 41
            color: arr_task[idx_task]["statustask"] === "Done" ? "#b935eb06" : "#373a43"
            radius: 10

            Label {
                id: label
                x: 8
                y: 8
                width: 153
                height: 25
                color: "#ffffff"
                text: arr_task[idx_task]["statustask"]
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 15
            }
        }

        Label {
            id: label1
            x: 8
            y: 117
            width: 169
            height: 37
            color: "#115ee1"
            text: arr_task[idx_task]["nametask"]
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 20
        }

        Label {
            id: label4
            x: 8
            y: 165
            width: 102
            height: 22
            text: qsTr("Grade: ")
            font.pointSize: 12
        }

        Label {
            id: label5
            x: 8
            y: 193
            width: 35
            height: 22
            text: qsTr("Type: ")
            font.pointSize: 12
        }

        Label {
            id: label7
            x: 116
            y: 165
            width: 61
            height: 22
            text: arr_task[idx_task]["grade"] === -1 ? "None" : qsTr(arr_task[idx_task]["grade"] + "")
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
        }

        Label {
            id: label10
            x: 49
            y: 193
            width: 128
            height: 22
            text: qsTr("MC")
            horizontalAlignment: Text.AlignRight
            font.pointSize: 12
        }

        Rectangle {
            id: rectangle4
            x: 8
            y: 266
            width: 169
            height: 41
            color: arr_task[idx_task]["statustask"] === "Done" ? "#373a43" : "#1e88e5"
            radius: 10
            Label {
                id: label11
                x: 8
                y: 8
                width: 153
                height: 25
                color: "#ffffff"
                text: qsTr("Start ")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent
                enabled: arr_task[idx_task]["statustask"] === "Done" ? false : true
                onClicked: {
                        console.log(idx_task)
                    main_stackview.replace("qrc:/Pages/Quiz.qml")
                }
            }
        }

        Connections {
            target: StoreClass
        }

        Component.onCompleted: {

            StoreClass.setN_noti_assign(0);

            var xmlhttp = new XMLHttpRequest();
            var url = "https://back-end-test.onrender.com/api/v1/task/" + User.icNumber;
            xmlhttp.onreadystatechange=function() {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    var obj = JSON.parse(xmlhttp.responseText);
                    if (obj["success"]){
                        arr_task = obj["data"]

                        for(var i = 0; i < arr_task.length; i++){
                            arr_assgignment.append(arr_task[i])
                        }
                        // arr_task.forEach(function (data) {
                        //                 arr_assgignment.append(data)
                        //                 }
//                                            )
                    }
                }
            }
            xmlhttp.open("POST", url, true);
            xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xmlhttp.send(JSON.stringify({
                "idclass": StoreClass.idclass,
                            })
            );
        }
    }

    Connections {
        target: User
    }

    Connections {
        target: StoreClass
    }


}
