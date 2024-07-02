#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDirIterator>
#include <NetworkManager.h>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Q_INIT_RESOURCE(res);

    /*
    QDirIterator it(":", QDirIterator::Subdirectories);
    while (it.hasNext()) {
        qDebug() << it.next();
    }*/

    qputenv("QT_QUICK_CONTROLS_UNIVERSAL_THEME", QByteArray("Dark"));
    QQuickStyle::setStyle("Universal");

    QQmlApplicationEngine engine;
    engine.setOutputWarningsToStandardError(true);
    const QUrl url(u"qrc:/View/NsView/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
            &app, [url, &engine](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                {
                    const auto error = engine.catchError();
                    QDebug(QtFatalMsg) << error.toString();
                    QCoreApplication::exit(-1);
                }
            }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
