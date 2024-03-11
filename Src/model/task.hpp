#ifndef TASK_HPP
#define TASK_HPP

#include <QObject>
#include <QString>
#include <QtQml/qqml.h>
#include <QDateTime>

class task : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString Time READ getTime WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(int status READ getStatus WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(bool includeEnd READ getIncludeEnd WRITE setIncludeEnd NOTIFY statusChanged)
    Q_PROPERTY(bool includeTime READ getIncludeTime WRITE setIncludeTime NOTIFY statusChanged)
  public:
    explicit task(int id, QString name, QDateTime startTime, QDateTime endTime, int status,bool includeEnd,bool includeTime)
        : _id(id), _status(status),_name(std::move(name)),_startTime(std::move(startTime)),_endTime(std::move(endTime)),_includeTime(includeTime),_includeEnd(includeEnd),QObject(nullptr) {}
    task():_id(-1),QObject(nullptr) {}
    ~task() {}
  private:
    long int _id;
    QString _name;
    QDateTime _startTime;
    QDateTime _endTime;
    int _status;
    bool _includeEnd;
    bool _includeTime;
  public:
    long int getId() {
        return _id;
    }
    QString getName() {
        return _name;
    }
    //    QString getStartTime(){return _startTime;}
    //    QString getEndTime(){return _endTime;}
    int getStatus() {
        return _status;
    }
    bool getIncludeEnd() {
        return _includeEnd;
    }
    bool getIncludeTime() {
        return _includeTime;
    }
    void setName(const QString& val) {
        _name=std::move(val);
    }
    //    void setStartTime(const QString& val){_startTime=std::move(val);}
    //    void setEndTime(const QString& val){_endTime=std::move(val);}
    void setStatus(const int& val) {
        _status=val;
    }
    void setIncludeEnd(const bool& val) {
        _includeEnd=val;
    }
    void setIncludeTime(const bool& val) {
        _includeTime=val;
    }

    QString getTime() {
        if(_includeEnd) {
            if(_includeTime) {
                if(_startTime.date()==_endTime.date()) {
                    return QString("%1 %2->%3").arg(_startTime.toString("yyyy-MM-dd"),_startTime.toString("hh:mm:ss"),_endTime.toString("hh:mm:ss"));
                } else {
                    return QString("%1->%2").arg(_startTime.toString("yyyy-MM-dd hh:mm:ss"),_endTime.toString("yyyy-MM-dd hh:mm:ss"));
                }
            } else {
                return QString("%1->%2").arg(_startTime.toString("yyyy-MM-dd"),_endTime.toString("yyyy-MM-dd"));
            }
        } else {
            if(_includeTime) {
                return _startTime.toString("yyyy-MM-dd hh:mm:ss");
            } else {
                return _startTime.toString("yyyy-MM-dd");
            }
        }
    }

    void setTime(const QString& val) {
        /** @todo: 设置时间 */
    }
  signals:
    void nameChanged(const QString val);
    void timeChanged(const QString val);
    void statusChanged(const int val);
    void includeEndChanged(const bool val);
    void includeTimeChanged(const bool val);
};

#endif // TASK_HPP
