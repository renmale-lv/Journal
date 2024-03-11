#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QQmlContext>

#include "import_qml_plugins.hpp"
#include "model/task.hpp"
#include "model/target.hpp"
#include "model/goal.hpp"
#include "mysql.hpp"
#include "GlobalSignals.hpp"
//#include "app_environment.hpp"

int main(int argc, char *argv[]) {
    if(!mysql::getInstance().init()) {
        exit(-1);
    }
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/Base/Resource/Image/Logo.png"));
    qmlRegisterType<task>("Task",1,0,"Task");
    qmlRegisterType<target>("Target",1,0,"Target");
    qmlRegisterType<goal>("Goal",1,0,"Goal");
    qmlRegisterSingletonInstance("Mysql",1,0,"Mysql",&mysql::getInstance());
    qmlRegisterSingletonInstance("GlobalSignals",1,0,"GlobalSignals",&GlobalSignals::getInstance());
    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);
    engine.loadFromModule("Main", "Main");
    return QGuiApplication::exec();
}
