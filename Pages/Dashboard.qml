import QtQuick 2.0
import QtQuick.Controls 2.1

Item {

    Column {
        id: main
        x: 261
        y: 0
        width: 763
        height: 600

        Rectangle {
            id: div_main
//            anchors.left: sidebar.right
            width: 763
            height: 600
            color: "#ffffff"
            Loader {
                id: loader_main_view
//                anchors.fill: sidebar.right
                source: "qrc:/Pages/Profile.qml"
//                sourceComponent: profile_component
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
                id: div_classroom
                x: -253
                y: 291
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_classroom
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    source: "qrc:/Resources/icon/webinar.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: label_classroom
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Classrooms")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                   loader_main_view.source = "qrc:/Pages/Classroom.qml"

//                                  loader_main_view.sourceComponent = classroom_component
                                   console.log("Classrooms")
                               }
                }
            }

            Rectangle {
                id: dev_noti
                x: -253
                y: 346
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_resouces
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    source: "../Resources/icon/alarm.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: label_resouces
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Notifications")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                   loader_main_view.source = "qrc:/Pages/Noti.qml"
                                   console.log("Notifications")
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
                    source: "qrc:/Resources/icon/logout.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: label_logout
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Logout")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                   main_stackview.replace("qrc:/Pages/LoginView.qml")
                               }
                }
            }

            Rectangle {
                id: dev_schedule
                x: -253
                y: 233
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10
                Image {
                    id: icon_schedule
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/Resources/icon/schedule.png"
                }

                Text {
                    id: label_schedule
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Schedule")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                    loader_main_view.source = "qrc:/Pages/Schedule.qml"
                                   console.log("Schedule")
                               }
                }
            }

            Rectangle {
                id: div_profile
                x: -252
                y: 179
                width: 246
                height: 38
                color: "#ffffff"
                radius: 10

                Image {
                    id: icon_profile
                    x: 0
                    y: 3
                    width: 49
                    height: 31
                    sourceSize.height: 112
                    sourceSize.width: 112
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/Resources/icon/graduated-112-112.png"
                }

                Text {
                    id: label_profile
                    x: 55
                    y: 3
                    width: 163
                    height: 31
                    text: qsTr("Profile")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                   loader_main_view.source = "qrc:/Pages/Profile.qml"
                                   console.log("Profile")
                               }
                }
            }
        }

        Image {
            id: avatar
            x: 80
            y: 24
            width: 100
            height: 100
            sourceSize.height: 512
            sourceSize.width: 512
            fillMode: Image.PreserveAspectFit
            source: "qrc:/Resources/icon/duoq.jpg"
        }

        Text {
            id: fullname
            x: 39
            y: 130
            color: "#000080"
            text: qsTr("Từ Thanh Dương")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
