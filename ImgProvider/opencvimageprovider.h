#ifndef OPENCVIMAGEPROVIDER_H
#define OPENCVIMAGEPROVIDER_H


#include <QObject>
#include <QImage>
#include <QQuickImageProvider>

class OpencvImageProvider : public QObject, public QQuickImageProvider
{
    Q_OBJECT
public:
    OpencvImageProvider(QObject *parent = nullptr);

    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
    QImage requestAvatar(const QString &id, QSize *size, const QSize &requestedSize) ;

public Q_SLOTS:
    void updateImage(const QImage &image);
    void updateAvatar(const QImage &p_avatar);

Q_SIGNALS:
    void imageChanged();
    void avatarChanged();

private:
    QImage image;
    QImage avatar;
};

#endif // OPENCVIMAGEPROVIDER_H
