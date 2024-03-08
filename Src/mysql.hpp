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
    //将query的值转换为QList
    QList<task*> getTask();
    QList<target*> getTarget();
    QList<goal*> getGoal();
    //获取今天的任务
    Q_INVOKABLE QList<task*> getTodayTask();
    //获取所谓未完成的任务
    Q_INVOKABLE QList<task*> getAllUndoneTask();
    //更新某一个任务
    Q_INVOKABLE void updateTask(const task&);
    //添加任务
    Q_INVOKABLE void addTask();
    //获取未开始的小目标
    Q_INVOKABLE QList<target*> getNotStartTarget();
    //获取进行中的小目标
    Q_INVOKABLE QList<target*> getOnGoingTarget();
    //获取未开始的大目标
    Q_INVOKABLE QList<goal*> getNotStartGoal();
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
