#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QGuiApplication::setWindowIcon(QIcon(":/Logo.png"));
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:main.qml"));
//    const QUrl url(QStringLiteral("qrc:Test.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}