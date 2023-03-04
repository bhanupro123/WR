#include "b.h"
#include"black.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QDebug>
#include <QCalendarWidget>
#include <QSqlDatabase>
#include <QDebug>
//#include<sys/reboot.h>
#include <QSqlError>
#include <QSqlTableModel>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriverPlugin>
#include <QtSql/QSqlQuery>
#include <QPrinter>
#include <QStringList>
#include <QString>
#include<iomanip>
#include<sstream>
#include <QPainter>
#include <QQmlContext>
#include <QQuickView>
#include <QDateTime>
#include <QPen>
#include<QThread>
#include<QtConcurrent/qtconcurrentrun.h>
#include<QFuture>
#include<QProcess>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include<iostream>
#include<QTimer>
#include<QPrinter>
#include<QPainter>
#include<QThread>
#include<QtConcurrent/qtconcurrentrun.h>
#include<QFuture>
#include<QtConcurrent/qtconcurrentrun.h>

static QString search="";
static QProcess OProcess;
static QString enroll_temp="";
static QDate machine_startup_date;
static bool auto_validate_1=false;
static bool auto_validate_2=false;
static bool auto_validate_3=false;
static bool auto_validate_4=false;
static QSqlDatabase db1;
static QFuture<void> f1;
using namespace QtConcurrent;
static QString cn;
static QString loc;
static QString mid="PHMX";
static QString reglarExp="[]";
static int hours_a,minuts_a,hours_b,minuts_b,hours_c,minuts_c,hours_d,minuts_d,status_a_e,status_b_e,status_c_e,status_d_e;
static QStringList usern;
static QString un;
static bool boo=true;
static int a;
static QString supliername="WinRender Systems LLP., Pharma Metal Detector";
static QString user="";
static QString tablename="";
static QString datee="";
static QString timee="";
static QString userName="";
static int this_month;
static int this_day;
static int this_year;

static QSqlQuery queryy;
static QString temp_id,temp_username,temp_password;
using namespace QtConcurrent;
using namespace std;
void clearcache()
{
    temp_id.clear();
    temp_username.clear();
    temp_password.clear();
}

int findEmptySpaceOfFingerprint()
{
    QSqlTableModel model;
    model.clear();
    model.setTable("usertable");
    model.select();
    bool find=false;
    if(  model.rowCount()>=1)
    {
    for (int i = 1; i <= model.rowCount(); i++)
    {
        int sno = model.record(i-1).value("fpid").toInt();
            qDebug()<<sno<<i<<"trieddd";
            if(sno!=i)
            {
                find=true;
                qDebug()<<i<<"snn finded";
                return i;
            }

    }
    if(!find)
    {
        return model.rowCount()+1;
    }
}
    else{
        return 1;
    }
    return 1;
}
int formatHEXtoINTT(QString s)
{

    QByteArray ba=s.toLatin1();
    char *c=ba.data();
    int x;
    std::stringstream ss;
    ss << std::hex<<c;
    ss >> x;
    qDebug()<<s<<x<<"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    return x;
}

