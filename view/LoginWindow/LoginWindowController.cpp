//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <UserModel.h>
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>
#include <QStringView>

using namespace Qt::Literals::StringLiterals;

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
    auto request = QNetworkRequest(Utils::getLink(u"registration"));
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      QVariant("application/json; chatset=utf-8"));

    auto body = QJsonObject{{"name", m_name},
                            {"username", m_username},
                            {"email", m_email},
                            {"password", m_password}};

    auto http = new QHttpMultiPart(NetworkManager);

    QHttpPart receiptPart;
    receiptPart.setHeader(QNetworkRequest::ContentDispositionHeader,
                          QVariant("form-data; name=\"data\""));
    receiptPart.setBody(QJsonDocument{body}.toJson(QJsonDocument::Compact));

    http->append(receiptPart);

    const auto reply = NetworkManager->post(request,
                                            QJsonDocument{body}.toJson(QJsonDocument::Compact));

    connect(
        reply,
        &QNetworkReply::finished,
        this,
        [this, reply]() {
            QList<QString> errors;
            if (Utils::NetworkManager::processReplyError(reply, errors)) {
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
