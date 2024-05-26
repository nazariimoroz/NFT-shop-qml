//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_NETWORKMANAGER_H
#define NFT_SHOP_NETWORKMANAGER_H

class QNetworkAccessManager;

namespace Utils
{
class NetworkManager
{
public:
    NetworkManager();

    ~NetworkManager();

    static QNetworkAccessManager* getNetworkAccessManager();

private:
    static QNetworkAccessManager* m_networkAccessManager;
};
}


#endif //NFT_SHOP_NETWORKMANAGER_H
