#ifndef TARGET_H
#define TARGET_H

#include <QObject>
#include <QString>
#include <QtQml/qqml.h>

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

#endif // TARGET_H
