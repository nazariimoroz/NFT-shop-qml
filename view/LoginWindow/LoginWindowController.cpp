//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <UserModel.h>
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>

LoginWindowController::LoginWindowController(QObject* parent) : QObject(parent)
{
}

void LoginWindowController::TryRegistration()
{
    QNetworkRequest request;
    request.setUrl(QUrl("http://localhost:5000/api/user/1"));

    Utils::NetworkManager::get(request, this, [this](QNetworkReply* reply){
        NS_CHECK(!reply->error());

        QJsonParseError error;
        const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
        NS_CHECK(error.error == QJsonParseError::NoError || !jsonDoc.isObject());

        QJsonObject jsonReply = jsonDoc.object();

        const auto user = Utils::tFromJson<UserModel>(jsonReply, this);

        qDebug() << user->m_createdAt.toString();
    });
}

void LoginWindowController::TryLogin()
{
    qDebug() << "Try Login";
}
