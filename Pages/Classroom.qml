import QtQuick 2.0
import QtQuick.Layouts 1.2

Item {

    property string enabled_hided: "unhided"
    property var arr_classrooms: []
    property var arr_classrooms_unhide: []
    property var arr_classrooms_hide: []

    Rectangle {
        id: dev_main
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#f7f7fa"
        border.color: "#ffffff"
        border.width: 1



        Rectangle {
            id: div_app_bar
            x: 13
            y: 8
            width: 728
            height: 57
            color: "#ffffff"
            radius: 10
            border.color: "#b5d9f9"

            Rectangle {
                id: btn_classs_avaible
                x: 8
                y: 12
                width: 124
                height: 33
                color: enabled_hided === "unhided" ? "#1e88e5" :  "#ffffff"
                radius: 10
                border.color: enabled_hided === "unhided" ?  "#f0f2f5" : "#1e88e5"
                border.width: 2

                Text {
                    id: element
                    x: 8
                    y: 5
                    width: 109
                    height: 23
                    color: enabled_hided === "unhided" ? "#ffffff" : "#1e88e5"
                    text: qsTr("Class availabled")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enabled_hided = "unhided"
                        arr_classrooms = enabled_hided === "hided" ? arr_classrooms_hide : arr_classrooms_unhide
                    }
                }
            }

            Rectangle {
                id: btn_classs_avaible1
                x: 159
                y: 12
                width: 124
                height: 33
                color: enabled_hided === "unhided" ? "#ffffff" : "#1e88e5"
                radius: 10
                Text {
                    id: element1
                    x: 8
                    y: 4
                    width: 109
                    height: 23
                    color: enabled_hided === "unhided" ? "#1e88e5" : "#ffffff"
                    text: qsTr("Class hidened")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enabled_hided = "hided"
                        arr_classrooms = enabled_hided === "hided" ? arr_classrooms_hide : arr_classrooms_unhide
                    }
                }
                border.width: 2
                border.color: enabled_hided === "unhided" ?  "#1e88e5" : "#ffffff"
            }

            Image {
                id: trash
                x: 688
                y: 13
                width: 32
                height: 32
                sourceSize.height: 512
                sourceSize.width: 512
                fillMode: Image.PreserveAspectFit
                source: "../Resources/icon/trash-bin.png"
                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log("Trash is clicked")
                    }
                }
            }


        Rectangle {
            id: div_app_bar1
            x: 13
            y: 78
            width: 625
            height: 35
            color: "#ffffff"
            radius: 10
            border.color: "#b5d9f9"

            TextInput {
                id: textInput
                x: 8
                y: 0
                width: 609
                height: 35
                color: "#a2a2bf"
                text: qsTr("Searching.....")
                //                displayText:

                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 14
            }
        }

        Rectangle {
            id: div_search
            x: 644
            y: 80
            width: 97
            height: 32
            color: "#1e88e5"
            radius: 10

            Text {
                id: element2
                x: 8
                y: 6
                width: 81
                height: 18
                color: "#ffffff"
                text: qsTr("Search")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }

        GridLayout {

            id: grid
            x: 13
            y: 120
            width: 723
            height: 450
            columns: 3
            columnSpacing: 30
            rowSpacing: 15
            flow: Flow.LeftToRight
            Repeater {
                model: arr_classrooms.length
                Rectangle {
                    x: 0
                    y: 0
                    width: 200
                    height: 200
                    color: "#ffffff"
                    radius: 20
                    border.color: "#f7f7fa"
                    Image {
                        x: 8
                        y: 8
                        width: 184
                        height: 128
                        fillMode: Image.PreserveAspectFit
                        source: arr_classrooms[index]["linkAvatarClass"]
                    }
                    Rectangle {
                        x: 8
                        y: 142
                        width: 151
                        height: 50
                        color: "#ffffff"
                        border.color: "#ffffff"

                        Text {
                            x: 8
                            y: 4
                            color: "#3e3f43"
                            text: qsTr(arr_classrooms[index]["nameClass"])
                            font.pixelSize: 18
                            Text {
                                x: 1
                                y: 23
                                width: 94
                                height: 15
                                color: "#646d84"
                                text:  qsTr("Teacher: " + arr_classrooms[index]["nameTeacher"])
                                font.pixelSize: 12
                            }
                        }
                    }
                    Rectangle {
                        x: 161
                        y: 152
                        width: 32
                        height: 32
                        color: "#ffffff"

                        Image {
                            x: 0
                            y: 0
                            width: 32
                            height: 32
                            fillMode: Image.PreserveAspectFit
                            source: "../Resources/icon/exit-door.png"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                StoreClass.setIdclass(arr_classrooms[index]["nameClass"])
                                main_stackview.push("qrc:/Pages/DetailClass.qml");
                            }
                        }
                    }

                }
            }

            Component.onCompleted: {
                var xmlhttp = new XMLHttpRequest();
                var url = "https://back-end-test.onrender.com/api/v1/classroom/" + User.icNumber;
                xmlhttp.onreadystatechange=function() {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                        var obj = JSON.parse(xmlhttp.responseText);
                        if (obj["success"]){
                            arr_classrooms = obj["data"]
                            arr_classrooms_hide = arr_classrooms.filter(obj => obj["hided"] === true)
                            arr_classrooms_unhide = arr_classrooms.filter(obj => obj["hided"] === false)
                            arr_classrooms = arr_classrooms_unhide

                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                xmlhttp.send();
            }
        }

        }

        Connections {
            target: StoreClass

//            function onIdclassChanged(){
//                console.log(StoreClass.idclass)
//            }
        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:764}
}
##^##*/
