#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
//#include <QtWebView/QtWebView>
#include <QtWebEngine/qtwebengineglobal.h>

#include "action.h"
#include "user.h"
#include "storeclass.h"
#include "dsocketclient.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);

    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
    app.setWindowIcon(QIcon(":/Resources/icon/school.png"));
    QQmlApplicationEngine engine;

    //! init cpp object
    User obj_User;
    StoreClass obj_store_class;
    Action obj_action;
    DSocketClient obj_dsk;

    //! register engine cpp
    engine.rootContext()->setContextProperty("User", &obj_User);
    engine.rootContext()->setContextProperty("StoreClass", &obj_store_class);
    engine.rootContext()->setContextProperty("ActionClass", &obj_action);
    engine.rootContext()->setContextProperty("DSocket", &obj_dsk);
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
