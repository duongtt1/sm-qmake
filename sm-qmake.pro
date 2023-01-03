QT += quick  qml
CONFIG += c++11
CONFIG += no_keywords
#CONFIG += fopenmp pthread


# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
QMAKE_CXXFLAGS += -pthread -fopenmp
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
#INCLUDEPATH += ./3rdParty/pdfjs-3.0.279-dist

#INCLUDEPATH += ./3rdParty/qmqtt/src/mqtt
#LIBS += -L"./3rdParty/qmqtt/src/mqtt"

SOURCES += \
        Duong/FaceAuth/src/TArcface.cpp \
        Duong/FaceAuth/src/TBlur.cpp \
        Duong/FaceAuth/src/TLive.cpp \
        Duong/FaceAuth/src/TMtCNN.cpp \
        Duong/FaceAuth/src/TRetina.cpp \
        Duong/FaceAuth/src/TWarp.cpp \
        Duong/FaceAuth/src/authFace.cpp \
        Duong/ImgProvider/opencvimageprovider.cpp \
        Duong/ImgProvider/videostreamer.cpp \
        Duong/action.cpp \
        Duong/arcface/arcface.cpp \
        Duong/arcface/base.cpp \
        Duong/arcface/mtcnn.cpp \
        Duong/dsocketclient.cpp \
        Duong/dtimer.cpp \
        main.cpp \
        Duong/storeclass.cpp \
        Duong/user.cpp

RESOURCES += qml.qrc

#INCLUDEPATH += /usr/local/include/
#DEPENDPATH += /usr/local/lib/

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Duong/FaceAuth/include/TArcface.h \
    Duong/FaceAuth/include/TBlur.h \
    Duong/FaceAuth/include/TLive.h \
    Duong/FaceAuth/include/TMtCNN.h \
    Duong/FaceAuth/include/TRetina.h \
    Duong/FaceAuth/include/TWarp.h \
    Duong/FaceAuth/include/authFace.h \
    Duong/ImgProvider/opencvimageprovider.h \
    Duong/ImgProvider/videostreamer.h \
    Duong/action.h \
    Duong/arcface/arcface.h \
    Duong/arcface/base.h \
    Duong/arcface/mtcnn.h \
    Duong/dsocketclient.h \
    Duong/dtimer.h \
    Duong/storeclass.h \
    Duong/user.h

#DISTFILES +=

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../usr/local/lib/release/ -lsioclient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../usr/local/lib/debug/ -lsioclient
else:unix: LIBS += -L$$PWD/../../../../usr/local/lib/ -lsioclient

INCLUDEPATH += $$PWD/../../../../usr/local/include
DEPENDPATH += $$PWD/../../../../usr/local/include

LIBS += /usr/local/lib/libopencv_*
LIBS += -pthread -fopenmp
INCLUDEPATH += /usr/local/include \
               /usr/local/include/opencv4 \
               /usr/local/include/opencv4/opencv2

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/release/libsioclient.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/debug/libsioclient.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/release/sioclient.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/debug/sioclient.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/libsioclient.a

DISTFILES += \
    Resources/icon/icons8-live-video-on.gif \
    arcface/main \
    models/det1.bin \
    models/det1.param \
    models/det2.bin \
    models/det2.param \
    models/det3.bin \
    models/det3.param \
    models/det4.bin \
    models/det4.param \
    models/mobilefacenet.bin \
    models/mobilefacenet.param \
    ncnn/lib/libncnn.a




unix:!macx: LIBS += -L$$PWD/../../tencent/ncnn/build/install/lib/ -lncnn

INCLUDEPATH += $$PWD/../../tencent/ncnn/build/install/include
DEPENDPATH += $$PWD/../../tencent/ncnn/build/install/include

unix:!macx: PRE_TARGETDEPS += $$PWD/../../tencent/ncnn/build/install/lib/libncnn.a
