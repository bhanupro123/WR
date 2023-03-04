#ifndef A_H
#define A_H
#include <QObject>
#include<QDebug>
class A : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString test READ test WRITE setTest NOTIFY testChanged)
public:
  explicit A(QObject *parent = 0) : QObject(parent){}
int a=1;
  QString test(){return myTest;}

  void setTest(QString t){
      a++;
      qDebug()<<t<<"BHANUUUU";
    myTest = QString::number(a)+ " W  "+t;
  emit  testChanged(QString::number(a)+ " X "+t);
  }

signals:
  void testChanged(QString t);

private:
  QString myTest;
};

#endif // A_H

