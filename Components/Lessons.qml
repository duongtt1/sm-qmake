import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
//import QtWebEngine 1.0
import QtWebView 1.1

Item {
    width: 764
    height: 600

    Connections {
        target: ActionClass
    }

    Item {
        id: div_content
        x: 0
        y: 0
        width: 764
        height: 600

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 764
            height: 600
            color: "#f7f7f7"

            Rectangle {
                id: rectangle
                x: 8
                y: 8
                width: 748
                height: 82
                color: "#ffffff"
                radius: 10

                Image {
                    id: image
                    x: 8
                    y: 8
                    width: 64
                    height: 64
                    source: "../Resources/icon/pdf.png"
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    id: label
                    x: 78
                    y: 8
                    width: 583
                    height: 64
                    text: qsTr("Tài liệu test")
                    font.pointSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter

                    Image {
                        id: image1
                        x: 599
                        y: 0
                        width: 64
                        height: 64
                        source: "../Resources/icon/open.png"
                        fillMode: Image.PreserveAspectFit
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                ActionClass.openPDF();
                            }
                        }

                    }
                }
            }

        }
    }
}