Back::Back(QObject* parent) : QObject(parent)
{
    finger_timer = new QTimer(this);
    //connect(finger_timer, &QTimer::timeout, this, &Back::start_searching);
    QSqlDatabase  db1 = QSqlDatabase::addDatabase("QSQLITE");
    db1.setDatabaseName("DataBase.db");
    system("sudo chmod 777 DataBase.db");
    bool ok1 = db1.open();
    if(ok1==true)
    {
        qDebug()<<ok1<<"damn DataBase.db opened";
    }



    QSqlQuery queryy;
    queryy.prepare("CREATE TABLE filtersettings("
                   "sno INT, "
                   "lPF1 INT, "
                   "lPF2 INT, "
                   "hPF1 INT, "
                   "hPF2 INT, "
                   "od INT, "
                   "hd INT, "
                   "dg REAL, "
                   "ag REAL);");
    if(queryy.exec())
    {
        queryy.exec("INSERT INTO filtersettings(sno,lPF1,lPF2,hPF1,hPF2,od,hd,dg,ag)"
                    "VALUES ('1','3','5','18','20','0','200','1','1')");

    }

    queryy.prepare("CREATE TABLE systemsettings("
                   "sno INT, "
                   "customername varchar(100) , "
                   "location varchar(100), "
                   "supliername varchar(100), "
                   "machineid varchar(100));");
    if(queryy.exec())
    {
        queryy.exec("INSERT INTO systemsettings(sno,supliername,machineid)"
                    "VALUES ('1','"+supliername+"','"+mid+"')");
        qDebug()<<queryy.lastError()<<"damnnnn";

    }
    QSqlTableModel model;
    model.clear();
    model.setTable("systemsettings");
    model.select();
    if(model.rowCount()>0)
    {
        cn= model.record(0).value("customername").toString();
        loc=model.record(0).value("location").toString();
        supliername=model.record(0).value("supliername").toString();
        mid=model.record(0).value("machineid").toString();

        qDebug()<<cn<<loc<<mid<<supliername<<"System Settings";

    }


    QSqlQuery query;
    query.prepare("CREATE TABLE IF NOT EXISTS listoftables("
                  "sno INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "tablename varchar(20) , "
                  "day INT, "
                  "month INT, "
                  "year INT );");

    query.exec();

    query.prepare("CREATE TABLE IF NOT EXISTS autovalidate("
                  "sno INT, "
                  "hours INT, "
                  "minuts INT, "
                  "status INT );");

    query.exec();


    model.clear();
    model.setTable("autovalidate");
    model.setSort(1, Qt::AscendingOrder);
    model.select();
    qDebug()<<model.rowCount()<<"row Count";

    if(model.rowCount()==0)
    {
        query.exec("INSERT INTO autovalidate(sno,hours,minuts,status)"
                   "VALUES ('1','11','15','1')");
        query.exec("INSERT INTO autovalidate(sno,hours,minuts,status)"
                   "VALUES ('2','11','30','1')");
        query.exec("INSERT INTO autovalidate(sno,hours,minuts,status)"
                   "VALUES ('3','11','45','1')");
        query.exec("INSERT INTO autovalidate(sno,hours,minuts,status)"
                   "VALUES ('4','11','0','1')");
    }
    else{
        readautovalidate();
    }
    query.prepare("CREATE TABLE IF NOT EXISTS usertable("
                  "fpid varchar(4) UNIQUE,"
                  "id varchar(3) , "
                  "username varchar(15) UNIQUE, "
                  "password varchar(8) UNIQUE);");
    query.exec();



    qDebug()<<query.lastError()<<"Nothing";
    QSqlQuery q1;
    q1.prepare("CREATE TABLE IF NOT EXISTS default1("
               "id varchar(3) , "
               "user varchar(15) UNIQUE, "
               "pass varchar(8) UNIQUE);");
    q1.exec();

    QString id="A";
    QString username="ADMIN";
    QString password="0000";
    QSqlQuery q2;


    QString q11="";
    QSqlQuery ab;
    ab.prepare("select id FROM default1 where user='"+username+"' and pass='"+password+"'");

    ab.exec();
    usern.clear();
    while (ab.next()) {
        usern<< ab.value(0).toString();
        q11=usern[0];

    }

    if(q11=="")
    {
        if(ab.exec("INSERT INTO default1(id,user,pass)"
                   "VALUES ('"+id+"','"+username+"','"+password+"')"))
        {

        }
    }

    createTable();
    //    QSqlTableModel model2;
    //    model2.clear();
    //    model2.setTable("usertable");
    //    model2.select();
    //    if(model2.rowCount()>0)
    //    {
    //        search_fp();
    //    }
    serial_finger_print.setPortName("ttyUSB0");
    serial_finger_print.open(QIODevice::ReadWrite);
    serial_finger_print.setBaudRate(QSerialPort::Baud57600);
    serial_finger_print.setDataBits(QSerialPort::Data8);
    serial_finger_print.setParity(QSerialPort::NoParity);
    serial_finger_print.setStopBits(QSerialPort::OneStop);
    serial_finger_print.setFlowControl(QSerialPort::NoFlowControl);

    if(serial_finger_print.isOpen())
    {
        qDebug()<<"Fp_serial port_is_opened";
        connect(&serial_finger_print,&QSerialPort::readyRead,this,&Back::read_from_fp_serial_port);
        //  finger_timer->start(1500);
    }

}
void Back::read_from_fp_serial_port()
{
    //  QThread::sleep(2);   ef01ffffffff0700070000050077008a
    //    finger_timer->stop();
    const QByteArray data = serial_finger_print.readAll();

    bufferstring_for_fp=bufferstring_for_fp.append(data.toHex());
    // qDebug()<<bufferstring_for_fp<<bufferstring_for_fp.size();

    if(bufferstring_for_fp.size()==24&&bufferstring_for_fp.startsWith(finger_returns_header))
    {
        qDebug()<<"QWERTY";
        QString temp=bufferstring_for_fp;
        bufferstring_for_fp.clear();
        temp=temp.replace(finger_returns_header,"");
        if(temp.startsWith("00"))
        {
            if(which_is_in_active==detect_is_active)
            {
                emit finger_got_score("Finger is Detected",false,0);
                qDebug()<<"Finger Detected";
                if(image_1_generated_or_not)//true
                {
                    ch2();
                }
                else{
                    ch1();
                }

            }
            else if(which_is_in_active==gen_image1)
            {
                emit finger_got_score("Generated Image 1",false,0);
                qDebug()<<"Genereted Image 1";
                image_1_generated_or_not=true;
                ch2();
            }
            else if(which_is_in_active==gen_image2)
            {
                emit finger_got_score("Generated Image 2",false,0);
                qDebug()<<"Genereted Image 2";
                qDebug()<<"Remove Finger";
                //emit finger_enroll_status_messege("Remove Finger",false);
                match();
            }


            else if(which_is_in_active==create_templete)
            {
                emit finger_got_score("Created",false,0);
                qDebug()<<"SuccessFully Finger Created";
                store(findEmptySpaceOfFingerprint());
            }
            else if(which_is_in_active==store_templete)
            {
                emit finger_got_score("SuccessFully Stored",true,2);
                image_1_generated_or_not=false;
                emit finger_enroll_status_messege("SuccessFully Finger Enrolled",true);
                qDebug()<<"SuccessFully Stored";
                QSqlQuery query;
                    query.prepare("INSERT INTO usertable(fpid,id,username,password) "
                                                            "VALUES (:fpid,:id,:username,:password)");
                    query.bindValue(":fpid", findEmptySpaceOfFingerprint());
                    query.bindValue(":id", temp_id);
                    query.bindValue(":username", temp_username);
                    query.bindValue(":password", temp_password);
                if(query.exec())
                {
                    emit create(true);
                    emit notify_me("User Created Successfully","USER",true);
                }
                else{
                    emit create(false);
                    emit notify_me("Error From Database","USER",false);
                }
            }
            else if(which_is_in_active==delete_all_fp)
            {

            }
            else if(which_is_in_active==single_delete_fp)
            {

            }
            else if(which_is_in_active==get_score)
            {
                qDebug()<<bufferstring_for_fp<<"From get _ Scrore";
            }




        }
        else  if(temp.startsWith("01"))
        {
            emit finger_got_score("Error from Scanner",false,0);
            qDebug()<<"Error from Scanner";
        }
        else  if(temp.startsWith("02"))
        {
            emit finger_got_score("no finger on the sensor clean your finger and try again",false,0);
            qDebug()<<"no finger on the sensor clean your finger and try again";
        }
        else  if(temp.startsWith("03"))
        {
             emit finger_got_score("Failed to collect Finger",false,0);
            qDebug()<<"Failed to collect Finger";
        }
        else  if(temp.startsWith("06"))
        {
            emit finger_got_score("Over-Disorderly",false,0);
            qDebug()<<"Over-Disorderly";
        }
        else  if(temp.startsWith("07"))
        {
            emit finger_got_score("small ness of image",false,0);
            qDebug()<<"small ness of image";
        }
        else  if(temp.startsWith("15"))
        {
            emit finger_got_score("lackness of valid primary image",false,0);
            qDebug()<<"lackness of valid primary image";
        }
    }
    else if(bufferstring_for_fp.size()==28&&bufferstring_for_fp.startsWith(finger_returns_match_header))
    {
        QString temp=bufferstring_for_fp;
        bufferstring_for_fp.clear();
        temp=temp.replace(finger_returns_match_header,"");
        if(temp.startsWith("00"))
        {
            //two buffers are matched
            qDebug()<<"two buffers are matched";
            search_existed_or_not();
        }
        else if(temp.startsWith("08"))
        {
            serial_finger_print.flush();
            qDebug()<<"Invalid package header"<<temp;
            emit finger_got_score("Try Again",false,0);

        }
        else{
            qDebug()<<"two buffers are not matched";
            image_1_generated_or_not=false;
            emit finger_got_score("Try Again",false,0);

        }

    }
    else if(bufferstring_for_fp.size()==32&&bufferstring_for_fp.startsWith(finger_returns_search_header))
    {
        QString temp=bufferstring_for_fp;
        bufferstring_for_fp.clear();
        temp=temp.replace(finger_returns_search_header,"");
        if(temp.startsWith("00"))
        {
            if(which_is_in_active==get_score)
            {
                QString fpid=temp.remove(0,2);
             fpid=  QString::number( formatHEXtoINTT(fpid.mid(0,4)));
               emit finger_got_score("finger is matched at : "  + QString::number( formatHEXtoINTT(fpid.mid(0,4)))+" Score is :  "+QString::number( formatHEXtoINTT(fpid.mid(4,4))),true,1);
                QSqlQuery qq;
                //qq.prepare("select username,password from usertable where fpid='"+fpid+"'");
                qq.prepare("select username,password  FROM usertable WHERE fpid= (:from)");
                qq.bindValue(":from",fpid);
                qq.exec();
                   while (qq.next()) {
                           qDebug()<<qq.value(1).toString();
verify(qq.value(0).toString(),qq.value(1).toString());
               }
                   qDebug()<<qq.value(1).toString()<<qq.lastError()<<fpid;

            }
            else if(which_is_in_active==search_finger)
            {
                emit finger_got_score("finger is already existed",false,0);

                qDebug()<<" finger is already existed ";
            }
        }
        else if(temp.startsWith("01"))
        {
            emit finger_got_score("Finger is Dirty or Wet or Scanner not in Clean",false,0);
            qDebug()<<"finger is dirty or scaneris not in clean";
        }
        else if(temp.startsWith("09"))
        {
            if(which_is_in_active==get_score)
            {
                qDebug()<<"its new finger not existed in Library";
                emit finger_got_score("Its new finger not existed in Library",false,0);
            }
            else if(which_is_in_active==search_finger)
            {
                qDebug()<<"its new finger , c1,c2 buffer are not  matched with library";
                create();
            }

        }

        else
        {
            qDebug()<<"Sorry ! Try Again"<<temp;
            emit finger_got_score("finger is not perfectly positioned",false,0);
        }

    }




}



