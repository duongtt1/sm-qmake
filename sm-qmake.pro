QT += quick  qml webengine
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
        FaceAuth/src/TArcface.cpp \
        FaceAuth/src/TBlur.cpp \
        FaceAuth/src/TLive.cpp \
        FaceAuth/src/TMtCNN.cpp \
        FaceAuth/src/TRetina.cpp \
        FaceAuth/src/TWarp.cpp \
        FaceAuth/src/authFace.cpp \
        ImgProvider/opencvimageprovider.cpp \
        ImgProvider/videostreamer.cpp \
        action.cpp \
        arcface/arcface.cpp \
        arcface/base.cpp \
        arcface/mtcnn.cpp \
        dsocketclient.cpp \
        dtimer.cpp \
        main.cpp \
        storeclass.cpp \
        user.cpp

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
    FaceAuth/include/TArcface.h \
    FaceAuth/include/TBlur.h \
    FaceAuth/include/TLive.h \
    FaceAuth/include/TMtCNN.h \
    FaceAuth/include/TRetina.h \
    FaceAuth/include/TWarp.h \
    FaceAuth/include/authFace.h \
    ImgProvider/opencvimageprovider.h \
    ImgProvider/videostreamer.h \
    action.h \
    arcface/arcface.h \
    arcface/base.h \
    arcface/mtcnn.h \
    dsocketclient.h \
    dtimer.h \
    ncnn/include/benchmark.h \
    ncnn/include/blob.h \
    ncnn/include/cpu.h \
    ncnn/include/layer.h \
    ncnn/include/layer_type.h \
    ncnn/include/layer_type_enum.h \
    ncnn/include/mat.h \
    ncnn/include/modelbin.h \
    ncnn/include/net.h \
    ncnn/include/opencv.h \
    ncnn/include/paramdict.h \
    ncnn/include/platform.h \
    storeclass.h \
    user.h

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
