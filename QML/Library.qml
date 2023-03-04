import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Controls 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
import QtQuick.Layouts 1.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
//import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: rectangle
    visible: true
    width: 800
    height: 360
     property bool case_sensitivity: false
    property int id_s : 0
    property int val: 0
    property string pname: textField.text
    property string pcode: textField1.text

    property int signal_t: parseInt(signalll.text)
      property int amp_t: parseInt(amplitude1.text)
      property real phase_t: parseFloat(mphs.text).toFixed(1)
       property int analog_gain: parseInt(analog_gain_textfiled.text)

    property int drive_power_value: parseInt(drive_power.text)
    property real dg_value: (dg_spin.value/10).toFixed(1)
    property real pf_value: (con33.value/10).toFixed(1)
    property real freq: (control.value/10).toFixed(1)
    property int dd_power_v: con3.value

    property bool editoradd: false

    property int s_d: 0
    property int a_d: 0
    property real p_d: 0

     property int analog_gain_d: 0
  property int drive_power_value_d: 0
  property real dg_value_d: 0
  property real pf_value_d: 0
  property real freq_d: 0
  property int dd_power_v_d: 0

    property string temp_string: ""

    Timer{
        interval: 1
        running: true
        repeat: false
        onTriggered: {
            lib1.send_active_details_to_qml()
            lib1.who_i_am("pl")
        }
    }

    Connections{
        target: lib1
        onLibrarydatalist:{
            temp_string=""
            temp_string=gno_q
            if(gno_q<10)
             {
                 temp_string="0"+gno_q
             }
            libraryModel.append({


                                    "Sno_r": sno_q,
                                    "Grno_r": temp_string,
                                    "P_name_r": pname_q,
                                    "P_Code_r": pcode_q,
                                    "Signal_r": signal_q,
                                    "Amp_r": amplitude_q,
                                    "Phase_r":phase_q,
                                    "Digital_Gain_r": digitalgain_q,
                                    "Analog_Gain_r": analoggain_q,
                                    "Drive_Power_r": drivepower_q,
                                    "DD_freq_r": ddfreq_q,
                                    "DD_Power_Factor_r": ddpowerfactor_q,
                                    "DD_Power_r": ddpower_q,
                                     "Active_r":active_status_11
                                })
                    if(active_status_11=="A")
                    {
                        tableView.currentRow=libraryModel.count-1
                        tableView.selection.select(libraryModel.count-1)

                    }


        }

        onSend_active_details_to_qml_signal:{
            comboBox.currentIndex=grno_A-1
            gindex= grno_A
            lindex=srno_A
            console.log(gindex,lindex,"glindex")

        }
        onDefault_values_to_qml:{
         console.log(thresh_qml,amplitude_qml,phase_qml,freq_qml,power_qml,power_factor_qml,dg_qml,analoggain_qml,drivepower_qml+"  Stats_v=1 && Default values")
            if(status_v==1)
            {
                freq=freq_qml
                dg_value=dg_qml
                con33.value=power_factor_qml*10
            s_d=thresh_qml
            a_d=amplitude_qml
            p_d=phase_qml
            freq_d=freq_qml
            dd_power_v_d=power_qml
            pf_value_d=power_factor_qml
            dg_value_d=dg_qml
            analog_gain_d=analoggain_qml
            drive_power_value_d=drivepower_qml

            signal_t=thresh_qml
            signalll.text=signal_t
            amp_t=amplitude_qml
            amplitude1.text=amp_t

            phase_t=phase_qml
            mphs.text=phase_t

            control.value=freq_qml
            con3.value=power_qml
            con33.value=power_factor_qml
             dg_spin.value=dg_qml
            analog_gain=analoggain_qml
            analog_gain_textfiled.text=analog_gain

            drive_power_value=drivepower_qml
            drive_power.text=drive_power_value
        }
        }
        onBo:{
            if(conform===true)
            {
            textField.text=""
            textField1.text=""
        }
        }

       onDeletestatus:{
       if(bs===true)
       {
           libraryModel.clear()
              time1.restart()
       }

       }
        onEditstatus:{
        //    console.log("oh noits damn")
            if(bs===true)
            {

         textField=""
           textField1=""
                libraryModel.clear()
                   time1.restart()
            }
            else
            {

                textField=""
                  textField1=""
            }
        }

         }
    Timer {
        id:time1
            interval: 10; running: true; repeat: false
            onTriggered: {
                bhanu.finduser()
                fun()
            }
 }


    Connections{
        target: bhanu
        onUsernametoqml:{
            lib1.usertrouble(usertype_predict,username)

            if(usertype_predict=="E")
            {
                button.enabled=true
                add.enabled=true
                edit.enabled=true
                delete_e.enabled=true
                load.enabled=true
            }
            else if(usertype_predict=="A")
            {
                button.enabled=true
                add.enabled=true
                edit.enabled=true
               delete_e.enabled=true
                load.enabled=true
            }
           else if(usertype_predict=="S")
            {
                button.enabled=true
                add.enabled=true
                edit.enabled=true
                delete_e.enabled=true
                load.enabled=true
            }
            else if(usertype_predict=="O")
            {
                button.enabled=false
                load.enabled=true
                add.enabled=false
                edit.enabled=false
                delete_e.enabled=false
            }
            else if(usertype_predict=="")
            {
                button.enabled=false
                load.enabled=false
                add.enabled=false
                edit.enabled=false
                delete_e.enabled=false
            }
        }
    }



    Timer{
        id:dialogtimer
            running: false
            repeat: false
            interval: 1000
            onTriggered: {
                dialog.close()
            }

    }

      property int c: 1
    property int lmc: 0
 property int coun:-1
    property real hue: Math.random()
    property bool tr:true
    property int gindex:0
    property int lindex: 0
    property bool seeen: false
        property bool checkk: false
            property bool which: false
      property var fun1:function(){
          gindex=comboBox.currentIndex+1
          lindex=tableView.currentIndex+1
          console.log(gindex,lindex,"damnnnnn")
      }

    property var fun:function(){
        console.log("bhanu ohhhh")
       libraryModel.clear()
    lib1.elist(comboBox.currentIndex+1)

}
    ListModel {
        id: libraryModel
    }
    TableView {
      id:tableView
        width:parent.width/1.3
        anchors.margins: 10
        anchors.top: rl.bottom
        height:parent.height-rl.height-20
        selectionMode: SelectionMode.SingleSelection


        onCurrentRowChanged: {
            q_q.text=": "+libraryModel.get(tableView.currentRow).Signal_r
            w_q.text=": "+libraryModel.get(tableView.currentRow).Amp_r
            e_q.text=": "+libraryModel.get(tableView.currentRow).Phase_r
            r_q.text=": "+libraryModel.get(tableView.currentRow).Digital_Gain_r
            t_q.text=": "+libraryModel.get(tableView.currentRow).Analog_Gain_r
            y_q.text=": "+libraryModel.get(tableView.currentRow).Drive_Power_r
            u_q.text=": "+libraryModel.get(tableView.currentRow).DD_freq_r
            i_q.text=": "+libraryModel.get(tableView.currentRow).DD_Power_Factor_r
            o_q.text=": "+libraryModel.get(tableView.currentRow).DD_Power_r
            console.log(tableView.currentRow,libraryModel.get(tableView.currentRow).Sno_r,libraryModel.get(tableView.currentRow).Digital_Gain_r,libraryModel.get(tableView.currentRow).DD_Power_Factor_r)
        }

    //    onClicked: {
//            q_q.text=": "+libraryModel.get(tableView.currentRow).Signal_r
//            w_q.text=libraryModel.get(tableView.currentRow).Amp_r
//            e_q.text=libraryModel.get(tableView.currentRow).Phase_r
//            r_q.text=libraryModel.get(tableView.currentRow).Digital_Gain_r
//            t_q.text=libraryModel.get(tableView.currentRow).Analog_Gain_r
//            y_q.text=libraryModel.get(tableView.currentRow).Drive_Power_r
//            u_q.text=libraryModel.get(tableView.currentRow).DD_freq_r
//            i_q.text=libraryModel.get(tableView.currentRow).DD_Power_Factor_r
//            o_q.text=libraryModel.get(tableView.currentRow).DD_Power_r
//            console.log(tableView.currentRow,libraryModel.get(tableView.currentRow).Sno_r,libraryModel.get(tableView.currentRow).Digital_Gain_r,libraryModel.get(tableView.currentRow).DD_Power_Factor_r)


       // }
        TableViewColumn {
            role: "Active_r"
            title: "Active"
            width: 50
        }
        TableViewColumn {
            role: "Grno_r"
            title: "Gr."
            width: 35
        }
        TableViewColumn {
            role: "Sno_r"
            title: "Sr."
            width: 35
        }

        TableViewColumn {
            role: "P_name_r"
            title: "Product Name"
            width: 150
        }
        TableViewColumn {
            role: "P_Code_r"
            title: "Product Code"
            width: 150
        }
        TableViewColumn {
            role: "Signal_r"
            title: "Signal"
            width: 100
        }
        TableViewColumn {
            role: "Phase_r"
            title: "Phase"
            width: 100
        }
        TableViewColumn {
            role: "Amp_r"
            title: "Amplitude"
            width: 100
        }

        TableViewColumn {
            role: "Digital_Gain_r"
            title: "Digital Gain"
            width: 120
        }
        TableViewColumn {
            role: "Analog_Gain_r"
            title: "Analog Gain"
            width: 120
        }
        TableViewColumn {
            role: "Drive_Power_r"
            title: "Drive Power"
            width: 100
        }
        TableViewColumn {
            role: "DD_freq_r"
            title: "DD Freq"
            width: 100
        }
        TableViewColumn {
            role: "DD_Power_Factor_r"
            title: "DD Power Factor"
            width: 150
        }
        TableViewColumn {
            role: "DD_Power_r"
            title: "DD Power"
width: 100
        }


        model: libraryModel
    }

        RowLayout{
            id:rl   ///tableView
            anchors.top: parent.top
            anchors.margins:5

                    width: parent.width-30
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                   spacing: 7

                   ComboBox {
                       id: comboBox
                       Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true

                currentIndex: 0
                displayText:  comboBox.currentIndex<9?"GROUP: 0"+"%1".arg(comboBox.currentIndex+1):"GROUP: "+"%1".arg(comboBox.currentIndex+1)
                font.pointSize: 14
                model: 10
                font.bold: true
                delegate:ItemDelegate {
                    width:parent.width
                    Text{

                        anchors.fill: parent
                        text:   modelData<9?"GROUP: 0"+"%1".arg(modelData+1):"GROUP: "+"%1".arg(modelData+1)
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 14
                             font.bold: true
                    }
                }
                onCurrentIndexChanged: {
                    console.log(comboBox.currentIndex+1)
                    time1.restart()
                }
            }
            Button{
                id:load
                Layout.fillHeight: true
                Layout.fillWidth: true
                  text: "LOAD"

                  font.bold: true
                  font.pointSize: 14
                      onClicked: {
                          gindex=comboBox.currentIndex+1
                          lindex=tableView.currentRow+1
           lib1.load(gindex,lindex)
                      fun()
                      }

            }
            Button{
                id:add
                Layout.fillHeight: true
                Layout.fillWidth: true
                text: "ADD"
                font.pointSize: 14
                font.bold: true
                onClicked: {
                    which=true
                    editoradd=false
                     rl.enabled=false
                    create.visible=true
                    create.enabled=true
                    stat.text="Add Form: Enter Details"
                    button.text="ADD"
                    lib1.default_values(1)
                }
            }

            Button{
                id:edit
                Layout.fillHeight: true
                Layout.fillWidth: true
                text: "EDIT"
                font.bold: true

                font.pointSize: 14
                onClicked: {
                    if(libraryModel.get(tableView.currentRow).Active_r==="A")
                    {
                      lib1.notify_to_qml_from_qml("Only In-active Product Can Be Edited ", false);
                    }
                       else
                    {
                    which=false
                    editoradd=true
                    textField.text=libraryModel.get(tableView.currentRow).P_name_r
                    textField1.text=libraryModel.get(tableView.currentRow).P_Code_r


                    signalll.text=libraryModel.get(tableView.currentRow).Signal_r
                    mphs.text=libraryModel.get(tableView.currentRow).Phase_r
                    amplitude1.text=libraryModel.get(tableView.currentRow).Amp_r

                    drive_power.text=libraryModel.get(tableView.currentRow).Drive_Power_r
                    analog_gain_textfiled.text=libraryModel.get(tableView.currentRow).Analog_Gain_r


                    button.text="EDIT"
                     stat.text="Edit In-active Product"
                    create.visible=true
                    create.enabled=true
                    signal_t=libraryModel.get(tableView.currentRow).Signal_r
                   amp_t =libraryModel.get(tableView.currentRow).Amp_r
                   phase_t =libraryModel.get(tableView.currentRow).Phase_r
                   dg_value =libraryModel.get(tableView.currentRow).Digital_Gain_r
                   analog_gain =libraryModel.get(tableView.currentRow).Analog_Gain_r
                    drive_power_value =libraryModel.get(tableView.currentRow).Drive_Power_r
                   freq= libraryModel.get(tableView.currentRow).DD_freq_r
                   pf_value =libraryModel.get(tableView.currentRow).DD_Power_Factor_r
                   dd_power_v=libraryModel.get(tableView.currentRow).DD_Power_r
                   }
                }
            }
            Button{
                id:delete_e
                Layout.fillHeight: true
                Layout.fillWidth: true
                text: "DELETE"
                font.pointSize: 14
                font.bold: true
                onClicked: {
                   if(gindex==comboBox.currentIndex+1&&
                    lindex==tableView.currentRow+1)
                   {
                          lib1.notify_to_qml_from_qml("Active Product Can Not Be Deleted",false)



                    }
                    else{
                        if(comboBox.currentIndex+1==1&&tableView.currentRow==0)
                        {
                         lib1.notify_to_qml_from_qml("Default Product Can Not Be Deleted",false)



                        }
                        else
                        {

                            lib1.deleteproduct(comboBox.currentIndex+1,parseInt(libraryModel.get(tableView.currentRow).Sno_r))
                                 fun()
                        }


                }
                }

            }



        }

      Rectangle{
 y:tableView.y
    x:tableView.width
    width: parent.width-x
    border.width: 0
    color:  "white"
    height: tableView.height
    ColumnLayout {
         id: rowLayout
           x: 120
         y: 17
         width: 80
         height: 282
         spacing: 2
         Text {
             id:q_q
             Layout.fillHeight: true
             text:signal_t
         }
         Text {
             id: w_q
            Layout.fillHeight: true
             text: qsTr("Amplitude: ")
         }
         Text {
             id: e_q
             Layout.fillHeight: true
             text: qsTr("Phase: ")
         }
         Text {
             id: r_q
             Layout.fillHeight: true
             text: qsTr("Digital gain: ")
         }
         Text {
             id: t_q
            Layout.fillHeight: true
             text: qsTr("Analog gain: ")
         }
         Text {
             id: y_q
             Layout.fillHeight: true
             text: qsTr("Drive Power: ")
         }
         Text {
             id: u_q
             Layout.fillHeight: true
             text: qsTr("DD Frequency: ")
         }
         Text {
             id: i_q
             Layout.fillHeight: true
             text: qsTr("DD Power Factor: ")
         }
         Text {
             id:o_q
             Layout.fillHeight: true
             text: qsTr("DD power: ")
         }

     }

    ColumnLayout {
         id: rowLayout2

         y: 17
         x: 14
         enabled: tableView.currentRow>=0?true:false
         width: 80
         height: 282
         spacing: 2

         Text {

             Layout.fillHeight: true
             text: qsTr("Signal")
         }
         Text {

            Layout.fillHeight: true
             text: qsTr("Amplitude ")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("Phase")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("Digital Gain")
         }
         Text {

            Layout.fillHeight: true
             text: qsTr("Analog Gain")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("Drive Power")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("DD Frequency")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("DD Power Factor")
         }
         Text {

             Layout.fillHeight: true
             text: qsTr("DD Power")
         }




     }



}



           Rectangle{
               id:rr
                  anchors.right: parent.right
                  width:parent.width*0.25
               visible: false
               enabled: false
               y: 72

               height: parent.height-100
               color: "white"
               border.width: 2



            Button{
                id:select
                y: 151
                visible: false
                enabled:false
                anchors.bottom: parent.bottom
                text: "SELECT"
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: 34
                anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {


                fun1()
            }
            }
           }

            Rectangle{
                id:create
                width:parent.width
                visible: false
                enabled: false
                  color: "#ebba5b"
                height: parent.height
                Behavior on visible {
                    NumberAnimation {
                        target:create
                        property: "opacity"
                        from:0
                        to:1
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                }

                radius: 1


                   ScrollView{
                       id: scrollView
                       anchors.fill: parent
                       Text {
                           id: stat
                           x: 390
                           y: 8
                           color: "#ffffff"

                           anchors.horizontalCenter: parent.horizontalCenter
                           font.bold: true
                           verticalAlignment: Text.AlignVCenter
                           horizontalAlignment: Text.AlignHCenter
                           wrapMode: Text.WordWrap
                           font.pixelSize: 30
                       }
                       CheckBox
                       {
                           id: sw
                           x: 624
                           y: 9
                           checked: false
                           onCheckedChanged: {
                               if(!checked)
                               {
                                  lib1.default_values(1)
                               }
                           }

                           text: qsTr("Edit Parameters")
                       }
                 clip: true
                 ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                     contentHeight:  sw.checked?850:360

                     RowLayout{
                         x:0
                         y:75
                         height: 40
                         anchors.horizontalCenter: parent.horizontalCenter
                         width: parent.width/1.14
                         TextField {
                             id: textField
                             font.bold: true
                             Layout.fillWidth: true
                             height: 40
                             placeholderText: "Product Name"
                             text: ""
                             inputMethodHints: Qt.ImhLowercaseOnly
                             maximumLength: 25
                             font.pointSize: 12
                             horizontalAlignment: Text.AlignHCenter
                              onTextChanged: {
                                  if(text.length>=3)
                                  {
                                      color="black"
                                  }
                                  else{
                                      color="red"
                                  }
                              }
                         }

                         TextField {
                             id: textField1

                             Layout.fillWidth: true
                             height: 40
                             font.bold: true
                             maximumLength: 25
                               inputMethodHints: Qt.ImhLowercaseOnly
                             width: 246
                             placeholderText: "Product Code"
                             text:""
                             font.pointSize: 12
                             horizontalAlignment: Text.AlignHCenter
                             onPressed: {

                             }
                         }
                         Button{

                             id:button

                             visible: true
                             enabled: false
                             text: "Enter"
                             font.bold: true
                             Layout.fillWidth: true
                             height: 40
                             font.pointSize: 12
                             onClicked:{

                                     if(which==true&&pname.length>=3&&editoradd==false)
                                     {
                                   bhanu.logout(true)
                                         if(sw.checked)
                                         {
                                             if(textField.text.length>=3&&parseInt(signalll.text)>=350&&parseInt(signalll.text)<=14000
                                                     &&parseInt(amplitude1.text)>=500&&parseInt(amplitude1.text)<=14000
                                                     &&parseInt(drive_power.text)>=1&&parseInt(drive_power.text)<=100
                                                     &&parseInt(analog_gain_textfiled.text)>=1&&parseInt(analog_gain_textfiled.text)<=100
                                                     &&parseFloat(mphs.text).toFixed(1)>=45&&parseFloat(mphs.text).toFixed(1)<=180
                                                     )
                                             {
                                                 lib1.createandinsertintogroup(comboBox.currentIndex+1,textField.text,
                                                 textField1.text,signal_t,amp_t,phase_t,
                                                 dg_value,analog_gain,drive_power_value,freq,pf_value,dd_power_v)
                                             }
                                             else{
                                                 lib1.notify_to_qml_from_qml("Please Fill The All Fields",false)
                                             }


                                         }
                                            else{
                                     lib1.createandinsertintogroup(comboBox.currentIndex+1,textField.text,
                                 textField1.text,s_d,a_d,p_d,dg_value_d,analog_gain_d
                                 ,drive_power_value_d,freq_d,pf_value_d,dd_power_v_d)
                                                }

                                     time1.restart()
                                     }
                                     else
                                     {
                                         if(gindex==comboBox.currentIndex+1&&lindex===tableView.currentIndex)
                                         {
                                             lib1.notify_to_qml_from_qml("It is selected Item..",false)

                                         }

                                         else{
                                             if(textField.text.length>=3&&editoradd==true)
                                      {
                                                 console.log(comboBox.currentIndex+1,tableView.currentRow+1,textField.text,
                                                         textField1.text,signal_t,amp_t,phase_t,
                                                         dg_value,analog_gain,drive_power_value,freq,pf_value ,dd_power_v,1)
                                                 lib1.editlibrary(comboBox.currentIndex+1,parseInt(libraryModel.get(tableView.currentRow).Sno_r),textField.text,
                                                 textField1.text,signal_t,amp_t,phase_t,
                                                 dg_value,analog_gain,drive_power_value,freq,pf_value ,dd_power_v,1)
                                             }

                                         else
                                             {
                                             lib1.notify_to_qml_from_qml("Please fill the required fields",false)
                                             }
                                         }
                                         }
                                     }
                                 }

                         Button{
                               Layout.fillWidth: true
                             width: 100
                             height: 40
                             text: "Esc"
                             font.pointSize: 12
                             font.bold: true
                             onClicked: {
                                 seeen=false
                                   checkk=false
                                 create.visible= false
                                 create.enabled=false
                                 rl.enabled=true
                                 time1.restart()
                             }
                         }
                     }


                     Rectangle{
                         id: re
                         border.width: 2
                         radius: 10
                         anchors.horizontalCenterOffset: 0
                         y:153
                         anchors.horizontalCenter: parent.horizontalCenter
                         width: 700
                         height:200
                         Column{
                                  y: 35
                                  spacing: 30
                              width:parent.width*0.3
                              height:150
                              anchors.left: parent.left
                              anchors.leftMargin: 5
                              Text {
                                  id:signall
                                  width:parent.width
                                  text: qsTr("Signal : "+signal_t)
                                  font.family: "Piboto Condensed"
                                  font.pointSize: 18
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignLeft

                              }
                              Text {

                                  text: qsTr("DD_Frequency : "+freq)
                                  font.family: "Piboto Condensed"
                                  font.pointSize: 18
                                   width:parent.width
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignLeft
                              }
                              Text {

                                  text: qsTr("Analog_Gain : "+analog_gain)
                                  font.family: "Piboto Condensed"
                                  font.pointSize: 18
                                   width:parent.width
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignLeft
                              }

                          }

                      Column {
                          x: 33
                          y: 35
                          height: 103
                          spacing: 30
                          anchors.horizontalCenter: parent.horizontalCenter
                         width:parent.width*0.3
                           Text {
                                id:phase
                                 width:parent.width
                                text: qsTr("Phase : "+phase_t)
                                font.family: "Piboto Condensed"
                                font.pointSize: 18
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft

                           }
                            Text {

                                text: qsTr("DD_Power_Factor : "+pf_value)
                                font.family: "Piboto Condensed"
                                font.pointSize: 18
                                 width:parent.width
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                            }
                            Text {



                                text: qsTr("Digital_Gain: "+dg_value)
                                font.family: "Piboto Condensed"
                                font.pointSize: 18
                                 width:parent.width
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                            }
                      }

                       Column {
                           x: 564
                            y: 35
                            width:parent.width*0.3
                            height: 103
                            anchors.right: parent.right
                           anchors.rightMargin: 5
                           spacing: 30
                           Text {

                               text: qsTr("Amplitude : "+amp_t)
                               font.family: "Piboto Condensed"
                               font.pointSize: 18
                               width:parent.width
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignRight
                           }
                           Text {

                                width:parent.width
                               text: qsTr("DD_Power : "+dd_power_v)
                               font.family: "Piboto Condensed"
                               font.pointSize: 18
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignRight
                           }
                           Text {

                                width:parent.width
                               text: qsTr("Drive_Power : "+drive_power_value)
                               font.family: "Piboto Condensed"
                               font.pointSize: 18
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignRight
                           }

                       }



                     }

                     Rectangle
                     {
                         y:re.y+re.height+20
                         width:800
                        height: 279
                        color: "#ebba5b"
                        visible:  sw.checked?true:false
                           enabled: sw.checked?true:false
                           RowLayout{
                               spacing: 2
                               width: 700
                               height:40
                               anchors.horizontalCenter: parent.horizontalCenter
                           TextField {
                               id:signalll
                               maximumLength: 5
                                 inputMethodHints: Qt.ImhDigitsOnly
                               visible:  sw.checked?true:false
                                  enabled: sw.checked?true:false
                             Layout.fillHeight: true
                             Layout.fillWidth: true
                               placeholderText: "Signal 350 to 14000"
                                onTextChanged: {
                                   if(parseInt(signalll.text)>=350&&parseInt(signalll.text)<=14000)
                                   {
                                   signal_t=parseInt(signalll.text)
                                       color="black"
                                   }
                                   else{
                                       signal_t=0
                                       color="red"
                                   }
                               }



                           }
                           TextField {
                               id: mphs
                               Layout.fillHeight: true
                               Layout.fillWidth: true
                               maximumLength: 5
                               inputMethodHints: Qt.ImhDigitsOnly
                               visible:  sw.checked?true:false
                                  enabled: sw.checked?true:false
                                  placeholderText: "Phase 10.0 to 180.0"
                                  onTextChanged: {

                                      if(parseFloat(mphs.text).toFixed(1)<=180&&parseFloat(mphs.text).toFixed(1)>=10)
                                      {
                                           phase_t=parseFloat(mphs.text).toFixed(1)
                                            color="black"
                                      }
                                      else{
                                          phase_t=0
                                          color="red"
                                      }


                                  }
                           }
                           TextField {
                               id: amplitude1
                                maximumLength: 5
                               inputMethodHints: Qt.ImhDigitsOnly
                               Layout.fillHeight: true
                               Layout.fillWidth: true
                               visible:  sw.checked?true:false
                                  enabled: sw.checked?true:false
                                  placeholderText: "Amp 500 to 14000"
                                 onTextChanged: {

                                      if(parseInt(amplitude1.text)>=0&&parseInt(amplitude1.text)<=14000)
                                      {
                                            amp_t=parseInt(amplitude1.text)
                                            color="black"
                                      }
                                      else{
                                          amp_t=0
                                          color="red"
                                      }

                                  }

                           }
                           TextField {
                               id: analog_gain_textfiled
                               inputMethodHints: Qt.ImhDigitsOnly
                               Layout.fillHeight: true
                               Layout.fillWidth: true
                               maximumLength: 3
                               visible:  sw.checked?true:false
                                  enabled: sw.checked?true:false
                                  placeholderText: "Analog gain 1 to 100"
                                  onTextChanged: {
                                      if(parseInt(analog_gain_textfiled.text)>=1&&parseInt(analog_gain_textfiled.text)<=100)
                                      {
                                              analog_gain=parseInt(analog_gain_textfiled.text)
                                            color="black"
                                      }
                                      else{
                                          analog_gain=0
                                          color="red"
                                      }

                                  }

                           }
                           TextField {
                               id: drive_power
                                maximumLength: 3
                               inputMethodHints: Qt.ImhDigitsOnly
                               Layout.fillHeight: true
                               Layout.fillWidth: true
                               visible:  sw.checked?true:false
                                  enabled: sw.checked?true:false
                                  placeholderText: "Drive Power 1 to 100"
                                   onTextChanged: {
                                      if(parseInt(drive_power.text)>=0&&parseInt(drive_power.text)<=100)
                                      {
                                              drive_power_value=parseInt(drive_power.text)
                                            color="black"
                                      }
                                      else{
                                          analog_gain=0
                                          color="red"
                                      }

                                  }

                           }

                           }


                     ColumnLayout{
                         width:700
                         height:360
                         anchors.horizontalCenterOffset: -5
                         anchors.horizontalCenter: parent.horizontalCenter
                         visible:  sw.checked?true:false
                       enabled: sw.checked?true:false

                      y: 80
                      anchors.margins: 20
                      spacing: 12
                     RowLayout{
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         spacing: 12
                         Rectangle{
                             id:r0
                             enabled: sw.checked?true:false
                             Layout.fillWidth: true
                             Layout.fillHeight: true
                             radius: width*0.01
                                    color: sw.checked? "#F7C59F" :"#b9c460"
                                    Text{
                                        font.bold: true
                                        font.family: "Piboto Condensed"
                                        font.pointSize: 12
                                        anchors.bottom: dg_value_text.top
                                        anchors.bottomMargin: 10
                                        x:dg_value_text.x
                                        color: "#56595b"
                                        text: "Min:1.0"
                                    }
                                    Text{
                                    font.family: "Piboto Condensed"
                                        anchors.top: dg_value_text.bottom
                                        anchors.topMargin: 10
                                        x:dg_value_text.x
                                        color: "#56595b"

                                        font.bold: true
                                        font.pointSize: 12
                                        text: "Max:9.9"
                                    }
                               Text {

                                   font.bold: true
                                   font.pointSize: 12
                                    anchors.margins: 5
                                     font.family: "Piboto Condensed"

                                   text: qsTr("Digital Gain")
                                   anchors.top: parent.top
                                   anchors.right: parent.right
                               }
                               Text {
                                   id:dg_value_text
                                   x:parent.width*0.12
                                   text: dg_value
                                    font.family: "Piboto Condensed"
                                   anchors.verticalCenter: parent.verticalCenter
                                   font.bold: true
                                   font.pointSize: 25
                     //
                               }

                               SpinBox{
                                   id:dg_spin
                                   from:10
                                   to:99
                                   value: 10
                                   onValueChanged: {
                                       dg_value=value/10
                                    }
                                   height:width/2.2
                                   stepSize: 1
                                   width: parent.height*0.9
                                   anchors.centerIn: parent
                                   contentItem:
                                       Text {
                                       width:0
                                       height: 0
                                       rotation: 90
                                       text: ""
                                   }

                                   background:
                                     Rectangle{
                                       width:con33.width
                                       height: con33.height

                                            color: sw.checked? "#F7C59F" :"#b9c460"
                                       }




                                   up.indicator: Rectangle {
                                           x: dg_spin.mirrored ? 0 : parent.width - width
                                           width: parent.height
                                           anchors.verticalCenter: parent.verticalCenter
                                           radius: width/2
                                         height:width
                                          border.width: 3
                                           color: dg_spin.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                           border.color: enabled ? "#21be2b" : "#bdbebf"

                                           Text {
                                               text: "UP"
                                               rotation: 90
                                               font.bold: true
                                                 font.family: "Piboto Condensed"
                                              font.pointSize: 12
                                                color: sw.checked? "black" :"grey"
                                               anchors.fill: parent
                                               fontSizeMode: Text.Fit
                                               horizontalAlignment: Text.AlignHCenter
                                               verticalAlignment: Text.AlignVCenter
                                           }
                                       }

                                       down.indicator: Rectangle {
                                           x: dg_spin.mirrored ? parent.width - width : 0
                                           width: parent.height
                                           anchors.verticalCenter: parent.verticalCenter
                                           radius: width/2
                                         height:width
                                         border.width: 3
                                           color: dg_spin.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                           border.color: enabled ? "#21be2b" : "#bdbebf"

                                           Text {
                                                rotation: 90
                                               text: "DN"
                                                font.bold: true
                                                 font.family: "Piboto Condensed"
                                               font.pointSize: 12
                                              color: sw.checked? "black" :"grey"
                                               anchors.fill: parent
                                               fontSizeMode: Text.Fit
                                               horizontalAlignment: Text.AlignHCenter
                                               verticalAlignment: Text.AlignVCenter
                                           }
                                       }

                                   rotation: 270
                               }
                         }

                         Rectangle{
                             id:r1
                             enabled: sw.checked?true:false
                             Layout.fillWidth: true
                             Layout.fillHeight: true
                             radius: width*0.01
                                    color: sw.checked? "#F7C59F" :"#b9c460"
                                    Text{
                                        font.bold: true
                                        font.family: "Piboto Condensed"
                                        font.pointSize: 12
                                        anchors.bottom: r1_value.top
                                        anchors.bottomMargin: 10
                                        x:r1_value.x
                                        color: "#56595b"
                                        text: "Min:20.0"
                                    }
                                    Text{
                                    font.family: "Piboto Condensed"
                                        anchors.top: r1_value.bottom
                                        anchors.topMargin: 10
                                        x:r1_value.x
                                        color: "#56595b"

                                        font.bold: true
                                        font.pointSize: 12
                                        text: "Max:80.0"
                                    }
                               Text {

                                   font.bold: true
                                   font.pointSize: 12
                                    anchors.margins: 5
                                     font.family: "Piboto Condensed"

                                   text: qsTr("DD Power Factor")
                                   anchors.top: parent.top
                                   anchors.right: parent.right
                               }
                               Text {
                                   id:r1_value
                                   x:parent.width*0.12
                                    font.family: "Piboto Condensed"
                                   anchors.verticalCenter: parent.verticalCenter
                                   font.bold: true
                                   font.pointSize: 25
                                   text: pf_value
                     //              text: con33.value+"."+con4.value
                               }

                               SpinBox{
                                   id:con33
                                   from:200
                                   to:800
                                   value: 200
                                   height:width/2.2
                                   width: parent.height*0.9
                         anchors.centerIn: parent
                         onValueChanged: {
                             pf_value=value/10
                          }
                                   contentItem:
                                       Text {
                                       width:0
                                       height: 0
                                       rotation: 90
                                       text: ""
                                   }

                                   background:
                                     Rectangle{
                                       width:con33.width
                                       height: con33.height
                     //                  color: "red"
                                            color: sw.checked? "#F7C59F" :"#b9c460"
                                       }




                                   up.indicator: Rectangle {
                                           x: con33.mirrored ? 0 : parent.width - width
                                           width: parent.height
                                           anchors.verticalCenter: parent.verticalCenter
                                           radius: width/2
                                         height:width
                                          border.width: 3
                                           color: con33.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                           border.color: enabled ? "#21be2b" : "#bdbebf"

                                           Text {
                                               text: "UP"
                                               rotation: 90
                                               font.bold: true
                                                 font.family: "Piboto Condensed"
                                              font.pointSize: 12
                                                color: sw.checked? "black" :"grey"
                                               anchors.fill: parent
                                               fontSizeMode: Text.Fit
                                               horizontalAlignment: Text.AlignHCenter
                                               verticalAlignment: Text.AlignVCenter
                                           }
                                       }

                                       down.indicator: Rectangle {
                                           x: con33.mirrored ? parent.width - width : 0
                                           width: parent.height
                                           anchors.verticalCenter: parent.verticalCenter
                                           radius: width/2
                                         height:width
                                         border.width: 3
                                           color: con33.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                           border.color: enabled ? "#21be2b" : "#bdbebf"

                                           Text {
                                                rotation: 90
                                               text: "DN"
                                                font.bold: true
                                                 font.family: "Piboto Condensed"
                                               font.pointSize: 12
                                              color: sw.checked? "black" :"grey"
                                               anchors.fill: parent
                                               fontSizeMode: Text.Fit
                                               horizontalAlignment: Text.AlignHCenter
                                               verticalAlignment: Text.AlignVCenter
                                           }
                                       }

                                   rotation: 270
                               }
                         }

                     }
                     RowLayout{
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         spacing: 12
                         Rectangle{
                             id:r3
                             radius: width*0.01
                                 color: sw.checked? "#F7C59F" :"#b9c460"
                                   enabled: sw.checked?true:false
                             Layout.fillWidth: true
                             Layout.fillHeight: true
                             Text{
                                 font.bold: true
                                   font.family: "Arial"
                                 font.pointSize: 12
                                 anchors.bottom: r3_value.top
                                 anchors.bottomMargin: 10
                                 x:r3_value.x
                                 color: "#56595b"
                                 text: "Min:0"
                             }
                             Text{

                                 anchors.top: r3_value.bottom
                                 anchors.topMargin: 10
                                 x:r3_value.x
                                 color: "#56595b"
                                 font.bold: true

                                  font.family: "Piboto Condensed"
                                 font.pointSize: 12
                                 text: "Max:100"
                             }

                             Text {
                                 font.bold: true
                                 font.pointSize: 12
                               anchors.margins: 5
                               font.family: "Piboto Condensed"
                                 anchors.top: parent.top
                                 anchors.right: parent.right
                                 text: qsTr("DD Power")

                             }
                             Text {
                                 id:r3_value
                                 x:parent.width*0.12
                                 anchors.verticalCenter: parent.verticalCenter
                                 font.bold: true
                                 font.pointSize: 25
                                  font.family: "Piboto Condensed"
                                 text: con3.value
                             }
                             SpinBox{
                                 id:con3
                                 stepSize: 1
                                 from:20
                                 to:100
                                 height:width/2.2
                                 width: parent.height*0.9
                                 anchors.centerIn: parent
                                 value: 20
                                 contentItem:
                                     Text {
                                     rotation: 90
                                     text: ""
                                 }

                                 background:
                                   Rectangle{
                                     width:con3.width
                                     height: con3.height
                                           color: sw.checked? "#F7C59F" :"#b9c460"
                                     }

                                 up.indicator: Rectangle {
                                         x: con3.mirrored ? 0 : parent.width - width
                                         width: parent.height
                                         anchors.verticalCenter: parent.verticalCenter
                                         radius: width/2
                                       height:width
                                        border.width: 3
                                         color: con3.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                         border.color: enabled ? "#21be2b" : "#bdbebf"

                                         Text {
                                             text: "UP"
                                             rotation: 90
                                             font.bold: true
                                                font.family: "Piboto Condensed"
                                            font.pointSize: 12
                                              color: sw.checked? "black" :"grey"
                                             anchors.fill: parent
                                             fontSizeMode: Text.Fit
                                             horizontalAlignment: Text.AlignHCenter
                                             verticalAlignment: Text.AlignVCenter
                                         }
                                     }

                                     down.indicator: Rectangle {
                                         x: con3.mirrored ? parent.width - width : 0
                                         width: parent.height
                                         anchors.verticalCenter: parent.verticalCenter
                                         radius: width/2
                                       height:width
                                        border.width: 3
                                         color: con3.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                         border.color: enabled ? "#21be2b" : "#bdbebf"

                                         Text {
                                              rotation: 90
                                             text: "DN"
                                              font.bold: true
                                               font.family: "Piboto Condensed"
                                             font.pointSize: 12
                                            color: sw.checked? "black" :"grey"
                                             anchors.fill: parent
                                             fontSizeMode: Text.Fit
                                             horizontalAlignment: Text.AlignHCenter
                                             verticalAlignment: Text.AlignVCenter
                                         }
                                     }
                                 rotation: 270
                             }

                         }
                         Rectangle{
                             id:r2
                             radius: width*0.01
                             color: sw.checked? "#F7C59F" :"#b9c460"
                             enabled: sw.checked?true:false
                             Layout.fillWidth: true
                             Layout.fillHeight: true
                             Text{
                                 font.bold: true
                                 font.pointSize: 12
                                 anchors.bottom: r2_value.top
                                 anchors.bottomMargin: 10
                                 x:r2_value.x
                               font.family: "Piboto Condensed"
                                 color: "#56595b"
                                 text: "Min:10.0"
                             }
                             Text{

                                 anchors.top: r2_value.bottom
                                 anchors.topMargin: 10
                                 x:r2_value.x
                                 color: "#56595b"
                                 font.family: "Piboto Condensed"
                                 font.bold: true
                                 font.pointSize: 12
                                 text: "Max:40.0"
                             }

                               Text {
                                   font.bold: true
                                   font.pointSize: 12
                                      font.family: "Piboto Condensed"
                                    anchors.margins: 5
                                   anchors.top: parent.top
                                   anchors.right: parent.right
                                   text: qsTr("DD Frequency")
                               }
                               Text {
                                   id:r2_value
                                   x:parent.width*0.12
                              font.family: "Piboto Condensed"
                                   anchors.verticalCenter: parent.verticalCenter
                                   font.bold: true
                                   font.pointSize: 25
                                   text: freq
                               }


                                   SpinBox{
                                       id:control
                                       from:180
                                      anchors.centerIn: parent
                                       height:width/2.2
                                       width: parent.height*0.9
                                       to:400
                                       onValueChanged: {
                                        freq=value/10
                                       }

                                          value: 180
                                          contentItem:
                                              Text {
                                              rotation: 90
                                              text: ""
                                          }

                                          Rectangle{
                                            width:control.width
                                            height: control.height
                                                  color: sw.checked? "#F7C59F" :"#b9c460"
                                            }
                                       up.indicator: Rectangle {
                                               x: control.mirrored ? 0 : parent.width - width
                                               width: parent.height
                                               anchors.verticalCenter: parent.verticalCenter
                                               radius: width/2
                                             height:width
                                              border.width: 3
                                               color: control.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                               border.color: enabled ? "#21be2b" : "#bdbebf"

                                               Text {
                                                   text: "UP"
                                                   rotation: 90
                                                font.family: "Piboto Condensed"
                                                   font.bold: true
                                                  font.pointSize: 12
                                                    color: sw.checked? "black" :"grey"
                                                   anchors.fill: parent
                                                   fontSizeMode: Text.Fit
                                                   horizontalAlignment: Text.AlignHCenter
                                                   verticalAlignment: Text.AlignVCenter
                                               }
                                           }

                                           down.indicator: Rectangle {
                                               x: control.mirrored ? parent.width - width : 0
                                               width: parent.height
                                               anchors.verticalCenter: parent.verticalCenter
                                               radius: width/2
                                               border.width: 3
                                             height:width
                                               color: control.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                               border.color: enabled ? "#21be2b" : "#bdbebf"

                                               Text {
                                                    rotation: 90
                                                   text: "DN"
                                                    font.bold: true
                                                      font.family: "Piboto Condensed"
                                                   font.pointSize: 12
                                                  color: sw.checked? "black" :"grey"
                                                   anchors.fill: parent
                                                   fontSizeMode: Text.Fit
                                                   horizontalAlignment: Text.AlignHCenter
                                                   verticalAlignment: Text.AlignVCenter
                                               }
                                           }
                                       rotation: 270

                             }


                         }
                     }
                     }


                   }
            }

            }





}


/*##^##
Designer {
    D{i:25;anchors_height:20;anchors_width:20}
}
##^##*/


