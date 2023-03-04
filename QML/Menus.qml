import QtQuick.VirtualKeyboard 2.2
import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Rectangle {                                // DELETE form
    id:rect
    width: 800
    height: 360
 color: "#ffffff"
      property Component dateandtime: DateAndTime{}
 property Component brightnessandvolume: BrightnessandVolume{}
 property Component ethernetSettings:EthernetSettings{}
  property Component wifiSettings:Filter_Setting{}

 property Component configureAutovalidation: ConfigureAutoValidation{}
 property Component configureESignature:ConfigureESignature{}
 property Component customerSettings:CustmerSettings{}
property Component autolearn: AutoLearn{}



ColumnLayout {
     id: rectangle
     x: 0
     y: 0
     width: 180
     height: parent.height



Rectangle{
id:r1

Layout.fillHeight:true
Layout.fillWidth: true

color:"#6E6E6E"
MouseArea{
 anchors.fill: parent
    onClicked: {
        r2.color="#080a0c"
        r3.color="#080a0c"
        r4.color="#080a0c"
        r5.color="#080a0c"
        r1.color="#6E6E6E"
        stack4.clear()
        stack4.push(dateandtime)

    }

         Text {
            leftPadding: 10
             y:8
             color: "#ffffff"
             text: qsTr("Date And Time")
             font.pixelSize: 15
             horizontalAlignment: Text.AlignLeft
             verticalAlignment: Text.AlignVCenter
         }
      }
  }


Rectangle{

id:r2
Layout.fillHeight:true
Layout.fillWidth: true

color:"#080a0c"
MouseArea{
    anchors.fill: parent

    onClicked: {
        r3.color="#080a0c"
        r4.color="#080a0c"
        r5.color="#080a0c"
        r1.color="#080a0c"
        r2.color="#6E6E6E"
        stack4.clear()
        stack4.push(brightnessandvolume)
    }


Text {
   leftPadding: 10
   y:8
   color: "#ffffff"
   text: qsTr("Brightness And Volume")
   font.pixelSize: 15
   horizontalAlignment: Text.AlignLeft
   verticalAlignment: Text.AlignVCenter
}
}

}

Rectangle{
    Layout.fillHeight:true
    Layout.fillWidth: true

    color:"#080a0c"
id:r3

MouseArea{
   anchors.fill: parent
   onClicked: {
       r2.color="#080a0c"
       r4.color="#080a0c"
       r5.color="#080a0c"
       r1.color="#080a0c"
       r3.color="#6E6E6E"
       stack4.clear()
       stack4.push(ethernetSettings)
   }


Text {
   id: element2
 leftPadding: 10
   y:8
   color: "#ffffff"
   text: qsTr("Ethernet Settings")
   font.pixelSize: 15
}
}

}

Rectangle{
    Layout.fillHeight:true
    Layout.fillWidth: true


    color:"#080a0c"
id:r4


MouseArea{
   anchors.fill: parent
   onClicked: {
       r3.color="#080a0c"
       r2.color="#080a0c"
       r5.color="#080a0c"
       r1.color="#080a0c"
   r4.color="#6E6E6E"
       r6.color="#080a0c"
       r7.color="#080a0c"
       r8.color="#080a0c"
       stack4.clear()
       stack4.push(wifiSettings)
   }


Text {
   id: element3
   y:8
  leftPadding: 10
   color: "#ffffff"
   text: qsTr("Wifi Settings")

   wrapMode: Text.WordWrap
   font.pixelSize: 15
}
}

}

Rectangle{
    id:r5
    Layout.fillHeight:true
    Layout.fillWidth: true

    color:"#080a0c"
MouseArea{
   anchors.fill: parent
   onClicked: {
       r3.color="#080a0c"
       r2.color="#080a0c"
       r4.color="#080a0c"
       r1.color="#080a0c"
   r5.color="#6E6E6E"
       r6.color="#080a0c"
       r7.color="#080a0c"
       r8.color="#080a0c"
       stack4.clear()
       stack4.push(configureAutovalidation)
   }

         Text {
             id: element4
          leftPadding: 10
             y:8
             color: "#ffffff"
             wrapMode: Text.WordWrap
             text: qsTr(" Auto Validation")
             font.pixelSize: 15
         }

}
}

Rectangle{
    id:r6
    Layout.fillHeight:true
    Layout.fillWidth: true

    color:"#080a0c"
MouseArea{
   anchors.fill: parent
   onClicked: {
       r3.color="#080a0c"
       r2.color="#080a0c"
       r4.color="#080a0c"
       r1.color="#080a0c"
   r6.color="#6E6E6E"
       r5.color="#080a0c"
       r7.color="#080a0c"
       r8.color="#080a0c"
       stack4.clear()
       stack4.push(configureESignature)

   }
         Text {
            leftPadding: 10
             y:8
             color: "#ffffff"
             wrapMode: Text.WordWrap
             text: qsTr("e-Signature Validation")
             font.pixelSize: 15
         }

}
}


Rectangle{
    id:r7
    Layout.fillHeight:true
    Layout.fillWidth: true

    color:"#080a0c"
MouseArea{
   anchors.fill: parent
   onClicked: {
       r3.color="#080a0c"
       r2.color="#080a0c"
       r4.color="#080a0c"
       r1.color="#080a0c"
   r7.color="#6E6E6E"
       r6.color="#080a0c"
       r5.color="#080a0c"
       r8.color="#080a0c"
       stack4.clear()
       stack4.push(customerSettings)
   }

         Text {
leftPadding: 10
             y:8
             color: "#ffffff"
             text: qsTr("Custmor Settings")
             font.pixelSize: 15
         }

}
}


Rectangle{
    id:r8
    Layout.fillHeight:true
    Layout.fillWidth: true

    color:"#080a0c"
MouseArea{
   anchors.fill: parent
   onClicked: {
       r3.color="#080a0c"
       r2.color="#080a0c"
       r4.color="#080a0c"
       r1.color="#080a0c"
   r8.color="#6E6E6E"
       r6.color="#080a0c"
       r7.color="#080a0c"
       r5.color="#080a0c"
       stack4.clear()
       stack4.push(autolearn)
   }

         Text {

             leftPadding: 10
             y:8
             color: "#ffffff"
             text: qsTr("Auto learn")
             font.pixelSize: 15
         }

}
}



}

 StackView {
      id: stack4
    x:180
    height: 360
    width:620
        initialItem: dateandtime
      popEnter: Transition {

          PropertyAnimation  {
              properties: "opacity"; easing.type: Easing.InOutQuad
              from:1
                  to:0
                  duration: 1000
     }

          }
          pushEnter: Transition {
               PropertyAnimation {
                   properties: "x"; easing.type: Easing.InOutQuad
                   from:0

                       to:1
                       duration: 1000
          }
          }
      }






}
