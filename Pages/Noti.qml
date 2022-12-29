import QtQuick 2.0

Item {
    property var arr_notifications: []

    Connections {
        target: DSocket
//        onHelloSignal: {
//            console.log("qml: socket hello")
//        }
    }

    Rectangle {

        Component.onCompleted: {
            DSocket.connect_to_server();
        }

        id: rectangle
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#f0f2f5"
        Column {
            x: 0
            y: 8
        width: 747
        height: 179
        spacing: 7
        Repeater {
            model: arr_notifications.length
                Rectangle {
                    id: rectangle1
                    x: 8
                    y: 8
                    width: 748
                    height: 55
                    color: "#ffffff"
                    radius: 10
                    border.color: "#f0f2f5"
                    border.width: 1

                    Image {
                        id: image
                        x: 10
                        y: 15
                        width: 32
                        height: 32
                        sourceSize.height: 512
                        sourceSize.width: 512
                        fillMode: Image.PreserveAspectFit
                        source: arr_notifications[index]["url_icon"]
                    }

                    Text {
                        id: element
                        x: 56
                        y: 13
                        width: 560
                        height: 18
                        text: arr_notifications[index]["content"]
                        font.pixelSize: 14

                        Text {
                            id: element1
                            x: 0
                            y: 21
                            width: 568
                            height: 17
                            color: "#68758d"
                            text: arr_notifications[index]["timing"]
                            font.pixelSize: 12
                        }
                    }

                }
                Component.onCompleted: {
                    var xmlhttp = new XMLHttpRequest();
                    var url = "https://back-end-test.onrender.com/api/v1/notifications/" + User.icNumber;
                    xmlhttp.onreadystatechange=function() {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var obj = JSON.parse(xmlhttp.responseText);
                            if (obj["success"]){
                                arr_notifications = obj["data"]
//                                console.log(arr_notifications[0]["url_icon"])
                            }
                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                    xmlhttp.send();
                    }
                }
            }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:764}
}
##^##*/
