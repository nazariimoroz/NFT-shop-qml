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

public:
    explicit LoginWindowController(QObject *parent = nullptr);

    Q_INVOKABLE void tryRegistration();
    Q_INVOKABLE void tryLogin();

signals:
    void authComplete(UserModel *result);

private:
    QNetworkAccessManager *NetworkManager;
};

#endif //NFT_SHOP_LOGINWINDOWCONTROLLER_H
