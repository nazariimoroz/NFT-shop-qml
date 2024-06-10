//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_LOGINWINDOWCONTROLLER_H
#define NFT_SHOP_LOGINWINDOWCONTROLLER_H

#include <QObject>
#include <QtQuick>
#include <UserModel.h>

class LoginWindowController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString name MEMBER m_name)
    Q_PROPERTY(QString username MEMBER m_username)
    Q_PROPERTY(QString email MEMBER m_email)
    Q_PROPERTY(QString password MEMBER m_password)

public:
    explicit LoginWindowController(QObject *parent = nullptr);

    Q_INVOKABLE void tryRegistration();
    Q_INVOKABLE void tryLogin();

signals:
    void authComplete(UserModel *result);

private:
    QNetworkAccessManager *NetworkManager;

    QString m_name;
    QString m_username;
    QString m_email;
    QString m_password;
};

#endif //NFT_SHOP_LOGINWINDOWCONTROLLER_H
