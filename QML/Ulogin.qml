import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3
//import QtQuick.VirtualKeyboard 2.2
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

//import Qt3D.Extras 2.14

Rectangle
{
    id: rectangle
    width: 800
    height: 360
color: "#87bed3"
    property var fun1: function(){
        comboBox.currentIndex=0
        textField.clear()
        tf1.clear()
        u_combo.clear()
       textField_create.clear()
        tumbler.currentIndex=0
    }
    property int fp_idd: 10000
    property bool tr: true
       property string a: ""
       property string bb: ""
       property string c: ""
    property string usertype: ""
    property string str: ""
    property string use:""
    property string pass: ""
    property string username_predict: ""

property int status_of_button: 0
  property int status_of_select_button: 2
    Timer {
                id:time2
                interval: 10; running: true; repeat: false
                onTriggered: {
                    bhanu.finduser()
                   model.clear()
                    model1.clear()
                    listView.currentIndex=-1
                   bhanu.ulist(status_of_select_button)
                    str="ADMIN"
                    comboBox.editText="ADMIN"

            }
    }
    Timer{
        interval: 10
        running: true
        repeat: false
        onTriggered: {
            lib1.who_i_am("us")

        }
    }

    Connections{
        target: lib1
        onTexttoqml:{
            date_qml.text=date+"\n"+time
        }

    }

    Connections{
        target: bhanu
  onLunch_fp_screen:{
       if(is_it_lunch_fp_screen)
       {
                 bhanu.logout(true)
                is_create_in_active=true
                stack_B.push(finger_print_scan)
       }
  }
        onUsernametoqml:{

            console.log("bhanu connections",user_type_cpp,"   ",username)
            username_predict=username
            usertype_predict=user_type_cpp
            if(usertype_predict=="E")
            {
                     button5.enabled=false
                button_fp.enabled=false
                status_hint.text="Successfully Loged-in"
                userid.text="User :\n"+username_predict
                     timeout_value=180
                     timer.restart()
                        updatebutton.enabled=true
                button7.enabled=true
                      button.enabled=true
            }

            if(usertype_predict=="A")
            {
                     button5.enabled=false
button_fp.enabled=false
       status_hint.text="Successfully LogedIN"
           userid.text="User :\n"+username_predict
                timeout_value=180
                timer.restart()
                button7.enabled=true
                button.enabled=true
                updatebutton.enabled=true

            }
            if(usertype_predict=="S")
            {
button_fp.enabled=false
                     button5.enabled=false
                status_hint.text="Successfully LogedIN"
            userid.text="User :\n"+username_predict
                timer.restart()
                                button7.enabled=true
                timeout_value=180
            button.enabled=true
                updatebutton.enabled=true
            }
            if(usertype_predict=="O")
            {
                     button5.enabled=false
button_fp.enabled=false
                status_hint.text="Successfully Loged-in"
             userid.text="User :\n"+username_predict
                timeout_value=180
                timer.restart()
                button.enabled=false
                updatebutton.enabled=false
                                button7.enabled=false
            }

            if(usertype_predict=="")
            {
button_fp.enabled=true
                     button5.enabled=true
                status_hint.text=""
             userid.text="User :\n"+username_predict
                timeout_value=180
                timer.stop()
                canvas_time.requestPaint()
                    button.enabled=false
                   updatebutton.enabled=false
                                button7.enabled=false
            }


        }
        onList:{
            model.append({text:str1})
            model1.append({text:str1})
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
             time2.restart()
         }
     }

    }
    property int timeout_value:180
    Dialog {
        id: dialog
        x: 135
        y: 125
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
            dialog.visible=false
        }
        onRejected: {
            dialog.visible=false
        }

    }

    Rectangle {
        id: combo
        color: "#87bed3"
    anchors.fill: parent
    Rectangle{
        x: 250
        y: 45
        width:233
        id:rr
       visible: model.count>0?true:false
        height: 307
        color: "#c29aee"

                 ColumnLayout {
                     anchors.fill: parent
                     ListView {
                         id: listView
                         cacheBuffer: 0
                         width: parent.width-10
                         flickableDirection: Flickable.VerticalFlick
                         boundsBehavior: Flickable.StopAtBounds
                         clip: true
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                        currentIndex: -1


                        model: ListModel{
                         id:model
                        }
                         ScrollBar.vertical: ScrollBar {
                             id:sv
                             active: true
                           policy: ScrollBar.AlwaysOn
                        background:
                            Rectangle{
                            width:10
                            height:334
                            radius: 5
                            color: "black"
                        }
                         }
          onCurrentIndexChanged: {
                   if(listView.currentIndex>=0)
                   {
                      if(status_of_select_button==0)
                      {
                          comboBox.editText =model.get(listView.currentIndex).text
                          str="A-"+model.get(listView.currentIndex).text
                      }
                      if(status_of_select_button==1)
                      {
                           comboBox.editText =model.get(listView.currentIndex).text
                          str="S-"+model.get(listView.currentIndex).text

                      }
                      if(status_of_select_button==2)
                      {

                          comboBox.editText =model.get(listView.currentIndex).text
                          str="O-"+model.get(listView.currentIndex).text

                      }

                    }
          }

                         highlight: Rectangle {
                             width:listView.width-120
                             height: 40
                             border.color: "red"
                             border.width: 1
                             radius: 7
                             color: "pink"
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     console.log("clicked")
                                 }
                             }
                         }

                         delegate:
                             Text {
                             width: listView.width-10
                             height: 40
                             verticalAlignment: Text.AlignVCenter
                             text:"  "+ modelData
                             font.bold: true
                             color: "white"
                             font.pointSize: 12
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {

                                     listView.currentIndex=index

                                 }

                         }
                         }

                     }
                 }
    }



    RowLayout{
        width: parent.width*0.35
           spacing: 2
anchors.right: combo.right
    anchors.rightMargin: 20

    Button{
         id:button_login
         height: 40
         text:"LOGIN"
         Layout.fillWidth: true
         font.bold: true
         background: Rectangle {
             width:button_login.width
             color:status_of_button===0 ? "yellow" :"#d4c9df"
             border.color:status_of_button===0 ?"black":"red"
             border.width: 2
             radius: 7
         }

         onClicked: {

   status_of_button=0
             fun1()
         }
    }

    Button{
        id:button_create
        height: 40
Layout.fillWidth: true
        text:"CREATE"
        font.bold: true
     onClicked: {
   status_of_button=1
         fun1()
     }
     background: Rectangle {
         width: button_create.width
         color:status_of_button===1 ? "yellow" :"#d4c9df"
         border.color:status_of_button===1 ?"black":"red"
         border.width: 2
         radius: 7

     }

    }
    Button{
        id:button_edit
        height: 40
Layout.fillWidth: true
        text:"EDIT"
        font.bold: true
        background: Rectangle {
            width:button_edit.width
            implicitHeight: 30
            color:status_of_button===2 ? "yellow" :"#d4c9df"
            border.color:status_of_button===2 ?"black":"red"
            border.width: 2
            radius: 7
        }
        onClicked: {
   status_of_button=2
            fun1()
        }
    }
    Button{
        id:button_delete
        height: 40
Layout.fillWidth: true
        text:"DELETE"
        font.bold: true
         background: Rectangle {
             width: button_delete.width
             implicitHeight: 30
             color:status_of_button===3 ? "yellow" :"#d4c9df"
             border.color:status_of_button===3 ?"black":"red"
             border.width: 2
             radius: 7
         }
         onClicked: {
   status_of_button=3
             fun1()
         }
   }
    }





            Canvas {
                 id: canvas3
                 x: -98
                 y: 80
                 width: 200
                 height: 200





                     enabled: false

                 onPaint: {
                     var ctx = getContext("2d")
                     ctx.clearRect(0, 0, width, height)

                         ctx.strokeStyle = "#F5F5F5"


                     ctx.lineWidth = 5
                     ctx.beginPath()
                     var startAngle = 43.1
                     var endAngle =44.85
                     ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                     ctx.stroke()
                     console.log(startAngle,endAngle)
                 }
             }

        Rectangle{

            width: 15
            height: width
         radius: width/2
         color: "#F5F5F5"

         anchors.top: parent.top
         anchors.topMargin:( parent.width*0.1)+adminn.height/3
         anchors.right: adminn.left
         anchors.rightMargin: 15
        }
        Button {
            id:adminn
            x: 83
            width: 110
            height: 42
            text: qsTr("ADMIN")
            anchors.topMargin: 81
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 607
            font.bold: true
            background: Rectangle {
                width: 109

                implicitWidth: 102
                implicitHeight: 30
                color:status_of_select_button===0 ? "yellow" :"#d4c9df"
                border.color:status_of_select_button===0 ?"black":"red"
                border.width: 2
                radius: 7
            }
            onClicked: {
                status_of_select_button =0
                typ.text="ADMIN"
                 time2.restart()

            }

        }
        Rectangle{
            x: 87
            anchors.right: superr.left
              anchors.verticalCenter: parent.verticalCenter
            width: 15
            height: width
            radius: width/2
            anchors.verticalCenterOffset: 1
            color: "#F5F5F5"
     anchors.rightMargin: 26
        }
        Button {
            id:superr
            x: 128
            width: 118
            height: 42
            text: qsTr("SUPERVISOR")
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 554
            font.bold: true
            background: Rectangle {
                width: 116
                implicitWidth: 102
                implicitHeight: 30
                color:status_of_select_button===1 ? "yellow" :"#d4c9df"
                border.color:status_of_select_button===1?"black":"red"
                border.width: 2
                radius: 7
            }
            onClicked: {
                status_of_select_button =1
                typ.text="SUPERVISOR"
                time2.restart()

            }
        }
        Rectangle{

            width: 15
            height: 15
            radius: width/2
            anchors.bottom: parent.bottom
            anchors.bottomMargin:parent.width*0.1+button3.height/3
            color: "#F5F5F5"

            anchors.right: button3.left
            anchors.rightMargin: 15
        }
        Button {
            id: button3
            x: 83
            y: 238

            width: 110
            height: 42
            text: qsTr("OPERATOR")
            anchors.bottomMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 607
            anchors.bottom: parent.bottom
            font.bold: true
            background: Rectangle {
                width: 109

                implicitWidth: 102
                implicitHeight: 30
                color:status_of_select_button===2 ? "yellow" :"#d4c9df"
                border.color:status_of_select_button===2 ?"black":"red"
                border.width: 2
                radius: 7
            }
            onClicked: {
                status_of_select_button =2
                typ.text="OPERATOR"
                 time2.restart()

            }
        }


    }



