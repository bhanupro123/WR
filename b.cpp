#include<iomanip>
#include<sstream>
#include <QDebug>
#include<QDateTime>
#include<QThread>
#include "b.h"
#include "a.h"
#include"black.h"
//#include<sys/reboot.h>
#include <QDebug>
#include <QSqlDatabase>
#include<QSqlQuery>
#include<QSqlError>
#include<QSqlTableModel>
//#include<wiringPi.h>

#include <QSerialPort>
#include <QSerialPortInfo>
//#include<wiringSerial.h>
#include<QSqlRecord>
#include<QFile>
#include<QDir>
#include<QStorageInfo>
#include<iostream>
//#include<wiringPi.h>
#include<QTimer>
#include<QPrinter>
#include<QPainter>
#include<QThread>
#include<QtConcurrent/qtconcurrentrun.h>
#include<QFuture>
#include<QtConcurrent/qtconcurrentrun.h>
qreal dd_dc;
qreal dd_pf;
static QFuture<void> f1;
using namespace QtConcurrent;
using namespace std;
//#include <wiringPi.h>
//#include <wiringPiSPI.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include<iostream>
//#include<sys/reboot.h>
//#include<wiringPiI2C.h>
#include<QProcess>
#include <QtMultimedia/QMediaContent>
#include <QtMultimedia/QMediaPlayer>
#include <QUrl>
#include <QtMultimedia/QSound>
#include<QtNetwork/QNetworkAccessManager>
#include<QtNetwork/QNetworkAccessManager>
#include<QNetworkReply>
int lPF_1= 3;
int lPF_2= 5;
int hPF_1= 18;
int hPF_2= 20;
int operate_delay_value= 0;
int hold_delay_value= 200;

int counterValue=0;
qreal digital_gain_value=1;
bool itsEntered=false;
QString code_Signal="A";
QString code_phase="B";
QString code_Amplitude="C";

QString code_Hold_Delay="F";
QString code_Operate_Delay="G";

QString code_LPF1="H";
QString code_LPF2="I";
QString code_HPF1="J";
QString code_HPF2="K";

QString code_Digital_Gain="L";
QString code_analog_Gain="M";

QString code_DD_on_off="W";
QString code_DD_Power="P";
QString code_DD_Frequency="N";
QString code_DD_Power_Factor="O";
QString code_Drive_power="Q";
  static  QThread *thread=new QThread;
  static  A* aa= new A();
QString formatIntToHEX(int value)
{
    QString wr;
    std::stringstream sstream;
    sstream<<std::hex;

    char hex_string[QString::number(value).length()];
    sprintf(hex_string, "%X", value); //convert number to  hex
    for(int i=0;i<QString::number(value).length();i++)
    {
        if(hex_string[i]!='\u0000')
        {
            wr= wr.append(hex_string[i]);

        }
    }

 //   qDebug()<<value<<hex_string<<wr<<"damn" ;
    return wr;
}
int formatHEXtoINT(QString s)
{

//    QString s1="";
//    s1=s1.append(s.at(2)).append(s.at(3)).append(s.at(0)).append(s.at(1));

    QByteArray ba=s.toLatin1();
    char *c=ba.data();
    int x;
    std::stringstream ss;
    ss << std::hex<<c;
    ss >> x;
   // qDebug()<<x<<" XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    return x;
}

b::b(QObject* parent) : QObject(parent)
{

    manager=new QNetworkAccessManager(this);
    replay=manager->get(QNetworkRequest(QUrl("https://qtfirebasewinrender-default-rtdb.firebaseio.com/Pets.json")));
    connect(replay,&QNetworkReply::readAll,this,&b::update);
    history("-----","-----","M/c Switch ON");
    qs.setPortName("ttyS0");
    qs.setParity(QSerialPort::NoParity);
    qs.setBaudRate(QSerialPort::Baud115200);
    qs.setDataBits(QSerialPort::Data8);
    qs.setStopBits(QSerialPort::OneStop);
    qs.setFlowControl(QSerialPort::NoFlowControl);
    //qs.setReadBufferSize(5000);
//     thread()->start();
//     qs.moveToThread(thread());
    if(qs.open(QIODevice::ReadWrite))
    {
        qDebug()<<"Serial port is opend";
        connect(&qs,&QSerialPort::readyRead,this,&b::readFromSerialPort);
    }
    //     fd=wiringPiI2CSetup(0x51);
    QProcess proc;
    QStringList args;
    QSqlQuery query;
    QSqlTableModel model;
    query.prepare("CREATE TABLE IF NOT EXISTS dpv("
                  "threshhold INT, "
                  "amplitude INT, "
                  "phase REAL, "
                  "ddfreq REAL, "
                  "ddpower INT, "
                  "ddpowerfactor REAL, "
                  "digitalgain REAL,"
                  "analoggain INT, "
                  "drivepower INT);");

    query.exec();

    qDebug()<<query.lastError()<<"dpv";

    model.clear();
    model.setTable("dpv");
    model.select();
    if(model.rowCount()>0)
    {

    }
    else {
        if(query.exec("INSERT INTO dpv(threshhold,amplitude,phase,ddfreq,ddpower,ddpowerfactor,digitalgain,analoggain,drivepower)"
                      "VALUES ('350','14000','45.0','18.0','20','50','1.0','1','1')"))
        {
            qDebug()<<query.lastError()<<"OH MY GOD";
        }
    }
    query.prepare("CREATE TABLE IF NOT EXISTS activeProductData("
                  "gno INT, "
                  "sno INT);");
    query.exec();

    model.clear();
    model.setTable("activeProductData");
    model.setSort(1, Qt::AscendingOrder);
    model.select();
    qDebug()<<model.rowCount()<<"row Count";
    if(model.rowCount()>0)
    {
        active_sr_no=model.record(0).value("sno").toInt();
        active_gr_no=model.record(0).value("gno").toInt();
    }
    else
    {
        query.prepare("INSERT INTO activeProductData(gno,sno) "
                      "VALUES (:sno,:gno)");
        query.bindValue(":gno", 1);
        query.bindValue(":sno", 1);
        query.exec();
        active_gr_no=1;
        active_sr_no=1;
        qDebug()<<"Constructing.......";
        createDefaultProduct();
    }
    qDebug()<<query.lastError()<<"activeProductData";
    QDateTime dateTime = dateTime.currentDateTime();
    QString aa= dateTime.toString("dd/MM/yyyy hh:mm:ss");
    aa=aa.mid(0,10);
    datee=aa;
    aa=aa.replace("/","_");
    tablename=aa.prepend("A_");
    query.prepare("CREATE TABLE IF NOT EXISTS '"+tablename+"'("
                                                           "date varchar(15) , "
                                                           "time varchar(15), "

                                                           "user varchar(10) , "
                                                           "old varchar(10) , "
                                                           "new varchar(10) , "
                                                           "remark varchar(10));");
    query.exec();
    readbrightness();
    mount();

}


