
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUrl>
#include <QCoreApplication>
#include <cstdlib>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setApplicationName("MacLinux");
    app.setOrganizationName("MacLinux Project");

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral(
        "qrc:/qt/qml/MacLinux/qml/Main.qml"
    ));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(EXIT_FAILURE);
        },
        Qt::QueuedConnection
    );

    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return EXIT_FAILURE;

    return app.exec();
}
