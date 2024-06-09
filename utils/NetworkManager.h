//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_NETWORKMANAGER_H
#define NFT_SHOP_NETWORKMANAGER_H

#include <QHttpMultiPart>
#include "QNetworkAccessManager"

class QHttpMultiPart;

namespace Utils
{
class NetworkManager
{
public:
    NetworkManager();

    ~NetworkManager();

    static QNetworkAccessManager* getNetworkAccessManager();

    template<class TFunc>
    static void get(const QNetworkRequest& request, QObject* object, TFunc func)
    {
        const auto manager = getNetworkAccessManager();

        QObject::connect(manager, &QNetworkAccessManager::finished,
                object, func,
                Qt::SingleShotConnection);

        manager->get(request);
    }

    template<class TFunc>
    static void post(const QNetworkRequest& request, const QHttpMultiPart& part, QObject* object, TFunc func)
    {
        const auto manager = getNetworkAccessManager();

        QObject::connect(manager, &QNetworkAccessManager::finished,
                object, func,
                Qt::SingleShotConnection);

        manager->post(request, const_cast<QHttpMultiPart*>(&part));
    }

private:
    static QNetworkAccessManager* m_networkAccessManager;
};
}


#endif //NFT_SHOP_NETWORKMANAGER_H
