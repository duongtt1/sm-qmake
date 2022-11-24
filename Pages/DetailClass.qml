import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0

Item {
    property string nameClass: ""
    property string idClass: ""
    property string nameTeacher: ""
    property var classislive: false
//    property var arr_members: []

    Connections {
        target: DSocket
        onStartClassSignal: {
            classislive = true
        }
    }

    Column {
        id: main
        x: 261
        y: 0
        width: 763
        height: 600

        Rectangle {
            id: div_main
            width: 764
            height: 600
            color: "#ffffff"
            Loader {
                id: loader_detail_class
                source: "qrc:/Components/Lessons.qml"
            }
        }
    }

    Rectangle {
        id: sidebar
        x: 0
        y: 0
        width: 260
        height: 600
        color: "#b5d9f9"

        Rectangle {
            id: div_side_bar
            x: 260
            y: 0
            width: 0
            height: 600
            color: "#ffffff"

            Rectangle {
                id: div_member
                x: -253
                y: 291
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_member
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    source: "../Resources/icon/people.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: label_member
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Members")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: ()=>{
                        loader_detail_class.source = "qrc:/Components/Members.qml"
                    }
                }
            }

            Rectangle {
                id: div_logout
                x: -253
                y: 548
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_logout
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    source: "../Resources/icon/logout.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: label_logout
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Go to Dashboard")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: ()=>{
                                   main_stackview.replace("qrc:/Pages/Dashboard.qml")
                           }
                }
            }

            Rectangle {
                id: dev_assignments
                x: -253
                y: 233
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_assignments
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/assignment.png"
                }

                Text {
                    id: label_assignments
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Assignments")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
//                    width: 246
                    anchors.fill: parent
                    onClicked: ()=>{
                                    loader_detail_class.source = "qrc:/Components/Assignments.qml"
                               }
                }
            }

            Rectangle {
                id: div_lessons
                x: -252
                y: 179
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10

                Image {
                    id: icon_lessons
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/tutorial.png"
                }

                Text {
                    id: label_lessons
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Lessons")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: ()=>{
                        loader_detail_class.source = "qrc:/Components/Lessons.qml"
                    }
                }
            }
        }

        Text {
            id: category
            x: 1
            y: 155
            color: "#303136"
            text: qsTr("Category")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
        }

        Text {
            id: name_class
            x: 7
            y: 10
            width: 246
            height: 42
            color: "#292b30"
            text: "Class "+ nameClass
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 26
        }

        Text {
            id: code_class
            x: 8
            y: 53
            width: 202
            height: 21
            color: "#303136"
            text: "Code class " + idClass
            verticalAlignment: Text.AlignTop
            font.pixelSize: 14

            Text {
                id: tc
                x: -6
                y: 34
                color: "#303136"
                text: qsTr("Teacher: ")
                font.pixelSize: 14
            }
        }

        Image {
            id: avatar_teacher
            x: 8
            y: 110
            width: 36
            height: 36
            source: "../Resources/icon/speech.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: name_teacher
            x: 50
            y: 110
            width: 204
            height: 36
            text: nameTeacher
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }

        Connections {
            target: ActionClass
        }


            AnimatedImage {
                id: icon_videocall
                x: 914
                y: 492
                width: 100
                height: 100
                visible: classislive === true ? true : false
                source: "../Resources/icon/icons8-live-video-on.gif"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ActionClass.openMeeting()
                    }
                }
            }

        Component.onCompleted: {

            DSocket.connect_to_server();

            var xmlhttp = new XMLHttpRequest();
            var url = "http://localhost:4000/api/v1/classroom/" + User.icNumber;
            xmlhttp.onreadystatechange=function() {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    var obj = JSON.parse(xmlhttp.responseText);
                    if (obj["success"]){
//                        console.log(obj["data"])
                        nameClass = obj["data"][0]["nameClass"]
                        nameTeacher = obj["data"][0]["fullnameTeacher"]
                        idClass = obj["data"][0]["nameClass"]
                    }
                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xmlhttp.send();
        }

    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
