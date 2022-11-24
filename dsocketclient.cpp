#include "dsocketclient.h"
#include <iostream>
#include <QDebug>

DSocketClient::DSocketClient(QObject *parent): QObject{parent}
{

}

void DSocketClient::recvStartClass(sio::event &){
    std::cout << "test \n";
    Q_EMIT startClassSignal();
}

bool DSocketClient::connect_to_server(){
    this->client_ins.connect("http://127.0.0.1:4000");
    client_ins.socket()->emit("connection");
    client_ins.socket()->on("mtcl", std::bind( &DSocketClient::recvStartClass,this,std::placeholders::_1));
    return 0;
}
