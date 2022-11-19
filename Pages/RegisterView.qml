import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 1024
        height: 600
        color: "#ffffff"

        Text {
            id: element1
            x: 397
            y: 47
            width: 230
            height: 60
            color: "#1e88e5"
            text: qsTr("Virtual Class")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 48
        }

        Rectangle {
            id: rectangle1
            x: 312
            y: 137
            width: 400
            height: 40
            color: "#ffffff"
            radius: 5
            border.color: "#1e88e5"

            TextEdit {
                id: txtUsername
                x: 8
                y: 0
                width: 392
                height: 38
                text: qsTr("Username")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
        }

        Button {
            id: button1
            x: 520
            y: 336
            width: 179
            height: 40
            text: qsTr("Register")
            onClicked: ()=>{
                           console.log("bth clicked")
                       }
        }

        Rectangle {
            id: rectangle3
            x: 312
            y: 263
            width: 400
            height: 40
            color: "#ffffff"
            radius: 5
            TextEdit {
                id: txtPassword1
                x: 8
                y: 0
                width: 384
                height: 40
                text: qsTr("Repeat Password")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
            border.color: "#1e88e5"
        }

        Button {
            id: btnComeBackLogin
            x: 323
            y: 336
            width: 177
            height: 40
            text: qsTr("Come back login")
            onClicked: main_stackview.push("qrc:/Pages/LoginView.qml")
        }
    }

    Rectangle {
        id: rectangle2
        x: 312
        y: 199
        width: 400
        height: 40
        color: "#ffffff"
        radius: 5
        border.color: "#1e88e5"
        TextEdit {
            id: txtPassword
            x: 8
            y: 0
            width: 384
            height: 40
            text: qsTr("Password")
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