QList<int> b::fetch_auto_validate()
{
    QList<int>  list;
    list.append(hours_a);
    list.append(minuts_a);
    list.append(hours_b);
    list.append(minuts_b);
    list.append(hours_c);
    list.append(minuts_c);
    list.append(hours_d);
    list.append(minuts_d);

    return list;
}


void b:: readFromSerialPort()
{
    const QByteArray data= qs.readAll();

  //  emit wow(data); ,

    bufferstring=bufferstring.append(data);
    QStringList listArray=bufferstring.split("n");
    isEndsWithn=bufferstring.endsWith("n");
         if(listArray.length()>0)
         {
             for(int i=0;i<listArray.length();i++)
             {
                if(i==listArray.length()-1&&!isEndsWithn)
                {
                    break;
                }

              bufferstring.remove(0,listArray[i].length()+1);
            listArray[i].remove(0,listArray[i].lastIndexOf("N")+1);
                     qDebug()<<listArray[i];
             QStringList listArray1=listArray[i].split(",");
                 if(listArray[i].length()==23 && listArray1.length()==4&&listArray1[0].length()==5&&listArray1[1].length()==5&&listArray1[2].length()==5&&listArray1[3].length()==5)
                 {
                     emit get_emit_thresh_hold_signal(listArray1[0].toInt());
                     emit get_emit_thresh_hold_phase(listArray1[1].toFloat());
                     emit get_emit_thresh_hold_amplitude(listArray1[2].toInt());
                     emit get_emit_thresh_hold_coil_output(listArray1[3].toInt());
                     qDebug()<<listArray1[0].toInt()<<" -- "<<listArray1[1].toFloat()<<" -- "<<listArray1[2].toInt()<<" -- "<<listArray1[3].toInt();
                 }
             }
         }

}



//void b::readFromSerialPort()
//{

//const QByteArray data    = qs.readAll();
//qDebug()<<data;

////bufferstring=bufferstring.append(data);
////if(bufferstring.contains("Z"))
////{
////    QString store_temp=bufferstring.left(bufferstring.indexOf("Z"));
////     bufferstring=bufferstring.remove(0,store_temp.length()+1);
////}

////if(bufferstring.contains("X"))
////{
////    QString store_temp=bufferstring.left(bufferstring.indexOf("X"));
////     bufferstring=bufferstring.remove(0,store_temp.length()+1);
////     qDebug()<<store_temp<<" bhanu";
////  emit get_emit_thresh_hold_signal(store_temp.toInt());
////     //aa->setTest(store_temp);
////}


////return;
//emit wow(data.toHex());
//  bufferstring=bufferstring.append(data.toHex());
//  if(!bufferstring.startsWith("N")&&!itsEntered)
//  {
//      itsEntered=true;
//      QString store_temp=bufferstring.left(bufferstring.indexOf("N"));
//       bufferstring=bufferstring.remove(0,store_temp.length());
//       return;
//  }
//QStringList listArray=bufferstring.split("n");

//for(int i=0;i<listArray.length();i++)
//{
//    if(i==listArray.length()-1&&!listArray[i].endsWith("n"))
//    {
//        return;
//    }

//     if(listArray[i].startsWith("N"))
//     {
//          bufferstring=bufferstring.remove(0,listArray[i].length()-1);
//         listArray[i].remove("N");
//         listArray[i].remove("n");
//         qDebug()<<listArray[i];
//         return;
//         emit get_emit_thresh_hold_signal(10);
//         emit get_emit_thresh_hold_phase(formatHEXtoINT(listArray[i].mid(6,4)));
//         emit get_emit_thresh_hold_amplitude(formatHEXtoINT(listArray[i].mid(12,4)));
//         emit get_emit_thresh_hold_coil_output(formatHEXtoINT(listArray[i].mid(18,4)));
//     }
//}
//return;



////Start
//  if(bufferstring.contains("4e")&&bufferstring.contains("6e")&&bufferstring.length()>=26)
//  {

//      if(!bufferstring.startsWith("4e")&&!itsEntered)
//      {
//          itsEntered=true;
//          QString store_temp=bufferstring.left(bufferstring.indexOf("4e"));
//           bufferstring=bufferstring.remove(0,store_temp.length());
//      }
//        if(bufferstring.length()>=26)
//        {
//       QString    store_temp=bufferstring.mid(0,26);
//                bufferstring=bufferstring.remove(0,26);
//                store_temp=store_temp.remove(0,2);
//                store_temp=store_temp.remove(22,2);

//             qDebug()<<"Signal = "<<store_temp.mid(0,4)<<formatHEXtoINT(store_temp.mid(0,4));
//counterValue=counterValue+1;
//            emit get_emit_thresh_hold_signal(counterValue);
//        }
//  }



//}


void b::createDefaultProduct()
{

    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    qDebug()<<"createDefaultProducts "<<model.rowCount();
    if(model.rowCount()>0)
    {
        int i=model.record(0).value("ddpower").toInt();
        qreal dg=model.record(0).value("digitalgain").toReal();
        qreal pff=model.record(0).value("ddpowerfactor").toReal();
        qreal ddfreq=model.record(0).value("ddfreq").toReal();
        qreal p=model.record(0).value("phase").toReal();
        int a=model.record(0).value("amplitude").toInt();
        int t=model.record(0).value("threshhold").toInt();
        int analoggain=model.record(0).value("analoggain").toInt();
        int drivepower=model.record(0).value("drivepower").toInt();
        qDebug()<<t<<a<<p<<ddfreq<<pff<<dg<<i<<analoggain<<drivepower<<"dpv";
        createandinsertintogroup(1,"default code","default name",t,a,p,dg,analoggain,drivepower,ddfreq
                                 ,pff,drivepower);
    }



}

void b::toggle_is_first_time_boot()
{
    is_first_time_to_qml=false;
    is_first_time_boot=true;
}

