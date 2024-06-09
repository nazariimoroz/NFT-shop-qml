//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <UserModel.h>
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>
#include <QStringView>

LoginWindowController::LoginWindowController(QObject *parent)
    : QObject(parent)
{}

void LoginWindowController::TryRegistration()
{
    const auto request =
        QNetworkRequest(QUrl(Utils::getLink(tr("registration"))));

    QHttpMultiPart https;
    QHttpPart http;

    Utils::NetworkManager::get(request, this, [this](QNetworkReply *reply)
    {
        if (reply->error()) {
            QDebug(QtCriticalMsg) << reply->errorString();
            return;
        }

        QJsonParseError error;
        const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
        if (error.error != QJsonParseError::NoError || !jsonDoc.isObject()) {
            QDebug(QtCriticalMsg) << error.errorString() << " OR " << "jsonDoc is not a object";
            return;
        }

        const auto user = Utils::tFromJson<UserModel>(jsonDoc.object(), this);
        qDebug() << user->getName();
    });
}

void LoginWindowController::TryLogin()
{
    qDebug() << "Try Login";
}
