import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Controls 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
import QtQuick.Layouts 1.0
import Qt.labs.calendar 1.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
//import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
Rectangle {

  enabled: usertype_predict=="A"||usertype_predict=="E"?true:false
    width: 800
    height: 360
       color: "#f9ce5c"
    property real hue: Math.random()

Connections{
    target:bhanu

 onCustomer_details_to_qml:
 {
      //QString cn, QString loc,QString mid);
     customer_name.text=cn
     location.text=loc
     machine_id.text=mid
     c_name.text="Customer Name: "+cn
     l_name.text="Location: "+loc
     m_name.text="Machin ID: "+mid
 }




}
       Timer{
           interval: 10
           running: true
           repeat: false
           onTriggered: {
               bhanu.customer_details();
               lib1.who_i_am("ss")
           }
       }
       ScrollView
       {
           id:sv
           width: 620
           height: 360
           anchors.horizontalCenter: parent.horizontalCenter
                clip: true
           contentHeight: sb.checked?1200:360
           CheckBox{
               id: sb
               x: 460
               y: 7
               checked: false
               width:140
               height:50
               text: "Click to Edit"
           }

           Rectangle{
               id: re
               border.width: 2
               radius: 10
               y:80
               x:10
               width: 600
               height:217

                    Text {
                        id:l_name
                        x: 8
                        y: 96
                        text: qsTr("LOCATION: XXXXXX")
                        font.family: "Piboto Condensed"
                        font.pointSize: 15
                         width:parent.width
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }




                Text {
                     id:c_name
                     x: 8
                     y: 30
                       width:parent.width
                      text: qsTr("CUSTOMER NAME:XXXXX")
                      font.family: "Piboto Condensed"
                      font.pointSize: 15
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignHCenter

                 }
                  Text {
                      id:m_name
                      x: 8
                      y: 176
                      text: qsTr("MACHINE ID:XXXXXX")
                      font.family: "Piboto Condensed"
                      font.pointSize: 15
                       width:parent.width
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignHCenter
                  }


           }

           Rectangle{
              y:320
               width:445
               height:359
           visible: sb.checked?true:false
           color: "#00000000"
           anchors.horizontalCenter: parent.horizontalCenter

              enabled: sb.checked?true:false
              Text {

               x: 190
               y: 137
               width: 44
               height: 18
               text: qsTr("Max:20")
               font.pixelSize: 12
              }
              Text {
               id: element5
               x: 16
               y: 236
               width: 104
               height: 35
               text: qsTr("Min:4")
               font.pixelSize: 12
              }
              Button{
                  x: 274
                  y: 51
                  width: 93
                  height: 41
                  text:"save"
                onClicked: {
                if(customer_name.text.length>=4)
                {
                    bhanu.system_settings_cn(customer_name.text)
                }
                }

           }


           TextField {
             id: machine_id
            x: 16
            y: 277
            width: 215
            height: 40
            text: qsTr("")
            maximumLength: 20
            font.pointSize: 14

            placeholderText: "Machine id"
           }

           TextField {
              id: customer_name
            x: 19
            y: 57
            width: 215
            height: 41
            maximumLength: 25
            text: qsTr("")

            font.pointSize: 14
            placeholderText: "Customer name"

           }

           TextField {
            id: location
            x: 16
            y: 161
            width: 215
            height: 40
            maximumLength: 15
            font.pointSize: 14
            text: qsTr("")
            placeholderText: "Location"

           }
           Text {

            x: 70
            y: 207
            width: 108
            height: 23
            text: qsTr("MACHINE ID")
            font.bold: true
            font.pixelSize: 18
           }

           Text {

            x: 70
            y: 6
            width: 131
            height: 23
            text: qsTr("CUSTOMER NAME")
            font.bold: true
            font.pixelSize: 18
           }


           Text {
            id: element3
            x: 82
            y: 115
            width: 88
            height: 23
            text: qsTr("LOCATION")
            font.bold: true
            font.pixelSize: 18
           }



           Button{
               x: 274
               y: 161
               width: 93
               height: 41
               text:"save"
                onClicked: {
               if(location.text.length>=4)
                {
                    bhanu.system_settings_Loc(location.text)
                }
                }

           }




           Text {

            x: 190
            y: 236
            width: 41
            height: 14
            text: qsTr("Max:12")
            font.pixelSize: 12
           }



           Text {
            id: element6
            x: 16
            y: 137
            text: qsTr("Min:4")
            font.pixelSize: 12
           }






           Text {
            id: element10
            x: 16
            y: 366
            width: 29
            height: 8
            font.family: "Piboto Condensed"
            text: qsTr("EDIT")
            font.pixelSize: 12
            font.bold: true
           }
           Button{
               x: 274
               y: 277
               width: 93
               height: 41
               text:"save"
                onClicked: {
               if(machine_id .text.length>=4)
                {
                    bhanu.system_settings_mid(machine_id.text)
                }

            }
           }
           Text {
            id: element11
            x: 190
            y: 373
            width: 56
            height: 17
            font.family: "Piboto Condensed"
            text: qsTr("SAVE")
            font.pixelSize: 12
            font.bold: true
           }

           Text {
               id: element7
               x: 19
               y: 36
               width: 42
               height: 15
               text: qsTr("Min:4")
               font.pixelSize: 12
           }

           Text {
               x: 202
               y: 36
               width: 44
               height: 15
               text: qsTr("Max:20")
               font.pixelSize: 12
           }



           }


       }



}






/*##^##
Designer {
    D{i:22;anchors_height:20;anchors_width:20}D{i:23;anchors_height:20;anchors_width:20}
}
##^##*/


