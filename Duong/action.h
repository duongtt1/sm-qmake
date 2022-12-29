#ifndef ACTION_H
#define ACTION_H

#include <QObject>

class Action: public QObject
{
    Q_OBJECT
public:
    explicit Action(QObject *parent = nullptr);
    Q_INVOKABLE void openPDF();
    Q_INVOKABLE void openMeeting();

};

#endif // ACTION_H
