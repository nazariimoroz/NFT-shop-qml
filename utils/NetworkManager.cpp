//
// Copyright 2024 Nazarii Moroz
//

#include "NetworkManager.h"
#include "QNetworkAccessManager"

using namespace Utils;

QNetworkAccessManager* NetworkManager::m_networkAccessManager = nullptr;

NetworkManager::NetworkManager()
{
    m_networkAccessManager = new QNetworkAccessManager();
}

NetworkManager::~NetworkManager()
{
    delete m_networkAccessManager;
}

QNetworkAccessManager* NetworkManager::getNetworkAccessManager()
{
    return m_networkAccessManager;
}
