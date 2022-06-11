#include "filterpic.h"

FilterPic::FilterPic(QObject *parent)
    : QObject(parent)
{
}

void FilterPic::greyPic(const QString &source)
{
    old_m_img.load(source);
    qDebug()<<"send sucess!!"<<source;

    QString str = source;
    str=str.replace("../../","");
    qDebug()<<str;
    if(old_m_img.load("/root/1.png")){
        qDebug()<<"load success"<<str;
    };

//    QImage img{old_m_img.width(),old_m_img.height(),QImage::Format_ARGB32};
//    new_m_img=img;

//    QColor oldColor;

//    for(int i=0;i<new_m_img.width();i++){
//        for(int j=0;j<new_m_img.height();j++){
//            oldColor=QColor(old_m_img.pixel(i,j));
//            int average=(oldColor.red()+oldColor.green()+oldColor.blue())/3;
//            new_m_img.setPixel(i,j,qRgb(average,average,average));
//        }
//    }

    if(!old_m_img.isNull()){
        qDebug()<<"old_m_img is not  NULL!!!!";
    }

  // imgProvider->img=old_m_img;

//    if(!imgProvider->img.isNull()){
//        qDebug()<<"imgProvider is not  NULL!!!!";
//    }

//    emit imageUpdate();
}
