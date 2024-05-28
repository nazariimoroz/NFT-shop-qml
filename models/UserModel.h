//
// Copyright 2024 Nazarii Moroz
//

#ifndef NFT_SHOP_USERMODEL_H
#define NFT_SHOP_USERMODEL_H

#include <QObject>
#include <QDateTime>

enum UserRole {
    User, Admin
};

class UserModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int id                   MEMBER m_id)
    Q_PROPERTY(QString name             MEMBER m_name)
    Q_PROPERTY(QString email            MEMBER m_email)
    Q_PROPERTY(QString password         MEMBER m_password)
    Q_PROPERTY(QString bio              MEMBER m_bio)
    //Q_PROPERTY(UserRole role           MEMBER m_id)
    Q_PROPERTY(QDateTime createdAt      MEMBER m_createdAt)
    Q_PROPERTY(QDateTime updatedAt      MEMBER m_updatedAt)
public:
    explicit UserModel(QObject* parent = nullptr);

public:
    int m_id;
    QString m_name;
    QString m_email;
    QString m_password;
    QString m_bio;
    UserRole m_role;
    QDateTime m_createdAt;
    QDateTime m_updatedAt;
};


#endif //NFT_SHOP_USERMODEL_H
