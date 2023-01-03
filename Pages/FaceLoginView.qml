import QtQuick 2.0
import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Controls 2.1
//import QtMultimedia 5.0
//import QtQuick.Extras 1.4

Item {
    width: 1024
    height: 600

    property bool isLogin: false

    Connections {
        target: liveImageProvider

        onImageChanged: {
            opencvImage.reload()
        }
    }

    Connections {
        target: VideoStreamer

        onLoginSuccess: {
            console.log("login ok")
            isLogin = true
            VideoStreamer.closeVideoCamera()
            txtUsername.text = VideoStreamer.getNameAuth()
            btnLogin.text = "Go to Dashboard"
        }
    }

    Image {
        id: opencvImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        property bool counter: false
        anchors.rightMargin: 513
        anchors.bottomMargin: 8
        anchors.leftMargin: 8
        anchors.topMargin: 8
        visible: false
        source: "image://live/image"
        asynchronous: false
        cache: false

        function reload() {
            counter = !counter
            source = "image://live/image?id=" + counter
        }
    }

    Rectangle {
        id: rectangle1
        x: 517
        y: 8
        width: 499
        height: 584
        color: "#ffffff"

        Rectangle {
            id: rectangle
            x: 100
            y: 383
            width: 157
            height: 36
            color: "#ffffff"
            radius: 10
            border.color: "#0e88cf"
            border.width: 1

            Text {
                id: btnLogin
                x: 8
                y: 0
                width: 141
                height: 36
                color: "#0e88cf"
                text: qsTr("Start Login")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (isLogin){
                         main_stackview.replace("qrc:/Pages/Dashboard.qml")
                    }else{
                        VideoStreamer.openVideoCamera()
                        opencvImage.visible = true
                    }
                }
            }
        }


        Rectangle {
            id: rectangle2
            x: 79
            y: 280
            width: 373
            height: 47
            color: "#ffffff"
            radius: 10
            border.color: "#0e88cf"

            TextInput {
                id: txtUsername
                x: 8
                y: 8
                width: 357
                height: 31
                text: qsTr("Username")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 22
            }
        }
    }

    Rectangle {
        id: rectangle3
        x: 786
        y: 390
        width: 157
        height: 36
        color: "#ffffff"
        radius: 10
        Text {
            id: element1
            x: 8
            y: 0
            width: 141
            height: 36
            color: "#0e88cf"
            text: qsTr("Cancel")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
//                main_stackview.push("qrc:/Pages/RegisterView.qml")
                main_stackview.pop()
//                VideoStreamer.closeVideoCamera()
            }
        }
        border.width: 1
        border.color: "#0e88cf"
    }
}
