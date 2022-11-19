#ifndef STORECLASS_H
#define STORECLASS_H

#include <QString>
#include <QObject>

class StoreClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString idclass READ idclass WRITE setIdclass NOTIFY idclassChanged);
public:
    explicit StoreClass(QObject *parent = nullptr);
    Q_INVOKABLE QString idclass();
    Q_INVOKABLE void setIdclass(const QString &data);
private:
    QString m_idclass;
signals:
    void idclassChanged();
};

#endif // STORECLASS_H
