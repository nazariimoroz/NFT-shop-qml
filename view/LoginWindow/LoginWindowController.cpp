//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <UserModel.h>
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>
#include <QStringView>

LoginWindowController::LoginWindowController(QObject* parent) : QObject(parent)
{
    Q_INIT_RESOURCE(res); // TODO MOVE TO Utils
}

void LoginWindowController::TryRegistration()
{
    QNetworkRequest request;

    request.setUrl(
            QUrl(Utils::getLink(tr("getUser")).arg(1))
            );

    Utils::NetworkManager::get(request, this, [this](QNetworkReply* reply){
        NS_CHECK(!reply->error());

        QJsonParseError error;
        const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
        NS_CHECK(error.error == QJsonParseError::NoError || !jsonDoc.isObject());

        const auto user = Utils::tFromJson<UserModel>(jsonDoc.object(), this);
        qDebug() << user->m_name;
    });
}

void LoginWindowController::TryLogin()
{
    qDebug() << "Try Login";
}
