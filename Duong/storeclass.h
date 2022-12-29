#ifndef STORECLASS_H
#define STORECLASS_H

#include <QString>
#include <QObject>

class StoreClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString idclass READ idclass WRITE setIdclass NOTIFY idclassChanged)
    Q_PROPERTY(bool isLive READ isLive WRITE setIsLive NOTIFY isLiveChanged)
    Q_PROPERTY(int n_noti_assign READ n_noti_assign WRITE setN_noti_assign NOTIFY n_noti_assignChanged)
public:
    explicit StoreClass(QObject *parent = nullptr);
    Q_INVOKABLE QString idclass();
    Q_INVOKABLE void setIdclass(const QString &data);
    Q_INVOKABLE bool isLive();
    Q_INVOKABLE void setIsLive(const int &data);
    Q_INVOKABLE int n_noti_assign();
    Q_INVOKABLE void setN_noti_assign(int data);
private:
    QString m_idclass;
    bool m_isLive;
    int m_n_noti_assign;
Q_SIGNALS:
    void idclassChanged();
    void isLiveChanged();
    void n_noti_assignChanged();
};

#endif // STORECLASS_H
