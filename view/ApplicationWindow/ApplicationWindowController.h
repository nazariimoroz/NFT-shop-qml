//
// Copyright 2024 Nazarii Moroz
//

#ifndef PAYMENTS_SYSTEM_APPLICATIONWINDOWCONTROLLER_H
#define PAYMENTS_SYSTEM_APPLICATIONWINDOWCONTROLLER_H

#include <QObject>
#include <QtQuick>

class QWindow;

class ApplicationWindowBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QWindow* loginWindow MEMBER m_loginWindow
        READ getLoginWindow WRITE setLoginWindow)
    QML_ELEMENT

public:
    explicit ApplicationWindowBackend(QObject* parent = nullptr);

    QWindow* getLoginWindow() const { return m_loginWindow; }
    void setLoginWindow(QWindow* newLoginWindow);

protected:
    Q_INVOKABLE void onCompleted(QWindow* window);

protected:
    QWindow* m_window = nullptr;
    QWindow* m_loginWindow = nullptr;
};


#endif //PAYMENTS_SYSTEM_APPLICATIONWINDOWCONTROLLER_H
