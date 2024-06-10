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
    QML_ELEMENT

public:
    explicit ApplicationWindowBackend(QObject* parent = nullptr);

};


#endif //PAYMENTS_SYSTEM_APPLICATIONWINDOWCONTROLLER_H