Text {
    id: element
    x: 415
    y: 503
    width: 168
    height: 24
    text: qsTr("")
    font.family: "Arial"
    font.pointSize: 15
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
}

Rectangle {
    id: login
  width: parent.width*0.35
  anchors.top: parent.top
  anchors.topMargin: 40
  anchors.bottom: parent.bottom
  anchors.bottomMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 20
    visible: status_of_button==0?true:false
    enabled: status_of_button==0?true:false

    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#67d4a9"
        }

        GradientStop {
            position: 1
            color: "#f4c070"
        }
    }



   ComboBox{
        id: comboBox
        x: 48
        y: 26
       width: parent.width-28
        height: 45
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
font.bold: true
         editable: true

model:ListModel
{
 id:model1
}


onEditTextChanged: {
 console.log(comboBox.editText,"   et")
}
popup: Popup{
}
    }

    TextField {
        id: textField
        x: 48
        y: 98
  width: parent.width-28
        height: 45
        text: ""
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 11

        placeholderText: "Enter Password"
        color: "red"
        echoMode: TextInput.Password
    }


    Button {
        id: button5
        x: 201
        y: 265
        enabled: true
        width:71
        anchors.bottom: parent.bottom
        anchors.right: parent.right
          anchors.rightMargin: 8
          anchors.bottomMargin: 15
          text: qsTr("LOGIN")
        font.bold: true
        font.pointSize: 12
        height: 40
        background: Rectangle {
            id:b_login
            implicitWidth: 95
            implicitHeight: 59
            color:button5.down ? "yellow" :"white"
            border.color: button5.down ? "black":"red"
            border.width: 2
            radius: 7
        }
        onPressAndHold: {
            if(comboBox.editText==="#*#*" && textField.text=="*#*#")
            {
                bhanu.engine("E")
                bhanu.logout(true)
            }
      fun1()

        }


        onClicked: {

            if(str=="ADMIN")
            {
            bhanu.admin(str,textField.text,0)
            }
            else
            {
            if(listView.currentIndex>=0&&usertype=="")
            {
            bhanu.verify(str,textField.text)
            }
            else
            {
            element.text="User already logedin"
            }
            }
            fun1()

                 }
    }

    Button {
        y: 235

        width: 72
        height: 40
        highlighted: true
        anchors.bottom: parent.bottom
        anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottomMargin: 15
        text: qsTr("CLEAR")
        font.bold: true
        onClicked: {
            fun1()
        }
    }

    Text {

        x: 48
        y: 75
        color: "#070606"
        text: qsTr("Enter Password")
        font.bold: true
        font.pixelSize: 12
    }

    Text {

        x: 48
        y: 6
        color: "#070606"
        text: qsTr("Select User name")
        font.pixelSize: 12
                   font.family: "Piboto Condensed"
        font.bold: true
    }

    Text {

        x: 48
        y: 147
        width: 92
        height: 17
        color: "#070606"
                   font.family: "Piboto Condensed"
        text: qsTr("User Type")
        font.pixelSize: 12
        font.bold: true
    }

    Rectangle {
        id: rectangle1
        y: 170
       width: parent.width-28
        height: 45
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
           font.family: "Piboto Condensed"
            color: "#000000"
            text: "Operator"
            id:typ
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            font.bold: false
        }
    }

    Button {
        id: button_fp
        x: 90
        y: 265
        text: qsTr("FP")
        onClicked:
        {
            bhanu.detect1()
        }
    }
}



