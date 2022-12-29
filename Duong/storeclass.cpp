#include "storeclass.h"

StoreClass::StoreClass(QObject *parent)
    : QObject{parent}
{
   this->m_n_noti_assign = 0;
}

QString StoreClass::idclass(){
    return this->m_idclass;
}

void StoreClass::setIdclass(const QString &data){
    this->m_idclass = data;
    Q_EMIT idclassChanged();
}

bool StoreClass::isLive(){
    return this->m_isLive;
}

int StoreClass::n_noti_assign(){
    return this->m_n_noti_assign;
}

void StoreClass::setN_noti_assign(int data){
    this->m_n_noti_assign = data;
    Q_EMIT n_noti_assignChanged();
}

void StoreClass::setIsLive(const int& data){
    this->m_isLive = data;
    Q_EMIT isLiveChanged();
}

