//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>

LoginWindowController::LoginWindowController(QObject* parent) : QObject(parent)
{
}

void LoginWindowController::TryRegistration()
{
    QNetworkRequest request;
    request.setUrl(QUrl("https://example.com/"));
    Utils::NetworkManager::get(request, this, [](QNetworkReply* reply){
        NS_CHECK(!reply->error());
        qDebug() << QString(reply->readAll());
    });
}

void LoginWindowController::TryLogin()
{
    qDebug() << "Try Login";
}