void Back::detect1()
{
    which_is_in_active=detect_is_active;
    const char f_detect[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x3, 0x1, 0x0, 0x5};
    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_detect[i],1);
    }
}

void Back::ch1()
{
    which_is_in_active=gen_image1;
    image_1_generated_or_not=true;
    const char f_imz2ch1[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x4, 0x2, 0x1, 0x0, 0x8};
    for(int i=0;i<=12;i++)
    {
        serial_finger_print.write(&f_imz2ch1[i],1);
    }
}

void Back::ch2()
{
    which_is_in_active=gen_image2;
    const char f_imz2ch2[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x4, 0x2, 0x2, 0x0, 0x9};
    for(int i=0;i<=12;i++)
    {
        serial_finger_print.write(&f_imz2ch2[i],1);
    }
}



void Back::create()
{
    which_is_in_active=create_templete;
    const char f_createModel[]={0xEF,0x1,0xFF,0xFF,0xFF,0xFF,0x1,0x0,0x3,0x5,0x0,0x9};

    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_createModel[i],1);
    }
}
//"\xEF\x01\xFF\xFF\xFF\xFF\x07\x00\x05\x00\x00\x02\x00\x0E" "" 0 ""
void Back::store(int id)
{
    which_is_in_active=store_templete;

    char f_storeModel[]={0xEF,0x1,0xFF,0xFF,0xFF,0xFF,0x1,0x0,0x6,0x6,0x1,0x0,0x1,0x0,0xE};
    f_storeModel[11]= (id>>8) & 0xff;
    f_storeModel[12]= id& 0xff;
    f_storeModel[14]= 14+id;
    for(int i=0;i<=14;i++)
    {
        serial_finger_print.write(&f_storeModel[i],1);
    }
}

void Back::deleteall()
{
    which_is_in_active=delete_all_fp;
    const char f_deleteAll[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x3, 0xd, 0x00, 0x11};
    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_deleteAll[i],1);
    }

}

void Back::singledelete(int id)
{
    which_is_in_active=single_delete_fp;
    char f_delete[]={0xEF,0x1,0xFF,0xFF,0xFF,0xFF,0x1,0x0,0x7,0xC,0x0,0x0,0x0,0x1,0x0,0x15};

    f_delete[10]=id>>8 & 0xff;
    f_delete[11]=id & 0xff;
    f_delete[14]=(21+id)>>8 & 0xff;
    f_delete[15]=(21+id) & 0xff;
    for(int i=0;i<=15;i++)
    {
        serial_finger_print.write(&f_delete[i],1);
    }
}

void Back::match()
{
    which_is_in_active=match_is_active;
    const char f_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x00, 0x03, 0x03, 0x00, 0x07};
    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_search[i],1);
    }
    //const char f_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x8, 0x1B, 0x1, 0x0, 0x0, 0x0, 0xA3, 0x0, 0xC8};
}
void Back::search_existed_or_not()
{
    which_is_in_active=search_finger;
    const char f_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x8, 0x1B, 0x1, 0x0, 0x0, 0x0, 0xA3, 0x0, 0xC8};
    for(int i=0;i<=16;i++)
    {
        serial_finger_print.write(&f_search[i],1);
    }
    //const char f_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x8, 0x1B, 0x1, 0x0, 0x0, 0x0, 0xA3, 0x0, 0xC8};
}
void Back::getscore()
{
    which_is_in_active=get_score;
    const char f_fast_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x00, 0x3, 0x34, 0x00,0x38};
    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_fast_search[i],1);
    }

}
QStringList bhnu(QString from_string,QString to_string)
{
    QStringList lists;

    QStringList usern;  QSqlQuery ab;
    int from,to;
    bool rr=false;
    ab.prepare("select sno FROM listoftables where tablename='"+from_string+"'");

    ab.exec();


    while (ab.next()) {
        from=ab.value(0).toInt();
        qDebug()<<ab.value(0).toInt()<<"ab.value(0).toInt()";
        rr=true;
        if(rr==true)
        {

        }

    }
    rr=false;
    ab.prepare("select sno FROM listoftables where tablename='"+to_string+"'");

    ab.exec();


    while (ab.next()) {
        to=ab.value(0).toInt();
        qDebug()<<ab.value(0).toInt()<<"ab.value(1).toInt()";
        rr=true;
        if(rr==true)
        {

        }
    }

    ab.prepare("select sno,tablename FROM listoftables WHERE sno BETWEEN (:from) and (:to)");

    ab.bindValue(":from",from);
    ab.bindValue(":to",to);
    if(ab.exec())
    {


        while (ab.next()) {
            qDebug()<<"Tables :"<<ab.value(1).toString();
            lists.append(ab.value(1).toString());

        }
    }
    else{
        qDebug()<<ab.lastError()<<"fromto";
    }

    return lists;
}

void Back::entrol()
{
    qDebug()<<"damnnnnn"<<"wow its working";

}


void Back::deletee_fp(int id)
{
    finger_timer->stop();
    char f_delete[]={0xEF,0x1,0xFF,0xFF,0xFF,0xFF,0x1,0x0,0x7,0xC,0x0,0x0,0x0,0x1,0x0,0x15};
    f_delete[10]=id>>8 & 0xff;
    f_delete[11]=id & 0xff;
    f_delete[14]=(21+id)>>8 & 0xff;
    f_delete[15]=(21+id) & 0xff;
    for(int i=0;i<=15;i++)
    {
        serial_finger_print.write(&f_delete[i],1);
    }
}

void Back::search_fp()
{
    const char f_fast_search[]={0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x00, 0x3, 0x34, 0x00,0x38};
    for(int i=0;i<=11;i++)
    {
        serial_finger_print.write(&f_fast_search[i],1);
    }
}
void Back::delete_index_slot(QString i)
{

}
void Back::readautovalidate()
{

    QSqlQuery query;
    QSqlTableModel model;
    model.clear();
    model.setTable("autovalidate");
    model.setSort(0, Qt::AscendingOrder);
    model.select();
    hours_a=model.record(0).value("hours").toInt();
    minuts_a=model.record(0).value("minuts").toInt();
    hours_b=model.record(1).value("hours").toInt();
    minuts_b=model.record(1).value("minuts").toInt();
    hours_c=model.record(2).value("hours").toInt();
    minuts_c=model.record(2).value("minuts").toInt();
    hours_d=model.record(3).value("hours").toInt();
    minuts_d=model.record(3).value("minuts").toInt();
    status_a_e=model.record(0).value("status").toInt();
    status_b_e=model.record(1).value("status").toInt();
    status_c_e=model.record(2).value("status").toInt();
    status_d_e=model.record(3).value("status").toInt();


    emit auto_validate_to_qml(hours_a,
                              minuts_a,
                              hours_b,
                              minuts_b,
                              hours_c,
                              minuts_c,
                              hours_d,
                              minuts_d,
                              status_a_e,
                              status_b_e,
                              status_c_e,
                              status_d_e
                              );


}

