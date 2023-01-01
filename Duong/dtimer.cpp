#include "dtimer.h"
#include <iostream>
#include <thread>
#include "Duong/user.h"

DTimer::DTimer(QObject *parent) : QObject(parent)
{
    faceCheckTimer = new QTimer(this);
    authFace = new AuthFace();
    connect(faceCheckTimer, SIGNAL(timeout()),this, SLOT(checkFaceLogin()));

}

void DTimer::startCheckFace(){
    faceCheckTimer->start(5000);
}

void DTimer::checkFaceLogin(){
    std::string name("");

    std::thread t([&](){
        qDebug() << "==> CHECK 1";
        int count = 0;
        qDebug() << "==> CHECK 2";
        bool ret=false;
        qDebug() << "==> CHECK 3";
        int count_check = 0;
        qDebug() << "==> CHECK 4";
        cv::VideoCapture cap_timer2;
        qDebug() << "==> CHECK 5";
        cap_timer2.open(0);
        qDebug() << "==> CHECK 6";
        cap_timer2 >> frame;
        while (count_check < 5) {
            name = authFace->startLoginWithFace(frame);
            if (name == User::getInstance()->username().toStdString()){
                qDebug() << "==> " << User::getInstance()->username();
                count_check++;
                ret = true;
            }
            count++;
            if (count > 100){
                qDebug() << "==> CHECK FAILED";
                ret = false;
                break;
            }
        }
        qDebug() << name.c_str();
        qDebug() << User::getInstance()->username();
        cap_timer2.release();
        Q_EMIT checkFaceChanged(ret);
        });
    t.join();
}

void DTimer::stopCheckFace(){
    faceCheckTimer->stop();
}

DTimer::~DTimer(){
    qDebug() << "==> CHECK detructor";
    if (faceCheckTimer != nullptr){
        delete faceCheckTimer;
    }
    if (authFace != nullptr){
        delete authFace;
    }
}
