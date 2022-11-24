#ifndef STORECLASS_H
#define STORECLASS_H

#include <QString>
#include <QObject>

class StoreClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString idclass READ idclass WRITE setIdclass NOTIFY idclassChanged)
    Q_PROPERTY(bool isLive READ isLive WRITE setIsLive NOTIFY isLiveChanged)
public:
    explicit StoreClass(QObject *parent = nullptr);
    Q_INVOKABLE QString idclass();
    Q_INVOKABLE void setIdclass(const QString &data);
    Q_INVOKABLE bool isLive();
    Q_INVOKABLE void setIsLive(const int &data);
private:
    QString m_idclass;
    bool m_isLive;
Q_SIGNALS:
    void idclassChanged();
    void isLiveChanged();
};

#endif // STORECLASS_H