void Back::autovalidate(int ha,int ma,int hb,int mb,int hc,int mc,int hd,int md,int status_a,int status_b,int status_c,int status_d)
{

    qDebug()<<ha<<ma<<hb<<mb<<hc<<mc<<hd<<md<<status_a<<status_b<<status_c<<status_d<<"validate_values";
    QSqlQuery query;
    QSqlTableModel model;
    model.clear();
    model.setTable("autovalidate");
    model.setSort(1, Qt::AscendingOrder);
    model.select();
    qDebug()<<model.rowCount()<<"row Count";


    //status //hours//minuts
    QString temp_string_h_a=QString::number(ha);
    QString temp_string_m_a=QString::number(ma);

    QString temp_string_h=QString::number(hours_a);
    QString temp_string_m=QString::number(minuts_a);

    if(hours_a<10)
    {
        temp_string_h=temp_string_h.prepend("0");
    }
    if(minuts_a<10)
    {
        temp_string_m=temp_string_m.prepend("0");
    }
    if(ha<10)
    {
        temp_string_h_a=temp_string_h_a.prepend("0");
    }
    if(ma<10)
    {
        temp_string_m_a=temp_string_m_a.prepend("0");
    }
    if(hours_a!=ha||minuts_a!=ma)
    {
        if(status_a_e!=status_a)
        {
            if(status_a==1)
            {
                auto_validate_1=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Time Changed + Enabled");
            }
            else
            {
                auto_validate_1=false;

                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Time Changed + Disable");
            }
        }
        else{
            if(status_a==1)
            {
                auto_validate_1=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Time Changed + Enabled");

            }
            else
            {
                auto_validate_1=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Time Changed + Disable");
            }
        }

    }
    else{
        if(status_a_e!=status_a)
        {
            if(status_a==1)
            {

                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Enabled");

            }
            else
            {

                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-1 Disable");
            }
        }
    }



    temp_string_h_a=QString::number(hb);
    temp_string_m_a=QString::number(mb);

    temp_string_h=QString::number(hours_b);
    temp_string_m=QString::number(minuts_b);
    if(hours_b<10)
    {
        temp_string_h=temp_string_h.prepend("0");
    }
    if(minuts_b<10)
    {
        temp_string_m=temp_string_m.prepend("0");
    }
    if(hb<10)
    {
        temp_string_h_a=temp_string_h_a.prepend("0");
    }
    if(mb<10)
    {
        temp_string_m_a=temp_string_m_a.prepend("0");
    }

    if(hours_b!=hb||minuts_b!=mb)
    {
        if(status_b_e!=status_b)
        {
            if(status_b==1)
            {
                auto_validate_2=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Enabled");
            }
            else
            {
                auto_validate_2=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Disable");
            }
        }
        else{
            if(status_b==1)
            {
                auto_validate_2=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Enabled");

            }
            else
            {
                auto_validate_2=false;

                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Disable");
            }
        }

    }
    else{
        if(status_b_e!=status_b)
        {
            if(status_b==1)
            {


                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Enabled");

            }
            else
            {

                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Disable");
            }
        }
    }



    temp_string_h_a=QString::number(hc);
    temp_string_m_a=QString::number(mc);

    temp_string_h=QString::number(hours_c);
    temp_string_m=QString::number(minuts_c);

    if(hours_c<10)
    {
        temp_string_h=temp_string_h.prepend("0");
    }
    if(minuts_c<10)
    {
        temp_string_m=temp_string_m.prepend("0");
    }
    if(hc<10)
    {
        temp_string_h_a=temp_string_h_a.prepend("0");
    }
    if(mc<10)
    {
        temp_string_m_a=temp_string_m_a.prepend("0");
    }


    if(hours_c!=hc||minuts_c!=mc)
    {
        if(status_c_e!=status_c)
        {
            if(status_c==1)
            {

                auto_validate_3=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Time Changed + Enabled");

            }
            else
            {
                auto_validate_3=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Time Changed + Disable");
            }
        }
        else{
            if(status_c==1)
            {
                auto_validate_3=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Time Changed + Enabled");

            }
            else
            {
                auto_validate_3=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Time Changed + Disable");
            }
        }

    }
    else{
        if(status_c_e!=status_c)
        {
            if(status_c==1)
            {
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Enabled");

            }
            else
            {
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-3 Disable");
            }
        }
    }



    temp_string_h_a=QString::number(hd);
    temp_string_m_a=QString::number(md);

    temp_string_h=QString::number(hours_d);
    temp_string_m=QString::number(minuts_d);
    if(hours_d<10)
    {
        temp_string_h=temp_string_h.prepend("0");
    }
    if(minuts_d<10)
    {
        temp_string_m=temp_string_m.prepend("0");
    }
    if(hd<10)
    {
        temp_string_h_a=temp_string_h_a.prepend("0");
    }
    if(md<10)
    {
        temp_string_m_a=temp_string_m_a.prepend("0");
    }


    if(hours_d!=hd||minuts_d!=md)
    {
        if(status_d_e!=status_d)
        {
            if(status_d==1)
            {
                auto_validate_4=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Enabled");

            }
            else
            {
                auto_validate_4=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-2 Time Changed + Disable");
            }
        }
        else{
            if(status_d==1)
            {
                auto_validate_4=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-4 Time Changed + Enabled");

            }
            else
            {
                auto_validate_4=false;
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-4 Time Changed + Disable");
            }
        }

    }
    else{
        if(status_d_e!=status_d)
        {
            if(status_d==1)
            {
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-4 Enabled");

            }
            else
            {
                history(temp_string_h+":"+temp_string_m,temp_string_h_a+":"+temp_string_m_a,"Auto Val-4 Disable");
            }
        }
    }




    query.prepare("update autovalidate set hours=(:ha),minuts=(:ma),status=(:status) where sno=(:sno)");

    query.bindValue(":ha",ha);
    query.bindValue(":ma",ma);
    query.bindValue(":sno",1);
    query.bindValue(":status",status_a);
    query.exec();




    query.prepare("update autovalidate set hours=(:hb),minuts=(:mb),status=(:status)  where sno=(:sno)");

    query.bindValue(":hb",hb);
    query.bindValue(":mb",mb);
    query.bindValue(":sno",2);
    query.bindValue(":status",status_b);
    query.exec();
    if(status_b_e!=status_b)
    {


    }

    query.prepare("update autovalidate set hours=(:hc),minuts=(:mc),status=(:status)  where sno=(:sno)");

    query.bindValue(":hc",hc);
    query.bindValue(":mc",mc);
    query.bindValue(":sno",3);
    query.bindValue(":status",status_c);
    query.exec();
    if(status_c_e!=status_c)
    {





    }
    query.prepare("update autovalidate set hours=(:hd),minuts=(:md),status=(:status)  where sno=(:sno)");

    query.bindValue(":hd",hd);
    query.bindValue(":md",md);
    query.bindValue(":sno",4);
    query.bindValue(":status",status_d);
    if(status_d_e!=status_d)
    {





    }
    if(query.exec())
    {

        emit notify_me("Updated AutoValidate Changes","Auto_Validation",true);
    }

    qDebug()<<query.lastError()<<"insertingggg";

    readautovalidate();


}


