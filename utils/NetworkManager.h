//
// Copyright 2024 Nazarii Moroz
//

#include <QString>

#ifndef NFT_SHOP_NETWORKMANAGER_H
#define NFT_SHOP_NETWORKMANAGER_H

class QNetworkReply;

namespace Utils::NetworkManager {

bool processReplyError(QNetworkReply *reply, QList<QString> &errors);

}

#endif //NFT_SHOP_NETWORKMANAGER_H
