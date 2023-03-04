#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include "black.h"
#include "b.h"
#include "a.h"
//#include<wiringPi.h>
#include<QDir>
#include<QNetworkConfiguration>
#include<QNetworkConfigurationManager>
int main(int argc, char *argv[])
{
QString  s="1234";
    QString s1="";
    s1=s1.append(s.at(2)).append(s.at(3)).append(s.at(0)).append(s.at(1));
    qDebug()<<s1<<"SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS";
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
//QQuickStyle::setStyle("material");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    Back appCore;    // Create the application core with signals and slots
    b app1;

    QQmlApplicationEngine engine;

qmlRegisterType<A>("test", 1, 0, "A");
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("bhanu", &appCore);
    context->setContextProperty("lib1", &app1);

  //  const QUrl url(QStringLiteral("qrc:/QMLNEW/main.qml"));
    const QUrl url(QStringLiteral("qrc:/QML/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
