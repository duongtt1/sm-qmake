import QtQuick 2.0
import "../Components" as DComponents

Item {

    property var type_calendar: "month"
    property var arr_month: ["January", "February", "March", "April", "May",
                             "June", "July", "August", "September", "October",
                             "November", "December"]
    property var idx_arr: 10


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
            x: 21
            y: 14
            width: 723
            height: 55
            color: "#ffffff"
            radius: 10
            Rectangle {
                id: btn_month
                x: 8
                y: 12
                width: 124
                height: 33
                color: type_calendar === "month" ? "#1e88e5" : "#f0f2f5"
                radius: 10
                Text {
                    id: month
                    x: 8
                    y: 5
                    width: 109
                    height: 23
                    color: type_calendar === "month" ? "#f0f2f5" : "#1e88e5"
                    text: qsTr("Month")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.width: type_calendar === "month" ?  0 : 2
                border.color: type_calendar === "month" ? "#ffffff":  "#f0f2f5"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        type_calendar = "month"
                    }
                }
            }

            Rectangle {
                id: btn_week
                x: 144
                y: 12
                width: 124
                height: 33
                color: type_calendar === "month" ? "#f0f2f5" : "#1e88e5"
                radius: 10
                Text {
                    id: week
                    x: 8
                    y: 4
                    width: 109
                    height: 23
                    color: type_calendar === "month" ? "#1e88e5" : "#f0f2f5"
                    text: qsTr("Week")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: type_calendar === "month" ? "#f0f2f5" : "#ffffff"
                border.width: 2
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        type_calendar = "week"
                    }
                }
            }

            Rectangle {
                id: calendar
                x: 289
                y: 12
                width: 236
                height: 35
                color: "#ffffff"

                Image {
                    id: back
                    x: 11
                    y: 0
                    width: 32
                    height: 32
                    sourceSize.height: 512
                    sourceSize.width: 512
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/back.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (idx_arr > 0){
                                idx_arr--;
                            }
                        }
                    }

                }

                Text {
                    id: element
                    x: 45
                    y: 8
                    width: 142
                    height: 19
                    color: "#3e3f43"
                    text: arr_month[idx_arr] + qsTr(" - 2022")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }

                Image {
                    id: back1
                    x: 186
                    y: 1
                    width: 32
                    height: 32
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/next.png"
                    sourceSize.height: 512
                    sourceSize.width: 512
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (idx_arr < 11){
                                idx_arr++;
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: btn_review
                x: 586
                y: 11
                width: 124
                height: 33
                color: "#ffffff"
                radius: 10
                Text {
                    id: label_review
                    x: 8
                    y: 4
                    width: 109
                    height: 23
                    color: "#1e88e5"
                    text: qsTr("Review")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.width: 2
                border.color: "#1e88e5"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("btn_review_clicked")

                    }

                }
            }
            border.color: "#b5d9f9"
        }

        Loader {
            anchors.top: padding_appbar.bottom
//            anchors.left: div_app_bar.x
            x: 21
            id: loaded_calender
//            sourceComponent: /*DComponents.CalenderMonth*/
            source: type_calendar === "week" ? "qrc:/Components/CalenderWeek.qml" : "qrc:/Components/CalenderMonth.qml"
        }

        Rectangle {
            id: padding_appbar
            x: 21
            y: 75
            width: 723
            height: 9
            color: "#f7f7fa"
        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:764}
}
##^##*/