void b::print_to_device(QString name)
{
    qDebug()<<name<<"name";
    QProcess OProcess;
    QString Command;    //Contains the command to be executed
    QStringList args;   //Contains arguments of the command

    Command = "lp";
    args<<name;

    OProcess.start(Command,args,QIODevice::ReadOnly); //Starts execution of command
    OProcess.waitForFinished();                       //Waits for execution to complete

    QString StdOut      =   OProcess.readAllStandardOutput();  //Reads standard output
    QString StdError    =   OProcess.readAllStandardError();   //Reads standard error

    emit notify_me("Done Printing By HP","Printer",true);


}

void b::default_values(int status_v)
{
    if(status_v==0)
    {
        load(active_gr_no,active_sr_no);
        is_first_time_boot=false;

    }
    if(status_v==1)
    {
        QSqlTableModel model;
        model.clear();
        model.setTable("dpv");
        model.select();
        if(model.rowCount()>0)
        {
            int i=model.record(0).value("ddpower").toInt();
            qreal dg=model.record(0).value("digitalgain").toReal();
            qreal pff=model.record(0).value("ddpowerfactor").toReal();
            qreal ddfreq=model.record(0).value("ddfreq").toReal();
            qreal p=model.record(0).value("phase").toReal();
            int a=model.record(0).value("amplitude").toInt();
            int t=model.record(0).value("threshhold").toInt();
            int analoggain=model.record(0).value("analoggain").toInt();
            int drivepower=model.record(0).value("drivepower").toInt();
            qDebug()<<t<<a<<p<<ddfreq<<pff<<dg<<i<<analoggain<<drivepower<<"dpv";
            emit default_values_to_qml(t,a,p,ddfreq,i,pff,dg,analoggain,drivepower,status_v);

        }


    }
}

void b::default_thresh_hold(int b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        int i=model.record(0).value("threshhold").toInt();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set threshhold=(:date) where threshhold=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }if(qs.open(QIODevice::ReadWrite))
    {
        qDebug()<<"Serial port is opend";
        //  connect(&qs,&QSerialPort::readyRead,this,&b::readFromSerialPort);
    }
    else{
        query.prepare("INSERT INTO dpv (threshhold)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"Thresh_hold";
    default_values(1);
}

void b::default_amplitude(int b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        int i=model.record(0).value("amplitude").toInt();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set amplitude=(:date) where amplitude=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (amplitude)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"amplitude";
    default_values(1);
}

void b::default_phase(qreal b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("phase").toReal();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set phase=(:date) where phase=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (phase)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"phase";
    default_values(1);
}

void b::notify_to_qml_from_qml(QString s,bool b)
{
    qDebug()<<s<<"s";
    emit notify_me(s,"",b);
}

void b::default_dd_freq(qreal b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("ddfreq").toReal();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set ddfreq=(:date) where ddfreq=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (ddfreq)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"ddfreq ";
    default_values(1);
}

void b::default_dd_power_factor(qreal b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("ddpowerfactor").toReal();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set ddpowerfactor=(:date) where ddpowerfactor=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (ddpowerfactor)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"ddpowerfactor";
    default_values(1);
}

void b::default_dd_power(int power)
{

    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        int i=model.record(0).value("ddpower").toInt();
        qDebug()<<i<<power<<"dpvv";
        query.prepare("update dpv set ddpower=(:date) where ddpower=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", power);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (ddpower)"
                      "VALUES (:date)");
        query.bindValue(":date", power);
        query.exec();
    }

    qDebug()<<query.lastError()<<power<<"ddpower";
    default_values(1);
}

void b::default_digital_gain(qreal b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("digitalgain").toReal();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set digitalgain=(:date) where digitalgain=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (digitalgain)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"digitalgain";
    default_values(1);
}

void b::default_analog_gain(int b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("analoggain").toInt();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set analoggain=(:date) where analoggain=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (analoggain)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"";
    default_values(1);
}

void b::default_drive_power(int b)
{
    QSqlTableModel model;
    model.clear();
    model.setTable("dpv");
    model.select();
    QSqlQuery query;
    if(model.rowCount()>0)
    {
        qreal i=model.record(0).value("drivepower").toInt();
        qDebug()<<i<<"dpvv";
        query.prepare("update dpv set drivepower=(:date) where drivepower=(:i)");
        query.bindValue(":i",i);
        query.bindValue(":date", b);
        query.exec();
    }
    else{

        query.prepare("INSERT INTO dpv (drivepower)"
                      "VALUES (:date)");
        query.bindValue(":date", b);
        query.exec();
    }

    qDebug()<<query.lastError()<<"Drive Power";
    default_values(1);
}

void b::who_i_am(QString s)
{
    qDebug()<<"serial port Stoped";
    //emit where_i_am(s);
}

void b::shutdownandrestart(int i)
{

    history("","","M/C Switched OFF");
    emit sendtoqml("quit");
    if(i==0)
    {
        system("sudo poweroff");

    }
    if(i==1)
    {
        system("sudo reboot");
    }
}
void bhanu()
{

    //    for(;;)
    //    {
    //     qDebug()<<dd_dc<<dd_pf;
    //    qreal peroid=(1000/dd_dc);
    //  qreal Width_high_h=(peroid*dd_pf)/100;
    //   qreal Width_low_w=(peroid-Width_high_h);
    //       digitalWrite(5,HIGH);
    //       delay(1);
    //       delay(Width_high_h);
    //       digitalWrite(5,LOW);
    //       delay(1);
    //        delay(Width_low_w);
    //    }
}

void b::powerFactor(qreal width_high,qreal DD_freq)
{
    dd_dc= width_high;
    dd_pf=DD_freq;
}


void b::update()
{
    qDebug()<<replay->readAll()<<"firebase";
}

void b::readbrightness()
{

    QString temp="";
    QFile brightness("/sys/class/backlight/rpi_backlight/brightness");
    if(brightness.open(QIODevice::ReadWrite))
    {
        qDebug()<<"openeddddddddddd"<<QDir::homePath();
        qDebug()<<temp<<brightness.readAll()<<"stable_value";
    }
    else
    {
        qDebug()<<"nooooooooooooooooooooo"<<QDir::currentPath();
    }
}

void b::writebrightness(int bright)
{

    QFile brightness("/sys/class/backlight/rpi_backlight/brightness");
    brightness.setPermissions(QFileDevice::ReadOwner|QFileDevice::WriteOwner);
    if(brightness.open(QIODevice::ReadWrite))
    {
        qDebug()<<"openeddddddddddd"<<QDir::homePath();
        QTextStream out(&brightness);
        out<<bright;
    }
    else
    {
        qDebug()<<"nooooooooooooooooooooo"<<QDir::currentPath();
    }



}

