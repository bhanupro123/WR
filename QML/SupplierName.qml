import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    id: rectangle
    height: 360
    color: "#e3fdf5"
   enabled: usertype_predict=="E"?true:false
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#e3fdf5"
        }

        GradientStop {
            position: 1
            color: "#ffe6fa"
        }
    }
    width:800
    Connections{
        target:bhanu

     onCustomer_details_to_qml:
     {
          textField.text=supliername
     }
    }
    TextField {
        id: textField
        x: 224
        y: 74
        width: 630
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        maximumLength: 50
        font.pointSize: 11
        horizontalAlignment: Text.AlignHCenter
        placeholderText: qsTr("Suplier Name : Min 5")
    }
    Timer{
        running:true
        repeat: false
    interval: 100
    onTriggered: {
     bhanu.customer_details()
    }
    }

    Button {
        id: button
        x: 311
        y: 142
        text: qsTr("Change")
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if(textField.text.length>=5)
            {
               bhanu.suplier_name(textField.text)
                bhanu.customer_details()
            }
        }
    }

}

