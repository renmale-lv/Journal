#include "mysql.hpp"

mysql* mysql::instance = new mysql();

QList<task*> mysql::getTask(){
    QList<task*> ans;
    while(query.next()){
        ans.push_back(
            new task(query.value(0).toLongLong(),
                     query.value(1).toString(),
                     query.value(2).toDateTime().toString("yyyy-MM-dd hh:mm:ss"),
                     query.value(3).toDateTime().toString("yyyy-MM-dd hh:mm:ss"),
                     query.value(4).toInt())
            );
    }
    return ans;
}

QList<task*> mysql::getTodayTask(){
    sql=QString("SELECT * FROM `task` WHERE '%1' >= DATE(`startTime`) AND '%1' <= DATE(`endTime`) AND `isDel` = 0;").arg(QDateTime::currentDateTime().toString("yyyy-MM-dd"));
    query.exec(sql);
    return getTask();
}

QList<task*> mysql::getAllUndoneTask(){
    sql=QString("SELECT * FROM `task` WHERE `isDel` = 0 AND `status` = 0;");
    query.exec(sql);
    return getTask();
}

void mysql::updateTask(const task& data){
    sql=QString("UPDATE");
    query.exec(sql);
}