void b::mount()
{
    if(QStorageInfo::mountedVolumes().count()>5)
    {
        qslist.clear();
        foreach (const QStorageInfo &storage, QStorageInfo::mountedVolumes())
        {
            if (storage.isValid() && storage.isReady())
            {

                QString bb=storage.rootPath();
                qslist.append(bb);
                bb=storage.displayName();
                // qDebug()<<bb<<"down";
                usb_storage_count=QStorageInfo::mountedVolumes().count();
                emit mountedcount(QStorageInfo::mountedVolumes().count());
                usb_storage_count=QStorageInfo::mountedVolumes().count();
            }
        }
    }
    emit mountedcount(QStorageInfo::mountedVolumes().count());
}

void b::mountedList()
{

    if(QStorageInfo::mountedVolumes().count()>5)
    {
        QStringList qslist1={};
        foreach (const QStorageInfo &storage, QStorageInfo::mountedVolumes())
        {
            if (storage.isValid() && storage.isReady())
            {

                QString bb=storage.rootPath();
                qslist1.append(bb);
                bb=storage.displayName();


            }
        }
        emit mountedListtoqml(qslist1[5]);
    }
}

void b::copy(int i,QString filenamepdf)
{
    QFile file;
    QString a=qslist.at(5);
    a=a.append("/");
    a=a.append(filenamepdf);
    qDebug()<<a<<filenamepdf<<"  "<<i<<"  get it";


    bool b=QFile::copy(QDir::currentPath().append("/").append(filenamepdf),a);
    qDebug()<<"Created"<<"  "<<b;
    if(b==true)
    {
        system("sudo sync");
        emit notify_me("File Copied Done","File",b);

    }
    else{
        emit notify_me("File Already Exist","File",b);
    }

}

void b::grabActiveProduct(int status_v)
{
    qDebug()<<status_v;
}



void b::keyboardData1(QString key)
{

    emit keysignal1(key.toFloat());
}

void b::keyboardData(QString key)
{
    if(key=="BACK")
    {
        temp_keyboard_value=temp_keyboard_value.remove(temp_keyboard_value.size()-1,1);
        temp_keyboard_value_int=temp_keyboard_value.toInt();
        emit keysignal(temp_keyboard_value_int);
    }
    if(key=="CLR")
    {
        temp_keyboard_value.clear();
        temp_keyboard_value_int=temp_keyboard_value.toInt();
        emit keysignal(temp_keyboard_value_int);
    }


    if(key=="1"||key=="2"||key=="3"||key=="4"||key=="5"||key=="6"||key=="7"
            ||key=="8"||key=="9"||key=="0")
    {
        temp_keyboard_value.append(key);
        temp_keyboard_value_int=temp_keyboard_value.toInt();
        emit keysignal(temp_keyboard_value_int);
    }

}

void b::send_active_details_to_qml()
{

    emit send_active_details_to_qml_signal(active_gr_no,active_sr_no);

}

void b::filter_values(int lPF_1, int lPF_2, int hPF_1, int hPF_2, int operate_delay_value, int hold_delay_value, qreal digital_gain_value,qreal analoggain_value)
{
    //emit notify_to_qml_from_qml(QString::number(digital_gain_value),true);

    QSqlQuery query;//lPF1,lPF2,hPF1,hPF2,od,hd,dg
    int sno=1;
    query.prepare("update filtersettings set lPF1=(:lPF_1),lPF2=(:lPF_2),hPF1=(:hPF_1),hPF2=(:hPF_2),od=(:operate_delay_value),hd=(:hold_delay_value),dg=(:digital_gain_value),ag=(:analoggain_value) where sno=(:sno)");
    query.bindValue(":sno",sno);
    query.bindValue(":lPF_1", lPF_1);
    query.bindValue(":lPF_2", lPF_2);
    query.bindValue(":hPF_1", hPF_1);
    query.bindValue(":hPF_2", hPF_2);
    query.bindValue(":operate_delay_value",operate_delay_value);
    query.bindValue(":hold_delay_value",hold_delay_value);
    query.bindValue(":digital_gain_value", digital_gain_value);
    query.bindValue(":analoggain_value", analoggain_value);
    query.exec();

    fetch_filter_values();


}

void b::fetch_filter_values()
{
    QSqlTableModel model;
    model.setTable("filtersettings");
    model.select();
    //lPF1,lPF2,hPF1,hPF2,od,hd,dg
    //    qDebug()<<model.record(0).value("lPF1").toInt()<<
    //            model.record(0).value("lPF2").toInt()<<
    //            model.record(0).value("hPF1").toInt()<<
    //            model.record(0).value("hPF2").toInt()<<
    //            model.record(0).value("od").toInt()<<
    //            model.record(0).value("hd").toInt()<<
    //           model.record(0).value("dg").toReal()<<model.record(0).value("ag").toReal()<<"fetch filter Settings";
    emit filter_values_toqml(model.record(0).value("lPF1").toInt(),
                             model.record(0).value("lPF2").toInt(),
                             model.record(0).value("hPF1").toInt(),
                             model.record(0).value("hPF2").toInt(),
                             model.record(0).value("od").toInt(),
                             model.record(0).value("hd").toInt(),
                             model.record(0).value("dg").toReal(),
                             model.record(0).value("ag").toReal()
                             );
    if(is_first_time_boot)
    {
        qDebug()<<is_first_time_boot<<"is_first_time_boot";


        share_on_serialport("{"
                            +code_DD_on_off+"0"+","
                            +code_Hold_Delay+ formatIntToHEX(model.record(0).value("hd").toInt())+","
                            +code_Operate_Delay+formatIntToHEX(model.record(0).value("od").toInt())+","
                            +code_LPF1+formatIntToHEX(model.record(0).value("lPF1").toInt())+","
                            +code_LPF2+formatIntToHEX(model.record(0).value("lPF2").toInt())+","
                            +code_HPF1+formatIntToHEX(model.record(0).value("hPF1").toInt())+","
                            +code_HPF2+formatIntToHEX(model.record(0).value("hPF2").toInt())+"}","");
    }
}


