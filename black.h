#ifndef BLACK_H
#define BLACK_H
#include <QObject>
#include <QSqlDatabase>
#include<QStringList>
#include <QStringListModel>
#include<QTimer>
#include<QDate>
#include <QObject>
#include <QAbstractTableModel>
#include<QSerialPort>
#include<QtMultimedia/QSound>
#include<QProcess>
#include<QtNetwork/QNetworkAccessManager>
#include<QNetworkReply>
class Back:public QObject
{
    Q_OBJECT
public:
    explicit Back(QObject *parent = nullptr);
signals:
    void machine_start_date(QDate machine_start_date_cpp);
    void auto_validate_to_qml(int ha,int maa,int hb,int mb,int hc,int mc,int hd,int md,int he,int me,int hf,int mf);
    void lunch_fp_screen(bool is_it_lunch_fp_screen);
    void texttoqml(QString date,QString time,bool reset_counter);
     void fetchtoqml(QString date,QString time,QString user,QString old,QString neww,QString remark,bool b,QString row_count);
   void list(QString str1);
     void dellist(QString str1);
      void editlist(QString str1);
    void timer(QString s);
    void uptodate(bool up);
   void create(bool b);
   void usernametoqml(QString user_type_cpp,bool correct,QString username);
    void mod();
    void verifyy(bool t);
    void solveuser(QString s,QString uname);
    void notify_me(QString notify,QString cat,bool co);
   void customer_details_to_qml(  QString cn, QString loc,QString supliername,QString mid);
  void finger_got_score(QString finger_got_score,bool status_of_finger,int type_of_status);
  void finger_enroll_status_messege(QString finger_got_score,bool status_of_finger);
public slots:

       void autovalidate(int ha,int ma,int hb,int mb,int hc,int mc,int hd,int md,int he,int me,int hf,int mf);
   void readautovalidate();
void getdateandtime();
   void entrol();
   void detect1();
   void ch1();
   void ch2();
   void create();
   void store(int id);
   void deleteall();
   void match();
   void getscore();
   void search_existed_or_not();
   void singledelete(int id);
   void read_from_fp_serial_port();


   void deletee_fp(int i);
   void search_fp();
   void delete_index_slot(QString i);
    void systemSetting(QString name,QString module);
   void verify(QString username , QString password);
void add(QString id,QString username , QString password);
   void time();
   void customer_details();
   void delet(QString username);
   void update(QString username , QString newpassword);
void system_settings_cn(QString customerName);
void system_settings_Loc(QString location);
void system_settings_mid(QString machineId);
void suplier_name(QString supliername);
   void  history(QString old,QString newww ,QString remark );
  void ulist(int a);
  void fetch(QString sorttype,QString tname,QString from_date,QString to_date,bool b,QStringList sort_list);
  void dlist();
  void elist();

  void createTable();
  void finduser();
  void logout(bool tr);

  void pdf(QString sorttype,QString tname,QString username,QString password,int mode,QString from_date,QString to_date,bool check_from_to_date,QStringList sortt_list);
  void engine(QString a);
  void admin(QString username,QString password,int mode);

  public:
 QSerialPort serial_finger_print;
 QTimer *finger_timer;
   QString bufferstring_for_fp;
 QString finger_returns_header="ef01ffffffff070003";

 QString finger_returns_match_header="ef01ffffffff070005";
 QString finger_returns_search_header="ef01ffffffff070007";
 QString which_is_in_active="";
 QString delete_all_fp="delete_all_fp";
 QString single_delete_fp="single_delete_fp";
 QString match_is_active="match_is_active";
 QString detect_is_active="detect_is_active";
 QString gen_image1="gen_image1";
 QString gen_image2="gen_image2";
 QString create_templete="create_templete";
 QString store_templete="store_templete";
 QString search_finger="search_finger";
 QString get_score="get_score";
 bool image_1_generated_or_not=false;
};

#endif // BLACK_H
