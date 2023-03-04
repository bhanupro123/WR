import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick 2.9
import QtQuick.Window 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
//import QtQuick 2.15
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtMultimedia 5.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2
Rectangle{
    width: 800
    height: 480//stack_A.height
    color: "#ffffff"
    property int selected_user_type_SlectUserType:3
        property bool is_popup_opened: false
    property int selected_which_action_of_user_form:-1
        property string selected_current_user_from_select_profile: ""
    property Component login_screen: Login{}
     property Component finger_print_scan: FingerPrintScreen{}
    property Component select_profile_screen:SelectUserType{}
    property Component userMenu: UserMenu{}
    property Component create_User: Create_User{}
property Component login_qml: Login{}
property Component edit_user: Edit_User{}
property Component delete_user: Delete_User{}
    property Component go:Settings_main{}
    property Component copy:Copyy{}
    property Component swipe_main:Swipe_main_Screen{}
    property Component ulogin:Ulogin{}
    property Component lib:Library{}
    property Component his:History{}
    property Component ss: System_settings{}
    property Component fs: Factory_Settings{}
    property Component lp:Load_Product_More{}

        property string heck: ""
    Connections{
        target: lib1
        onWow:{
            textArea.text=heck.concat(whoa)
        }

        onSendtoqml:{
            Qt.quit()
        }
        onNotify_me:{
          //  console.log(notify,"notification")
            if(co==true)
            {
                notify_me.color="blue"
            }
            else{
                     notify_me.color="red"
            }

            notify_me.text=notify
        //
            timenotify.restart()
        }
        onWhere_i_am:{
            where_i_am=iam
            if(iam=="us")
            {
                line3.text="User Settings"
            }
            else if (iam=="uo")
            {
                line3.text="USB Operations"
            }
            else if (iam=="sm")
            {
                line3.text="Selection Menu"
            }
            else if (iam=="pl")
            {
                line3.text="Product Library"
            }
            else if (iam=="at")
            {
                line3.text="Audit Trail Data"
            }
            else if (iam=="ss")
            {
                line3.text="System Settings"
            }
            else if (iam=="fs")
            {
                line3.text="Factory Settings"
            }
            else if (iam=="lp")
            {
                line3.text="Load Product"
            }
            else if (iam=="vs")
            {
                line3.text="Validation Settings"
            }
            else
            {

            }
        }
        onMountedcount:{
            if(sd>5)
            {
                name.color="white"
                ma_usb.enabled=true
            }
            else
            {
                name.color="grey"
                ma_usb.enabled=true
            }

        }


        onAns:{
            if(a<10)
            {
                if(b<10)
                {
                      product_name.text="Product: "+"0"+a+"-00"+b+".  "+c
                    product_code.text="Code: "+d
                }
                else if(b<100&&b>=10)
                {
                    product_name.text="Product: "+"0"+a+"-0"+b+".  "+c
                product_code.text="Code: "+d
                }
                else
                {
                    product_name.text="Product: "+"0"+a+"-"+b+".  "+c
                    product_code.text="Code: "+d
            }
            }
           else if(a==10)
            {
                    product_name.text="Product: "+a+" - "+b+".  "+c+"  "+d
                    product_code.text="Code: "+d
            }
        }

    }

    Connections{
        target: bhanu
        onTexttoqml:{
//            console.log(username_predict," = ",usertype_predict)
            date_qml.text=date+"\n"+time
            time_store=time
            date_qml1.text=date
            time_qml.text=time
            if(!reset_counter)
            {
                limit_count_entered=false
            }
   // lib1.history("-----",five_minut_reject_count+"/"+reject_count_since_power_ON,"RC/Total RC")
            //select count(*) from A_13_05_2021;
         //   console.log(reset_counter,five_minut_reject_count,"debugging....")
            if(five_minut_reject_count>0&&reset_counter==true&&limit_count_entered==false)
            {
                limit_count_entered=true
                lib1.history("-----",five_minut_reject_count+"/"+reject_count_since_power_ON,"RC/Total RC")
                five_minut_reject_count=0
            }

        }

        onNotify_me:{
            if(co==true)
            {
                notify_me.color="blue"
            }
            else{
                     notify_me.color="red"
            }
            if(cat=="Auto-Validate")
            {
            notify_model.append({

                                    "time": time_store,
                                    "title": notify,
                                    "category": cat
                                })
            }
            notify_me.text=notify
            timenotify.restart()
        }
     onUsernametoqml:{
          username_predict=username
            usertype_predict=user_type_cpp

            if(usertype_predict=="E")
            {
                time_out_rect.enabled=true
                canvas_time.visible=true
                canvas_time.enabled=true
                userid.text="User :\n"+username_predict
                     timeout_value=180
                     timer.restart()
            }
            if(usertype_predict=="A")
            {
                 time_out_rect.enabled=true
                canvas_time.visible=true
                canvas_time.enabled=true
                userid.text="User :\n"+username_predict
                timeout_value=180
                timer.restart()
                ma.enabled=false
            }
            if(usertype_predict=="S")
            {
                 time_out_rect.enabled=true
                canvas_time.visible=true
                canvas_time.enabled=true
                userid.text="User :\n"+username_predict
                timer.restart()
                timeout_value=180
                ma.enabled=false
            }
            if(usertype_predict=="O")
            {
                 time_out_rect.enabled=true
                canvas_time.visible=true
                canvas_time.enabled=true
              userid.text="User :\n"+username_predict
                timer.restart()
                timeout_value=180
                ma.enabled=false
            }
            if(usertype_predict=="E")
            {
                 time_out_rect.enabled=true
                canvas_time.visible=true
                canvas_time.enabled=true
             userid.text="User :\n"+username_predict
                timer.restart()
                timeout_value=180
                ma.enabled=false
            }
            if(usertype_predict=="")
            {
                 time_out_rect.enabled=false
                canvas_time.visible=false
                canvas_time.enabled=false
             userid.text="User :"+username_predict
                timer.stop()
                timeout_value=180
                ma.enabled=true

            }


        }
    }

Rectangle{
    id: rectangle
   anchors.fill: parent


   SequentialAnimation
     {
        running: true
    ParallelAnimation
     {
           NumberAnimation { target:w; property: "y"; to: 120; duration: 900 }
           NumberAnimation { target: i ;property: "y"; to: 120;  duration: 600}
           RotationAnimation{target: i ;property: "rotation"; to: 0;  duration: 1000}
           RotationAnimation{target: i ;property: "rotation"; to: 275;  duration: 800}

           NumberAnimation { target: n; property: "y"; to: 120; duration: 900 }
           RotationAnimation{target: r;property: "rotation"; to: 0;  duration: 1000}
           RotationAnimation{target: r;property: "rotation"; to: 275;  duration: 800}
           NumberAnimation { target:r; property: "y"; to: 120;  duration: 500 }

           NumberAnimation { target: e ;property: "y"; to: 120;  duration: 600 }
           NumberAnimation { target: n2; property: "y"; to: 120;  duration: 1000}
           RotationAnimation{target: n2 ;property: "rotation"; to: 260;  duration: 700}
           RotationAnimation{target: n2 ;property: "rotation"; to: 0;  duration: 850}

           NumberAnimation { target:d; property: "y"; to: 120;  duration: 900}
           RotationAnimation{target: d ;property: "rotation"; to: 0;  duration: 1000}
           RotationAnimation{target: d ;property: "rotation"; to: 275;  duration: 800}
           NumberAnimation { target: e2 ;property: "y"; to: 120; duration: 1000 }

            NumberAnimation { target:r2; property: "y"; to: 120; duration: 900 }
            RotationAnimation{target: r2 ;property: "rotation"; to: 245;  duration: 600}
             RotationAnimation{target: r2 ;property: "rotation"; to: 0;  duration: 800}


             //system LLp

             NumberAnimation { target:s; property: "y"; to: 120; duration: 900 }
             NumberAnimation { target: yy ;property: "y"; to: 120;  duration: 600}
             RotationAnimation{target: yy;property: "rotation"; to: 0;  duration: 1000}
             RotationAnimation{target: yy ;property: "rotation"; to: 275;  duration: 800}

             NumberAnimation { target: s2; property: "y"; to: 120; duration: 900 }
             RotationAnimation{target: t;property: "rotation"; to: 0;  duration: 1000}
             RotationAnimation{target: t;property: "rotation"; to: 275;  duration: 800}
             NumberAnimation { target:t; property: "y"; to: 120;  duration: 500 }

             NumberAnimation { target: e3 ;property: "y"; to: 120;  duration: 600 }
             NumberAnimation { target: m; property: "y"; to:120;  duration: 1000}
             RotationAnimation{target: m ;property: "rotation"; to: 260;  duration: 700}
             RotationAnimation{target: m ;property: "rotation"; to: 0;  duration: 850}
NumberAnimation { target: s_2 ;property: "y"; to:120; duration: 1000 }

             NumberAnimation { target:l; property: "y"; to: 120;  duration: 900}
             RotationAnimation{target: l ;property: "rotation"; to: 0;  duration: 1000}
             RotationAnimation{target: l ;property: "rotation"; to: 275;  duration: 800}
             NumberAnimation { target:l1; property: "y"; to: 120;  duration: 1000}
             RotationAnimation{target: l1 ;property: "rotation"; to: 0;  duration: 1000}
             RotationAnimation{target: l1 ;property: "rotation"; to: 275;  duration: 800}
             NumberAnimation { target: dot ;property: "y"; to:120; duration: 1000 }

              NumberAnimation { target:p; property: "y"; to: 120; duration: 1000 }
              RotationAnimation{target: p ;property: "rotation"; to: 245;  duration: 600}
               RotationAnimation{target: p ;property: "rotation"; to: 0;  duration: 800}

           }

    ParallelAnimation
     {
           NumberAnimation { target:w; property: "y"; to: 66; duration: 900 }
            NumberAnimation { target:i; property: "y"; to: 66; duration: 900 }
             NumberAnimation { target:n; property: "y"; to: 66; duration: 900 }
              NumberAnimation { target:r; property: "y"; to: 66; duration: 900 }
               NumberAnimation { target:e; property: "y"; to: 66; duration: 900 }
               NumberAnimation { target:n2; property: "y"; to: 66; duration: 900 }
               NumberAnimation { target:d; property: "y"; to: 66; duration: 900 }
                NumberAnimation { target:e2; property: "y"; to: 66; duration: 900 }
                NumberAnimation { target:r2; property: "y"; to: 66; duration: 900 }
NumberAnimation { target: s_2 ;property: "y"; to:66; duration: 1000 }
                NumberAnimation { target:s; property: "y"; to: 66; duration: 900 }
                 NumberAnimation { target:yy; property: "y"; to: 66; duration: 900 }
                 NumberAnimation { target:s2; property: "y"; to: 66; duration: 900 }

                 NumberAnimation { target:t; property: "y"; to: 66; duration: 900 }
                  NumberAnimation { target:e3; property: "y"; to: 66; duration: 900 }
                  NumberAnimation { target:m; property: "y"; to: 66; duration: 900 }

                  NumberAnimation { target:l; property: "y"; to: 66; duration: 900 }
                   NumberAnimation { target:l1; property: "y"; to: 66; duration: 900 }
                   NumberAnimation { target:p; property: "y"; to: 66; duration: 900 }

                   NumberAnimation { target:dot; property: "y"; to: 66; duration: 900 }
     }

     }
    Timer{
        id:detect_timer
        running: false
        repeat: false
        interval: 600
        onTriggered:{


            if(!is_validation_running&&which_item_status!=3)
            {
            reject_count_since_power_ON=reject_count_since_power_ON+1
            five_minut_reject_count=five_minut_reject_count+1
            }
            if(which_item_status==3)
            {
                is_validation_running=false
                which_item_status=0
            }

            metal_detected.visible=false   //RED
            image.visible=true   //BLUE

        }
    }

    Timer{
        id:click_timer
        running: false
        repeat: false
        interval: 400
        onTriggered: {
            click_count=0
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            click_timer.restart()
            click_count=click_count+1
            if(click_count==3)
            {
                rectangle.visible=false
                rectangle.enabled=false
                miniparent.visible=true
                miniparent.enabled=true
            }
        }

     Rectangle{
         id:md
         anchors.centerIn: parent
         width:parent.width*0.8
         height: 184
         radius: 20
      color: "#002ea3"

           Rectangle{

                 width:parent.width*0.8
                 height: 184
                 radius: 20
                 id:image
                 x: 20
                 anchors.verticalCenterOffset: 0
                 anchors.horizontalCenterOffset: 0
                 color: "#002ea3"
                 Text {
                     id: w
                     x: 115
                     y: -80
                     color: "#ffffff"
                     text:"W"
                         font.family: "Piboto Condensed"
                     font.bold: true
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter

                 }
                 Text {
                     id: i
                     x: 142
                 y: -80
                    font.family: "Piboto Condensed"
                     width: 14
                     height: 53
                     color: "#ffffff"
                     text:"i"
                     font.bold: true
                     font.pointSize:30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter

                 }
                 Text {
                     id: n
                     x: 156
                   y: -80
                   font.family: "Piboto Condensed"
                     text:"n"
                     font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: r
                     x: 176
                  y: -80
                  font.family: "Piboto Condensed"
                     text:"R"
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: e
                     x: 199
                    y: -80
                    font.family: "Piboto Condensed"
                     text:"e"
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: n2
                     x: 218
                     y: -80
                     text:"n"
                     font.family: "Piboto Condensed"
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: d
                     x: 238
                   y: -80
                     text:"d"
                     font.family: "Piboto Condensed"
                       color: "#ffffff"
                     font.pointSize: 30

                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: e2
                     x: 257
                  y: -80
                  font.family: "Piboto Condensed"
                     text:"e"
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: r2
                     x: 276
                    y: -80
                    font.family: "Piboto Condensed"
                     text:"r"
                       color: "#ffffff"
                       font.pointSize: 30
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: s
                     x: 296
                     y: -80
                     text:"S"
                     font.family: "Piboto Condensed"
                     font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: yy
                     x: 319
                          y: -80
                          text:"y"
                          font.family: "Piboto Condensed"
                          font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: s2
                     x: 336
                   y: -80
                   font.family: "Piboto Condensed"
                   text:"s"
                   font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: t
                     x: 353
                   y: -80
                   font.family: "Piboto Condensed"
                   text:"t"
                   font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: e3
                     x: 365
                     font.family: "Piboto Condensed"
                y: -80
                text:"e"
                font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: m
                     x: 384
                y: -80
                font.family: "Piboto Condensed"
                text:"m"
                font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: s_2
                     x: 413
                y: -80
                font.family: "Piboto Condensed"
                text:"s"
                font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: l
                     x: 458
                y: -80
                text:"L"
                font.family: "Piboto Condensed"
                font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: l1
                     x: 439
                y: -80
                font.family: "Piboto Condensed"
                text:"L"
                font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: p
                     x: 478
                     font.family: "Piboto Condensed"
                     y: -80
                     width: 22
                     height: 53
                     text:"P"
                     font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Text {
                     id: dot
                     x: 476
                         y: -80
                         font.family: "Piboto Condensed"
                         text:"."
                         font.bold: true
                       color: "#ffffff"
                     font.pointSize: 30
                     verticalAlignment: Text.AlignBottom
                     horizontalAlignment: Text.AlignHCenter
                 }
             }


     }

     Rectangle{
         id: metal_detected
 visible: false
 color: "red"
 radius: 20
 anchors.centerIn: parent
 width:parent.width*0.8
 height: 184
 Text {
    color: "white"
    visible: true
    font.pointSize: 30
       font.family: "Piboto Condensed"
    text:"METAL DETECTED!"
   anchors.centerIn: parent
    font.bold: true
 }
     }


     Text {
         x: 8
    y: 95
    font.pointSize: 20
    color: "#0c0df2"
    anchors.bottom: md.top
       font.family: "Piboto Condensed"
    font.bold: true
leftPadding: parent.width*0.1
    text:"Pharma Metal Detector"
    anchors.bottomMargin: 16
     }
     Text {
         x: 618
         y: 95
         width: 102
         height: 37
    font.pointSize: 18
    color: "#0c0df2"
    font.italic:  true
       font.family: "Piboto Condensed"
rightPadding: parent.width*0.1
text:"Sort-O-Met"
}
     Text {
    x: 181
    y: 430
    width: 439
    height: 42
    text: "Total Reject Count Since Power ON: "+reject_count_since_power_ON
    wrapMode: Text.WordWrap
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pointSize: 18
    color: "#0c0df2"
    font.family: "Piboto Condensed"


}
     Button {

       font.family: "Piboto Condensed"
 anchors.bottom: parent.bottom
 anchors.left:parent.left
    text: qsTr("Click")
    opacity: 0.1
    visible: true
    onClicked: {

        image.visible=false
          metal_detected.visible=true
           detect_timer.start()

    }
    onPressed: {
    detect_timer.stop()
    }
    onReleased: {
         detect_timer.stop()
    }

    onPressAndHold: {
        image.visible=false
        metal_detected.visible=true
        detect_timer.start()
    }
}

Rectangle {
    id: rectangle2
    x: 667
    y: 8
    width: 125
    height: 48
    color: "#0c0df2"
    radius: 20
    gradient: Gradient {
        GradientStop {
            position: 0.0
             color: "#8080db"

        }
        GradientStop {
            position: 0.996
           color: "#2526c3"
        }

    }
    Text {
        id: time_qml

        text: "12:12:12"

      color: "#ffffff"
          font.family: "Piboto Condensed"
       font.bold: true
     anchors.centerIn: parent
       font.pointSize: 16
    }
}
Rectangle {

    x: 8
    y: 8
    width: 125
    height: 48
    color: "#0c0df2"
    gradient: Gradient {
        GradientStop {
            position: 0.0
             color: "#8080db"

        }
        GradientStop {
            position: 0.996
           color: "#2526c3"
        }

    }
    radius: 20


    Text {
        id: date_qml1
  font.family: "Piboto Condensed"
     color: "#ffffff"

        font.bold: true
        text: "12/12/2021"
       anchors.centerIn: parent
        font.pointSize: 16
    }
}
}

}
Rectangle{
id:miniparent
anchors.fill: parent
visible: false
enabled: false
color: "red"
SoundEffect{
id:sound
source: "qrc:/mp3/notification.mp3"
}
gradient: Gradient {
    GradientStop {
        position: 0
        color: "#f5f3f3"
    }

    GradientStop {
        position: 1
        color: "#cbc6c6"
    }
}
// color: "#f5f3f3"

 Popup{
     id:drawer_validate
    x:0
    spacing: 0
   closePolicy:Popup.NoAutoClose
    y:60
     height: 360
     width:800
Rectangle{
    width: parent.width
    height: parent.height
    color: 'pink'
    ScrollView{
     anchors.fill: parent

        TextArea{
            id:textArea
            font.pointSize: 23

            anchors.fill: parent

        }
    }


}

//     ListModel {
//         id: notify_model
//     }
//     Rectangle{
//         color: "#00000000"
//    anchors.fill: parent
////         TableView{
////            width: parent.width
////            height: 300

////               selectionMode: SelectionMode.SingleSelection
////             model: notify_model
////                id:tv_notify

////             TableViewColumn {
////                 role: "time"
////                 title: "Time"
////                 width: 70
////             }
////             TableViewColumn {
////                 role: "title"
////                 title: "Notification"
////                 width: 150
////             }
////             TableViewColumn {
////                 role: "category"
////                 title: "Remark"
////                 width: 150
////             }




////     }

////RowLayout{
////    width: parent.width
////    height: 40
////    y:300
////    enabled: tv_notify.currentRow>=0?true:false
////    spacing: 4

////     Button{
////        Layout.fillHeight: true
////        Layout.fillWidth: true
////        text: "Take Action"
////        onClicked: {

////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-1")
////            {
////                which_validation="Validate-1"
////                 footer_validate.visible=true
////                footer_validate.enabled=true
////                footer.visible=false
////                footer.enabled=false
////            }

////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-2")
////            {
////                which_validation="Validate-2"
////                footer_validate.visible=true
////               footer_validate.enabled=true
////               footer.visible=false
////               footer.enabled=false

////            }
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-3")
////            {
////                which_validation="Validate-3"
////                footer_validate.visible=true
////               footer_validate.enabled=true
////               footer.visible=false
////               footer.enabled=false
////            }
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-4")
////            {
////                which_validation="Validate-4"
////                footer_validate.visible=true
////               footer_validate.enabled=true
////               footer.visible=false
////               footer.enabled=false
////            }
////              notify_model.remove(tv_notify.currentRow)
////            drawer_validate.close()

////        }
////    }
////    Button{
////        Layout.fillHeight: true
////        Layout.fillWidth: true
////        text: "Clear"
////        onClicked: {
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-1")
////            {
////              lib1.history(notify_model.get(tv_notify.currentRow).time,"","Validation-1 Ignored")
////            }
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-2")
////            {
////              lib1.history(notify_model.get(tv_notify.currentRow).time,"","Validation-2 Ignored")
////            }
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-3")
////            {
////                lib1.history(notify_model.get(tv_notify.currentRow).time,"","Validation-3 Ignored")
////            }
////            if(notify_model.get(tv_notify.currentRow).title==="Its time to Validate-4")
////            {
////               lib1.history(notify_model.get(tv_notify.currentRow).time,"","Validation-4 Ignored")
////            }
////            notify_model.remove(tv_notify.currentRow)
////        }
////    }
////    Button{

////        Layout.fillHeight: true
////        Layout.fillWidth: true
////        text: "ESC"
////        onClicked: {

////            drawer_validate.close()
////            notify_icon.source="qrc:/icons/Dashboard_icons/bell_black.svg"
////        notify_status2=true
////        }
////    }


////}


//}

 }
    Drawer{
        id:drawer
        spacing: 10
        dragMargin: 20
        edge: Qt.TopRightCorner
        x:parent.width-drawer.width
        height: parent.height
        width: 300
        Rectangle{

            anchors.fill: parent
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                width:parent.width
                anchors.bottom: slider.top
            bottomPadding: 20
height: 60
Button{
 width: 100
 height: 60
 text:"ShutDown"
 onClicked: {

     lib1.shutdownandrestart(0)
 }
}
Button{
 width: 100
 height: 60
 text:"ReStart"
 onClicked: {
lib1.shutdownandrestart(1)
 }
}

            }
            Slider {
                id: slider
                width: 250
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 60
                anchors.horizontalCenter: parent.horizontalCenter
                from:15
                to:255
                value: 15
                onValueChanged: {
                    val=slider.value

               lib1.writebrightness(val)
                }
            }
            Button{
                width:50
                height: 50
                text: "X"
                anchors.horizontalCenterOffset: -118
                anchors.topMargin: -3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: slider.bottom
                onClicked: {
                    drawer.close()
                }
            }
        }
    }



    Timer {
                id:time2
                interval: 10; running: true; repeat: false
                onTriggered: {
                    bhanu.finduser()

            }
    }
    Timer {
                id:timenotify
                interval: 5000; running: false; repeat: false
                onTriggered: {
                  notify_me.color="blue"
                    notify_me.text=""
            }
    }

    Rectangle{
        x: timeanddate.width
        y: 0
        width: u_log.x-timeanddate.width
        height: (parent.height*12.5)/100
        border.width: 0
        color: "#2b34dd"
        visible: stack_B.depth>=2?true:false
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#f5f3f3"
            }

            GradientStop {
                position: 1
                color: "#cbc6c6"
            }
        }

        Rectangle{
            width: parent.width-10
            height:parent.height-5
            radius: 10

            anchors.centerIn: parent

                border.width: 1
            gradient: Gradient {
          GradientStop {
              position: 0
              color: "#cdc9c9"

          }

          GradientStop {
              position: 1
              color: "#f1eeee"
          }
      }
        }

        Text {
            id:line3
            color: "#0020bf"
            text: "Notification Center"
            font.pointSize: 12
            maximumLineCount: 3
            anchors.centerIn: parent
            font.bold: true
             font.family: "Piboto Condensed"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

    }
    Rectangle
    {
        id: footer_validate
        x:rectangle1.width
        visible: false
        enabled: false
        anchors.bottom: parent.bottom
        width: validateee.x-rectangle1.width
        height: (parent.height*12.5)/100
        radius: 10
        border.width: 0
        color: "#2b34dd"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#f5f3f3"
            }

            GradientStop {
                position: 1
                color: "#cbc6c6"
            }
        }
        onVisibleChanged: {
            button_1.enabled=false
            button_2.enabled=false
            button_3.enabled=false
            msg.color="black"
            run.enabled=true
            time_limit_count=9
            button_1.enabled=false
            button_2.enabled=false
            button_3.enabled=false
            notify_me.color="blue"
            button_1.color="grey"
            button_2.color="grey"
            button_3.color="grey"


        }

        Rectangle{

            width: parent.width-10
            height:parent.height-5
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.width: 1
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cdc9c9"

                }

                GradientStop {
                    position: 1
                    color: "#f1eeee"
                }
            }
        Timer
        {
        id:limit_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered:
        {

            if(time_limit_count!=0)
            {
                time_limit_count=time_limit_count-1
            }
            if(time_limit_count==0)
            {
                if(is_mannual_validation)
                {
                    lib1.history(time_store,"","M-Validation Failed")
                    msg.text="Manual Validation Failed...!"
                    is_mannual_validation=false
                }
                 else{
                    msg.text="Validation Failed...!"
                     lib1.history("",which_validation,"Auto Val Failed")
                }
              notify_me.text="Auto Validation Failed...!"
               limit_timer.stop()
                run.enabled=true
                msg.color="red"


                 time_limit_count=9
                button_1.enabled=false
                button_2.enabled=false
                button_3.enabled=false

                footer_validate.visible=false
                footer_validate.visible=false
                footer.visible=true
                footer.enabled=true

                 timenotify.restart()



           }
        }
        }

        Row{
            height: 30
            anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                x:20
                spacing: 5
            width: 180
            Button {
                width: 20
                height: 20
                text: "X"
                onClicked: {
                    limit_timer.stop()
                    run.enabled=true
                    if(is_mannual_validation)
                    {
                        lib1.history("","","Manual Val Failed")
                        is_mannual_validation=false
                    }

                    if(!is_validation_running&&which_validation!="")
                    {
                        lib1.history("",which_validation,"Validation Failed")
                    }
                    is_validation_running=false
                    footer_validate.visible=false
                    footer_validate.visible=false
                    footer.visible=true
                    footer.enabled=true

                }
            }

          Rectangle {
                id: button_1

               width: 30
              height: width
              radius: height/2
              color: "grey"
                Text {
                   font.bold: true
                    color: "white"
                    anchors.centerIn: parent
                  text: qsTr("Fe")
                }

                enabled: false
       //         onClicked: {
       //              time_limit_count=9
       //          msg.text="Waiting for Ferrus metal 2"

       //         }
            }

           Rectangle {
                id: button_2

                width: 30
               height: width
               radius: height/2
               color: "grey"
                Text {
                    font.bold: true
                anchors.centerIn: parent
                text: qsTr("NFe")
                enabled: false
                  color: "white"
                }

       //         onClicked: {

       //          time_limit_count=9
       //             msg.text="Waiting for zinc metal 3"

       //         }
            }

            Rectangle {
                id: button_3

                width: 30
               height: width
               radius: height/2
                color: "grey"
                Text {
                    font.bold: true
                anchors.centerIn: parent
                    text: qsTr("SS")
                enabled: false
                  color: "white"
                }

                enabled: false
       //         onClicked: {
       //             run.enabled=true
       //             time_limit_count=9
       //             limit_timer.stop()
       //             time_limit.visible=false
       //             msg.text="Validation Done...!"

       //             button_1.enabled=false
       //             button_2.enabled=false
       //             button_3.enabled=false

       //         }
            }


        }
      Text {
         id: time_limit
         anchors.right: parent.right
         anchors.top: parent.top
         width: 59
         height: 22
         anchors.topMargin: 2
         anchors.rightMargin: 10
         text: "00:0"+time_limit_count
         visible: false
         font.bold: true
         font.pixelSize: 17
     }


         Text {
             id: msg

             text: "Run Validate"+("  1")
             anchors.horizontalCenter: parent.horizontalCenter
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             font.bold: true
             font.pixelSize: 13

     }
        Button {
             id: run

             width: 59
             height: 30
             text: qsTr("RUN")
             anchors.bottom: parent.bottom
             anchors.bottomMargin: 5
             anchors.right: parent.right
             anchors.rightMargin: 10
             font.bold: true
             font.pointSize: 12
             onClicked: {
                 which_item_status=0
                  is_validation_running=true
                  msg.color="black"
                 msg.text="Waiting for metal-1"

                time_limit.visible=true
                 limit_timer.restart()
                run.enabled=false
                 button_1.color="grey"
                 button_2.color="grey"
                 button_3.color="grey"
                 button_1.enabled=true
                 button_2.enabled=true
                 button_3.enabled=true
             }
         }

    }
}

    Rectangle{
        x:rectangle1.width
        anchors.bottom: parent.bottom
        width: validateee.x-rectangle1.width
        height: (parent.height*12.5)/100
        id:footer
      color: "#2b34dd"
      gradient: Gradient {
          GradientStop {
              position: 0
              color: "#f5f3f3"
          }

          GradientStop {
              position: 1
              color: "#cbc6c6"
          }
      }
      border.width: 0
      Rectangle{
          id: rect4
          width: parent.width-10
          height:parent.height-5
          radius: 10
          anchors.verticalCenter: parent.verticalCenter
          anchors.left: parent.left
          anchors.leftMargin: 0



          border.width: 1
          gradient: Gradient {
              GradientStop {
                  position: 0
                  color: "#cdc9c9"

              }

              GradientStop {
                  position: 1
                  color: "#f1eeee"
              }
          }
          Text {

              text: notify_model.count
              anchors.right: parent.right
              anchors.rightMargin: 5
              font.pointSize: 8
              font.bold: true
              anchors.top: parent.top
              anchors.topMargin: 2
          }

    Image {
        id:notify_icon
        width: 30
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 30
        sourceSize.height: 30
        fillMode: Image.PreserveAspectFit
        source: "qrc:/icons/Dashboard_icons/bell_black.svg"
        Behavior on source{
            OpacityAnimator{
               target: notify_icon
               from: 0
               to:1
               duration: 1000

            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {

                if(notify_status2==true)
                {
                           sound.play()
                    notify_icon.source="qrc:/icons/Dashboard_icons/bell_red.svg"
                notify_status2=false
                    drawer_validate.open()

                }
               else
                {
                    notify_icon.source="qrc:/icons/Dashboard_icons/bell_black.svg"
                notify_status2=true
                    drawer_validate.close()
                }




            }
        }
    }
      }
      Text {




      height: parent.height
       font.family: "Piboto Condensed"
           x:5
       text: "TRC: "+reject_count_since_power_ON+"\n"+"\n"+"5RC: "+five_minut_reject_count
       verticalAlignment: Text.AlignVCenter
       horizontalAlignment: Text.AlignHCenter
                           color:  "#C40B69"
          font.pointSize: 8
          font.bold: true
      }
      Text {
          id:notify_me
      anchors.fill:parent
       font.family: "Piboto Condensed"
       text: "Notification center"
       verticalAlignment: Text.AlignVCenter
       horizontalAlignment: Text.AlignHCenter
                           color: "#455DDA"
          font.pointSize: 15
      }
    }
    Rectangle{
        x: timeanddate.width
        y: 0
        border.width: 0
        width: u_log.x-timeanddate.width
        height: (parent.height*12.5)/100
        id:pro_heder
         visible: stack_B.depth==1?true:false

        gradient: Gradient {
            GradientStop {
                position: 0
                 color: "#f1eeee"


            }

            GradientStop {
                position: 1
                color: "#cdc9c9"
            }
        }

Rectangle{
    width: parent.width-5
    height:parent.height-5
    radius: 10
    anchors.centerIn: parent
        border.width: 1
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#cdc9c9"

            }

            GradientStop {
                position: 1
                color: "#f1eeee"
            }
        }
        Text {
            id:product_name
             font.family: "Piboto Condensed"
              color: "#455dda"
            text: qsTr("")
            leftPadding: 10
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 15
            width: 219
         anchors.top: parent.top
        }
        Text {
            id:product_code
             color: "#455dda"
             font.family: "Piboto Condensed"
            text: qsTr("Product Code: 1234 ")
            font.bold: true
          leftPadding: 10
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize:15

            anchors.bottom: parent.bottom
         anchors.left:  parent.left
        }
        Text {

            color: "#455dda"
            text: qsTr("Batch No:1234")
            font.bold: true
            rightPadding: 10
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 15
             font.family: "Piboto Condensed"
      anchors.right:  parent.right
      anchors.bottom: parent.bottom
        }
    }
    }


    Rectangle{
        id:u_log
        x: parent.width-(parent.height*12.5)/100-width
        y: 0
        width: 180
        height: (parent.height*12.5)/100
        color: "#6c80ea"
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#f5f3f3"
            }

            GradientStop {
                position: 1
                color: "#cbc6c6"
            }
        }
        Rectangle{
            width: parent.width-20
            height:parent.height-10
            color: "#6c80ea"
            radius: 10
                border.width: 1
            gradient: Gradient {
          GradientStop {
              position: 0
              color: "#cdc9c9"

          }

          GradientStop {
              position: 1
              color: "#f1eeee"
          }
      }
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
     }
        Text {
        id:userid
            color: "#455dda"
             font.family: "Piboto Condensed"
            text: qsTr("Login")
            anchors.fill: parent
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15

        }
        MouseArea{
            id:ma
            anchors.fill: parent
           onClicked: {
               if(stack_B.depth==1)
               {
                is_create_in_active=false
                  selected_which_action_of_user_form=0
          stack_B.push( select_profile_screen)
                }
               }
        }
    }

    Timer{
        id:timer
     running: true
     repeat: false
     interval: 1000
     onTriggered: {
         timeout_value=timeout_value-1
         timer.restart()
         if(timeout_value==0)
         {
             timer.stop()
             bhanu.logout(false)
         }



     }

    }

    Rectangle{
             id:time_out_rect
        width: (parent.height*12.5)/100
        height: (parent.height*12.5)/100
        enabled: false
        x: parent.width-(parent.height*12.5)/100
        y: 0
    color: "#6c80ea"
    border.width: 0
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#f5f3f3"
        }

        GradientStop {
            position: 1
            color: "#cbc6c6"
        }
    }
        Rectangle{
            width: parent.width-5
            height:parent.height-5

            radius: 10
            border.width: 0
            border.color: "#040404"
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cdc9c9"

                }

                GradientStop {
                    position: 1
                    color: "#f1eeee"
                }
            }
        }
    Canvas {
        id: canvas_time
   anchors.fill: parent

   Text {
   color: "#0036c3"
      font.pointSize: 15
       font.family: "Piboto Condensed"
      text:timeout_value
      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.fill: parent
      font.bold: true
   }


        Connections {
            target: timer
            onTriggered: canvas_time.requestPaint()
        }
    onPaint: {

               var ctx = getContext("2d")
               ctx.clearRect(0,0, width, height)
               ctx.strokeStyle =  "#0036c3"
               ctx.lineWidth = 4
               ctx.beginPath()
               var startAngle = Math.PI / 5 * 2.5
               var endAngle = startAngle + timeout_value/180 * Math.PI / 5 * 10.5
               ctx.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, startAngle, endAngle)
               ctx.stroke()
           }
       }
    MouseArea{
        anchors.fill: parent
       pressAndHoldInterval: 2000
        onClicked: {

            timeout_value=180

        }

        onPressAndHold: {
dialog1.visible=true
        }
    }
    }
    Rectangle{
        id:timeanddate
        width: 130

        height: (parent.height*12.5)/100
                anchors.left: parent.left
                color: "#6c80ea"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#f5f3f3"
                    }

                    GradientStop {
                        position: 1
                        color: "#cbc6c6"
                    }
                }
                border.width: 0
                Rectangle{

                    width: parent.width-10
                    height:parent.height-5
                    radius: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter



                    border.width: 1
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#cdc9c9"

                        }

                        GradientStop {
                            position: 1
                            color: "#f1eeee"
                        }
                    }
                }
                    Text {
                id: date_qml
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                 color: "#455dda"
                 font.family: "Piboto Condensed"

                font.bold: true
                font.pointSize: 15
            }
    }
    Rectangle
{

    width:200
            height: 60
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    Rectangle{
        anchors.fill: parent
        radius: 10
        anchors.leftMargin: -5

        anchors.centerIn: parent

            border.width: 1
        gradient: Gradient {
      GradientStop {
          position: 0
          color: "#cdc9c9"

      }

      GradientStop {
          position: 1
          color: "#f1eeee"
      }
  }
    }

}

    Image {
        id: button
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        fillMode: Image.PreserveAspectFit
        height: ((parent.height*12.5)/100)-20
        width: height
        source: "qrc:/icons/Settings_icons/settings.svg"
   MouseArea{
    id: settings_mouse_Area
    anchors.fill: parent
    enabled: stack_B.depth<2?true:false
    onClicked: {
               sound.play()
    stack_B.push(go)

               }
             }
           }
   Image {
        id: button1
        anchors.bottom: parent.bottom
        anchors.margins: 10
        fillMode: Image.PreserveAspectFit
        height: ((parent.height*12.5)/100)-20
        width: height
        source: "qrc:/icons/Dashboard_icons/left-arrow.svg"
        anchors.right: button.left
   MouseArea{
       anchors.fill: parent
       onClicked: {
                  sound.play()
        if(stack_B.depth<=1)
                {
            miniparent.visible=false
            miniparent.enabled=false
            rectangle.visible=true
            rectangle.enabled=true
             lib1.toggle_is_first_time_boot()
                }
        else
        {
            stack_B.pop()
            if(stack_B.depth<=2)
            {
                lib1.who_i_am("sm")
            }
        }
              }
         }
   }

