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
{
    NetworkManager = new QNetworkAccessManager(this);
}

void LoginWindowController::tryRegistration()
{
    if (!NetworkManager) {
        QDebug(QtCriticalMsg) << "!NetworkManager";
        return;
    }
    auto request = QNetworkRequest(QUrl{"http://localhost:5000/api/auth/registration"});
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      QVariant("application/x-www-form-urlencoded"));

    const auto body = QJsonObject{{"name", "user4"},
                                  {"username", "@user4"},
                                  {"email", "USER4@gmail.com"},
                                  {"password", "qwerty"}};

    const auto reply = NetworkManager->post(request,
                                            QJsonDocument{body}.toJson(QJsonDocument::Compact));

    connect(
        reply,
        &QNetworkReply::finished,
        this,
        [this, reply]() {
            if (reply->error()) {
                QDebug(QtCriticalMsg) << reply->errorString();
                QJsonParseError error;
                const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
                if (error.error != QJsonParseError::NoError) {
                    return;
                }
                const auto arrayList = jsonDoc.object()["message"].toArray();

                return;
            }

            QJsonParseError error;
            const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
            if (error.error != QJsonParseError::NoError || !jsonDoc.isObject()) {
                QDebug(QtCriticalMsg) << error.errorString() << " OR "
                                      << "jsonDoc is not a object";
                return;
            }

            const auto user = Utils::tFromJson<UserModel>(jsonDoc.object(), this);
            emit authComplete(user);
        },
        Qt::SingleShotConnection);
}

void LoginWindowController::tryLogin()
{
    qDebug() << "Try Login";
}
