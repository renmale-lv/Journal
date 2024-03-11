#ifndef GLOBALSIGNALS_HPP
#define GLOBALSIGNALS_HPP

#include <QObject>

#include "model/task.hpp"

class GlobalSignals : public QObject {
    Q_OBJECT
  public:
    static GlobalSignals& getInstance() {
        static GlobalSignals single;
        return single;
    }
  private:
    GlobalSignals()=default;
    ~GlobalSignals()=default;
  signals:
    void editTask(task *task);
};

#endif // GLOBALSIGNALS_HPP