void b::elist(int a)
{

    QSqlTableModel model;
    QString groupno=QString::number(a);
    groupno=groupno.prepend("group");
    model.setTable(groupno);
    model.setSort(1, Qt::AscendingOrder);
    model.select();
    for (int i = 0; i < model.rowCount(); ++i) {
        int sno = model.record(i).value("sno").toInt();
        int gno = model.record(i).value("gno").toInt();
        QString pname = model.record(i).value("pname").toString();
        QString pcode = model.record(i).value("pcode").toString();

        int signal = model.record(i).value("signalt").toInt();
        int amplitude = model.record(i).value("amplitude").toInt();

        qreal phase = model.record(i).value("phase").toReal();
        qreal digitalgain = model.record(i).value("digitalgain").toReal();

        int analoggain = model.record(i).value("analoggain").toInt();
        int drivepower = model.record(i).value("drivepower").toInt();

        qreal ddfreq = model.record(i).value("ddfreq").toReal();
        qreal ddpowerfactor = model.record(i).value("ddpowerfactor").toReal();

        int ddpower = model.record(i).value("ddpower").toInt();
        QString active_status="";

        if(active_gr_no==a&&active_sr_no==sno)
        {
            qDebug()<<"active:"<<active_sr_no<<active_gr_no;
            active_status="A";
        }

        emit librarydatalist(sno,gno,pname ,pcode,signal,
                             amplitude,phase,digitalgain,analoggain,
                             drivepower,ddfreq,ddpowerfactor,
                             ddpower,active_status);
    }
}


void b::default_values(int a, int b)
{

    QString groupno=QString::number(a);
    groupno=groupno.prepend("group");
    QSqlTableModel model;
    model.clear();
    model.setTable(groupno);
    model.setSort(1, Qt::AscendingOrder);
    model.select();

    QString pname = model.record(b-1).value("pname").toString();
    QString pcode = model.record(b-1).value("pcode").toString();
    int signalt = model.record(b-1).value("signalt").toInt();
    int amplitude = model.record(b-1).value("amplitude").toInt();
    qreal phase = model.record(b-1).value("phase").toFloat();
    qreal digitalgain = model.record(b-1).value("digitalgain").toFloat();
    int analoggain = model.record(b-1).value("analoggain").toInt();
    int drivepower = model.record(b-1).value("drivepower").toInt();
    qreal ddfreq = model.record(b-1).value("ddfreq").toFloat();
    qreal ddpowerfactor = model.record(b-1).value("ddpowerfactor").toFloat();
    int ddpower = model.record(b-1).value("ddpower").toInt();
    emit notify_to_qml_from_qml(pcode,true);
    //nt thresh_qml,int amplitude_qml,qreal phase_qml,qreal freq_qml,int power_qml,qreal power_factor_qml,qreal dg_qml,int analoggain_qml ,int drivepower_qml
    emit default_values_to_qml(signalt,amplitude,phase,digitalgain,analoggain,
                               drivepower,ddfreq,ddpowerfactor,ddpower,0);




}
void b::createandinsertintogroup(int a, QString pname,QString pcode,int signalt,
                                 int amplitude,qreal phase,qreal digitalgain,int analoggain,
                                 int drivepower,qreal ddfreq,qreal ddpowerfactor,
                                 int ddpower)
{
    qDebug()<<a<<"createandinsert";
    QSqlQuery query1;
    QString groupno=QString::number(a);
    groupno=groupno.prepend("group");

    query1.prepare("CREATE TABLE IF NOT EXISTS '"+groupno+"'("
                                                          "gno INT,"
                                                          "sno INT, "
                                                          "pname varchar(20),"
                                                          "pcode varchar(20),"
                                                          "signalt INT, "
                                                          "amplitude INT, "
                                                          "phase REAL, "
                                                          "digitalgain REAL , "
                                                          "analoggain INT,"
                                                          "drivepower INT,"
                                                          "ddfreq REAL, "
                                                          "ddpowerfactor REAL, "
                                                          "ddpower INT);");
    query1.exec();
    qDebug()<<query1.lastError()<<"error";
    QSqlTableModel model;
    model.clear();
    model.setTable(groupno);
    model.select();
    bool find=true;
    int srno=0;
    for (int i = 1; i <= model.rowCount(); i++)
    {
        int sno = model.record(i-1).value("sno").toInt();
        if(find==true&&model.rowCount()>=1)
        {
            qDebug()<<sno<<i<<"trieddd";
            if(sno!=i)
            {
                srno=i;
                find=false;
            }
        }
        qDebug()<<srno<<"snn";
    }
    if(find==true)
    {
        srno=model.rowCount()+1;
    }
    qDebug()<<srno<<"snn";
    query1.prepare("INSERT INTO '"+groupno+"'(sno,gno,pname,pcode,signalt,amplitude,phase,digitalgain,analoggain,drivepower,ddfreq,ddpowerfactor,ddpower) "
                                           "VALUES (:sno,:gno,:pname,:pcode,:signalt,:amplitude,:phase,:digitalgain,:analoggain,:drivepower,:ddfreq,:ddpowerfactor,:ddpower)");
    query1.bindValue(":sno", srno);
    query1.bindValue(":gno", a);
    query1.bindValue(":pname", pname);
    query1.bindValue(":pcode", pcode);

    query1.bindValue(":signalt", signalt);
    query1.bindValue(":amplitude", amplitude);
    query1.bindValue(":phase", phase);

    query1.bindValue(":digitalgain", digitalgain);
    query1.bindValue(":analoggain", analoggain);
    query1.bindValue(":drivepower", drivepower);

    query1.bindValue(":ddfreq", ddfreq);
    query1.bindValue(":ddpowerfactor", ddpowerfactor);
    query1.bindValue(":ddpower", ddpower);

    QString ssnn=QString::number(srno);

    if(srno<=100)
    {
        query1.exec();
        emit notify_to_qml_from_qml("Successfully Added Product",true);
        qDebug()<<query1.lastError()<<"insider";

        emit bo(true);
        if(srno<=9)
        {

            if(a<10)
            {
                ssnn=ssnn.prepend("0"+QString::number(a)+"-00");
            }
            else
            {
                ssnn=ssnn.prepend(QString::number(a)+"-00");
            }

            if(!is_first_time_boot)
            {
                history("-----",ssnn,"Product Added");
            }
        }
        else if(srno<=99&&srno>=10)
        {
            if(a<10)
            {

                ssnn=ssnn.prepend("0"+QString::number(a)+"-0");
            }
            else
            {

                ssnn=ssnn.prepend(QString::number(a)+"-0");
            }

            if(!is_first_time_boot)
            {
                history("-----",ssnn,"Product Added");
            }
        }
        else if(srno==100)
        {
            if(a<10)
            {

                ssnn=ssnn.prepend("0"+QString::number(a)+"-00");
            }
            else
            {

                ssnn=ssnn.prepend(QString::number(a)+"-0");
            }
            if(!is_first_time_boot)
            {
                history("-----",ssnn,"Product Added");

            }

        }

    }
    else
    {
        emit bo(false);
        if(srno>100)
        {
            notify_to_qml_from_qml("Group is filled",true);
        }
        notify_to_qml_from_qml("DataBase error",false);

    }



}

