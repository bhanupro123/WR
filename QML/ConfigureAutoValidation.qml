import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.0

import QtQuick.Layouts 1.2
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 2.0

Rectangle
{
    color: "#ffffff"
    id: rectangle
    width: 800
    height: 360
    enabled: usertype_predict=="A"||usertype_predict=="E"?true:false

    Connections{
     target: bhanu
         onUsernametoqml:{

            if(usertype_predict==="A"||usertype_predict==="E")
            {

                c1.enabled=true
                c2.enabled=true
                save.enabled=true
                clear.enabled=true

            }
            else{

                c1.enabled=false
                c2.enabled=false
                save.enabled=false
                clear.enabled=false
            }
       }
}

    property int time_limit_count:9
    property int hours_1:0
    property int minuts_1:0

    property int hours_2:0
    property int minuts_2:0

    property int hours_3:0
    property int minuts_3:0

    property int hours_4:0
    property int minuts_4:0

    property int hours_5:0
    property int minuts_5:0

    property int hours_6:0
    property int minuts_6:0

     property int present_1:0

Connections{
    target: bhanu
    onAuto_validate_to_qml:{
    console.log(ha,maa,hb,mb,hc,mc,hd,md,he,me,hf,mf,"values")
        hours_1=ha
        minuts_1=maa

        hours_2=hb
        minuts_2=mb

        hours_3=hc
        minuts_3=mc

        hours_4=hd
        minuts_4=md

        hours_5=he
        if(hours_5==1)
        {
            cb1.checked=true
        }
        else
        {
            cb1.checked=false
        }

        minuts_5=me
        if(minuts_5==1)
        {
            cb2.checked=true
        }
        else
        {
            cb2.checked=false
        }
        hours_6=hf
        if(hours_6==1)
        {
            cb3.checked=true
        }
        else
        {
            cb3.checked=false
        }
        minuts_6=mf
        if(minuts_6==1)
        {
            cb4.checked=true
        }
        else
        {
            cb4.checked=false
        }
    }


}

    Timer{
        interval: 10
        running: true
        repeat: false
        onTriggered: {
     bhanu.finduser()
            bhanu.readautovalidate()
            lib1.who_i_am("vs")
        }
    }
Text {
    id: element
    x: 234
    y: 14
    text: qsTr("Auto Validation Prompt Time")
    font.pixelSize: 12
}

Rectangle {
    id: rectangle1
    x: 40
    y: 54
    width: 536
    height: 288
    anchors.horizontalCenter: parent.horizontalCenter
    color: "#cebebe"

    Text {
        id: element1
        x: 57
        y: 25
        width: 89
        height: 25
        text: qsTr("Validation Time")
        font.pixelSize: 12
    }

    Text {
        id: element2
        x: 217
        y: 25
        width: 50
        height: 15
        text: qsTr("Edit Time")
        font.pixelSize: 12
    }

    Text {
        id: element3
        x: 318
        y: 25
        text: qsTr("Enable/Disable")
        font.pixelSize: 12
    }
    ColumnLayout{
        x: 5
        width: 20
        spacing: 10
        height: parent.height*0.5
anchors.verticalCenterOffset: 30
        anchors.verticalCenter: parent.verticalCenter

       Text {

           text: qsTr("1")
           font.pointSize: 14
           font.bold: true
       }
       Text {

           text: qsTr("2")
           font.pointSize: 14
           font.bold: true
       }
       Text {

           text: qsTr("3")
           font.pointSize: 14
           font.bold: true
       }
       Text {

           text: qsTr("4")
           font.pointSize: 14
           font.bold: true
       }



    }
    ColumnLayout{
        x: 49
        width: 105
        spacing: 10
        height: parent.height*0.5

anchors.verticalCenterOffset: 30
        anchors.verticalCenter: parent.verticalCenter

    Rectangle {
        id: rectangle2
        x: 37
        y: 62
       Layout.fillHeight: true
       Layout.fillWidth: true
        color: "#ffffff"
        Text {
            anchors.fill: parent
            text: hours_1+":"+minuts_1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }
    }

    Rectangle {

        x: 37
        y: 62
       Layout.fillHeight: true
       Layout.fillWidth: true
        color: "#ffffff"
        Text {
            anchors.fill: parent
            text: hours_2+":"+minuts_2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }
    }

    Rectangle {

        x: 37
        y: 62

       Layout.fillHeight: true
       Layout.fillWidth: true
        color: "#ffffff"
        Text {
            anchors.fill: parent
          text: hours_3+":"+minuts_3
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }
    }
    Rectangle {

        x: 37
        y: 62
       Layout.fillHeight: true
       Layout.fillWidth: true
        color: "#ffffff"
        Text {
            anchors.fill: parent
            text: hours_4+":"+minuts_4
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }
    }



    }
    ColumnLayout{
        x: 200
        y: 67
          id:c1
        width: 100
        spacing: 10
        height: parent.height*0.5

anchors.verticalCenterOffset: 30
        anchors.verticalCenter: parent.verticalCenter

         Button {

                x: 37
                y: 62
               Layout.fillHeight: true
               Layout.fillWidth: true
               text: "Edit"
               onClicked: {

                present_1=1
                   control.currentIndex=hours_1
                   control1.currentIndex=minuts_1/15
               }

            }
         Button {

                x: 37
                y: 62
               Layout.fillHeight: true
               Layout.fillWidth: true
               text: "Edit"
               onClicked: {
                present_1=2
                   control.currentIndex=hours_2
                   control1.currentIndex=minuts_2/15
               }

            }
         Button {

                x: 37
                y: 62
               Layout.fillHeight: true
               Layout.fillWidth: true
               text: "Edit"
               onClicked: {
                   control.currentIndex=hours_3
                   control1.currentIndex=minuts_3/15
                present_1=3
               }

            }
         Button {

                x: 37
                y: 62
               Layout.fillHeight: true
               Layout.fillWidth: true
               text: "Edit"
               onClicked: {
                present_1=4
                   control.currentIndex=hours_4
                   control1.currentIndex=minuts_4/15
               }

            } 


    }

//    CheckBox {

//        x: 337
//        y: 57
//         width:40
//         height: 40
//          id:cb
//          text: "Select all"
//          onCheckedChanged:
//         {
//          if(cb.checked)
//          {
//              cb1.checked=true
//              cb2.checked=true
//              cb3.checked=true
//              cb4.checked=true
//          }
//          else
//          {
//              cb1.checked=false
//              cb2.checked=false
//              cb3.checked=false
//              cb4.checked=false
//          }

//          }

//       }

    ColumnLayout{
        id:c2
        x: 337
        y: 67
        width: 40
        spacing: 10
        height: parent.height*0.5

         anchors.verticalCenterOffset: 30
        anchors.verticalCenter: parent.verticalCenter
          CheckBox {

                   x: 37
                   y: 62
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  id:cb1
                  onCheckedChanged: {
                      if(cb1.checked)
                      {
                      hours_5=1
                  }
                      else{
                       hours_5=0
                      }
                  }


               }
            CheckBox {

                   x: 37
                   y: 62
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  id:cb2
                  onCheckedChanged: {
                      if(cb2.checked)
                      {
                     minuts_5=1
                  }
                      else{
                       minuts_5 =0
                      }
                  }

               }
            CheckBox {

                   x: 37
                   y: 62
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  id:cb3
                  onCheckedChanged: {
                      if(cb3.checked)
                      {
                     hours_6 =1
                  }
                      else{
                       hours_6 =0
                      }
                  }

               }
            CheckBox {

                   x: 37
                   y: 62
                  Layout.fillHeight: true
                  Layout.fillWidth: true

                  id:cb4
                  onCheckedChanged: {
                      if(cb4.checked)
                      {
                     minuts_6=1
                  }
                      else{
                       minuts_6 =0
                      }
                  }
               }


    }
    ColumnLayout{
        x: 420
        y: 43

        width: 100
        spacing: 10
        height: parent.height*0.5
        anchors.verticalCenterOffset: 30
        anchors.verticalCenter: parent.verticalCenter

            Button{
                id:save
                width: 100
                height: 40
                text: "SAVE"
                onClicked: {
console.log(hours_1,minuts_1,hours_2,minuts_2,
            hours_3,minuts_3,hours_4,minuts_4,
            hours_5,minuts_5,hours_6,minuts_6," qml")
    bhanu.autovalidate(hours_1,minuts_1,hours_2,minuts_2,
                      hours_3,minuts_3,hours_4,minuts_4,
                      hours_5,minuts_5,hours_6,minuts_6
                      )

    present_1=0

                }

            }
            Button{
                id:clear
                width: 100
                height: 40
                text: "ESC"
                onClicked: {
                    bhanu.readautovalidate()
                    present_1=0
                }
            }

}
    Rectangle{
        id:dateandtime_picker
        visible: present_1>0?true:false
        border.width: 2

        enabled: present_1>0?true:false
        width: 536
        height: 288
        ColumnLayout{
            width: 100
            height: 80
            x:420
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
            Button{

                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "Enter "
                onClicked: {
    if(present_1==1)
    {
     hours_1=control.currentIndex
        minuts_1=control1.currentIndex*15
    }
     else if(present_1==2)
    {
     hours_2=control.currentIndex
        minuts_2=control1.currentIndex*15
    }
    else if(present_1==3)
    {
     hours_3=control.currentIndex
        minuts_3=control1.currentIndex*15
    }
    else if(present_1==4)
    {
     hours_4=control.currentIndex
        minuts_4=control1.currentIndex*15
    }
    else if(present_1==5)
    {
     hours_5=control.currentIndex
        minuts_5=control1.currentIndex*15
    }
    else if(present_1==6)
    {
     hours_6=control.currentIndex
        minuts_6=control1.currentIndex*15
    }


    present_1=0

                }
            }
            Button{

                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "ESC"
                onClicked: {
                    bhanu.readautovalidate()
                    present_1=0
                }
            }
        }


Rectangle{
      anchors.centerIn: parent
      width: rl.width
      height: rl.height
      border.width: 2
      radius: 10
    RowLayout{
        id:rl
           anchors.centerIn: parent
           Tumbler {
             id: control
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: 24
            currentIndex: 0

            delegate: Text {
                     text: modelData<10?"0"+(modelData):(modelData)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (5 / 2)
                }
        }

    Tumbler {
        currentIndex: 0

         id: control1
        Layout.fillHeight: true
        Layout.fillWidth: true
        model: 4

        delegate: Text {
               text: modelData*15<10?"0"+(modelData*15):(modelData*15)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (control1.visibleItemCount / 2)
            }
    }
    }
}
Text {
    id: name
    topPadding: 10
    text: "Time : "+(control.currentIndex)+":"+(control1.currentIndex*15)
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    font.pointSize: 20

}

    }




}









}

/*##^##
Designer {
    D{i:24;anchors_height:25;anchors_width:128;anchors_x:40;anchors_y:45}
}
##^##*/
