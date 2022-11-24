QT += quick  qml webengine
CONFIG += c++11
CONFIG += no_keywords


# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
#INCLUDEPATH += ./3rdParty/pdfjs-3.0.279-dist

#INCLUDEPATH += ./3rdParty/qmqtt/src/mqtt
#LIBS += -L"./3rdParty/qmqtt/src/mqtt"

SOURCES += \
        action.cpp \
        dsocketclient.cpp \
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
    action.h \
    dsocketclient.h \
    storeclass.h \
    user.h

#DISTFILES +=

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../usr/local/lib/release/ -lsioclient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../usr/local/lib/debug/ -lsioclient
else:unix: LIBS += -L$$PWD/../../../../usr/local/lib/ -lsioclient

INCLUDEPATH += $$PWD/../../../../usr/local/include
DEPENDPATH += $$PWD/../../../../usr/local/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/release/libsioclient.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/debug/libsioclient.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/release/sioclient.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/debug/sioclient.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../../usr/local/lib/libsioclient.a

DISTFILES += \
    Resources/icon/icons8-live-video-on.gif
