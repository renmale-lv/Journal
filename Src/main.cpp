#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "import_qml_plugins.hpp"
//#include "app_environment.hpp"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QGuiApplication::setWindowIcon(QIcon("qrc:/Resource/Image/Logo.png"));
    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);
    engine.loadFromModule("Main", "Main");
    return QGuiApplication::exec();
}
