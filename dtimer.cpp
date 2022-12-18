#include "dtimer.h"

DTimer::DTimer(QObject *parent) : QObject(parent)
{
    faceCheckTimer = new QTimer(this);
    authFace = new AuthFace();
    connect(faceCheckTimer, SIGNAL(timeout()),this, SLOT(checkFaceLogin()));

}

void DTimer::startCheckFace(){
    faceCheckTimer->start(20000);
}

bool DTimer::checkFaceLogin(){
    std::string name("");
    cap_timer.open(0);
    cap_timer >> frame;
    int count = 0;
    bool ret=false;
    int count_check = 0;
    while (count_check < 10) {
        name = authFace->startLoginWithFace(frame);
        if (name == "Duong"){
            qDebug() << "==> Duong";
            count_check++;
            ret = true;
        }
        count++;
        if (count > 100){
            qDebug() << "==> No Duong";
            ret = false;
            break;
        }
    }
    qDebug() << name.c_str();
    cap_timer.release();
    Q_EMIT checkFaceChanged(ret);
    return ret;
}

void DTimer::stopCheckFace(){
    faceCheckTimer->stop();
}

DTimer::~DTimer(){
    if (faceCheckTimer != nullptr){
        delete faceCheckTimer;
    }
    if (authFace != nullptr){
        delete authFace;
    }
}
