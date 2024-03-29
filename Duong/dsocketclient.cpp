#include "dsocketclient.h"
#include <iostream>
#include <QDebug>

DSocketClient::DSocketClient(QObject *parent): QObject{parent}
{

}

void DSocketClient::emitSubmmitTask(){
    std::string idclass = "mtcl";
    this->client_ins.socket()->emit("submittask", idclass);
}

void DSocketClient::recvStartClass(sio::event &){
    Q_EMIT startClassSignal();
}

void DSocketClient::recvCloseClass(sio::event &){
    Q_EMIT closeClassSignal();
}

void DSocketClient::recvAsign(sio::event &){
    Q_EMIT newAssign();
}

void DSocketClient::blockScreenStudent(sio::event &){
//    QDebug
     Q_EMIT eventBlockScreenStudent();
}

void DSocketClient::unBlockScreenStudent(sio::event &){
     Q_EMIT eventUnBlockScreenStudent();
}

void DSocketClient::studentIsNotPresent(sio::event &){
     // something
}

bool DSocketClient::connect_to_server(){
    this->client_ins.connect("http://127.0.0.1:4000");
    client_ins.socket()->emit("connection");
    client_ins.socket()->on("startmtcl", std::bind( &DSocketClient::recvStartClass,this,std::placeholders::_1));
    client_ins.socket()->on("closemtcl", std::bind( &DSocketClient::recvCloseClass,this,std::placeholders::_1));
    client_ins.socket()->on("newassignmtcl", std::bind( &DSocketClient::recvAsign,this,std::placeholders::_1));
    client_ins.socket()->on("blockscreen", std::bind( &DSocketClient::blockScreenStudent,this,std::placeholders::_1));
    client_ins.socket()->on("unblockscreen", std::bind( &DSocketClient::unBlockScreenStudent,this,std::placeholders::_1));
    return 1;
}
