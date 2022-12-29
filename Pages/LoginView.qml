import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property string q_username: ""
    property string q_password: ""

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
            y: 109
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
            y: 226
            width: 400
            height: 40
            color: "#ffffff"
            radius: 5
            border.color: "#1e88e5"

            TextEdit {
                id: txtUsername
                x: 8
                y: 0
                width: 384
                height: 40
                text: qsTr("18520651")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
        }

        Connections {
            target: D_timer
        }

        Button {
            id: btnLogin
            x: 333
            y: 391
            text: qsTr("Login")
            onClicked: ()=>{
          var xmlhttp = new XMLHttpRequest();
                           console.log(txtUsername.text)
          var url = "https://back-end-test.onrender.com/api/v1/auth/login";
          xmlhttp.onreadystatechange=function() {
              if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                  var obj = JSON.parse(xmlhttp.responseText);
                  if (obj["success"]){
                        User.setEmail( obj["data"]["email"])
                        User.setFullname(obj["data"]["full_name"])
                        User.setAvatar(obj["data"]["avatar"])
                        User.setGender(obj["data"]["gender"])
                        User.setDayofbirth(obj["data"]["day_of_birth"])
                        User.setEmail(obj["data"]["email"])
                        User.setIcNumber(obj["data"]["ic_number"])
                        User.setTelephone(obj["data"]["telephone"])
                        User.setClassUser(obj["data"]["class"])
                        User.setCountry(obj["data"]["country"])
                        User.setUni(obj["data"]["uni"])
                        User.setIsLogin(true);
                        D_timer.startCheckFace();
                        main_stackview.replace("qrc:/Pages/Dashboard.qml")
                  }
              }
          }
          xmlhttp.open("POST", url, true);
          xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
          xmlhttp.send(JSON.stringify({
              "username": txtUsername.text,
              "password": txtPassword.text
                                      })
                       );
                   }
        }

        Button {
            id: button1
            x: 581
            y: 391
            text: qsTr("Register")
            onClicked: ()=>{
                           main_stackview.push("qrc:/Pages/RegisterView.qml")
                       }
        }

        Button {
            id: button
            x: 457
            y: 391
            text: qsTr("Face Login")
            onClicked: ()=>{
                           main_stackview.push("qrc:/Pages/FaceLoginView.qml")
                       }
        }
    }

    function preProcessPassword(pass){

    }

    Rectangle {
        id: rectangle2
        x: 312
        y: 309
        width: 400
        height: 40
        color: "#ffffff"
        radius: 5
        border.color: "#1e88e5"
        TextInput {
            id: txtPassword
            x: 8
            y: 0
            width: 384
            height: 40
            text: qsTr("18520651")
            echoMode: TextInput.Password
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
    }

    function processingData(json) {
        var obj = JSON.parse(json);
        console.log(obj["userId"])
    }
    Connections {
            target: User

//            onTelephoneChanged: {
//                console.log(User.telephone)
//            }

    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
