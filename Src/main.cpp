#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QtQml/QQmlExtensionPlugin>

#include "import_qml_plugins.hpp"
#include "app_environment.hpp"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
//    QGuiApplication::setWindowIcon(QIcon("Logo.png"));
    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);
//    engine.setInitialProperties({{ "builtInStyles", builtInStyles }});
    engine.loadFromModule("Main", "Main");
    return app.exec();
}
