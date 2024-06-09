//
// Copyright 2024 Nazarii Moroz
//

#include "ApplicationWindowController.h"
#include <QDebug>
#include <QWindow>

ApplicationWindowBackend::ApplicationWindowBackend(QObject* parent) : QObject(parent)
{

}

void ApplicationWindowBackend::onCompleted(QWindow* window)
{
    m_window = window;
    if (!m_loginWindow) {
        QDebug(QtMsgType::QtCriticalMsg) << "!m_loginWindow";
        return;
    }

    m_loginWindow->show();
}

void ApplicationWindowBackend::setLoginWindow(QWindow* newLoginWindow)
{
    m_loginWindow = newLoginWindow;
}