Rectangle{
    id: rectangle1
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 130
     height: (parent.height*12.5)/100
color: "#2b34dd"
gradient: Gradient {
 GradientStop {
     position: 0
     color: "#f5f3f3"
 }

 GradientStop {
     position: 1
     color: "#cbc6c6"
 }
}
border.width: 0
Rectangle{
 width: parent.width
 height:parent.height
 radius: 10

 anchors.centerIn: parent

     border.width: 0
 gradient: Gradient {
GradientStop {
   position: 0
   color: "#cdc9c9"

}

GradientStop {
   position: 1
   color: "#f1eeee"
}
 }
 MouseArea{
     id:ma_usb
     anchors.fill: parent
     onClicked: {
         if(where_i_am!="uo")
         {
         stack_B.push(copy)
         }
     }
 }
}


Text {
           id: name
           color: "grey"
            font.family: "Piboto Condensed"
           text: qsTr("USB")
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.verticalCenter: parent.verticalCenter
           font.bold: true
           verticalAlignment: Text.AlignVCenter
           horizontalAlignment: Text.AlignHCenter
           font.pointSize: 15
       }


   }

   Image {
        id: button2
        anchors.bottom: parent.bottom
        anchors.margins: 10
        fillMode: Image.PreserveAspectFit
        height: ((parent.height*12.5)/100)-20
        width: height
        source: "qrc:/icons/Dashboard_icons/home1.svg"
        anchors.right: button1.left

   MouseArea{
       anchors.fill: parent
       onClicked: {

               for(initali=0;initali<stack_B.depth;initali++)
               {


                       stack_B.pop()

               }

           miniparent.visible=false
           miniparent.enabled=false
           rectangle.visible=true
           rectangle.enabled=true
           lib1.toggle_is_first_time_boot()
}
       }
   }

StackView{
   id: stack_B
 anchors.centerIn: parent
 width: 800
 height: 360

   initialItem:swipe_main
}
Image {
    id:validateee
     anchors.bottom: parent.bottom
     anchors.margins: 10
     fillMode: Image.PreserveAspectFit
     height: ((parent.height*12.5)/100)-20
     width: height
     source: "qrc:/icons/Dashboard_icons/validation1.svg"
     anchors.right: button2.left
MouseArea{
    anchors.fill: parent
    onClicked: {
        footer.enabled=false
        footer.visible=false
        is_mannual_validation=true
        footer_validate.enabled=true
        footer_validate.visible=true
    }
}
}



Dialog {
    id: dialog1
    x: 110
    y: 185
    width: 500
    height:150
    visible: false
    Text {
        x:0
        y:0

        text: "Conform your LOGOUT :"
        color: "red"
        font.pointSize: 18
    }
    standardButtons:Dialog.Ok|Dialog.Cancel
    onAccepted: {
        bhanu.logout(false)
        dialog1.visible=false
    }
    onRejected: {
        dialog1.visible=false
    }

}
}

}
