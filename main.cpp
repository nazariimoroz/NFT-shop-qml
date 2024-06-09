#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDirIterator>
#include <NetworkManager.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Q_INIT_RESOURCE(res);

    const auto networkManager = Utils::NetworkManager();

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/View/NsView/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
            &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
