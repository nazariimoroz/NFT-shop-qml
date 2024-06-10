//
// Copyright 2024 Nazarii Moroz
//

#ifndef PAYMENTS_SYSTEM_UTILS_H
#define PAYMENTS_SYSTEM_UTILS_H

#include <QJsonObject>
#include <QString>

#define RES_FILE ":/json/links.json"

namespace Utils
{

QUrl getLink(QStringView name);

template<class T>
T *tFromJson(const QJsonObject &jsonObject, QObject *parent = nullptr)
{
    auto var = new T(parent);
    const auto metaObject = var->metaObject();
    for (int i = metaObject->propertyOffset(); i < metaObject->propertyCount(); ++i) {
        const auto property = metaObject->property(i);
        const auto propertyName = property.name();
        const auto propertyValue = jsonObject[propertyName].toVariant();
        if (!jsonObject.isEmpty()) {
            var->setProperty(propertyName, propertyValue);
        }
    }

    return var;
}
}

#endif //PAYMENTS_SYSTEM_UTILS_H
