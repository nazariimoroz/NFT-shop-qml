//
// Copyright 2024 Nazarii Moroz
//
#include <QString>
#include <QStringView>
#include <QFile>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include "Utils.h"

QString Utils::getLink(QStringView name)
{
    static thread_local QJsonObject jsonObject;
    if (jsonObject.isEmpty()) {
        auto file = QFile(RES_FILE);
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            QDebug(QtCriticalMsg) << "Can not open RES file";
            return QString{};
        }
        jsonObject = QJsonDocument::fromJson(file.readAll()).object();
    }
    const auto toRet = jsonObject["server"].toString() + jsonObject[name].toString();
    return toRet;
}
