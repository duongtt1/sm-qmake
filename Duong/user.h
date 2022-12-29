#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString fullname READ fullname WRITE setFullname NOTIFY fullnameChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString dayofbirth READ dayofbirth WRITE setDayofbirth NOTIFY dayofbirthChanged)
    Q_PROPERTY(QString gender READ gender WRITE setGender NOTIFY genderChanged)
    Q_PROPERTY(QString icNumber READ icNumber WRITE setIcNumber NOTIFY icNumberChanged)
    Q_PROPERTY(QString telephone READ telephone WRITE setTelephone NOTIFY telephoneChanged)
    Q_PROPERTY(QString avatar READ avatar WRITE setAvatar NOTIFY avatarChanged)
    Q_PROPERTY(QString classUser READ classUser WRITE setClassUser NOTIFY classUserChanged)
    Q_PROPERTY(QString uni READ uni WRITE setUni NOTIFY uniChanged)
    Q_PROPERTY(QString country READ country WRITE setCountry NOTIFY countryChanged)
    Q_PROPERTY(bool isLogin READ isLogin WRITE setIsLogin NOTIFY isLoginChanged)

public:
    explicit User(QObject *parent = nullptr);
//    User(QObject *parent);

    Q_INVOKABLE QString username();
    Q_INVOKABLE void setUsername(const QString &data);

    Q_INVOKABLE QString fullname();
    Q_INVOKABLE void setFullname(const QString &data);

    Q_INVOKABLE QString email();
    Q_INVOKABLE void setEmail(const QString &data);

    Q_INVOKABLE QString dayofbirth();
    Q_INVOKABLE void setDayofbirth(const QString &data);

    Q_INVOKABLE QString gender();
    Q_INVOKABLE void setGender(const QString &data);

    Q_INVOKABLE QString icNumber();
    Q_INVOKABLE void setIcNumber(const QString &data);

    Q_INVOKABLE QString telephone();
    Q_INVOKABLE void setTelephone(const QString &data);

    Q_INVOKABLE QString avatar();
    Q_INVOKABLE void setAvatar(const QString &data);

    Q_INVOKABLE QString classUser();
    Q_INVOKABLE void setClassUser(const QString &data);

    Q_INVOKABLE QString uni();
    Q_INVOKABLE void setUni(const QString &data);

    Q_INVOKABLE QString country();
    Q_INVOKABLE void setCountry(const QString &data);

    Q_INVOKABLE bool isLogin();
    Q_INVOKABLE void setIsLogin(const bool &data);

//    Q_INVOKABLE void setDataUser();

Q_SIGNALS:
    void usernameChanged();
    void fullnameChanged();
    void emailChanged();
    void dayofbirthChanged();
    void genderChanged();
    void icNumberChanged();
    void telephoneChanged();
    void avatarChanged();
    void updateUser();
    void classUserChanged();
    void uniChanged();
    void countryChanged();
    void isLoginChanged();

private:
    QString m_username;
    QString m_fullname;
    QString m_email;
    QString m_dayofbirth;
    QString m_gender;
    QString m_icNumber;
    QString m_telephone;
    QString m_avatar;
    QString m_classUser;
    QString m_uni;
    QString m_country;
    bool m_isLogin;
};

#endif // USER_H
