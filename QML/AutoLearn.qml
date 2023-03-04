import QtQuick 2.0
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
Rectangle{

width:800
height:360
Rectangle{
         id: create
    anchors.fill: parent
    visible: status_of_button==1?true:false
    enabled: status_of_button==1?true:false

    AnimatedImage {
        id: animatedImage
        x: 482
        y: 73
        width: 283
        height: 214
        currentFrame: 30
        playing: false
        fillMode: Image.PreserveAspectFit
        source: "qrc:/icons/miniGif_20210318170022.gif"

        Text {
            id: fp_status
            x: 0
            y: 0
            width: 283
            height: 30
            color: "#ffffff"
            text: qsTr("")
             font.family: "Piboto Condensed"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
    }
    Button {
        id: button
        x: 683
        y: 307
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 35
        anchors.bottomMargin: 13
        width: 82
        height: 40
        enabled: true
        text: qsTr("Create")

        activeFocusOnTab: true

        onClicked: {
if(u_combo.text.length>3&& textField_create.length>3&&tumbler.currentIndex>=0)
          //  if(u_combo.text.length>3&& textField_create.length>3&&tumbler.currentIndex>=0&&fp_idd<=1000)
            {
    fp_idd=1
                console.log(c,a,bb,"qmlll")
                bhanu.logout(tr);
                bhanu.add(c,a,bb,fp_idd)
                textField_create.clear()
                u_combo.clear()
                tumbler.currentIndex=0
                time2.restart()
                     fp_idd=10000
            }
            else{
                bhanu.notify_to_qml_from_qml("Choose Strong Username & Password",false);
                fp_idd=10000
 console.log(c,a,bb,"faill")
            }

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
        y: 307
activeFocusOnTab: true
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 13
       anchors.horizontalCenter:parent.horizontalCenter
       width: 76
       height: 40
        font.pointSize: 12
        font.family: "Arial"
        text: qsTr("CLEAR")
        anchors.horizontalCenterOffset: 224
        onClicked: {
            fun1()
        }
    }
    Button {
        x: 482
        y: 307
activeFocusOnTab: true
anchors.bottom: parent.bottom
anchors.bottomMargin: 13

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
    anchors.left: parent.left
    anchors.leftMargin: 20
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
             bhanu.logout(true)
                is_create_in_active=true
            stack_B.push(finger_print_scan)


            }
        }



}
}


}