void Back::getdateandtime()
{


    QDateTime dateTime = dateTime.currentDateTime();

    QString dt= dateTime.toString("dd/MM/yyyy hh:mm:ss");
    QString date=dt.mid(0,10);
    QString time=dt.mid(11,18);
    //qDebug()<<dateTime.toString("mm").toInt()<<dateTime.toString("mm").toInt()%2<<"Minuts Value";
    if(dateTime.toString("mm").toInt()%2==0&&dateTime.toString("ss").toInt()==0)
    {
        emit texttoqml(date,time,true);
    }
    else {
        emit texttoqml(date,time,false);
    }
    int i=0;
    //qDebug()<<time<<status_a_e<<hours_a<<dateTime.toString("hh").toInt()<<minuts_a<<(dateTime.toString("mm").toInt())+i<<dateTime.toString("mm").toInt()<<auto_validate_1;

    if(status_a_e==1&&hours_a==dateTime.toString("hh").toInt()&&minuts_a==dateTime.toString("mm").toInt()+i&&auto_validate_1==false)
    {
        //  qDebug()<<time;
        emit notify_me("Its time to Validate-1","Auto-Validate",false);
        auto_validate_1=true;
    }
    if(status_b_e==1&&hours_b==dateTime.toString("hh").toInt()&&minuts_b==dateTime.toString("mm").toInt()+i&&auto_validate_2==false)
    {

        emit notify_me("Its time to Validate-2","Auto-Validate",false);
        auto_validate_2=true;
    }
    if(status_c_e==1&&hours_c==dateTime.toString("hh").toInt()&&minuts_c==dateTime.toString("mm").toInt()+i&&auto_validate_3==false)
    {

        emit notify_me("Its time to Validate-3","Auto-Validate",false);
        auto_validate_3=true;
    }
    if(status_d_e==1&&hours_d==dateTime.toString("hh").toInt()&&minuts_d==dateTime.toString("mm").toInt()+i&&auto_validate_4==false)
    {

        emit notify_me("Its time to Validate-4","Auto-Validate",false);
        auto_validate_4=true;
    }
    // qDebug()<<dateTime.toString("hh")<<dateTime.toString("mm");

    //    b *bravo=new b();
    //   QList<int> qlist=bravo->fetch_auto_validate();
    //   for(int i=0;i<4;i++)
    //   {
    //    qDebug()<<qlist.at(i)<<"ohhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh";
    //       }


}
void Back::systemSetting(QString name, QString module)
{

    QString settingname=name;
    QSqlQuery ss;
    ss.prepare("CREATE TABLE IF NOT EXISTS systemsettings("
               "settingname varchar(15) UNIQUE, "
               "settingvalue varchar(15) UNIQUE);");
    ss.exec();
    ss.clear();
    if(ss.exec("INSERT INTO systemsettings(settingname,settingvalue)"
               "VALUES ('"+settingname+"','"+module+"')"))
    {

    }

}
//python2 /usr/share/doc/python-fingerprint/examples/example_enroll.py
void Back::ulist(int a)
{
    QString ab="";
    if(a==0)
    {
        ab="A";
    }
    else if(a==1)
    {
        ab="S";
    }
    else if(a==2)
    {
        ab="O";
    }

    QSqlTableModel model;
    model.setTable("usertable");
    model.setSort(1, Qt::AscendingOrder);
    model.select();

    for (int i = 0; i < model.rowCount(); ++i) {
        QString usernam = model.record(i).value("username").toString();

        if(usernam.startsWith(ab)==true)
        {
            usernam.remove(0,2);
            emit list(usernam);
        }



        // qDebug()<<i<<usernam;
    }
}

void Back::fetch(QString sorttype,QString   tname,QString from_string,QString to_string,bool check_from_to_date,QStringList sortt_list)
{

    emit machine_start_date(machine_startup_date);
    qDebug()<<sorttype<<tname<<from_string<<to_string<<check_from_to_date<<sortt_list<<sortt_list.size();

    QStringList tables_list;
    if(check_from_to_date)
    {
        tables_list=bhnu(from_string,to_string);
    }
    if(tables_list.size()==0)
    {
        if(tname=="today")
        {

            tables_list.append(tablename);
        }
        else
        {
            tables_list.append(tname);
        }
    }

    int exception=255;
    for(int j = 0; j<=tables_list.size()-1; ++j)
    {
        emit notify_me(tables_list.at(j),"",true);
        qDebug()<<tables_list.at(j)<<"table at: before";
        QSqlTableModel model;
        QString table_name=tables_list.at(j);
        model.clear();
        model.setTable(table_name);
        model.select();
        qDebug()<<tables_list.at(j)<<"table at: after";
        for (int i = 0; i < model.rowCount(); ++i)
        {
            QString id = model.record(i).value("id").toString();

            QString date = model.record(i).value("date").toString();//
            QString time = model.record(i).value("time").toString();
            QString user = model.record(i).value("user").toString();
            QString old = model.record(i).value("old").toString();
            QString neww = model.record(i).value("new").toString();
            QString remark = model.record(i).value("remark").toString();
            //qDebug()<<id<<date<<time<<user<<old<<neww<<remark<<"values";

            if(user=="")
            {
                user="-----";
            }
            if(old=="")
            {
                old="-----";
            }
            if(neww=="")
            {
                neww="-----";
            }
            if(sorttype!="All")
            {
                for(int k=0;k<sortt_list.size();k++)
                {
                    if(sortt_list.at(k)==remark)
                    {
                        emit fetchtoqml(date,time,user,old,neww,remark,false,id);

                    }
                }
            }
            else
            {
                //  qDebug()<<id<<date<<time<<user<<old<<neww<<remark<<"values";
                emit fetchtoqml(date,time,user,old,neww,remark,false,id);
            }
            if(i>0&&i%255==0)
            {
                model.clear();
                model.setTable(table_name);
                QString s="id>"+QString::number(exception);
                model.setFilter(s);
                model.select();
                exception=exception+256;
                qDebug()<<s<<exception<<"cleared model & count"<<model.rowCount();
                i=0;
            }



        }
    }
}

void Back::dlist()
{
    QSqlTableModel model;
    model.setTable("usertable");
    model.setSort(1, Qt::AscendingOrder);
    model.select();

    for (int i = 0; i < model.rowCount(); ++i) {
        QString usernam = model.record(i).value("username").toString();

        if(user==" ")
        {
            emit dellist(usernam);
        }
        else  if(user=="O")
        {
            emit dellist(usernam);
        }
        else if(user=="A")
        {
            emit dellist(usernam);
        }
        else if(user=="S")
        {
            if(usernam.startsWith("O"))
            {
                emit dellist(usernam);
            }
        }
    }
}
void Back::delet(QString username)
{

    QSqlQuery q1;
    if(q1.exec("select fpid from usertable where USERNAME='"+username+"'"))
    {
        while (q1.next()) {
            usern.clear();
            usern<< q1.value(0).toString();

            if(usern.size()>0)
            {
            qDebug()<<usern[0]<<"userlist";
            singledelete(usern[0].toInt());
            if(q1.exec("delete from usertable where USERNAME='"+username+"'"))
            {
                boo=true;
                emit uptodate(boo);
                qDebug()<<"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
                history("",username,"User Deleted");
                emit notify_me("SuccessFully User Deleted","USER",true);
            }

            }

        }

    }

}

void Back::update(QString username, QString newpassword)
{

    QSqlQuery qryy;
    if( qryy.exec("update usertable set password='"+newpassword+"' where username='"+username+"'"))
    {
        bool t=true;
        elist();
        emit verifyy(t);
        qDebug()<<qryy.lastError();
        history("",username,"User Update");
        emit notify_me("User Update Successful","USER",true);
    }
    else{
        bool t=false;
        emit verifyy(t);
        emit notify_me("User Update Failed","USER",false);
        elist();
    }

}
void Back::system_settings_cn(QString customerName)
{
    qDebug()<<user<<"userType";
    qDebug()<<customerName;
    QSqlQuery ab;
    if(ab.exec("update systemsettings set customername ='"+customerName+"' where sno='1'"))
    {
        emit notify_me("Customer Name Changed","Machine Settings",true);

        history(cn,customerName,"Customer Name Changed");
        cn=customerName;
        customer_details();
    }
    else{
        emit notify_me("Already Existed","Machine Settings",true);
    }


}

