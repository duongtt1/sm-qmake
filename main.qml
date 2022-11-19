import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import "./Pages" as Page
import QtWebEngine 1.0

Window {
    visible: true
    width: 1024
    height: 600
    title: qsTr("CE-UIT")

    StackView {
        id: main_stackview
        anchors.fill: parent
        Component.onCompleted: {
                main_stackview.push('qrc:/Pages/LoginView.qml');
            }
    }
}
