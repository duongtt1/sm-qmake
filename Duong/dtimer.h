#ifndef DTIMER_H
#define DTIMER_H

#include <QObject>
#include <QTimer>
#include <QtDebug>
#include <Duong/arcface/arcface.h>
#include <Duong/arcface/mtcnn.h>
#include <opencv4/opencv2/core.hpp>
#include <opencv4/opencv2/opencv.hpp>
#include <opencv4/opencv2/highgui.hpp>
#include "FaceAuth/include/authFace.h"

class DTimer : public QObject
{
    Q_OBJECT


public:
    Q_INVOKABLE void startCheckFace();
    Q_INVOKABLE void stopCheckFace();
Q_SLOT
    bool checkFaceLogin();
    DTimer(QObject *parent = nullptr);
    ~DTimer();
private:
    QTimer *faceCheckTimer;
    AuthFace *authFace;
    cv::Mat frame;
    cv::VideoCapture cap_timer;
Q_SIGNALS:
    void checkFaceChanged(bool ret);
};

#endif // DTIMER_H
