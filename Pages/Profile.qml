import QtQuick 2.0

Item {

    property var id_account: "null"
    property var q_telephone: "null"
    property var q_email: "null"
    property var q_fb: "null"
    property var q_fullname: "null"
    property var q_class: "null"
    property var q_dob: "null"
    property var q_country: "null"
    property var q_uni: "null"
    property var g_edit: true
    property var q_avatar: "null"


    Connections {
            target: User
    }
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 764
        height: 600
        color: "#ffffff"


        Rectangle {
            id: div_frame_left_profile
            x: 0
            y: 0
            width: 382
            height: 600
            color: "#ffffff"
            border.color: "#f0f2f5"
            border.width: 1

            Text {
                id: header_1
                x: 10
                y: 8
                width: 178
                height: 23
                text: qsTr("Infomation account")
                font.italic: true
                font.family: "Verdana"
                font.bold: false
                font.pixelSize: 14
            }

            Rectangle {
                id: row_id_card
                x: 23
                y: 194
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5

                Image {
                    id: icon_id_card
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/id-card.png"
                }

                Text {
                    id: ladbel_id_card
                    x: 46
                    y: 12
                    text: qsTr("ID Account: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_id_card
                    x: 141
                    y: 12
                    color: "#1e88e5"
//                    text: qsTr("03334802009")
                    text: id_account
                    styleColor: "#000000"
                    font.pixelSize: 16
                }
            }

            Rectangle {
                id: row_phone
                x: 23
                y: 247
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_phone
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/telephone.png"
                }

                Text {
                    id: ladbel_phone
                    x: 46
                    y: 12
                    text: qsTr("Phone number: ")
                    font.pixelSize: 16
                }

                TextInput {
                    id: input_phone
                    x: 185
                    y: 12
                    width: 122
                    height: 20
                    text: q_telephone
                    font.pixelSize: 16
                    readOnly: g_edit
                }

                Image {
                    id: edit_phone
                    x: 306
                    y: 8
                    width: 24
                    height: 24
                    sourceSize.height: 512
                    sourceSize.width: 512
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/edit.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                                  console.log("edit_phone is pushed")
                                   }
                    }
                }
            }

            Rectangle {
                id: row_mail
                x: 23
                y: 300
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_mail
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/letter.png"
                }

                Text {
                    id: ladbel_mail
                    x: 46
                    y: 12
                    text: qsTr("Email:")
                    font.pixelSize: 16
                }

                TextInput {
                    id: input_mail
                    x: 96
                    y: 12
                    width: 205
                    height: 20
                    color: "#0783c9"
                    text: q_email
                    font.pixelSize: 16
                    readOnly: g_edit
                }

                Image {
                    id: edit_mail
                    x: 304
                    y: 9
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 512
                    sourceSize.width: 512
                    source: "../Resources/icon/edit.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                                  console.log("edit_mail is pushed")
                                   }
                    }
                }
            }

            Image {
                id: avatar
                x: 141
                y: 54
                width: 100
                height: 100
                fillMode: Image.PreserveAspectFit
                source: "../Resources/icon/duoq.jpg"
//                source: q_avatar
            }

            Rectangle {
                id: row_fb
                x: 23
                y: 359
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_fb
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/facebook.png"
                }

                Text {
                    id: ladbel_fb
                    x: 46
                    y: 12
                    text: qsTr("Facebook:")
                    font.pixelSize: 16
                }

                TextInput {
                    id: input_fb
                    x: 133
                    y: 12
                    width: 168
                    height: 20
                    color: "#000000"
                    text: qsTr("Not link")
                    font.pixelSize: 16
                }

                Image {
                    id: edit_fb
                    x: 304
                    y: 9
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 512
                    sourceSize.width: 512
                    source: "../Resources/icon/link.png"
                }
            }


        }

        Image {
            id: edit_avatar
            x: 243
            y: 140
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 512
            sourceSize.width: 512
            source: "../Resources/icon/photo.png"
        }

        Rectangle {
            id: div_frame_right_profile
            border.color: "#f0f2f5"
            Text {
                id: header_2
                x: 384
                y: 7
                width: 178
                height: 23
                text: qsTr("Infomation personal")
                font.italic: true
                font.family: "Verdana"
                font.bold: false
                font.pixelSize: 14
            }

            Rectangle {
                id: row_class
                x: 401
                y: 111
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_class
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/school.png"
                }

                Text {
                    id: ladbel_class
                    x: 46
                    y: 12
                    text: qsTr("Class: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_class
                    x: 141
                    y: 12
                    width: 123
                    height: 19
                    text: q_class
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
            }

            Rectangle {
                id: row_fullname
                x: 401
                y: 44
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_fullname
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/id.png"
                }

                Text {
                    id: ladbel_fullname
                    x: 46
                    y: 12
                    text: qsTr("Fullname: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_fullname
                    x: 141
                    y: 12
                    text: q_fullname
                    font.pixelSize: 16
                }
            }

            Rectangle {
                id: row_dob
                x: 401
                y: 180
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_dob
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/calendar.png"
                }

                Text {
                    id: ladbel_dob
                    x: 46
                    y: 12
                    text: qsTr("Day of birth: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_dob
                    x: 141
                    y: 12
                    width: 123
                    height: 19
                    text: q_dob
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
            }

            Rectangle {
                id: row_tinh
                x: 401
                y: 299
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_tinh
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/uni.png"
                }

                Text {
                    id: ladbel_tinh
                    x: 46
                    y: 12
                    text: qsTr("University: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_tinh
                    x: 141
                    y: 12
                    width: 123
                    height: 19
                    text: q_uni
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
            }

            Rectangle {
                id: row_school
                x: 402
                y: 239
                width: 336
                height: 40
                color: "#f0f2f5"
                radius: 5
                Image {
                    id: icon_school
                    x: 8
                    y: 4
                    width: 32
                    height: 33
                    fillMode: Image.PreserveAspectFit
                    source: "../Resources/icon/countries.png"
                }

                Text {
                    id: ladbel_school
                    x: 46
                    y: 12
                    text: qsTr("Country: ")
                    font.pixelSize: 16
                }

                Text {
                    id: value_school
                    x: 141
                    y: 12
                    width: 123
                    height: 19
                    text: q_country
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
            }

        }



//        AnimatedImage {
//            id: animatedImage
//            x: 141
//            y: 56
//            width: 100
//            height: 100
//            source: "../../../../Users/duong/Pictures/66088771_731533417280302_4745012111216738304_n.jpg"
//        }
        Component.onCompleted: ()=>{
            id_account = User.telephone
            q_telephone = User.telephone
            q_avatar = User.avatar
            q_email= User.email
            q_fullname= User.fullname
            q_dob = User.dayofbirth.slice(0, 10);
            q_avatar = User.avatar
            q_class = User.classUser
            q_uni = User.uni
            q_country = User.country
        }
    }

    function processString(str){

    }

    function getDataProfile() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://localhost:4000/api/v1/auth/login";
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                var obj = JSON.parse(xmlhttp.responseText);
                if (obj["success"]){
                   main_stackview.replace("qrc:/Pages/Dashboard.qml")
                }
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xmlhttp.send(JSON.stringify({
            "id": txtUsername.text,
            "password": txtPassword.text}));


                     }

}
/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:764}
}
##^##*/
