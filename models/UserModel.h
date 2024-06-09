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

    [[nodiscard]] int getId() const
    {
        return m_id;
    }

    [[nodiscard]] const QString& getName() const
    {
        return m_name;
    }
    void setName(const QString &name)
    {
        m_name = name;
    }

    [[nodiscard]] const QString &getEmail() const
    {
        return m_email;
    }
    void setEmail(const QString &email)
    {
        m_email = email;
    }

    [[nodiscard]] const QString &getPassword() const
    {
        return m_password;
    }
    void setPassword(const QString &password)
    {
        m_password = password;
    }

    [[nodiscard]] const QString &getBio() const
    {
        return m_bio;
    }
    void setBio(const QString &bio)
    {
        m_bio = bio;
    }

    [[nodiscard]] UserRole getRole() const
    {
        return m_role;
    }
    void setRole(UserRole role)
    {
        m_role = role;
    }

    [[nodiscard]] const QDateTime &getCreatedAt() const
    {
        return m_createdAt;
    }
    void setCreatedAt(const QDateTime &createdAt)
    {
        m_createdAt = createdAt;
    }

    [[nodiscard]] const QDateTime &getUpdatedAt() const
    {
        return m_updatedAt;
    }
    void setUpdatedAt(const QDateTime &updatedAt)
    {
        m_updatedAt = updatedAt;
    }

protected:
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
