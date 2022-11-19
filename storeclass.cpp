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
    emit idclassChanged();
}
