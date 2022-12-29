#ifndef AUTHFACE_H
#define AUTHFACE_H


#include <iostream>
#include <opencv2/opencv.hpp>
#include "TMtCNN.h"
#include "TArcface.h"
#include "TRetina.h"
#include "TWarp.h"
#include "TLive.h"
#include "TBlur.h"

#define RETINA
#define RECOGNIZE_FACE
//#define TEST_LIVING
//#define AUTO_FILL_DATABASE
//#define BLUR_FILTER_STRANGER
// some diagnostics
//#define SHOW_LEGEND
#define SHOW_LANDMARKS
//----------------------------------------------------------------------------------------
// Adjustable Parameters
//----------------------------------------------------------------------------------------
using namespace std;
using namespace cv;

class AuthFace
{
private:
    vector<cv::String> NameFaces;
    const int   MaxItemsDatabase = 2000;
    const int   MinHeightFace    = 90;
    const float MinFaceThreshold = 0.30;    // default 0.50
    const float FaceLiving       = 0.93;
    const double MaxBlur         = -25.0;   //more positive = sharper image
    const double MaxAngle        = 10.0;
    //----------------------------------------------------------------------------------------
    // Some globals
    //----------------------------------------------------------------------------------------
    const int   RetinaWidth      = 320;
    const int   RetinaHeight     = 240;
    float ScaleX, ScaleY;

    float f;
    float FPS[16];
    int   n,Fcnt=0;
    size_t i;
//    cv::Mat frame;
    cv::Mat result_cnn;
    cv::Mat faces;
    std::vector<FaceObject> Faces;
    vector<cv::Mat> fc1;
    string pattern_jpg = "./img/*.jpg";
    cv::String NewItemName;
    size_t FaceCnt;
    //the networks
    TLive Live;
    TWarp Warp;
    TMtCNN MtCNN;
    TArcFace ArcFace;
    TRetina *Rtn;     //have Vulkan support on a Jetson Nano
    TBlur Blur;
    //some timing
    chrono::steady_clock::time_point Tbegin, Tend;
public:
    AuthFace();
    ~AuthFace();
    std::string startLoginWithFace(cv::Mat& img_input);
    void DrawObjects(cv::Mat &frame, vector<FaceObject> &Faces, std::string& name_result);


};

#endif // AUTHFACE_H
