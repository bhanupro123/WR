import QtQuick 2.0
import QtQuick.Controls 2.2
Rectangle {
    width: 800
    height: 360

    Button {
        id: button
        x: 94
        y: 30
        text: qsTr("search")
        onClicked: {
            bhanu.getscore()
        }
    }

    Button {
        id: button1
        x: 241
        y: 30
        text: qsTr("enroll")
        onClicked: {
            bhanu.detect1()
        }
    }


        Button {
            id: button2
            x: 386
            y: 30
            text: qsTr("Delete All")
            onClicked: {
                bhanu.deleteall()
            }
        }


}

