#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
//#include <QtWebView/QtWebView>
#include <QtWebEngine/qtwebengineglobal.h>

#include "Duong/action.h"
#include "Duong/user.h"
#include "Duong/storeclass.h"
#include "Duong/dsocketclient.h"
#include "Duong/ImgProvider/videostreamer.h"
#include "Duong/ImgProvider/opencvimageprovider.h"
#include "Duong/dtimer.h"

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
    VideoStreamer videoStreamer;
    OpencvImageProvider *liveImageProvider(new OpencvImageProvider);
    DTimer *d_timer = new DTimer();

    //! register engine cpp
    engine.rootContext()->setContextProperty("User", &obj_User);
    engine.rootContext()->setContextProperty("StoreClass", &obj_store_class);
    engine.rootContext()->setContextProperty("ActionClass", &obj_action);
    engine.rootContext()->setContextProperty("DSocket", &obj_dsk);
    engine.rootContext()->setContextProperty("VideoStreamer",&videoStreamer);
    engine.rootContext()->setContextProperty("liveImageProvider",liveImageProvider);
    engine.rootContext()->setContextProperty("D_timer",d_timer);
    engine.addImageProvider("live",liveImageProvider);

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QObject::connect(&videoStreamer,&VideoStreamer::newImage,liveImageProvider,&OpencvImageProvider::updateImage);
    QObject::connect(&videoStreamer,&VideoStreamer::newAvatar,liveImageProvider,&OpencvImageProvider::updateAvatar);

    engine.load(url);

    return app.exec();
}
