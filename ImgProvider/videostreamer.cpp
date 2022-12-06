#include "videostreamer.h"
#include "opencv2/opencv.hpp"
#include <QDebug>

cv::Mat ncnn2cv(ncnn::Mat img)
{
    unsigned char pix[img.h * img.w * 3];
    img.to_pixels(pix, ncnn::Mat::PIXEL_BGR);
    cv::Mat cv_img(img.h, img.w, CV_8UC3);
    for (int i = 0; i < cv_img.rows; i++)
    {
        for (int j = 0; j < cv_img.cols; j++)
        {
            cv_img.at<cv::Vec3b>(i, j)[0] = pix[3 * (i * cv_img.cols + j)];
            cv_img.at<cv::Vec3b>(i, j)[1] = pix[3 * (i * cv_img.cols + j) + 1];
            cv_img.at<cv::Vec3b>(i, j)[2] = pix[3 * (i * cv_img.cols + j) + 2];
        }
    }
    return cv_img;
}

VideoStreamer::VideoStreamer()
{
    this->ins_detector = new MtcnnDetector("./models");
    connect(&tUpdate,&QTimer::timeout,this,&VideoStreamer::streamVideo);
}

VideoStreamer::~VideoStreamer()
{
    delete ins_detector;
    cap.release();
    tUpdate.stop();
}

void VideoStreamer::streamVideo()
{
    cap>>frame;
    ncnn::Mat det1;
    this->name = ins_AF.startLoginWithFace(frame);

    if (name != "" && pre_name != "" && name == pre_name){
        count++;
    }
    pre_name = name;
    qDebug() << count;
    if (count == 50){
        this->name_auth = QString::fromUtf8(name.c_str());;
        Q_EMIT loginSuccess();

    }
    QImage img = QImage(frame.data,frame.cols,frame.rows,QImage::Format_RGB888).rgbSwapped();
    Q_EMIT newImage(img);
}

QString VideoStreamer::getNameAuth(){
    return  this->name_auth;
}

void VideoStreamer::openVideoCamera()
{
    cap.open(0);
    double fps = cap.get(cv::CAP_PROP_FPS);
    tUpdate.start(1000/fps);
}

void VideoStreamer::closeVideoCamera(){
    cap.release();
    tUpdate.stop();
}
