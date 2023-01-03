import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import "./Pages" as Page

Window {
    visible: true
    width: 1024
    height: 600
    title: qsTr("CE-UIT")

    property bool isLogin: false

    Connections {
        target: DSocket
        onEventBlockScreenStudent: {

        }

        onEventUnBlockScreenStudent: {

        }
    }

    Connections{
        target: D_timer
         onCheckFaceChanged: {
             if (!ret){
//                 popup.open()
                 console.log("CHECK SUSSCESS")
             }else{
//                 if (popup.enabled){
//                     popup.close()
//                 }
                 console.log("CHECK FAILDED")
             }
         }
    }

     Popup {
         id: popup
         x: 256
         y: 150
         width: 512
         height: 300
         modal: true
         focus: true
         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
         contentData: Label {
             text: "Please focus to class "
             anchors.fill: parent.Center
             font.pixelSize: 30
             font.italic: true
         }
     }

    StackView {
        id: main_stackview
        anchors.fill: parent
        Component.onCompleted: {
                main_stackview.push('qrc:/Pages/LoginView.qml');
            }
    }
}
