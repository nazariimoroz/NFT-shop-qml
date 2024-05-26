//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_NETWORKMANAGER_H
#define NFT_SHOP_NETWORKMANAGER_H

#include "QNetworkAccessManager"

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

private:
    static QNetworkAccessManager* m_networkAccessManager;
};
}


#endif //NFT_SHOP_NETWORKMANAGER_H
