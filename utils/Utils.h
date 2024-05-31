//
// Copyright 2024 Nazarii Moroz
//

#ifndef PAYMENTS_SYSTEM_UTILS_H
#define PAYMENTS_SYSTEM_UTILS_H

class QJsonObject;

#define TO_STR(TO_CONV) #TO_CONV
#define TO_STR_COV(TO_CONV) TO_STR(TO_CONV)

#define NS_INFO(MSG)\
    {QDebug(QtInfoMsg) << (__FILE__ "(" TO_STR_COV(__LINE__) ")" ": " MSG);} (void)0

#define NS_ERROR(MSG)\
    {QDebug(QtCriticalMsg) << (__FILE__ "(" TO_STR_COV(__LINE__) ")" ": " MSG);} (void)0

#define NS_CHECK_RETURN(COND, TO_RET)                                                   \
    if(!(COND))                                                                         \
    {                                                                                   \
        NS_ERROR(#COND);                                                                \
        return TO_RET;                                                                  \
    }(void)0

#define NS_CHECK(COND) NS_CHECK_RETURN(COND, )


#define RES_FILE ":/json/links.json"

namespace Utils
{

QString getLink(QStringView name);

template<class T>
T* tFromJson(const QJsonObject& jsonObject, QObject* parent = nullptr)
{
    auto var = new T(parent);
    const auto metaObject = var->metaObject();
    for(int i = metaObject->propertyOffset(); i < metaObject->propertyCount(); ++i)
    {
        const auto property = metaObject->property(i);
        const auto propertyName = property.name();
        const auto propertyValue = jsonObject[propertyName].toVariant();

        var->setProperty(propertyName, propertyValue);
    }

    return var;
}
}

#endif //PAYMENTS_SYSTEM_UTILS_H
