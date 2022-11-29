#include "user.h"
#include <QDebug>
//#include <opencv4/opencv2/core.hpp>
User::User(QObject *parent):QObject(parent)
{

}

QString User::username(){
    return this->m_username;
}

void User::setUsername(const QString &data){
    this->m_username = data;
//    qDebug() >> this->m_username;
    Q_EMIT usernameChanged();
}

QString User::fullname(){
    return this->m_fullname;
}

void User::setFullname(const QString &data){
    this->m_fullname = data;
    Q_EMIT fullnameChanged();
}

QString User::email(){
    return this->m_email;
}

void User::setEmail(const QString &data){
    this->m_email = data;
    Q_EMIT emailChanged();
}

QString User::dayofbirth(){
    return this->m_dayofbirth;
}

void User::setDayofbirth(const QString &data){
    this->m_dayofbirth = data;
    Q_EMIT dayofbirthChanged();
}

QString User::gender(){
    return this->m_gender;
}

void User::setGender(const QString &data){
    this->m_gender = data;
    Q_EMIT genderChanged();
}

QString User::icNumber(){
    return this->m_icNumber;
}

void User::setIcNumber(const QString &data){
    this->m_icNumber = data;
    Q_EMIT icNumberChanged();
}

QString User::telephone(){
    return this->m_telephone;
}

void User::setTelephone(const QString &data){
    this->m_telephone = data;
    Q_EMIT telephoneChanged();
}

QString User::avatar(){
    return this->m_avatar;
}

void User::setAvatar(const QString &data){
    this->m_avatar = data;
    Q_EMIT avatarChanged();
}

QString User::classUser(){
    return this->m_classUser;
}

void User::setClassUser(const QString &data){
    this->m_classUser = data;
}

QString User::uni(){
    return this->m_classUser;
}

void User::setUni(const QString &data){
    this->m_uni = data;
}

QString User::country(){
    return this->m_country;
}

void User::setCountry(const QString &data){
    this->m_country = data;
}
