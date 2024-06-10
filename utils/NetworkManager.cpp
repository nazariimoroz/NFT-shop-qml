//
// Copyright 2024 Nazarii Moroz
//

#include "NetworkManager.h"
#include "qjsonarray.h"
#include "qjsonobject.h"

#include <QJsonParseError>
#include <QNetworkReply>

using namespace Utils;

bool NetworkManager::processReplyError(QNetworkReply *reply, QList<QString> &errors)
{
    if (reply->error()) {
        QDebug(QtCriticalMsg) << reply->errorString();

        QJsonParseError error;

        const auto jsonDoc = QJsonDocument::fromJson(reply->readAll(), &error);
        if (error.error != QJsonParseError::NoError) {
            return true;
        }

        const auto arrayList = jsonDoc.object()["message"].toArray();
        for (auto var : arrayList) {
            const auto result = var.toString();
            QDebug(QtCriticalMsg) << result;
            errors << result;
        }
        return true;
    }

    return false;
}