void Back::system_settings_Loc(QString location)
{
    qDebug()<<user<<"userType";


    QSqlQuery ab;
    if(ab.exec("update systemsettings set location ='"+location+"' where sno='1'")&&location!=loc)

    {
        emit notify_me("location Saved","Machine Settings",true);
        history(loc,location,"Customer Location Changed");
        loc=location;
        customer_details();
    }
    else{
        emit notify_me("Already Existed","Machine Settings",true);
    }

}




void Back::system_settings_mid(QString machineId)
{
    qDebug()<<user<<"userType";

    QSqlQuery ab;
    if(ab.exec("update systemsettings set machineid ='"+machineId+"' where sno='1'")&&machineId!=mid)

    {
        emit notify_me("Machine-ID Saved","Machine Settings",true);
        history(mid,machineId,"Machine-ID Changed");
        mid=machineId;
        customer_details();
    }

    else{
        emit notify_me("Already Existed","Machine Settings",true);
    }


}

void Back::suplier_name(QString supliernam)
{
    qDebug()<<user<<"userType";

    QSqlQuery ab;
    if(ab.exec("update systemsettings set supliername ='"+supliernam+"' where sno='1'")&&supliernam!=supliername)

    {
        emit notify_me("Suplier Name Changed","Machine Settings",true);
        history(supliername,supliernam,"Suplier Name Changed");
        supliername=supliernam;
        customer_details();
    }
    else{
        emit notify_me("Already Existed","Machine Settings",true);
    }

}



void Back::verify(QString username, QString password)
{
    qDebug()<<username<<password<<"str,pass";
    bool r=false;
    QString q11;    QSqlQuery ab;
    ab.prepare("select id FROM usertable where USERNAME='"+username+"' and PASSWORD='"+password+"'");

    ab.exec();
    usern.clear();
    while (ab.next()) {
        usern<< ab.value(0).toString();
        q11=usern[0];
        r=true;
        if(r==true)
        {
            emit usernametoqml(q11,true,username);
            user=q11;
            userName=username;
            history("","","Loged-in");
            emit notify_me("Successfully Loged-in","USER",true);
        }

    }
    if(r==false)
    {
        qDebug()<<"second";
        emit usernametoqml(user,true,userName);
        emit notify_me("Login Failed","USER",false);
    }
    qDebug()<<ab.lastError();

}

void Back::engine(QString a)
{
    if(a=="E")
    {
        user="E";
        userName="Engineer";
        history("","","Loged-in");
        emit notify_me("Engineer Loged-in","USER",true);
    }
    if(a=="A")
    {
        user="A";
        userName="Admin";
        history("","","Loged-in");
        emit notify_me("ADMIN Loged-in","USER",true);
    }
    emit usernametoqml(user,true,userName);

}
void Back::admin(QString username,QString password ,int mode)
{
    qDebug()<<username<<password<<mode<<"details";
    QSqlQuery q;

    if(mode==0)  //verify
    {
        bool r=false;
        QString q11;    QSqlQuery ab;
        ab.prepare("select id FROM default1 where user='"+username+"' and pass='"+password+"'");

        ab.exec();
        usern.clear();
        while (ab.next()) {
            usern<< ab.value(0).toString();
            q11=usern[0];
            r=true;

        }
        if(r==true)
        {
            emit usernametoqml(q11,true,username);
            user=q11;
            userName=username;

            emit notify_me("\""+userName+"\""+" Loged-in","USER",true);
            history("-----","-----","Loged-in");

        }
        else{
            emit notify_me("Wrong Password","USER",true);
        }

    }
    if(mode==1&&userName=="ADMIN")  //update
    {

        QSqlQuery qryy;
        if( qryy.exec("update default1 set pass='"+password+"' where user='"+username+"'"))
        {
            bool t=true;
            elist();
            emit verifyy(t);
            qDebug()<<qryy.lastError();
            history("-----","","User PW Changed");
        }

    }
}

void Back::add(QString id, QString username, QString password)
{
bool is_found=false;
    int aCount = username.count(QRegExp(reglarExp));
    int bCount = password.count(QRegExp(reglarExp));
    if(aCount==0&&bCount==0)
    {
        if(username.length()>=5){
            QString s=id;
            s=s.append("-");
            username=s.append(username);
            qDebug()<<id<<username<<password<<"detailsss";
            QString q1="";    QSqlQuery q;
            q.prepare("select username FROM usertable where username='"+username+"' COLLATE NOCASE");
            q.exec();
            while (q.next()) {
                if(!q.value(0).toString().isEmpty())
                {
                    is_found=true;
                    emit create(false);
                    emit notify_me("Choose Strong username","USER",true);

                }
            }

                if(!is_found){
                    q.prepare("select password FROM usertable where password='"+password+"' COLLATE NOCASE");
                    q.exec();
                    while (q.next()) {

                        if(! q.value(0).toString().isEmpty())
                        {
                           is_found =true;
                            emit create(false);
                            emit notify_me("Choose Strong username","USER",true);

                        }
                    }
                        if(!is_found)
                        {
                            qDebug()<<"Test 2 passed";
                           temp_id=id;
                           temp_username=username;
                           temp_password=password;
                           emit lunch_fp_screen(true);
                        }



            }


    }

    else {
        emit notify_me("Invalid Charectors Use Alpha-Numeric","USER",false);
    }
}

}
    void Back::time()
{
    QDateTime dateTime = dateTime.currentDateTime();
    QString a= dateTime.toString("dd/MM/yy hh:mm:ss");
    emit timer(a);
}

void Back::customer_details()
{
    emit  customer_details_to_qml(  cn,loc,supliername,mid);
}
void Back::elist()
{
    QSqlTableModel model;
    model.setTable("usertable");
    model.setSort(1, Qt::AscendingOrder);
    model.select();

    for (int i = 0; i < model.rowCount(); ++i) {
        QString usernam = model.record(i).value("username").toString();
        if(user==" ")
        {
            emit editlist(usernam);
        }
        else  if(user=="O")
        {
            emit editlist(usernam);
        }
        else if(user=="A")
        {
            emit editlist(usernam);
        }
        else if(user=="S")
        {
            if(usernam.startsWith("O"))
            {
                emit editlist(usernam);

            }
        }
    }
    emit mod();
}

