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
    cv::Mat img1 = frame;
    QImage avatar;
    ncnn::Mat det1;
    ncnn::Mat ncnn_img1 = ncnn::Mat::from_pixels(img1.data, ncnn::Mat::PIXEL_BGR, img1.cols, img1.rows);
    this->ins_face_result = this->ins_detector->Detect(ncnn_img1);

    if (this->ins_face_result.size() != 0){
        det1 = preprocess(ncnn_img1, this->ins_face_result[0]);
        for (auto it = this->ins_face_result.begin(); it != this->ins_face_result.end(); it++)
            {
                cv::rectangle(img1, cv::Point(it->x[0], it->y[0]), cv::Point(it->x[1], it->y[1]), cv::Scalar(0, 255, 0), 2);
                cv::circle(img1, cv::Point(it->landmark[0], it->landmark[1]), 2, cv::Scalar(0, 255, 0), 2);
                cv::circle(img1, cv::Point(it->landmark[2], it->landmark[3]), 2, cv::Scalar(0, 255, 0), 2);
                cv::circle(img1, cv::Point(it->landmark[4], it->landmark[5]), 2, cv::Scalar(0, 255, 0), 2);
                cv::circle(img1, cv::Point(it->landmark[6], it->landmark[7]), 2, cv::Scalar(0, 255, 0), 2);
                cv::circle(img1, cv::Point(it->landmark[8], it->landmark[9]), 2, cv::Scalar(0, 255, 0), 2);
            }

    }

    QImage img = QImage(img1.data,img1.cols,img1.rows,QImage::Format_RGB888).rgbSwapped();
//    cv::imshow("test", ncnn2cv(det1));
    avatar = QImage(ncnn2cv(det1).data,ncnn2cv(det1).cols,ncnn2cv(det1).rows,QImage::Format_RGB888).rgbSwapped();

    Q_EMIT newImage(img);
    Q_EMIT newAvatar(avatar);
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