Rectangle {
    id: edit
    width: parent.width*0.35
    anchors.top: parent.top
    anchors.topMargin: 40
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
      anchors.right: parent.right
      anchors.rightMargin: 20
      visible: status_of_button==2?true:false
      enabled: status_of_button==2?true:false
    Text {

        x: 48
        y: 75
        color: "#070606"
        text: qsTr("Enter Password")
        font.bold: true
        font.pixelSize: 12
    }

    Text {

        x: 48
        y: 6
        color: "#070606"
        text: qsTr("Select User name")
        font.pixelSize: 12
        font.bold: true
    }


    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#67d4a9"
        }

        GradientStop {
            position: 1
            color: "#f4c070"
        }
    }


    TextField {
        id: tf
   activeFocusOnTab: true
        x: 21
        y: 24
        width: parent.width*0.9
        height: 45
        font.pointSize: 12
        font.family: "Arial"
        enabled: false
        text: str
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter


}
    TextField {
        id: tf1
        x: 21
        y: 98
        activeFocusOnTab: true
      width: parent.width*0.9
        height: 45
        font.pointSize: 12
        font.family: "Arial"

        enabled: true
        placeholderText: "Enter New password"
        text: qsTr("")
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        echoMode: TextInput.Password

    }
    Button {
        y: 242


        width:74
        height: 40

        text: qsTr("CLEAR")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            fun1()
        }
    }
    Button {
        y: 242
activeFocusOnTab: true
anchors.bottom: parent.bottom
anchors.bottomMargin: 8
anchors.left: parent.left
anchors.leftMargin: 15
font.pointSize: 12
        font.family: "Arial"
        width: 74
        height: 40
        text: qsTr("EXIT")
        onClicked: {
            status_of_button=0
        }
    }
     Button{
         id:updatebutton
         x: 188
         y: 242

       width:79
         height: 40
         text: "UPDATE"
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 8
         anchors.right: parent.right
         anchors.rightMargin: 13
         font.pointSize: 12
         enabled: false
         background: Rectangle {
             id:updatebuttonrect
             width: 80
             implicitWidth:188
             implicitHeight: 43
             color: updatebutton.down ? "yellow" : "white"
             border.color: "red"
             border.width: 2

         }
         onClicked: {

              pass=tf1.text
             if(str=="ADMIN"&&pass.length>=3)
             {
                 bhanu.admin(str,pass,1)
             }
else{
             if(str!=username_predict&&tf1.length>3)
             {
                     bhanu.update(str,pass)
                      bhanu.logout(true);
            }

             else{
                 tf1.text=""
                 hint.text="Check once "
             }
         }

         fun1()
         }
     }






}

