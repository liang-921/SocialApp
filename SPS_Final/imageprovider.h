#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H
#include <QQuickImageProvider>

class ImageProvider:public QQuickImageProvider
{
public:
    ImageProvider();

    QImage requestImage(const QString &id,QSize *size, const QSize &requestedSize);
  //  void setImage(const QImage &image);
//private:
    QImage img;
};

#endif // IMAGEPROVIDER_H
