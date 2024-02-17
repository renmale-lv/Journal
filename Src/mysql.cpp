#include "mysql.hpp"

mysql* mysql::instance = new mysql();

QVector<task*> mysql::getTask(){
    QVector<task*> ans;
    while(query.next()){
        ans.push_back(
            new task(query.value(0).toLongLong(),
                 query.value(1).toString(),
                 query.value(2).toDateTime().toString("yyyy-MM-dd hh:mm:ss"),
                 query.value(3).toDateTime().toString("yyyy-MM-dd hh:mm:ss"),
                 query.value(4).toInt())
            );
    }
    qDebug()<<ans;
    return ans;
}

QVector<task*> mysql::getTodayTask(){
    sql=QString("SELECT * FROM `task` WHERE '%1' >= DATE(`startTime`) AND '%1' <= DATE(`endTime`) AND `isDel` = 0;").arg(QDateTime::currentDateTime().toString("yyyy-MM-dd"));
    qDebug()<<sql;
    query.exec(sql);
    return getTask();
}

