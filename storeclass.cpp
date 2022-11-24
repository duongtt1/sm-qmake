#include "storeclass.h"

StoreClass::StoreClass(QObject *parent)
    : QObject{parent}
{

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

void StoreClass::setIsLive(const int& data){
    this->m_isLive = data;
    Q_EMIT isLiveChanged();
}