void b::load(int gno, int srno)
{
    if(active_gr_no==gno&&active_sr_no==srno&&is_first_time_boot==false)
    {
        emit notify_to_qml_from_qml("It Is Already Loaded",true);
    }
    else{
        qDebug()<<gno<<srno<<"active products";

        QString active_grno_temp=QString::number(active_gr_no);
        active_grno_temp=active_grno_temp.append("-");
        active_grno_temp=active_grno_temp.append(QString::number(active_sr_no));

        QString gno_temp_string=QString::number(srno);

        if(srno<=9)
        {
            if(gno<10)
            {
                gno_temp_string=gno_temp_string.prepend("0"+QString::number(gno)+"-00");
            }
            else
            {
                gno_temp_string=gno_temp_string.prepend(QString::number(gno)+"-00");
            }
            if(!is_first_time_boot)
            {

                history(new_active_groupname,gno_temp_string,"Product Loaded");
            }
            else
            {
                if(is_first_time_to_qml==true)
                {
                    history(new_active_groupname,gno_temp_string,"Last Active Product Loaded");
                }
            }
            new_active_groupname=gno_temp_string;
        }
        else if(srno<=99&&srno>=10)
        {
            if(gno<10)
            {
                gno_temp_string=gno_temp_string.prepend("0"+QString::number(gno)+"-00");
            }
            else
            {

                gno_temp_string=gno_temp_string.prepend(QString::number(gno)+"-0");
            }
            if(!is_first_time_boot)
            {

                history(new_active_groupname,gno_temp_string,"Product Loaded");
            }
            else
            {
                if(is_first_time_to_qml==true)
                {
                    history(new_active_groupname,gno_temp_string,"Last Active Product Loaded");
                }
            }
            new_active_groupname=gno_temp_string;
        }
        else if(srno==100)
        {
            if(gno<10)
            {

                gno_temp_string=gno_temp_string.prepend("0"+QString::number(gno)+"-00");
            }
            else
            {

                gno_temp_string=gno_temp_string.prepend(QString::number(gno)+"-0");
            }

            if(!is_first_time_boot)
            {

                history(new_active_groupname,gno_temp_string,"Product Loaded");
            }
            else
            {

                if(is_first_time_to_qml==true)
                {
                    history(new_active_groupname,gno_temp_string,"Last Active Product Loaded");
                }
            }
            new_active_groupname=gno_temp_string;
        }
        active_gr_no=gno;
        active_sr_no=srno;

        QSqlQuery query1;
        QSqlTableModel model;
        model.setTable("activeProductData");
        model.select();
        qDebug()<<model.rowCount()<<"row Count";
        if(model.rowCount()>=1)
        {
            int sno_m=model.record(0).value("sno").toInt();
            query1.prepare("update activeProductData set gno=(:gno),sno=(:sno) where sno=(:sno_m)");
            query1.bindValue(":gno",gno);
            query1.bindValue(":sno", srno);
            query1.bindValue(":sno_m", sno_m);
            query1.exec();
        }
        else
        {
            query1.prepare("INSERT INTO activeProductData(gno,sno) "
                           "VALUES (:sno,:gno)");
            query1.bindValue(":gno", gno);
            query1.bindValue(":sno", srno);
            query1.exec();
        }

        QString groupno=QString::number(gno);
        groupno=groupno.prepend("group");

        model.clear();
        model.setTable(groupno);
        model.setSort(1, Qt::AscendingOrder);
        model.select();

        QString pnam = model.record(srno-1).value("pname").toString();
        QString pcod = model.record(srno-1).value("pcode").toString();
        int signalt = model.record(srno-1).value("signalt").toInt();
        int amplitude = model.record(srno-1).value("amplitude").toInt();
        qreal phase = model.record(srno-1).value("phase").toFloat();
        qreal digitalgain = model.record(srno-1).value("digitalgain").toFloat();
        int analoggain = model.record(srno-1).value("analoggain").toInt();
        int drivepower = model.record(srno-1).value("drivepower").toInt();
        qreal ddfreq = model.record(srno-1).value("ddfreq").toFloat();
        qreal ddpowerfactor = model.record(srno-1).value("ddpowerfactor").toFloat();
        int ddpower = model.record(srno-1).value("ddpower").toInt();

        //       void default_values_to_qml(int thresh_qml,int amplitude_qml,qreal phase_qml,
        //                                  qreal freq_qml,int power_qml,qreal power_factor_qml,
        //                                  qreal dg_qml,int analoggain_qml ,int drivepower_qml,int status_v);

        emit default_values_to_qml(signalt,amplitude,phase,ddfreq,ddpower,ddpowerfactor,digitalgain,analoggain,
                                   drivepower,0);
        if(!is_first_time_boot)
        {
            emit notify_me("Successfully Loaded Product","Library",true);
        }

        emit ans(gno,srno,pnam,pcod);// c = name

        share_on_serialport("{"+code_Signal+ formatIntToHEX(signalt)+","
                            +code_phase +formatIntToHEX(phase*10)+","
                            +code_Amplitude+formatIntToHEX(amplitude)+","
                            +code_Digital_Gain+formatIntToHEX(digitalgain*10)+","
                            +code_analog_Gain +formatIntToHEX(analoggain)+","
                            +code_DD_Frequency+formatIntToHEX(ddfreq*10)+","
                            +code_DD_Power_Factor+formatIntToHEX(ddpowerfactor*10)+","
                            +code_DD_Power+formatIntToHEX(ddpower)+","
                            +code_Drive_power+formatIntToHEX(drivepower)+"}","");


    }
}
void b::save()
{
    emit saveto(q,qq);
}

