// This file is autogenerated by CMake. Do not edit.

#include <QtQml/qqmlextensionplugin.h>

extern void qml_register_types_Content();
Q_GHS_KEEP_REFERENCE(qml_register_types_Content)

class ContentPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    ContentPlugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {
        volatile auto registration = &qml_register_types_Content;
        Q_UNUSED(registration)
    }
};



#include "Journal_contentplugin_ContentPlugin.moc"