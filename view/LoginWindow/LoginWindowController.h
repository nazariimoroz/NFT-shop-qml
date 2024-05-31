//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_LOGINWINDOWCONTROLLER_H
#define NFT_SHOP_LOGINWINDOWCONTROLLER_H

#include <QObject>
#include <QtQuick>

class UserModel;

class LoginWindowController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit LoginWindowController(QObject* parent = nullptr);

    Q_INVOKABLE void TryRegistration();
    Q_INVOKABLE void TryLogin();
};


#endif //NFT_SHOP_LOGINWINDOWCONTROLLER_H
