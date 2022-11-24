#ifndef DSOCKETCLIENT_H
#define DSOCKETCLIENT_H

#include <QObject>
#include <sio_client.h>

class DSocketClient : public QObject
{
    Q_OBJECT
    sio::client client_ins;
public:
    explicit DSocketClient(QObject *parent = nullptr);
    Q_INVOKABLE bool connect_to_server();
    void recvStartClass(sio::event &);

//    DSocketClient(QObject *parent = 0);
Q_SIGNALS:
    void startClassSignal();
};

#endif // DSOCKETCLIENT_H
