import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import Qt.labs.calendar 1.0
import QtQuick.Controls 1.4 as B
Rectangle {
    height: 360
    width:620
    property int time_hours: 0
    property int time_minuts: 0
    property int time_seconds: 0
  enabled: usertype_predict=="A"||usertype_predict=="E"?true:false
    B.Calendar{
        id:calender
    x:90
    width:385
    height:300
     onClicked: {
     console.log(selectedDate.getDate())
       // date_time_text.text=selectedDate.getDate()+"/"+selectedDate.getMonth()+"/"+selectedDate.getYear()
    }

    }
    Text {
        id: date_time_text
        x: 90
        y: 308
        width:calender.width
        font.family: "Piboto Condensed"
        font.pointSize: 18
        text: "Selected Date :"+calender.selectedDate.getDate()+"/"+calender.selectedDate.getMonth()+"/"+(calender.selectedDate.getYear()+1900)+"   "+(control.currentIndex+1)+":"+(control1.currentIndex+1)+":"+(control2.currentIndex+1)

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        x: 495
        y: 35
        width: 200
        height: 19

        text: qsTr("Pick Date and Time")
        font.pointSize: 15
        font.family: "Arial"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Rectangle{
        x: 500
        y: 100
        border.width: 2
        height: 200
        width:190
    RowLayout{

           Tumbler {
             id: control
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: 23
            currentIndex: 0

            delegate: Text {
                     text: modelData+1<10?"0"+(modelData+1):(modelData+1)
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
        model: 60

        delegate: Text {
               text: modelData+1<10?"0"+(modelData+1):(modelData+1)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (control1.visibleItemCount / 2)
            }
    }

   Tumbler {
         id: control2
        Layout.fillHeight: true
        Layout.fillWidth: true
        model: 60

        delegate: Text {
               text: modelData+1<10?"0"+(modelData+1):(modelData+1)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (control2.visibleItemCount / 2)
            }
    }
    }
}
    }
