#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QUrl>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("MacLinux");
    app.setOrganizationName("MacLinux Project");
    QQuickStyle::setStyle("Basic");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/MacLinux/qml/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(EXIT_FAILURE);
    }, Qt::QueuedConnection);
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return EXIT_FAILURE;
    return app.exec();
}
