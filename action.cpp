#include "action.h"


Action::Action(QObject *parent)
    : QObject{parent}
{

}

void Action::openPDF(){
    system("C:\\Users\\duong\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe C:\\Users\\duong\\AppData\\Local\\SumatraPDF\\example.pdf -presentation -zoom 200");
}

void Action::openMeeting(){
    system("C:\\Program^ Files\\Google\\Chrome\\Application\\chrome.exe --start-fullscreen --app=https://meet.jit.si/IT001");
}