void b::editlibrary(int gno,int sno, QString pname,QString pcode,int signalt,
                    int amplitude,qreal phase,qreal digitalgain,int analoggain,
                    int drivepower,qreal ddfreq,qreal ddpowerfactor,
                    int ddpower,int status)
{
    QString groupno=QString::number(gno);
    groupno=groupno.prepend("group");
    QSqlQuery qryy;
    if(status==1)
    {
        qryy.prepare("update '"+groupno+"' set pname=(:pname),pcode=(:pcode),signalt=(:signalt),amplitude=(:amplitude), phase=(:phase),digitalgain=(:digitalgain),analoggain=(:analoggain),drivepower=(:drivepower),ddfreq=(:ddfreq),ddpowerfactor=(:ddpowerfactor),ddpower=(:ddpower) where sno=(:i)");
        qryy.bindValue(":pname", pname);
        qryy.bindValue(":pcode", pcode);
        qryy.bindValue(":signalt", signalt);
        qryy.bindValue(":amplitude", amplitude);
        qryy.bindValue(":phase",phase);
        qryy.bindValue(":digitalgain", digitalgain);
        qryy.bindValue(":analoggain", analoggain);
        qryy.bindValue(":drivepower",drivepower);
        qryy.bindValue(":ddfreq", ddfreq);
        qryy.bindValue(":ddpowerfactor", ddpowerfactor);
        qryy.bindValue(":ddpower", ddpower);
        qryy.bindValue(":i",sno);
        qryy.exec();

        emit notify_me(" SuccessFully Product Edited","Library",true);

    }
    qDebug()<<qryy.lastError()<<"bugginhg";





}

void b::deleteproduct(int grno,int sno)
{
    QSqlQuery q1;
    qDebug()<<grno<<sno<<"coming all";
    QString groupno=QString::number(grno);
    groupno=groupno.prepend("group");
    q1.prepare("delete from '"+groupno+"' where sno=(:sno)");
    q1.bindValue(":sno",sno);
    if(q1.exec())
    {
        QString sold=QString::number(grno);
        QString snew=QString::number(sno);
        history(sold+"-"+snew,"","Product Deleted");
        emit notify_me(" SuccessFully Product Deleted","Library",true);
    }
    else{


    }
    qDebug()<<q1.lastError()<<"delete";


}

void b::just(int a)
{
    emit just1(a);
}

void b::usertrouble(QString typee, QString userr)
{
    qDebug()<<type<<"type"<<user<<"user";
    user=userr;
    type=typee;
}
void b::s0(int thr_s)
{
    QByteArray b64;
    QString wr;
    std::stringstream sstream;
    sstream<<std::hex;
    char hex_string[5];
    sprintf(hex_string, "%X", thr_s); //convert number to hex
    qDebug()<<hex_string<<"hex_string";
    for(int i=0;i<5;i++)
    {
        if(hex_string[i]!='\u0000')
        {
            wr= wr.append(hex_string[i]);

        }
    }

    // qDebug()<<wr<<"damn" ;

    // qDebug()<<"HEX-Value : 0x"<<wr;
    //QList<QChar> qslist={'0x00',hex_string[0],'#'};
    //qs.write(hex_string,wr.size());



}

void b::s1(int a)
{

//    QString wr=QString::number(a);
//    wr.append("@");
//    wr.prepend("`@");
//    QByteArray b64 =wr.toUtf8();
//    const char *str;
//    str=b64.data();
//    if(qs.isOpen())
//    {
//        QByteArray b64 = wr.toUtf8();
//        const char *str;
//        str=b64.data();
//        qs.write(str,wr.size());
//        qs.flush();
//        notify_me("Serial Port Opened","",true);
//        //  delay(10);
//    }
//    else{
//        notify_me("Serial Port Not Opened","",true);
//    }
}
void b::s2(int a)
{

}
void b::cp(int a)
{

}

void  b::share_on_serialport(QString wr,QString code)
{
    return;
    if(wr.contains("."))
    {
        wr=wr.replace(".","");
    }
    if(code!="")
    {
        code=code.prepend("$");
        wr=wr.prepend(code).append("#");
    }

    if(qs.isOpen())
    {
        QByteArray b64 = wr.toUtf8();
        const char *str;
        str=b64.data();
        qs.write(str,wr.size());
//        qs.flush();  /////
   //   delay(10);
    }
    notify_me(wr +"  ZZ","",true);
    qDebug()<<"Data : "<<wr;
}

void b::s3(int old,int a )
{
    qDebug()<<old<<a<<"modified load values";
    if(active_gr_no>0&&active_sr_no>0)
    {
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        qryy.prepare("update '"+groupno+"' set signalt=(:signalt) where sno=(:sno)");
        qryy.bindValue(":signalt", a);
        qryy.bindValue(":sno",active_sr_no);
        if(qryy.exec())
        {
            QString sold=QString::number(old);
            QString snew=QString::number(a);
            qDebug()<<sold<<snew<<"checking THR-S changed or not";
            history(sold,snew,"THR-S Changed");
            emit notify_to_qml_from_qml("THR-S Changed",true);
        }

    }

    share_on_serialport(formatIntToHEX(a),code_Signal);
}
void b::s4(qreal old,qreal a)
{

    qDebug()<<old<<a<<"modified load values";
    if(active_gr_no>0&&active_sr_no>0)
    {
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        //(sno,gno,pname,pcode,signalt,amplitude,phase,digitalgain,analoggain,drivepower,ddfreq,ddpowerfactor,ddpower) "
        //                "VALUES (:sno,:gno,:pname,:pcode,:signalt,:amplitude,:phase,:digitalgain,:analoggain,:drivepower,:ddfreq,:ddpowerfactor,:ddpower)");

        qryy.prepare("update '"+groupno+"' set phase=(:phase) where sno=(:sno)");
        qryy.bindValue(":phase", a);
        qryy.bindValue(":sno",active_sr_no);
        if(qryy.exec())
        {

            history(QString::number(old),QString::number(a),"MPHS Changed");
            emit notify_to_qml_from_qml("MPHS Changed",true);
        }
    }

    share_on_serialport(formatIntToHEX(a*10),code_phase);

}
void b::s5(int old ,int a) //amplitude
{
    qDebug()<<old<<a<<"amplitude";
    if(active_gr_no>0&&active_sr_no>0)
    {
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        qryy.prepare("update '"+groupno+"' set amplitude=(:amplitude) where sno=(:sno)");
        qryy.bindValue(":amplitude", a);
        qryy.bindValue(":sno",active_sr_no);
        if(qryy.exec())
        {
            QString sold=QString::number(old);
            QString snew=QString::number(a);
            history(sold,snew,"THR-A Changed");
            emit notify_to_qml_from_qml("THR-A Changed",true);
        }
    }

    share_on_serialport(formatIntToHEX(a),code_Amplitude);


}

