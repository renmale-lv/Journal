#ifndef JOURNAL_MYSQL_HPP
#define JOURNAL_MYSQL_HPP

#include<QObject>
#include<QSqlDatabase>
#include<QDebug>
#include<QSqlError>
#include<QVector>
#include<QSqlQuery>
#include<QDateTime>
#include<QDebug>

#include "model.hpp"

class mysql:public QObject{
    Q_OBJECT
public:
    static mysql* getinstance(){
        return instance;
    }
    bool init(){
        bool ok =db.open();
        if (!ok){
            qDebug()<<"error open database because "<<db.lastError().text();
        }
        if(ok){
            query=QSqlQuery(db);
        }
        return ok;
    }
public:
    //将query的值转换为QVector
    QVector<task*> getTask();
    //获取今天的任务
    Q_INVOKABLE QVector<task*> getTodayTask();
    //获取所谓未完成的任务
    QVector<task*> getAllUndoneTask();
private:
    static mysql* instance;
private:
    int limit;
    QSqlDatabase db;
    QSqlQuery query;
    QString sql;
    mysql()
        : limit(50)
    {
        db=QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("127.0.0.1");
        db.setPort(3306);
        db.setDatabaseName("journal");
        db.setUserName("root");
        db.setPassword("123456");
    }
};

#endif
