import QtQuick 2.0
import QtQuick.Controls 2.2
//import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
//import Qt.labs.qmlmodels 1.0
import Qt.labs.folderlistmodel 2.0
Rectangle {
    width: 800
    height: 360
    color: "white"
    property bool exist: false
    Timer{
        interval: 10
        running: true
        repeat: false
        onTriggered: {
            lib1.who_i_am("uo")
        }
    }
    property real hue: Math.random()
    Connections{
        target: lib1
       onMountedListtoqml:{
            model.append({text:pathnam})

       }
        onMountedcount:{

            if(sd>5)
                 {
            element1.text="Available storage devices : 1 "
                            comboBox.enabled=true
                exist=true
                 }

            else{

                comboBox.enabled=false
                  element1.text="No USB Devices Found or Try Refresh"
            }


            if(sd<=5)
            {
                model.clear();
        }
    }
    }

Timer{
 id:timerr
 running: true

   repeat: false
interval: 10
onTriggered: {
    model.clear()
    lib1.mount()
    lib1.mountedList();

}
}
    ScrollView{
       width: 382
       height: 352
       FolderListModel{
           id:folder
        nameFilters: ["*pdf"]
        sortField: FolderListModel.Time
//           folder: "C:\Users\ASUS\Desktop\build-Real-Desktop_Qt_5_14_2_MinGW_32_bit-Debug"
      showDirs: false
       }
    ListView{
        clip: true
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds
        id:kl
        width: 382
        currentIndex: -1
        height: 361
        highlight: Rectangle {
            width:kl.width-120
            height: 20
            border.color: "red"
            border.width: 1
            radius: 7
            color: "pink"
        }
        Component{
            id:file

           Rectangle{

               width: parent.width
               height: 40
               border.width: 1
               color: "#00000000"
                       Row{
                id: column
                anchors.fill: parent
                spacing: 2
                anchors.horizontalCenter: parent.horizontalCenter
                Image{
                    id:im
                    width: 30
                    height: 40
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/pdf.svg"

                }

            Text {
                id: name
                text: fileName
                               font.pointSize: 10
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
                }

            }
            MouseArea{
                anchors.fill: parent
          onClicked: {
              kl.currentIndex=index
              console.log(name.text,"last",folder.parentFolder)
              selectpdf=name.text

          }
            }
            }
        }
        model: folder
        delegate: file

    }

    }
    Button {
        id: button
        x: 585
        enabled: comboBox.currentIndex>-1?true:false
        y: 312
        text: qsTr("Copy")
        onClicked: {
            if(comboBox.currentIndex>=0&&kl.currentIndex>=0)
            {
            lib1.copy(comboBox.currentIndex,selectpdf)
        }
            else{

            }
        }
    }
    property string selectpdf: ""
property string str2:selectpdf
    ComboBox {
        id: comboBox
        x: 398
        y: 116
        width: 232
        height: 40
        displayText: "Destination"
        currentIndex: -1
      onCurrentIndexChanged: {
       comboBox.displayText=model.get(currentIndex+1)
      }
        model: ListModel{
            id:model
        }

 }
    Text {
        id: name
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: folder.parentFolder
        font.pointSize: 20
    }
    Text {
        id: element
        x: 519
        y: 0
        width: 232
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        height: 39
        text:"\nSelected PDf\n "+selectpdf//folder.parentFolder
        font.pixelSize: 15
        font.bold: true
    }

    Text {
        id: element1
        x: 519
        y: 83
        width: 232
        height: 27
        text: qsTr("")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    Button {
        id: button1
        x: 659
        y: 116
        text: "Refresh"
        onClicked: {
            model.clear()
            comboBox.displayText="Select USB"
            lib1.mountedList()
        }
    }

    Button {
        id: button2
        x: 585
        y: 249
        enabled: kl.currentIndex>=0?true:false
        text: qsTr("PRINT")
        onClicked: {
          lib1.print_to_device(selectpdf);
        }
    }

}