Rectangle {
    id: dele
      width: parent.width*0.35

    anchors.top: parent.top
    anchors.topMargin: 40
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
      anchors.right: parent.right
      anchors.rightMargin: 20
      visible: status_of_button==3?true:false
      enabled: status_of_button==3?true:false

    Button {
activeFocusOnTab: true
anchors.bottom: parent.bottom
anchors.bottomMargin: 8
anchors.left: parent.left
anchors.leftMargin: 8
        font.pointSize: 12
        font.family: "Arial"
        width: 127
        height: 40
        text: qsTr("EXIT")
        onClicked: {
            status_of_button=0
        }
    }
    Button {
        id: button7
        x: 146
        y: 242
        width: 126
        height: 40
        text: qsTr("Delete")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        onClicked: {
            if(str!=username_predict&&str!="ADMIN")
                {
              bhanu.delet(str)
                    time2.restart()
                }
               else{
                    status_hint.text="You can not delete this user"
                }

        }

        background: Rectangle {
            id: b_login2
            color: button7.down ? "yellow" :"white"
            radius: 7
            border.width: 2
            border.color: button7.down ? "black":"red"
            implicitHeight: 59
            implicitWidth: 95
        }

        enabled: true
        font.pointSize: 18
    }




    Text {

        width: 92
        height: 17
        color: "#070606"
        text: "Selected User Name :"+"\n"+str
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        font.pixelSize: 18
        font.bold: true
    }


    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#67d4a9"
        }

        GradientStop {
            position: 1
            color: "#f4c070"
        }
    }
}