void Back::finduser()
{
    emit usernametoqml(user,true,userName);
}
void Back::logout(bool h)
{
    if(h==true){
        emit usernametoqml(user,h,userName);
    }
    else
    {
        history("","","Loged-out");
        emit notify_me(userName+" User Logged-out","LOG-OUT",true);
        user="";
        userName="";
        emit usernametoqml(user,h,userName);
        emit solveuser(user,userName);

    }
}
void Back::pdf(QString sorttype,QString tname,QString username,QString password,int mode,QString from_string,QString to_string,bool check_from_to_date,QStringList sortt_list)
{
    // sorttype="M/c Switch ON";
    qDebug()<<tablename<<userName<<sorttype<<tname<<username<<password<<from_string<<to_string<<check_from_to_date;
    QStringList tables_list;
    if(check_from_to_date)
    {
        tables_list=bhnu(from_string,to_string);
    }
    QSqlQuery ab;


    int i=10;
    bool r=false;
    QString q11;
    int exception=255;
    int s_increment=0;
    if(username=="ADMIN"&&username!=password)
    {
        ab.prepare("select id FROM default1 where user='"+username+"' and pass='"+password+"'");

        ab.exec();
        usern.clear();
        while (ab.next()) {
            if(ab.value(0).toString()=="A")
            {
                r=true;
                emit notify_me("User Approved Done","USER",true);
            }
            else{
                emit notify_me("User Approved Failed","USER",false);
            }

        }
    }
    else if(username!=password)
    {
        ab.prepare("select id FROM usertable where USERNAME='"+username+"' and PASSWORD='"+password+"'");
        ab.exec();
        while (ab.next()) {
            usern<< ab.value(0).toString();
            r=true;
        }
        if(r==true&&username!=password)
        {
            emit notify_me("User Approved Done","USER",true);
        }
        else{
            emit notify_me("User Approved Failed","USER",false);
        }
    }

    if(user=="A")
    {
        i=250;
        r=true;
    }
    if(r==true&&userName!="")
    {
        QDateTime dateTimeee = dateTimeee.currentDateTime();
        QString aaaa= dateTimeee.toString("yy/MM/dd_hh/mm/ss");
        QString timetosql = aaaa.mid(9, 16);
        timee=timetosql;
        QString pdfname=mid+"_"+aaaa;
        pdfname=pdfname.replace("/","");
        //  qDebug()<<pdfname<<"traceing";
        tname=tname.replace("/","_");
        tname=tname.prepend("A_");
        QPrinter printer;
        printer.setOrientation(QPrinter::Portrait);
        printer.setPageSize(QPrinter::A4);
        printer.setOutputFormat(QPrinter::PdfFormat);
        printer.setOutputFileName(pdfname.append(".pdf"));
        QMargins bhanum=QMargins(40, 10, 10, 30);
        printer.setPageMargins(bhanum);
        QPainter painter;
        QColor c="black";
        QPen pen;
        pen.setWidth(12);//12
        pen.setColor(c);
        painter.setPen(pen);

        painter.begin(&printer);
        QSqlTableModel model;
        model.clear();
        int intpdf=20;
        QFont serifFont1("Arial", 10,QFont::Thin);
        serifFont1.setItalic(false);
        serifFont1.setBold(true);
        painter.setFont(serifFont1);
        if(tables_list.size()!=0)
        {
            //  qDebug()<<tables_list<<tables_list.size()<<"size";
            QString s=tables_list.at(0);
            s=s.remove("A");
            s=s.replace("_","/");
            painter.drawText(10,20,"From:"+s);
            s=tables_list.at(tables_list.size()-1);
            s=s.remove("A");
            s=s.replace("_","/");
            painter.drawText(600,20,"To:"+s);
        }
        else{
            QString s=tablename;
            s=s.remove("A");
            s=s.replace("_","/");
            painter.drawText(10,20,"From:"+tablename);
            painter.drawText(600,20,"To:"+tablename);


        }


        painter.drawText(190,intpdf,supliername);
        intpdf=intpdf+25;
        //line 2
        painter.drawText(10,intpdf,"Customer:  "+cn);
        painter.drawText(280,intpdf,"Location:  "+loc);
        painter.drawText(480,intpdf,"Machine ID: "+mid);
        intpdf=intpdf+25;
        QString datepdf=datee;
        QString temp=datepdf.append("   @ ").append(timee);
        temp.prepend("File Created On: ");
        painter.drawText(10,intpdf,temp);
        painter.drawText(280,intpdf,"Category:"+sorttype);
        int pagecount=1;
        int totalpagecount=1;
        int iteration=50;
        int totalpagecount1=totalpagecount%iteration;
        // totalpagecount=model.rowCount()/iteration;     //row countttttt
        if(totalpagecount1!=0)
        {
            totalpagecount=totalpagecount+1;
            QString temp1=QString::number(pagecount);
            QString temp2=QString::number(totalpagecount);
            temp2="XXX";
            QString temp3=temp1+"/"+temp2;
            painter.drawText(480,intpdf,"Page No: "+temp3);
            serifFont1.setPointSize(9);
            painter.setFont(serifFont1);
            painter.drawText(i,1080,"Audit Trail Generated By: "+userName);
            if(i==10)
            {
                painter.drawText(450,1080,"Audit Trail Approved By : "+username);
            }
        }
        else
        {
            QString temp1=QString::number(pagecount);
            QString temp2=QString::number(totalpagecount);
            QString temp3=temp1+"/"+temp2;
            painter.drawText(550,intpdf,temp3);
        }

        painter.drawLine(0,intpdf+10,700,intpdf+10);

        //line 3 header
        intpdf=intpdf+30;
        serifFont1.setPointSize(8);//9
        serifFont1.setBold(true);
        painter.setFont(serifFont1);
        painter.drawText(10,intpdf,"Sr/No.");
        painter.drawText(50,intpdf,"Date");
        painter.drawText(130,intpdf,"Time");
        painter.drawText(200,intpdf,"User ID");
        painter.drawText(310,intpdf,"Old Value");
        painter.drawText(410,intpdf,"New Value");
        painter.drawText(550,intpdf,"Details");
        serifFont1.setBold(false);
        painter.setFont(serifFont1);
        qDebug()<<totalpagecount<<"counting.."<<sorttype;
        if(tables_list.size()==0)
        {
            tables_list.append(tablename);
        }


        if(sorttype=="All")
        {

            for(int j = 0; j<=tables_list.size()-1; ++j)
            {
                emit notify_me(tables_list.at(j),"",true);
                qDebug()<<tables_list.at(j)<<"table at:";
                model.clear();
                QString table_name=tables_list.at(j);
                model.setTable(table_name);
                model.select();
                for (int i = 0; i < model.rowCount(); ++i)
                {
                    QString date = model.record(i).value("date").toString();
                    QString time = model.record(i).value("time").toString();
                    QString usertname = model.record(i).value("user").toString();
                    QString old =  model.record(i).value("old").toString();
                    QString neww = model.record(i).value("new").toString();
                    QString remark = model.record(i).value("remark").toString();
                    s_increment=s_increment+1;

                    if(s_increment<iteration)
                    {
                        intpdf=intpdf+19;
                    }
                    else
                    {
                        if(s_increment/iteration==pagecount)
                        {
                            pagecount=pagecount+1;
                            printer.newPage();
                            QString temp1=QString::number(pagecount);
                            QString temp2=QString::number(totalpagecount);
                            QString temp3=temp1+"/"+temp2;
                            painter.setFont(serifFont1);
                            serifFont1.setBold(true);
                            painter.setFont(serifFont1);
                            intpdf=40;
                            painter.drawText(10,intpdf,"Sr/No.");
                            painter.drawText(50,intpdf,"Date");
                            painter.drawText(130,intpdf,"Time");
                            painter.drawText(200,intpdf,"User ID");
                            painter.drawText(310,intpdf,"Old Value");
                            painter.drawText(410,intpdf,"New Value");
                            painter.drawText(550,intpdf,"Details");
                            painter.drawText(480,10,"Page No: "+temp3);

                            if(s_increment%50==0)
                            {
                                if(user=="A")
                                {
                                    painter.drawText(250,1080,"Audit Trail Generated By: "+userName);
                                }
                                else{
                                    painter.drawText(s_increment,1080,"Audit Trail Generated By: "+userName);
                                    painter.drawText(450,1080,"Audit Trail Approved By : "+username);
                                }

                            }
                            serifFont1.setBold(false);
                            painter.setFont(serifFont1);
                        }
                        intpdf=intpdf+20;
                    }

                    QString a=QString::number(s_increment);

                    painter.drawText(10,intpdf,a);

                    painter.drawText(50,intpdf,date);


                    painter.drawText(130,intpdf,time);

                    painter.drawText(200,intpdf,usertname);

                    painter.drawText(310,intpdf,old);


                    painter.drawText(410,intpdf,neww);


                    painter.drawText(550,intpdf,remark);

                    // qDebug()<<date<<time<<usertname<<old<<neww<<remark<<printer.width()<<"Alll";
                    if(i>0&&i%255==0)
                    {
                        model.clear();
                        model.setTable(table_name);
                        QString s="id>"+QString::number(exception);
                        model.setFilter(s);
                        model.select();
                        exception=exception+256;
                        //qDebug()<<s<<exception<<"cleared model & count"<<model.rowCount();
                        i=0;
                    }

                }
            }

        }
        else
        {
            for(int j = 0; j<=tables_list.size()-1; ++j)
            {
                emit notify_me(tables_list.at(j),"",true);
                qDebug()<<tables_list.at(j)<<"table at:";
                model.clear();
                QString table_name=tables_list.at(j);
                model.setTable(table_name);

                // model.setFilter("remark="+sorttype);
                model.select();
                for (int i = 0; i < model.rowCount(); ++i)
                {
                    QString date = model.record(i).value("date").toString();
                    QString time = model.record(i).value("time").toString();
                    QString usertname = model.record(i).value("user").toString();
                    QString old =  model.record(i).value("old").toString();
                    QString neww = model.record(i).value("new").toString();
                    QString remark = model.record(i).value("remark").toString();
                    for(int k=0;k<sortt_list.size();k++)
                    {
                        if(sortt_list.at(k)==remark)
                        {
                            s_increment=s_increment+1;
                            if(s_increment<iteration)
                            {
                                intpdf=intpdf+19;
                            }
                            else
                            {
                                if(s_increment/iteration==pagecount)
                                {
                                    pagecount=pagecount+1;
                                    printer.newPage();
                                    QString temp1=QString::number(pagecount);
                                    QString temp2=QString::number(totalpagecount);
                                    QString temp3=temp1+"/"+temp2;
                                    painter.setFont(serifFont1);
                                    serifFont1.setBold(true);
                                    painter.setFont(serifFont1);
                                    intpdf=40;
                                    painter.drawText(10,intpdf,"Sr/No.");
                                    painter.drawText(50,intpdf,"Date");
                                    painter.drawText(130,intpdf,"Time");
                                    painter.drawText(200,intpdf,"User ID");
                                    painter.drawText(310,intpdf,"Old Value");
                                    painter.drawText(410,intpdf,"New Value");
                                    painter.drawText(550,intpdf,"Details");
                                    painter.drawText(480,10,"Page No: "+temp3);

                                    if(s_increment%50==0)
                                    {
                                        if(user=="A")
                                        {
                                            painter.drawText(250,1080,"Audit Trail Generated By: "+userName);
                                        }
                                        else{
                                            painter.drawText(s_increment,1080,"Audit Trail Generated By: "+userName);
                                            painter.drawText(450,1080,"Audit Trail Approved By : "+username);
                                        }

                                    }
                                    serifFont1.setBold(false);
                                    painter.setFont(serifFont1);
                                }
                                intpdf=intpdf+20;
                            }


                            painter.drawText(10,intpdf,QString::number(s_increment));
                            painter.drawText(50,intpdf,date);
                            painter.drawText(130,intpdf,time);
                            painter.drawText(200,intpdf,usertname);
                            painter.drawText(310,intpdf,old);
                            painter.drawText(410,intpdf,neww);
                            painter.drawText(550,intpdf,remark);

                            // qDebug()<<date<<time<<usertname<<old<<neww<<remark<<printer.width()<<"Alll";
                            if(i>0&&i%255==0)
                            {
                                model.clear();
                                model.setTable(table_name);
                                QString s="id>"+QString::number(exception);
                                model.setFilter(s);
                                model.select();
                                exception=exception+256;
                                //qDebug()<<s<<exception<<"cleared model & count"<<model.rowCount();
                                i=0;
                            }

                        }
                    }

                }
            }
        }
        painter.end();

        emit notify_me("SuccessFully PDF created","PDF",true);

    }

}
void Back:: history(QString old,QString newww ,QString remark )
{
    //    QSqlDatabase  db1 = QSqlDatabase::addDatabase("QSQLITE");
    //      db1.setDatabaseName("DataBase.db");
    QDateTime dateTimeee = dateTimeee.currentDateTime();
    QString aaaa= dateTimeee.toString("dd/MM/yyyy hh:mm:ss");
    QString timetosql = aaaa.mid(11, 16);
    qDebug()<<timetosql<<"time find out";
    QSqlQuery query;

    query.prepare("INSERT INTO '"+tablename+"'(date,time,user,old,new,remark) "
                                            "VALUES (:date,:time,:user,:old,:new,:remark)");
    query.bindValue(":date", datee);
    query.bindValue(":time", timetosql);
    query.bindValue(":user", userName);
    query.bindValue(":old", old);
    query.bindValue(":new",newww);
    query.bindValue(":remark", remark);
    query.exec();
    qDebug()<<query.lastError()<<"last error";
    QStringList list;
    //fetch("All","today","","",false);
}

