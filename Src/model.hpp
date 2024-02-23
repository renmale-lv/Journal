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
        : _id(id), _status(status),_name(std::move(name)),_startTime(std::move(startTime)),_endTime(std::move(endTime)),QObject(nullptr) {}
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
    void setName(const QString val){_name=std::move(val);}
    void setStartTime(const QString val){_startTime=std::move(val);}
    void setEndTime(const QString val){_endTime=std::move(val);}
    void setStatus(const int val){_status=val;}
signals:
    void nameChanged(const QString val);
    void startTimeChanged(const QString val);
    void endTimeChanged(const QString val);
    void statusChanged(const int val);
};

class target : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString startTime READ getStartTime WRITE setStartTime NOTIFY startTimeChanged)
    Q_PROPERTY(QString endTime READ getEndTime WRITE setEndTime NOTIFY endTimeChanged)
    Q_PROPERTY(int status READ getStatus WRITE setStatus NOTIFY statusChanged)
public:
    explicit target(int id, QString name, QString startTime, QString endTime, int status)
        : _id(id), _status(status),_name(std::move(name)),_startTime(std::move(startTime)),_endTime(std::move(endTime)),QObject(nullptr) {}
    target():_id(-1),QObject(nullptr){}
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
    void setName(const QString val){_name=std::move(val);}
    void setStartTime(const QString val){_startTime=std::move(val);}
    void setEndTime(const QString val){_endTime=std::move(val);}
    void setStatus(const int val){_status=val;}
signals:
    void nameChanged(const QString val);
    void startTimeChanged(const QString val);
    void endTimeChanged(const QString val);
    void statusChanged(const int val);
};

class goal : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString startTime READ getStartTime WRITE setStartTime NOTIFY startTimeChanged)
    Q_PROPERTY(QString endTime READ getEndTime WRITE setEndTime NOTIFY endTimeChanged)
    Q_PROPERTY(int status READ getStatus WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(int currentVal READ getCurrentVal WRITE setCurrentVal NOTIFY currentValChanged)
    Q_PROPERTY(int sumVal READ getSumVal WRITE setSumVal NOTIFY sumValChanged)
public:
    explicit goal(int id, QString name, QString startTime, QString endTime, int status,int currentVal,int sumVal)
        : _id(id), _status(status),_name(std::move(name)),_startTime(std::move(startTime)),_endTime(std::move(endTime)),_currentVal(currentVal),_sumVal(sumVal),QObject(nullptr) {}
    goal():_id(-1),QObject(nullptr){}
private:
    long int _id;
    QString _name;
    QString _startTime;
    QString _endTime;
    int _status;
    int _currentVal;
    int _sumVal;
public:
    long int getId(){return _id;}
    QString getName(){return _name;}
    QString getStartTime(){return _startTime;}
    QString getEndTime(){return _endTime;}
    int getStatus(){return _status;}
    int getCurrentVal(){return _currentVal;}
    int getSumVal(){return _sumVal;}
    void setName(const QString val){_name=std::move(val);}
    void setStartTime(const QString val){_startTime=std::move(val);}
    void setEndTime(const QString val){_endTime=std::move(val);}
    void setStatus(const int val){_status=val;}
    void setCurrentVal(const int val){_currentVal=val;}
    void setSumVal(const int val){_sumVal=val;}
signals:
    void nameChanged(const QString val);
    void startTimeChanged(const QString val);
    void endTimeChanged(const QString val);
    void statusChanged(const int val);
    void currentValChanged(const int val);
    void sumValChanged(const int val);
};

#endif //JOURNAL_TASKMODEL_HPP
