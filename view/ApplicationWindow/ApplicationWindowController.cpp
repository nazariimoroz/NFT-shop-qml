//
// Copyright 2024 Nazarii Moroz
//

#include "ApplicationWindowController.h"
#include <QDebug>
#include <QWindow>
#include "Utils.h"

ApplicationWindowBackend::ApplicationWindowBackend(QObject* parent) : QObject(parent)
{

}

void ApplicationWindowBackend::onCompleted(QWindow* window)
{
    PS_CHECK((m_window = window));
    PS_CHECK(m_loginWindow);

    m_loginWindow->show();
}

void ApplicationWindowBackend::setLoginWindow(QWindow* newLoginWindow)
{
    m_loginWindow = newLoginWindow;
}
