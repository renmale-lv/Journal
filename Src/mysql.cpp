#include "mysql.hpp"

mysql* mysql::instance = new mysql();

QList<task*> mysql::getTask(){
    QList<task*> ans;
    while(query.next()){
        ans.push_back(
            new task(query.value(0).toLongLong(),
            query.value(1).toString(),
            query.value(2).toDateTime().toString("yyyy-MM-dd hh:mm"),
            query.value(3).toDateTime().toString("yyyy-MM-dd hh:mm"),
            query.value(4).toInt())
        );
    }
    return ans;
}

QList<target*> mysql::getTarget(){
    QList<target*> ans;
    while(query.next()){
        ans.push_back(
            new target(query.value(0).toLongLong(),
                query.value(1).toString(),
                query.value(2).toDateTime().toString("yyyy-MM-dd hh:mm"),
                query.value(3).toDateTime().toString("yyyy-MM-dd hh:mm"),
                query.value(4).toInt())
        );
    }
    return ans;
}

QList<goal*> mysql::getGoal(){
    QList<goal*> ans;
    while(query.next()){
        ans.push_back(
            new goal(query.value(0).toLongLong(),
                query.value(1).toString(),
                query.value(2).toDateTime().toString("yyyy-MM-dd hh:mm"),
                query.value(3).toDateTime().toString("yyyy-MM-dd hh:mm"),
                query.value(4).toInt(),
                query.value(5).toInt(),
                query.value(6).toInt())
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

void mysql::addTask(){
    sql=QString("INSERT INTO `task` (`name`) VALUES ('United');");
    query.exec(sql);
}

QList<target*> mysql::getNotStartTarget(){
    sql=QString("SELECT * FROM `target` WHERE `isDel` = 0 AND `status` = 0");
    query.exec(sql);
    return getTarget();
}

QList<target*> mysql::getOnGoingTarget(){
    sql=QString("SELECT * FROM `target` WHERE `isDel` = 0 AND `status` = 1");
    query.exec(sql);
    return getTarget();
}

QList<goal*> mysql::getNotStartGoal(){
    sql=QString("SELECT * FROM `goal` WHERE `isDel` = 0 AND `status` = 0");
    query.exec(sql);
    return getGoal();
}

