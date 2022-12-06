#include "action.h"


Action::Action(QObject *parent)
    : QObject{parent}
{

}

void Action::openPDF(){
    system("evince ~/example.pdf"); // evince example.pdf
}

void Action::openMeeting(){
    system("chromium --start-fullscreen --app=https://meet.jit.si/IT001");
}