void b::analog_gain(double old, double a)
{
    history(QString::number(old),QString::number(a),"Analog Gain Changed");
    QString groupno=QString::number(active_gr_no);
    groupno=groupno.prepend("group");
    QSqlQuery qryy;

    qryy.prepare("update '"+groupno+"' set analoggain=(:analoggain) where sno=(:sno)");
    qryy.bindValue(":analoggain", a);
    qryy.bindValue(":sno",active_sr_no);
    qryy.exec();
    emit notify_to_qml_from_qml("Analog Gain Changed",true);
    //share_on_serialport(formatIntToHEX(a*10),"0B");
}

void b::digital_gain(double old, double a)
{
    history(QString::number(old),QString::number(a),"Digital Gain Changed");
    QString groupno=QString::number(active_gr_no);
    groupno=groupno.prepend("group");
    QSqlQuery qryy;
    qryy.prepare("update '"+groupno+"' set digitalgain=(:digitalgain) where sno=(:sno)");
    qryy.bindValue(":digitalgain", a);
    qryy.bindValue(":sno",active_sr_no);
    qryy.exec();
    emit notify_to_qml_from_qml("Digital Gain Changed",true);
    // share_on_serialport(formatIntToHEX(a*10),"0F");
}
void b::dD_on_off(bool b)
{
    emit dd_on_off_to_qml(b);
    return;
    if(qs.isOpen()&&!is_first_time_boot)
    {
        if(b)
        {
            share_on_serialport(formatIntToHEX(1),code_DD_on_off);
        }
        else{
            share_on_serialport(formatIntToHEX(0),code_DD_on_off);
        }
    }


}

void b::dd_power_factor(double old, double a,bool can_I_store)
{
    if(can_I_store)
    {
        history(QString::number(old),QString::number(a),"DD Power Factor Changed");
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        qryy.prepare("update '"+groupno+"' set ddpowerfactor=(:ddpowerfactor) where sno=(:sno)");
        qryy.bindValue(":ddpowerfactor", a);
        qryy.bindValue(":sno",active_sr_no);
        qryy.exec();
        emit notify_to_qml_from_qml("DD Power Factor Changed",true);
    }
    else{
        return;
        if(qs.isOpen()&&!is_first_time_boot)
        {
            share_on_serialport(formatIntToHEX(a*10),code_DD_Power_Factor);
        }
        else{
            emit notify_to_qml_from_qml("Serial port is not open",true);
        }

    }
}

void b::dd_power(int old, int a,bool can_I_store)
{
    if(can_I_store)
    {
        history(QString::number(old),QString::number(a),"DD Power Changed");
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        qryy.prepare("update '"+groupno+"' set ddpower=(:ddpower) where sno=(:sno)");
        qryy.bindValue(":ddpower", a);
        qryy.bindValue(":sno",active_sr_no);
        qryy.exec();
        emit notify_to_qml_from_qml("DD Power Changed",true);
    }
    else{

return;
        if(qs.isOpen()&&!is_first_time_boot)
        {
            share_on_serialport(formatIntToHEX(a),code_DD_Power);
        }
        else{
            emit notify_to_qml_from_qml("Serial port is not open",true);
        }
    }

}

void b::dd_frequency(double old, double a,bool can_I_store)
{
    qDebug()<<old<<a<<" DD frequnecy values";
    if(can_I_store)
    {
        history(QString::number(old),QString::number(a),"DD Frequency Changed");
        QString groupno=QString::number(active_gr_no);
        groupno=groupno.prepend("group");
        QSqlQuery qryy;
        qryy.prepare("update '"+groupno+"' set ddfreq=(:ddfreq) where sno=(:sno)");
        qryy.bindValue(":ddfreq", a);
        qryy.bindValue(":sno",active_sr_no);
        qryy.exec();
        emit notify_to_qml_from_qml("DD Frequency Changed",true);
    }
    else{
return;
        if(qs.isOpen()&&!is_first_time_boot)
        {
            share_on_serialport(formatIntToHEX(a*10),code_DD_Frequency);
        }
        else{
            emit notify_to_qml_from_qml("Serial port is not open",true);
        }
    }

}

void b::slide1(int s1)
{
    emit ss1(s1);
}
void b::slide2(int s2)
{
    emit ss2(s2);
}
void b::slide3(int s3)
{
    emit ss3(s3);
}

void b::tsd(int i, int j,int k)
{
    qDebug()<<i<<"i"<<j<<"j"<<k<<"k";
    QString ssold=QString::number(j);
    QString ssnew=QString::number(k);
    if(i==0)
    {
        history(ssold,ssnew,"T-Signal");
        qDebug()<<ssold<<ssnew<<"";
    }
    if(i==1)
    {
        history(ssold,ssnew,"T-Amplitude");
    }
    if(i==2)
    {
        history(ssold,ssnew,"M-Phase");
    }
}
void b:: history(QString old,QString newww ,QString remark )
{

    QDateTime dateTime = dateTime.currentDateTime();
    QString aa= dateTime.toString("dd/MM/yyyy hh:mm:ss");
    QString timetosql = aa.mid(11, 16);
    aa=aa.mid(0,10);
    datee=aa;
    aa=aa.replace("/","_");
    tablename=aa.prepend("A_");
    QSqlQuery query;
    //qDebug()<<tablename<<"tab  1";
    query.prepare("CREATE TABLE IF NOT EXISTS '"+tablename+"'("
                                                           "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                                           "date varchar(15) , "
                                                           "time varchar(15), "
                                                           "user varchar(10) , "
                                                           "old varchar(10) , "
                                                           "new varchar(10) , "
                                                           "remark varchar(10));");
    query.exec();
    query.prepare("INSERT INTO '"+tablename+"'(date,time,user,old,new,remark) "
                                            "VALUES (:date,:time,:user,:old,:new,:remark)");
    query.bindValue(":date", datee);
    query.bindValue(":time", timetosql);
    query.bindValue(":user", user);
    query.bindValue(":old", old);
    query.bindValue(":new",newww);
    query.bindValue(":remark", remark);
    query.exec();

    qDebug()<<query.lastError()<<"History Error";
}
