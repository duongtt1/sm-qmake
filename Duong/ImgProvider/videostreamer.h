#ifndef VIDEOSTREAMER_H
#define VIDEOSTREAMER_H

#include <QObject>
#include <QTimer>
#include <QImage>
#include <iostream>
#include <vector>
#include <Duong/arcface/arcface.h>
#include <Duong/arcface/mtcnn.h>
#include <opencv4/opencv2/core.hpp>
#include <opencv4/opencv2/opencv.hpp>
#include <opencv4/opencv2/highgui.hpp>
#include "Duong/FaceAuth/include/authFace.h"

cv::Mat ncnn2cv(ncnn::Mat img);

class VideoStreamer: public QObject
{
    Q_OBJECT
public:
    VideoStreamer();
    ~VideoStreamer();
//    MtcnnDetector *ins_detector;
    vector<FaceInfo> ins_face_result{};
    std::string pre_name = "";
    std::string name="";
    int count=0;
    QString name_auth="";
public:
    Q_INVOKABLE QString getNameAuth();
    void streamVideo();

public Q_SLOTS:
    void openVideoCamera();
    void closeVideoCamera();

private:
    AuthFace ins_AF;
    cv::Mat frame;
    cv::VideoCapture cap;
    QTimer tUpdate;
    int check;

Q_SIGNALS:
    void loginSuccess();
    void newImage(QImage &);
    void newAvatar(QImage &);
};

#endif // VIDEOSTREAMER_H
