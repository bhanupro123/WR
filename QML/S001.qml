import QtQuick 2.9
import QtQuick.Window 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2

    Rectangle{
id:rect
width:800
height: 480
    color: "#2d2a22"


    property Component ss2: S002{}
    SequentialAnimation {
        id:pa
        running: true

        onRunningChanged: {
       if(!pa.running)
       {
           blink.restart()

       }
        }

        ParallelAnimation {
               NumberAnimation { target:rectangle1; property: "width"; to: 550; duration: 1200 }
               NumberAnimation { target: rectangle2; property: "width"; to: 550; duration: 1200 }
               NumberAnimation { target: rectangle3; property: "width"; to: 550; duration: 1200 }
           }
    ParallelAnimation {
           NumberAnimation { target:element; property: "y"; to: 0; duration: 1200 }
           NumberAnimation { target: element1; property: "y"; to: 0; duration: 1200 }
           NumberAnimation { target: element2; property: "y"; to: 0; duration: 1200 }
       }
    NumberAnimation { target:element; property: "y"; to: 0; duration: 2000 }
    ParallelAnimation {
           NumberAnimation { target:element; property: "y"; to: -40; duration: 1200 }
           NumberAnimation { target: element1; property: "y"; to: -40; duration: 1200 }
           NumberAnimation { target: element2; property: "y"; to: -40; duration: 1200 }
       }
    ParallelAnimation {
           NumberAnimation { target:rectangle1; property: "width"; to: 0; duration: 1200 }
           NumberAnimation { target: rectangle2; property: "width"; to: 0; duration: 1200 }
           NumberAnimation { target: rectangle3; property: "width"; to: 0; duration: 1200 }
       }
    }
Connections{
 target: bhanu
 onTexttoqml:{
     date_qml.text=date
     time_qml.text=time

 }
}



Rectangle {

    x: 650
    y: 21
    width: 125
    height: 48
    color: "#00000000"
    radius: 20
    Text {
        id: time_qml

        text: "12:12:12"

      color: "#ffcf00"
          font.family: "Piboto Condensed"
       font.bold: true
     anchors.centerIn: parent
       font.pointSize: 24
    }
}
Rectangle {
    x: 44
    y: 21
    width: 125
    height: 48
    color: "#00000000"
    radius: 20
    Text {
        id: date_qml
  font.family: "Piboto Condensed"
     color: "#ffcf00"

        font.bold: true
        text: "12/12/2021"
       anchors.centerIn: parent
        font.pointSize: 24
    }
}
                Timer{
                    running: true
                    interval: 1000
                    repeat: true
                    onTriggered: {
                        bhanu.getdateandtime()
                    }
                }
                Timer{
                    id:blink
                    running: false
                    interval: 1
                    repeat: false
                    onTriggered: {
                        console.log("its time to")
                         stack_A.push(ss2)
                    }
                }

Rectangle {

    x: 633
    y: 416
    width: 142
    height: 48
    color: "#00000000"
    radius: 20
    anchors.horizontalCenter: parent.horizontalCenter
    Text {
        id: time_qml1
        color: "#ffcf00"
        text: "Version 3.2+"
        anchors.verticalCenter: parent.verticalCenter
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font.bold: true
        font.pointSize: 24
        font.family: "Piboto Condensed"
    }
}

Rectangle {
    id: rectangle1
    x: 318
    y: 135
    width: 30
      height: 41
      color: "#ffcf00"
      radius: 0
      border.width: 0
      anchors.horizontalCenter: parent.horizontalCenter
    Text
    {
                color: "#2d2a22"
                id: element
                    y:-40
                    font.family: "Piboto Condensed"
                   anchors.horizontalCenter: parent.horizontalCenter
                   text: "Welcome"
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30

    }
}

Rectangle {
    id: rectangle2
    x: 224
    y: 220
    width: 30
      height: 41
      color: "#ffcf00"
      radius: 0
      border.width: 0
      anchors.horizontalCenter: parent.horizontalCenter
    Text {
        id: element1
      y:-40
    anchors.horizontalCenter: parent.horizontalCenter
        color: "#2d2a22"
        text: qsTr("WinRender Systems LLP.,")
             font.family: "Piboto Condensed"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        font.pixelSize: 30
        }
}

Rectangle {
    id: rectangle3
    x: 142
    y: 305
  width: 30
    height: 41
    color: "#ffcf00"
    radius: 0
    border.width: 0
    anchors.horizontalCenter: parent.horizontalCenter
    Text {
        id: element2
            y:-40
            color: "#2d2a22"
        text: qsTr("Pharmaceutical Metal Detector")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
             font.family: "Piboto Condensed"
        styleColor: "#f3d9d9"
        font.pixelSize: 30
    }

}
 SequentialAnimation
 {
     id:sa

     NumberAnimation {
         target: button
         property: "y"
         to:button.y-20
         duration: 200
         easing.type: Easing.InOutQuad
     }
     NumberAnimation {
         target: button
         property: "y"
         to:432
         duration: 200
         easing.type: Easing.InOutQuad
     }
 }

Button {
    id: button
    x: 8
    y: 432
    text: qsTr("Button")


    onClicked: {
        sa.restart()
        element.y=-50
        element1.y=-50
        element2.y=-50
        rectangle1.width=0
         rectangle2.width=0
         rectangle3.width=0
        pa.restart()
    }
}







    }




