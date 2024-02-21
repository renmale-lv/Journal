//
// Created by lvxr on 2024-02-15.
//

#ifndef JOURNAL_MODEL_HPP
#define JOURNAL_MODEL_HPP

#include <QObject>
#include <QString>
#include <QtQml/qqml.h>

class task : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString startTime READ getStartTime WRITE setStartTime NOTIFY startTimeChanged)
    Q_PROPERTY(QString endTime READ getEndTime WRITE setEndTime NOTIFY endTimeChanged)
    Q_PROPERTY(int status READ getStatus WRITE setStatus NOTIFY statusChanged)
public:
    explicit task(int id, QString name, QString startTime, QString endTime, int status)
        : _id(id), _status(status),QObject(nullptr) {
        _name=std::move(name);
        _startTime=std::move(startTime);
        _endTime=std::move(endTime);
    }
    task():_id(-1),QObject(nullptr){}
    ~task(){}
private:
    long int _id;
    QString _name;
    QString _startTime;
    QString _endTime;
    int _status;
public:
    long int getId(){return _id;}
    QString getName(){return _name;}
    QString getStartTime(){return _startTime;}
    QString getEndTime(){return _endTime;}
    int getStatus(){return _status;}
    void setName(QString val){_name=std::move(val);}
    void setStartTime(QString val){_startTime=std::move(val);}
    void setEndTime(QString val){_endTime=std::move(val);}
    void setStatus(int val){_status=val;}
signals:
    void nameChanged(QString val);
    void startTimeChanged(QString val);
    void endTimeChanged(QString val);
    void statusChanged(int val);
};

#endif //JOURNAL_TASKMODEL_HPP
