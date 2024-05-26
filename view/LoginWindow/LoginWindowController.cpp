//
// Copyright 2024 Nazarii Moroz
//

#include "LoginWindowController.h"
#include <QDebug>
#include <Utils.h>
#include <NetworkManager.h>

LoginWindowController::LoginWindowController(QObject* parent) : QObject(parent)
{
}

void LoginWindowController::TryRegistration()
{

}

void LoginWindowController::TryLogin()
{
    qDebug() << "Try Login";
}