Rectangle{
         id: create
    anchors.fill: parent
    visible: status_of_button==1&&usertype_predict!=""?true:false
    enabled: status_of_button==1&&usertype_predict!=""?true:false
    Button {
        id: button
        x: 677
        y: 160
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 41
        anchors.bottomMargin: 160
        width: 82
        height: 40
        enabled: true
        text: qsTr("Create")
        activeFocusOnTab: true
        onClicked: {


        }

        font.pointSize: 12
        background: Rectangle {
            id:b
            implicitWidth: 82
            implicitHeight: 40
            color:button.down ? "yellow" : "#00000000"
            border.color: "red"
            border.width: 2
            radius: 7
        }
    }

    Button {
        y: 159
activeFocusOnTab: true
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 161
       anchors.horizontalCenter:parent.horizontalCenter
       width: 76
       height: 40
        font.pointSize: 12
        font.family: "Arial"
        text: qsTr("CLEAR")
        anchors.horizontalCenterOffset: 208
        onClicked: {
            fun1()
        }
    }
    Button {
        x: 430
        y: 160
activeFocusOnTab: true
anchors.bottom: parent.bottom
anchors.bottomMargin: 161

font.pointSize: 12
        font.family: "Arial"
        width: 82
        height: 40
        text: qsTr("EXIT")
        onClicked: {
            status_of_button=0
        }
    }

Rectangle {

    y: 0
    width:293
    height:311
    radius: 10
    anchors.verticalCenterOffset: 1
    anchors.left: parent.left
    anchors.leftMargin: 52
    border.width: 0
    anchors.verticalCenter: parent.verticalCenter


    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#67d4a9"
        }

        GradientStop {
            position: 1
            color: "#f4c070"
        }
    }


    Text {

        x: 48
        y: 75
        color: "#070606"
        text: qsTr("Enter Password")
        font.bold: true
        font.pixelSize: 12
    }

    Text {

        x: 48
        y: 6
        color: "#070606"
        text: qsTr("Select User name")
        font.pixelSize: 12
        font.bold: true
    }

    Text {

        x: 48
        y: 147
        width: 92
        height: 17
        color: "#070606"
        text: qsTr("User Type")
        font.pixelSize: 12
        font.bold: true
    }
    TextField {
        id: u_combo
        x: 37
        y: 24
       width: parent.width*0.9
        activeFocusOnTab: true
        height: 45
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 12
        font.family: "Arial"
        placeholderText: "Enter Username"
        onTextEdited: {
           a=u_combo.text
       }
    }

    TextField {
        activeFocusOnTab: true
        id: textField_create
      x: 49
        y: 98
     width: parent.width*0.9
        height: 43

        text:""
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 12
        font.family: "Arial"
        placeholderText: "Enter password"
          echoMode: TextInput.Password
         color: "red"
         onTextEdited: {
            bb=textField_create.text

         }
    }


        ComboBox{
            id: tumbler
          x: 37
            y: 176
          width: parent.width*0.9
          height: 45
          displayText: "Select Type"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            font.family: "Arial"
            currentIndex: -1

            model: ["Admin","Supervisor","Operator"]
            onCurrentIndexChanged: {
  bhanu.logout(true)
                    if(currentIndex==0)
                    {
                            tumbler.displayText="Admin"
                        c="A"
                    }
                   if(currentIndex==1)
                    {
                            tumbler.displayText="Supervisor"
                        c="S"
                    }
                   if(currentIndex==2)
                   {
                            tumbler.displayText="Operator"
                       c="O"
                   }
                   console.log(currentIndex,"tumbler current Index",c)
            }



        }


        Button {
            id:enroll
            enabled:textField_create.length>3&&u_combo.length>3?true:false
        width: parent.width*0.9
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 30
           anchors.horizontalCenter:parent.horizontalCenter
           height: 40
            font.pointSize: 12
            font.family: "Arial"
            text: qsTr("Enroll Finger")
            onClicked: {
                if(u_combo.text.length>3&& textField_create.length>3&&tumbler.currentIndex>=0)
                          //  if(u_combo.text.length>3&& textField_create.length>3&&tumbler.currentIndex>=0&&fp_idd<=1000)
                            {
                                bhanu.logout(tr);
                                bhanu.add(c,a,bb)
                                textField_create.clear()
                                u_combo.clear()
                                tumbler.currentIndex=0
                                time2.restart()
                            }
                            else{
                                bhanu.notify_to_qml_from_qml("Choose Strong Username & Password",false);
                 console.log(c,a,bb,"faill")
                            }



            }
        }



}
}


Rectangle {
    id: rectangle2
    x: 250
    y: 14
    width: 233
    height: 31
    visible: create.visible?false:true
       enabled: create.visible?false:true
    color: listView.currentIndex==-1? "pink":"#c29aee"
    border.color:listView.currentIndex==-1 ? "red":"#c29aee"
    border.width: listView.currentIndex==-1 ? 0:1
    radius: listView.currentIndex==-1 ? 7:0
    Text {
        id:adminname
        font.bold: true
        color: "white"
        font.pointSize: 12
        text: qsTr("  Admin")
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
status_of_select_button==3
            listView.currentIndex=-1
            str="ADMIN"
comboBox.editText="ADMIN"
        }
    }
}

Text {
    id: status_hint
    x: 370
    y: 444
    color: "#f7f6f6"
    text: qsTr("")
               font.family: "Piboto Condensed"
    font.bold: true
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    anchors.horizontalCenter: parent.horizontalCenter
    font.pixelSize: 20
}


}







/*##^## Designer {
    D{i:79;anchors_height:22;anchors_width:200}D{i:89;anchors_height:22;anchors_width:200}
D{i:93;anchors_height:22;anchors_width:200}D{i:96;anchors_height:22;anchors_width:200}
}
 ##^##*/
