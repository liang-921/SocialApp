#ifndef FILTERPIC_H
#define FILTERPIC_H

#include <QObject>
#include <QImage>
#include "imageprovider.h"

class FilterPic : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QImage newImg READ newImg WRITE setnewImg);
//    Q_PROPERTY(QImage oldImg READ oldImg WRITE setoldImg);
//    Q_PROPERTY(QString sourceImg READ sourceImg WRITE setsourceImg);
public:
    explicit FilterPic(QObject *parent = nullptr);
    ImageProvider *imgProvider;
//    Q_INVOKABLE void greyPic();
   // Q_INVOKABLE void

//    QImage oldImg() const {return old_m_img;}
//    QImage newImg() const {return new_m_img;}
//    QString sourceImg() const {return m_sourceImg;}

signals:
    void imageUpdate();

public slots:
//    void setoldImg(QImage oldImg){old_m_img = oldImg;}
//    void setnewImg(QImage newImg){old_m_img = newImg;}
//    void setsourceImg(QString sourceImg){m_sourceImg = sourceImg;}

    void greyPic(const QString &source);
//    void showUrl(const QString &source);

private:
    QImage new_m_img;
    QImage old_m_img;
    QString m_sourceImg;
};

#endif // FILTERPIC_H
