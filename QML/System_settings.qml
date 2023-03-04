import QtQuick.VirtualKeyboard 2.2
import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Rectangle {                                // DELETE form
    id:rect
    width: 800
    height: 360
 color: "#ffffff"


 StackView {

      id: stack4
    x:180
    height: 360
    width:620
    anchors.fill: parent
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


Popup {
     id: rectangle
     x: 0
     y: 0
     width: 220
     height: parent.height
    ColumnLayout{
        id:layout
        width: 200
        height: parent.height-40
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
         rectangle.close()
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
 rectangle.close()
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
       stack4.push(autolearn)
     rectangle.close()
   }


Text {
   id: element2
 leftPadding: 10
   y:8
   color: "#ffffff"
   text: qsTr("Auto Learn")
   font.pixelSize: 15
}
}

}

Rectangle{
    Layout.fillHeight:true
    Layout.fillWidth: true


    color:"#080a0c"
id:r4

Text {
   id: element3
   y:8
  leftPadding: 10
   color: "#ffffff"
   text: qsTr("Filter Settings")
   wrapMode: Text.WordWrap
   font.pixelSize: 15
}
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
       stack4.clear()
       stack4.push(filter_Setting)
        lib1.fetch_filter_values()
     rectangle.close()

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
       stack4.clear()
       stack4.push(configureAutovalidation)
       rectangle.close()
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

       stack4.clear()
       stack4.push(configureESignature)
     rectangle.close()

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

       stack4.clear()
       stack4.push(customerSettings)
      rectangle.close()
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



}
    Rectangle{
        width:30
        height: 30
        radius: 15
        anchors.topMargin: 5
        anchors.top: layout.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color:"#080a0c"
        Text {
            y:8
            color: "#ffffff"
            text: qsTr("X")
            font.pixelSize: 15
            anchors.centerIn: parent
        }
    MouseArea{
       anchors.fill: parent
       onClicked: {
          rectangle.close()
       }



    }
    }

}


 Image{
     width:30
     height:30
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.topMargin: 10
         anchors.leftMargin: 10
     sourceSize.height: 30
     sourceSize.width: 30
    source: "qrc:/icons/Settings_icons/menu.svg"
     fillMode: Image.PreserveAspectFit
     MouseArea{
         anchors.fill: parent
         onClicked: {
             lib1.notify_to_qml_from_qml("Clicked",true);
             rectangle.open()
         }
     }
 }


}
