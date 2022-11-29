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
    Q_INVOKABLE void emitSubmmitTask();

    void recvStartClass(sio::event &);
    void recvCloseClass(sio::event &);

    void recvAsign(sio::event &);


Q_SIGNALS:
    void startClassSignal();
    void closeClassSignal();
    void newAssign();
};

#endif // DSOCKETCLIENT_H
