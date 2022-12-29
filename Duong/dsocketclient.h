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
    Q_INVOKABLE void studentIsNotPresent(sio::event &);

    void recvStartClass(sio::event &);
    void recvCloseClass(sio::event &);
    void recvAsign(sio::event &);
    void blockScreenStudent(sio::event &);
    void unBlockScreenStudent(sio::event &);


Q_SIGNALS:
    void startClassSignal();
    void closeClassSignal();
    void newAssign();
    void eventBlockScreenStudent();
    void eventUnBlockScreenStudent();
};

#endif // DSOCKETCLIENT_H
