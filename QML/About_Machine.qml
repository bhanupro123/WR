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
    visible: true
    width: 800
    height: 360
       color: "#f9ce5c"
    property real hue: Math.random()

Connections{
    target:bhanu
 onCustomer_details_to_qml:
 {
      //QString cn, QString loc,QString mid);
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
           anchors.fill: parent
                clip: true
           contentHeight: sb.checked?1200:360
           CheckBox{
               id: sb
               x: 651
               y: 7
               width:140
               height:50
               text: "Click to Edit"
           }

           Rectangle{
               id: re
               border.width: 2
               radius: 10
               y:80
               anchors.horizontalCenter: parent.horizontalCenter
               width: 700
               height:200
               Column{
                        y: 35
                        spacing: 30
                    width:294
                    height:103
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    Text {
                        id:s_name
                        width:parent.width
                        text: qsTr("SUPPLIER NAME : XXXXX")
                        font.family: "Piboto Condensed"
                        font.pointSize: 18
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft

                    }
                    Text {
                        id:l_name
                        text: qsTr("LOCATION: XXXXXX")
                        font.family: "Piboto Condensed"
                        font.pointSize: 18
                         width:parent.width
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }

                }

            Column {
                x: 370
                y: 35
                height: 103
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 50
                spacing: 30
                width:294
                Text {
                     id:c_name
                       width:parent.width
                      text: qsTr("CUSTOMER NAME:XXXXX")
                      font.family: "Piboto Condensed"
                      font.pointSize: 18
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft

                 }
                  Text {
                      id:m_name
                      text: qsTr("MACHINE ID:XXXXXX")
                      font.family: "Piboto Condensed"
                      font.pointSize: 18
                       width:parent.width
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft
                  }
            }

           }

       Rectangle{
           y:380
           width:800
           height:210
           visible: sb.checked?true:false
           color: "#00000000"
           enabled: sb.checked?true:false

    Image {
        id: c1
        x: 713
        y: 60
        width: 40
        height: 40
        fillMode: Image.Stretch
        source: "check.svg"
        MouseArea{
            anchors.fill: parent
            onClicked: {
            if(customer_name.text.length>=4)
            {
                bhanu.system_settings_cn(customer_name.text)
            }
            }
        }
    }


    TextField {
         id: machine_id
        x: 411
        y: 161
        width: 215
        height: 40
        text: qsTr("")
        maximumLength: 20
        font.pointSize: 14
        enabled: false
        placeholderText: "Machine id"
    }

    TextField {
          id: customer_name
        x: 411
        y: 59
        width: 215
        height: 41
        maximumLength: 25
        text: qsTr("")
        enabled: false
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
        text: qsTr("")
        placeholderText: "Location"
        enabled: false
    }
    Image {

        id: e1
        x: 643
        y: 60
        width: 41
        height: 40
        source: "pen.svg"
        MouseArea{
            anchors.fill: parent
        onClicked: {
            customer_name.enabled=true

        }
       }

    }
    Text {

        x: 465
        y: 115
        width: 108
        height: 23
        text: qsTr("MACHINE ID")
        font.bold: true
        font.pixelSize: 18
    }

    Text {

        x: 453
        y: 14
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



    Image {
        id: c2
        x: 320
        y: 161
        width: 40
        height: 40
        fillMode: Image.Stretch
        source: "check.svg"
        MouseArea{
            anchors.fill: parent
            onClicked: {
           if(location.text.length>=4)
            {
                bhanu.system_settings_Loc(location.text)
            }
            }
        }
    }

    Image {
        id: c3
        x: 713
        y: 161
        width: 40
        height: 40
        fillMode: Image.PreserveAspectFit
        source: "check.svg"
        MouseArea{
            anchors.fill: parent
            onClicked: {
           if(machine_id .text.length>=4)
            {
                bhanu.system_settings_mid(machine_id.text)
            }
            }
        }
    }

    Image {
        id: button_machine_id
        x: 257
        y: 161
        width: 41
        height: 40
        MouseArea {
            anchors.fill:parent
            onClicked: {
location.enabled=true
                machine_id.enabled=false
                customer_name.enabled=false
            }
        }
        source: "pen.svg"
    }

    Image {
        id: button_machine_id1
        x: 643
        y: 161
        width: 41
        height: 40
        MouseArea {
            anchors.fill: parent
            onClicked:{
             machine_id.enabled=true
            }
        }
        source: "pen.svg"
    }

    Text {
        id: element1
        x: 267
        y: 14
        text: qsTr("EDIT")
        font.bold: true
         font.family: "Piboto Condensed"
        font.pixelSize: 12
    }

    Text {
        id: element2
        x: 327
        y: 14
         font.family: "Piboto Condensed"
        text: qsTr("SAVE")
        font.bold: true
        font.pixelSize: 12
    }

    Text {
        id: element4
        x: 16
        y: 36
        text: qsTr("Min:4")
        font.pixelSize: 12
    }

    Text {
        id: element5
        x: 411
        y: 137
        text: qsTr("Min:4")
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
        id: element7
        x: 197
        y: 36
        text: qsTr("Max:10")
        font.pixelSize: 12
    }

    Text {
        id: element8
        x: 197
        y: 137
        text: qsTr("Max:25")
        font.pixelSize: 12
    }

    Text {
        id: element9
        x: 589
        y: 137
        width: 37
        height: 17
        text: qsTr("Max:15")
        font.pixelSize: 12
    }

    TextField {
        id: customer_name1
        x: 16
        y: 59
        width: 215
        height: 41
        text: qsTr("")
        maximumLength: 25
        font.pointSize: 14
        enabled: false
        placeholderText: "Supplier Name"
    }

    Image {
        id: e2
        x: 257
        y: 60
        width: 41
        height: 40
        MouseArea {
            anchors.fill: parent
        }
        source: "pen.svg"
    }

    Image {
        id: c4
        x: 320
        y: 60
        width: 40
        height: 40
        fillMode: Image.Stretch
        MouseArea {
            anchors.fill: parent
        }
        source: "check.svg"
    }

    Text {
        x: 61
        y: 14
        width: 131
        height: 23
         font.family: "Piboto Condensed"
        text: qsTr("SUPPLIER NAME")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element10
        x: 653
        y: 14
         font.family: "Piboto Condensed"
        text: qsTr("EDIT")
        font.pixelSize: 12
        font.bold: true
    }

    Text {
        id: element11
        x: 722
        y: 14
         font.family: "Piboto Condensed"
        text: qsTr("SAVE")
        font.pixelSize: 12
        font.bold: true
    }



}

           Column{
               enabled: sb.enabled?true:false
               visible: sb.enabled?true:false
               y:650
               width: parent.width
               height: 80
               Row{
                   width: 700
                   anchors.horizontalCenter: parent.horizontalCenter
                   height: 40
                   spacing: 150
                   Text {
                        font.family: "Piboto Condensed"
                       text: qsTr("Volume : "+volumee.value)
                       font.pointSize: 18

                   }
                   Text {
                        font.family: "Piboto Condensed"
                       text: qsTr("Brightness : "+slider.value)
                       font.pointSize: 18
                   }
                   Text {
                        font.family: "Piboto Condensed"
                       text: qsTr("Time Out : "+logout_timeout.value)
                       font.pointSize: 18
                   }
               }

           Row
           {
           spacing: 100
             width: parent.width
             height: 40

             Slider{
                 id:volumee
                 stepSize: 1
                 Layout.fillWidth: true
                 Layout.fillHeight: true
                 from:0
                 to:100
                 value: 0
                 onValueChanged: {

                 }
             }

           Slider {
               id: slider
               stepSize: 1
               from:15
               to:255
               Layout.fillWidth: true
               Layout.fillHeight: true
               value: 15
               onValueChanged: {
              lib1.writebrightness(slider.value)
               }
           }
           Slider {
               id: logout_timeout
               from:2
               to:10
               stepSize: 1
               Layout.fillWidth: true
               Layout.fillHeight: true
               value: 2
               onValueChanged: {

               }
           }

           }

           }
Calendar{
    id:calender
    y:750
    x:50
width:400
height:300
onClicked: {
 console.log(selectedDate.getDate())
   // date_time_text.text=selectedDate.getDate()+"/"+selectedDate.getMonth()+"/"+selectedDate.getYear()
}

}
Text {
    id: date_time_text
    width:calender.width
    font.family: "Piboto Condensed"
    font.pointSize: 18
    text: "Selected Date :"+calender.selectedDate.getDate()+"/"+calender.selectedDate.getMonth()+"/"+calender.selectedDate.getYear()
    y:calender.y
    x:calender.width
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
}

       }
}






/*##^##
Designer {
    D{i:25;anchors_height:20;anchors_width:20}
}
##^##*/