void Back::createTable()
{
    QSqlQuery query;
    QDateTime dateTime = dateTime.currentDateTime();
    QString aa= dateTime.toString("dd/MM/yyyy hh:mm:ss");
    aa=aa.mid(0,10);
    datee=aa;
    aa=aa.replace("/","_");
    tablename=aa.prepend("A_");

    query.prepare("CREATE TABLE '"+tablename+"'("
                                             "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                             "date varchar(15) , "
                                             "time varchar(15), "
                                             "user varchar(10) , "
                                             "old varchar(10) , "
                                             "new varchar(10) , "
                                             "remark varchar(10));");
    this_day= dateTime.toString("dd").toInt();
    this_month= dateTime.toString("MM").toInt();
    this_year= dateTime.toString("yyyy").toInt();
    if(query.exec())
    {

        query.prepare("INSERT INTO listoftables(tablename,day,month,year) "
                      "VALUES (:tablename,:day,:month,:year)");

        query.bindValue(":tablename",tablename);
        query.bindValue(":day", this_day);
        query.bindValue(":month",this_month);
        query.bindValue(":year", this_year);
        query.exec();

    }

    QSqlTableModel model;
    model.clear();
    model.setTable("listoftables");
    model.select();
    model.setSort(1, Qt::AscendingOrder);
    machine_startup_date.setDate(model.record(0).value("year").toInt()
                                 ,model.record(0).value("month").toInt()
                                 ,model.record(0).value("day").toInt());




    qDebug()<<query.lastError()<<machine_startup_date.toString()<<" tablename error";
    QStringList tables_list=bhnu("A_14_05_2021","A_19_05_2021");
    for(int i = 0; i<=tables_list.size()-1; ++i)
    {

        qDebug()<<tables_list.at(i)<<"table at:"<<i;
    }
    // bhnu("A_14_05_2021","A_19_05_2021");
}
