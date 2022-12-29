import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: main_item
    width: 724
    height: 600

    Connections {
            target: User
    }

    property string enabled_button: ""
    property var arr_schedule: [
        {
            "className": "IT001.MTCL.2",
            "roomCode": "qjt-rtgr-rkv",
            "roomType": "online",
            "startTime": "7h30",
            "status":"not start"
        },
        {
            "className": "IT001.MTCL.1",
            "roomCode": "qjt-rtgr-rka",
            "roomType": "online",
            "startTime": "9h30",
            "status":"starting"
        }]


    Rectangle {
        id: div_main_month
        x: 0
        y: 0
        width: 724
        height: 515
        color: "#f7f7fa"
        radius: 10

        Rectangle {
            id: header
            x: 8
            y: 8
            width: 708
            height: 33
            color: "#ffffff"
            radius: 10

            Text {
                id: name_class
                x: 17
                y: 8
                color: "#1e88e5"
                text: qsTr("Name class")
                font.pixelSize: 16
            }

            Text {
                id: room_code
                x: 158
                y: 8
                color: "#1e88e5"
                text: qsTr("Room code")
                font.pixelSize: 16
            }

            Text {
                id: room_type
                x: 281
                y: 8
                color: "#1e88e5"
                text: qsTr("Room type")
                font.pixelSize: 16
            }

            Text {
                id: start_time
                x: 387
                y: 8
                color: "#1e88e5"
                text: qsTr("Start time")
                font.pixelSize: 16
            }



            Text {
                id: status
                x: 505
                y: 8
                height: 19
                color: "#1e88e5"
                text: qsTr("Status")
                font.pixelSize: 16
            }
        }


        Rectangle {
            id: body
            x: 8
            y: 47
            width: 708
            height: 460
            color: "#ffffff"
            radius: 10

            Column {
                x: 0
                y: 8
                spacing: 10
                Repeater {
                    model: arr_schedule.length

                    Rectangle {
                        x: 8
                        y: 8
                        width: 695
                        height: 34
                        color: "#f7f7fa"
                        radius: 10
                        Row {
                            x: 8
                            y: 8
                            spacing: 65
                            Text {
                                color: "#3e3f43"
                                    text: arr_schedule[index]["className"]
                                    font.pixelSize: 14
                                }
                            Text {
                                color: "#3e3f43"
                                    text: arr_schedule[index]["roomCode"]
                                    font.pixelSize: 14
                                }
                            Text {
                                color: "#3e3f43"
                                    text: arr_schedule[index]["roomType"]
                                    font.pixelSize: 14
                                }
                            Text {
                                color: "#3e3f43"
                                    text: arr_schedule[index]["startTime"]
                                    font.pixelSize: 14
                                }
                            Text {
                                color: "#3e3f43"
                                    text: arr_schedule[index]["status"]
                                    font.pixelSize: 14
                                }

                            Rectangle {
                                id: btn_join
//                                x: 500
//                                visible: index === 1 ? true : false
                                y: -5
                                width: 70
                                height: 29
                                color: "#ffffff"
                                radius: 10
                                visible: arr_schedule[index]["status"] === "starting" ? true : false
                                Text {
                                    id: label_review
                                    width: 70
                                    height: 23
                                    color: "#1e88e5"
                                    text: qsTr("Join")
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 16
                                }
                                border.width: 1
                                border.color: "#ee2a2a"
//                                border.color: "#1e88e5"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log("btn_join_clicked" + index)

                                    }

                                }
                            }
                        }

                    }
                }
            }

        Component.onCompleted: {
            var xmlhttp2 = new XMLHttpRequest();
            var url = "https://back-end-test.onrender.com/api/v1/schedule/" + User.icNumber;
            console.log(url)
            xmlhttp2.onreadystatechange=function() {
                if (xmlhttp2.readyState === 4 && xmlhttp2.status === 200) {
                    var obj = JSON.parse(xmlhttp2.responseText);
                    if (obj["success"]){
                        arr_schedule = obj["data"]
                    }
                }
            }
            xmlhttp2.open("GET", url, true);
            xmlhttp2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xmlhttp2.send();
        }


        }




//    ListClassMonth{

    }

}

