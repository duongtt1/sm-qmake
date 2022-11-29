#include "opencvimageprovider.h"
#include <QDebug>

OpencvImageProvider::OpencvImageProvider(QObject *parent) : QObject(parent), QQuickImageProvider(QQuickImageProvider::Image)
{
    image = QImage(200,200,QImage::Format_RGB32);
    image.fill(QColor("black"));
    avatar = QImage(224,224,QImage::Format_RGB32);
    avatar.fill(QColor("black"));
}

QImage OpencvImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(id);

    if(size){
        *size = image.size();
    }

    if(requestedSize.width() > 0 && requestedSize.height() > 0) {
        image = image.scaled(requestedSize.width(), requestedSize.height(), Qt::KeepAspectRatio);
    }
    return image;
}

QImage OpencvImageProvider::requestAvatar(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(id);

    if(size){
        *size = avatar.size();
    }

    if(requestedSize.width() > 0 && requestedSize.height() > 0) {
        avatar = avatar.scaled(requestedSize.width(), requestedSize.height(), Qt::KeepAspectRatio);
    }
    return avatar;
}

void OpencvImageProvider::updateImage(const QImage &image)
{
    qDebug() << "update image";
    if(!image.isNull() && this->image != image) {
        qDebug() << "imageChanged";
        this->image = image;
        Q_EMIT imageChanged();
    }
}

void OpencvImageProvider::updateAvatar(const QImage &p_avatar)
{
    qDebug() << "update image";
    if(!avatar.isNull() && this->avatar != p_avatar) {
        qDebug() << "updateAvatar";
        this->avatar = p_avatar;
        Q_EMIT avatarChanged();
    }
}
