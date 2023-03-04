#ifndef B_H
#define B_H
#include <QObject>
#include <QAbstractTableModel>
#include<QSerialPort>
#include<QtMultimedia/QSound>
#include<QProcess>
#include<QtNetwork/QNetworkAccessManager>
#include<QNetworkReply>
class b:public QObject
{
    Q_OBJECT
public:
    explicit b(QObject *parent = nullptr);
    signals:
void default_values_to_qml(int thresh_qml,int amplitude_qml,qreal phase_qml,
                           qreal freq_qml,int power_qml,qreal power_factor_qml,
                           qreal dg_qml,int analoggain_qml ,int drivepower_qml,int status_v);
void texttoqml(QString date,QString time);
void keysignal(qreal key);
void sendtoqml(QString string);
 void readyRead();
 void editstatus(bool bs);
 void deletestatus(bool bs);
 void saveto(int a, int bb);
 void ans(int a, int b,QString c,QString d);
 void group1(int counter);
 void librarydatalist(int sno_q,int gno_q,QString pname_q, QString pcode_q,int signal_q,
                      int amplitude_q,qreal phase_q,qreal digitalgain_q,int analoggain_q,
                      int drivepower_q,qreal ddfreq_q,qreal ddpowerfactor_q,
                      int ddpower_q,QString active_status_11);//del
  void ss1(int xyz);
 void ss2(int bz);
 void ss3(int cz);
 void bo(bool conform);
 void just1(int ju);
void send_active_details_to_qml_signal(int grno_A, int srno_A);
 void notify_me(QString notify,QString cat,bool co);
 void valid_value(QString value_s);

void where_i_am(QString iam);
void emit_bright(int lumancy);
 void mountedcount(int sd);
 void keysignal1(float key);
void mountedListtoqml(QString pathnam);

void dd_on_off_to_qml(bool dd_status);

void filter_values_toqml(int lPF1,int lPF2,int hPF1,int hPF2,int operatedelayvalue,int holddelayvalue,qreal digitalgainvalue,qreal analoggainvalue);

void get_emit_thresh_hold_signal(int get_emit_thresh_hold_signal);
void get_emit_thresh_hold_phase(int get_emit_thresh_hold_phase);
void get_emit_thresh_hold_amplitude(int get_emit_thresh_hold_amplitude);
void get_emit_thresh_hold_coil_output(int get_emit_thresh_hold_coil_output);


void get_defect_emit_thresh_hold_signal(int get_defect_emit_thresh_hold_signal);
void get_defect_emit_thresh_hold_phase(int get_defect_emit_thresh_hold_phase);
void get_defect_emit_thresh_hold_amplitude(int get_defect_emit_thresh_hold_amplitude);
void get_defect_emit_thresh_hold_coil_output(int get_defect_emit_thresh_hold_coil_output);
void wow(QString whoa);
public slots:


QList<int>  fetch_auto_validate();



void readFromSerialPort();
void createDefaultProduct();
void toggle_is_first_time_boot();
void print_to_device(QString name);
void default_values(int a);
void default_values(int a,int b);


void default_thresh_hold( int b);
void default_amplitude(int b);
void default_phase(qreal b);
void notify_to_qml_from_qml(QString s,bool b);
void default_dd_freq(qreal b);
void default_dd_power_factor(qreal b);
void default_dd_power(int freq);
void default_digital_gain(qreal b);
void default_analog_gain(int b);
void default_drive_power(int b);



void who_i_am(QString s);
void shutdownandrestart(int i);
void dD_on_off(bool b);
void powerFactor(qreal a,qreal b);
 void update();
void readbrightness();
void writebrightness(int bright);
void mount();
void mountedList();
void copy(int i,QString filenamepdf);
void grabActiveProduct(int a);
      void elist(int a);//del
      void createandinsertintogroup(int a,QString b, QString c,int signalt,
                                    int amplitude,qreal phase,qreal digitalgain,int analoggain,
                                    int drivepower,qreal ddfreq,qreal ddpowerfactor,
                                    int ddpower);
      void load(int groupno, int b);
      void save();
      void editlibrary(int sno,int a, QString pname,QString pcode,int signalt,
                       int amplitude,qreal phase,qreal digitalgain,int analoggain,
                       int drivepower,qreal ddfreq,qreal ddpowerfactor,
                      int ddpower,int status);
      void deleteproduct(int z,int ci);
      void just(int a);
      void usertrouble(QString type,QString user);
      void s0(int old);
      void s1(int old);
      void s2(int a);  //coil_output
      void s3(int old,int neww);  //signal
      void s4(qreal old,qreal a);  //amplitude
      void s5(int old,int neww);  //phase
      void analog_gain(double old,double neww);
      void digital_gain(double old,double neww);
      void dd_power_factor(double old,double neww,bool b);
      void dd_power(int old,int neww,bool b);
      void dd_frequency(double old,double neww,bool b);


      void cp(int a);
        void share_on_serialport(QString data,QString code);
      void slide1(int s1);
      void slide2(int s2);
      void slide3(int s3);
      void tsd(int i,int j,int z);
        void  history(QString old,QString newww ,QString remark );

void keyboardData1(QString key);
void keyboardData(QString key);

void send_active_details_to_qml();
void filter_values(int lPF_1,int lPF_2,int hPF_1,int hPF_2,int operate_delay_value,int hold_delay_value,qreal digital_gain_value,qreal analoggain_value);
void fetch_filter_values();
private:

QNetworkReply *replay;
QNetworkAccessManager *manager;
qreal temp_keyboard_value_int;
QString temp_keyboard_value="";
QString byteString="";
QString which_enum_is_in_active="";
 QString normal_Data_Strore="";
 QString enum_normal_Data_Strore="enum_normal_Data_Strore";
 QString enum_defect_Data_Strore="enum_defect_Data_Strore";
 QString enum_auto_Data_Strore="enum_auto_Data_Strore";
 QSerialPort qs;
QStringList usern;//del

//active products

int active_gr_no=0;
int active_sr_no=0;
//active


int a=0;
int q=0;
int qq=-1;
bool bb=false;

QString new_active_groupname="-----";
QString user="";
QString tablename="";
QString datee="";
QString type="";
QString bufferstring="";
int tablesize=0;
   int pin23, pin24;
   qreal PF=20;
   qreal DD_FREQ=50;
   int count_of_group_items=100;
bool blink =true;
    int bytecount=0;
     int usb_storage_count=0;
    QStringList qslist={};
    int rejection_count=0;
    int fd;
    QString reglarExp="[]";
    QString pname_A;
    QString pcode_A;
    int ddpower_value;
     qreal digitalgain_value;
    qreal ddpowerfacter_value;
    qreal ddfrequency_value;
       qreal phase_value;
       int amplitude_value;
         int signal_value;
          int drivepower_value;
          int analoggain_value;

          bool is_first_time_boot=true;
          bool is_first_time_to_qml=true;

          int hours_a,minuts_a,hours_b,minuts_b,hours_c,minuts_c,hours_d,minuts_d,status_a_e,status_b_e,status_c_e,status_d_e;
};

#endif // B_H
