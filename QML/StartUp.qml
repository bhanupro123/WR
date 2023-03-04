import QtQuick 2.9
import QtQuick.Window 2.2
import test 1.0
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextEdit{
        id:bh
        width: 100

        height: 60
    }
    Text {
        x:70
        y:20
        text: aa.test
    }

    Rectangle {
      width: 100
      color: 'red'
      anchors.centerIn: parent
      height: 60
      Text {
        id: textField
        text: qsTr("Click me.")
        anchors.centerIn: parent
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          textField.text = "Clicked...";
          aa.test = bh.text
                }
      }
      A{id: aa; test: "bar"}
    }
}
