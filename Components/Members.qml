import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    width: 764
    height: 600

    property var arr_category: ["ID", "Full name", "School", "Class"]
    property var data_model: ListModel {}


    Connections {
        target: User
    }

    Rectangle {

        id: div_main
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#ffffff"

        Component.onCompleted: {
            //            init_data()
            var xmlhttp = new XMLHttpRequest()
            var url = "http://localhost:4000/api/v1/classroom/" + User.icNumber
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    var obj = JSON.parse(xmlhttp.responseText)
                    if (obj["success"]) {
                        obj["data"].forEach(function (data, i) {
                            data_model.append(data)
                            console.log(data)
                        })
                    }
                }
            }
            xmlhttp.open("POST", url, true)
            xmlhttp.setRequestHeader("Content-Type",
                                     "application/json;charset=UTF-8")
            xmlhttp.send(JSON.stringify({
                                            "idclass": StoreClass.idclass
                                        }))
        }

        Rectangle {
            id: rectangle
            x: 8
            y: 8
            width: 748
            height: 78
            color: "#efeff5"
            radius: 10

            Label {
                id: label
                x: 8
                y: 8
                width: 732
                height: 23
                color: "#312828"
                text: qsTr("Member of class (" + data_model.count + ")")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
            }

            Rectangle {
                id: rectangle2
                x: 8
                y: 41
                width: 732
                height: 29
                color: "#ffffff"
                radius: 10

                TextInput {
                    id: textInput
                    x: 8
                    y: 4
                    width: 716
                    height: 21
                    color: "#5b5757"
                    text: qsTr("Enter name class...............")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                }

                AnimatedImage {
                    id: animatedImage
                    x: 695
                    y: 2
                    width: 24
                    height: 24
                    source: "../Resources/icon/loupe.png"
                }
            }
        }

        Rectangle {
            id: rectangle1
            x: 8
            y: 97
            width: 748
            height: 39
            color: "#efeff5"
            radius: 10

            Row {
                id: row
                x: 8
                y: 8
                width: 732
                height: 23
                spacing: 155
                Repeater {
                    model: arr_category.length
                    Text {
                        text: arr_category[index]
                    }
                }
            }
        }

        Rectangle {
            id: rectangle3
            x: 8
            y: 142
            width: 748
            height: 450
            color: "#efeff5"
            radius: 10
            Component {
                id: com_list_view
                Rectangle {
                    id: rectangle4
                    x: 8
                    y: 8
                    width: 732
                    height: 36
                    color: "#ffffff"
                    radius: 10

                    Row {
                        id: row2
                        x: 8
                        y: 8
                        width: 732
                        height: 23
                        spacing: 100
                        Text {
                            text: id
                        }
                        Text {
                            text: fullname
                        }
                        Text {
                            text: school
                        }
                        Text {
                            text: idclass
                        }
                    }
                }
            }
            ListView {
                anchors.fill: parent
                anchors.topMargin: 8
                orientation: ListView.Vertical
                delegate: com_list_view
                spacing: 5
                model: data_model
            }
        }

        Connections {
            target: StoreClass
        }
    }
}
