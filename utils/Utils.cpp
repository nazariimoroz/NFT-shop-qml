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

QUrl Utils::getLink(QStringView name)
{
    static thread_local QJsonObject jsonObject;
#ifdef NDEBUG
    if (jsonObject.isEmpty()) {
#else
    if (true) {
#endif
        auto file = QFile(RES_FILE);
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            QDebug(QtCriticalMsg) << "Can not open RES file";
            return QUrl{QString{}};
        }
        jsonObject = QJsonDocument::fromJson(file.readAll()).object();
    }
    const auto toRet = jsonObject["server"].toString() + jsonObject[name].toString();
    return QUrl{toRet};
}
