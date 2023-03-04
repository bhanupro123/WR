import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
//import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
import Qt.labs.calendar 1.0
import QtQuick.Controls 1.4 as B

//import Qt.labs.qmlmodels 1.0
Rectangle {
    width: 800
    height: 360
    color: "lightblue"
    property string str: ""
    property string user_type: ""
    property var sort_array_list: []

    property int month_count: 2
    property int spin_value: 0
    property bool which_text_field: false
     property bool no_previous_history: false
       property var to_day_date: new Date("dd/mm/yyyy")
     property var from_Date: new Date("dd/mm/yyyy")
  property string temp_date: ""
      property string temp_month: ""
    property string from_date_string: ""
        property string to_date_string: ""
    property var to_Date:new Date("dd/mm/yyyy")
        property var machine_start_date:new Date()
       property var date_array: []
       property var dt:new Date("dd/mm/yyyy")
      property int anim_height: 0
   property var getDaysArray:function(start, end) {
        for(date_array=[],dt=new Date(start); dt<=end; dt.setDate(dt.getDate()+1)){

          date_array.push(new Date(dt));
           // console.log(new Date(dt).toDateString("dd/mm/yyyy"),"in loop")

            // date_array.push(new Date(dt).toDateString("dd/mm/yyyy"));
             //  console.log("A_"+dt.getDate()+"_"+dt.getMonth()+"_"+dt.getFullYear()+"in loop")
        }
        return date_array;
    };

    Timer {
        interval: 10
        running: true
        repeat: false
        onTriggered: {
            lib1.who_i_am("at")

        }
    }


    Timer {
        id: time1
        interval: 10
        running: true
        repeat: false
        onTriggered: {

             libraryModel.clear()
            bhanu.fetch("All", "today",from_date_string,to_date_string,false,sort_array_list)
            bhanu.finduser()
                    console.log( )
            //day.currentIndex=parseInt(to_day_date.toLocaleDateString("dd"),to_day_date.toLocaleDateString("dd"),to_day_date.toLocaleDateString(""))
            // month.currentIndex=parseInt(to_day_date.toLocaleDateString("MM"))
        }
    }
    Connections {
        target: bhanu
        onMachine_start_date:{
            machine_start_date=machine_start_date_cpp
            calender.minimumDate=machine_start_date
            lib1.notify_to_qml_from_qml("machine Start date:",machine_start_date.toDateString(),true)
        }

        onFetchtoqml: {


//            if (b==true) {
//               // libraryModel.clear()
//            }

            libraryModel.append({
                                    "sno":row_count,
                                    "date1": date,
                                    "time1": time,
                                    "user1": user,
                                    "old1": old,
                                    "new1": neww,
                                    "remark1": remark
                                })
            table_view.update()

          //  console.log(row_count,date,time,user,old,neww,remark,"Count",row_count,libraryModel.count)
           // table_view.update()

        }
    }
    Connections {
        target: bhanu
        onList: {
            console.log(str1,"str1")
            model.append({ "text": str1})
        }
        onUsernametoqml: {
            console.log("bhanu connections", usertype_predict, "   ", username)
            user_type = usertype_predict
        }
    }

    ListModel {
        id: libraryModel
    }
    TableView {
        id:table_view
        anchors.top: toolBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 3
        width: parent.width
        selectionMode: SelectionMode.SingleSelection
        onClicked: {
            console.log(libraryModel.get(row).date1)
            console.log(libraryModel.get(row).time1)
        }
        TableViewColumn {
            role: "sno"
            title: "sno"
            width: 40
        }
        TableViewColumn {
            role: "date1"
            title: "Date"
            width: 100
        }
        TableViewColumn {
            role: "time1"
            title: "Time"
            width: 100
        }
        TableViewColumn {
            role: "user1"
            title: "User"
            width: 100
        }
        TableViewColumn {
            role: "old1"
            title: "Old"
            width: 130
        }
        TableViewColumn {
            role: "new1"
            title: "New"
            width: 130
        }
        TableViewColumn {
            role: "remark1"
            title: "Remark"
            width: 300
        }
        model: libraryModel
    }

    property real hue: Math.random()

    RowLayout {
        id: toolBar
        anchors.top: parent.top
        anchors.margins: 5
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 10
        height: 40
        spacing: 7
        TextField {
            id: textField_from
            Layout.fillWidth: true

            enabled: false
            font.pointSize: 13
            placeholderText: qsTr("From : Date")
        }
        Image {
            id: image

        x: 445
        y: 189

        height: 40
        Layout.fillWidth: true
//            Layout.maximumWidth: 40
        sourceSize.height: 40
        sourceSize.width: 40
        fillMode: Image.PreserveAspectFit
           source: "qrc:/PNG/calendar.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                   if(machine_start_date.toLocaleDateString("dd.MM.yyyy")!=new Date().toLocaleDateString("dd.MM.yyyy"))
                    {
                       calender.minimumDate=machine_start_date
                       calender.selectedDate=from_Date
                    calender_window.visible=true
                    calender_window.enabled=true
                    which_text_field=false
                    }
                    else{
                         lib1.notify_to_qml_from_qml("No Previous History",true)
                    }
                }
            }
        }

        TextField {
            id: textField_to
            Layout.fillWidth: true

            enabled: false
            font.pointSize: 13
            placeholderText: qsTr("To : Date")

        }

        Image {
            id: image1
            x: 445
            y: 189

            height: 40
            Layout.fillWidth: true
//            Layout.maximumWidth: 40
            sourceSize.height: 40
            sourceSize.width: 40
            fillMode: Image.PreserveAspectFit
               source: "qrc:/PNG/calendar.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                    if(machine_start_date.toLocaleDateString("dd.mm.yyyy")!=new Date().toLocaleDateString("dd.mm.yyyy"))
                    {

                        calender.minimumDate=calender.selectedDate
                         calender.selectedDate=to_Date
                    calender_window.visible=true
                    calender_window.enabled=true
                    which_text_field=true
                    }
                    else{
                    lib1.notify_to_qml_from_qml("No Previous History",true)
                    }
                }
            }
        }
ComboBox{
   id:sort_combo
 Layout.fillWidth: true
 currentIndex: 0
popup: Popup{
    width: 0
    height:0

 onOpened: {
     if(sort_combo.currentIndex==0)
     {
         sort_combo.currentIndex=1
     }
     else{
         sort_combo.currentIndex=0
     }
 }

}

 model: ["All","Custom"]
 onCurrentIndexChanged: {
     if(currentIndex==1)
     {
         anim_height=315
         sorting_rect.height=315
         sorting_rect.open()
     }
     else{
         libraryModel.clear()
            bhanu.fetch("All", name,from_date_string,to_date_string,which_text_field,sort_array_list)
     }
 }

}


//        Button {
//            y: 1
//            Layout.fillWidth: true
//            height: 30
//            text: "SELECT"
//            highlighted: true
//            onClicked: {

//                   libraryModel.clear()
//                if(from_Date!=to_Date&&from_Date<=to_Date&&which_text_field)
//                {
//                    if(sort_combo.currentIndex==0)
//                    {
//                       bhanu.fetch("All", name,from_date_string,to_date_string,true,sort_array_list)
//                    }
//                    else
//                    {
//                      bhanu.fetch("", name,from_date_string,to_date_string,true,sort_array_list)
//                    }


//                }
//                else{
//                    if(sort_combo.currentIndex==0)
//                    {
//                       bhanu.fetch("All", name,from_date_string,to_date_string,false,sort_array_list)
//                    }
//                    else
//                    {
//                      bhanu.fetch("", name,from_date_string,to_date_string,false,sort_array_list)
//                    }

//                }


//            }
//        }
//
Button {
            y: 1
            height: 30
            Layout.fillWidth: true
            highlighted: true
            text: "TODAY"
            onClicked: {
                which_text_field=false
                textField_from.text="From:date"
                textField_to.text="to:date"
                time1.restart()
            }
        }
        Button {
            y: 1
            height: 30
            Layout.fillWidth: true
            highlighted: true
            text: "COPY"
            onClicked: {
            lib1.notify_to_qml_from_qml("work in progress",true)
            }

        }
        Button {
            y: 1
            height: 30
            Layout.fillWidth: true
            highlighted: true
            text: "PRINT"
            onClicked: {
            lib1.notify_to_qml_from_qml("work in progress",true)
            }

        }

        Button {
            y: 1
            id:pdf
            Layout.fillWidth: true
            height: 30
            text: "PDF"
     enabled: usertype_predict!=""?true:false
            highlighted: true
            onClicked: {
                console.log(usertype_predict,"usertype_predict")
                if(usertype_predict!="A")
                {
                    cpdf.visible = true
                    cpdf.enabled = true
                        model.clear()
                     model.append({ "text": "ADMIN"})
                        bhanu.ulist(0)
//                    if(no_previous_history&&which_text_field)
//                    {
//                    bhanu.pdf(sorting.currentText, name, str, textField.text,0,from_date_string,to_date_string,which_text_field)
//                    }
                }
                else
                {
                    if(sort_combo.currentIndex==0)
                    {
                   bhanu.pdf("All", name, user_type, user_type,0,from_date_string,to_date_string,which_text_field,sort_array_list)
                }
                    else{
                        bhanu.pdf("Custom", name, user_type, user_type,0,from_date_string,to_date_string,which_text_field,sort_array_list)
                    }
                    }
            }
        }
    }

    property string name: "today"

    Rectangle {
        id:cpdf
      width: 800
      height:360
      visible: false
        enabled: false
        color: "white"

        Rectangle{
            x: 0
            y: 52
            width:233
            id:rr
           visible: model.count>0?true:false
            height: 308
            color: "#c29aee"

                     ColumnLayout {
                         anchors.fill: parent
                         ListView {
                             id: listView
                             cacheBuffer: 0
                             width: parent.width-10
                             flickableDirection: Flickable.VerticalFlick
                             boundsBehavior: Flickable.StopAtBounds
                             clip: true
                             Layout.fillWidth: true
                             Layout.fillHeight: true
                            currentIndex: -1
                            model: ListModel{
                             id:model
                            }
                             ScrollBar.vertical: ScrollBar {
                                 id:sv
                                 active: true
                               policy: ScrollBar.AlwaysOn
                            background:
                                Rectangle{
                                width:10
                                height:334
                                radius: 5
                                color: "black"
                            }
                             }
              onCurrentIndexChanged: {
                       if(listView.currentIndex>=0)
                       {
                            str="A-"+model.get(listView.currentIndex).text
                           if(listView.currentIndex==0)
                           {
                                str=model.get(listView.currentIndex).text
                           }


                        }
              }

                             highlight: Rectangle {
                                 width:listView.width-120
                                 height: 40
                                 border.color: "red"
                                 border.width: 1
                                 radius: 7
                                 color: "pink"
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         console.log("clicked")
                                     }
                                 }
                             }

                             delegate:
                                 Text {
                                 width: listView.width-10
                                 height: 40
                                 verticalAlignment: Text.AlignVCenter
                                 text:"  "+ modelData
                                 font.bold: true
                                 color: "white"
                                 font.pointSize: 12
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {

                                         listView.currentIndex=index

                                     }

                                 }
                             }

                         }
                     }
        }

        Text {
            id: element
            x: 0
            y: 1
            width: 248
            visible: model.count>0
            height: 45
            text: "User:"+str

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 20
        }
        RowLayout{
            
            width: 336
            height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            Button {
        id: button

            Layout.fillHeight: true
            Layout.fillWidth: true
            text: qsTr("CREATE")
            onClicked: {
//                  date_array=getDaysArray(from_Date,to_Date);
//                for (var i = 0; i < date_array.length; i++) {
//                    console.log(date_array[i]);
//                }
                     if(textField.text.length>=3)
                     {
                         if(sort_combo.currentIndex==0)
                         {
                    bhanu.pdf("All", name, str, textField.text,0,from_date_string,to_date_string,which_text_field,sort_array_list)
                         }
                         else{
                    bhanu.pdf("Custom", name, str, textField.text,0,from_date_string,to_date_string,which_text_field,sort_array_list)
                         }


                    }
                     else{
                         lib1.notify_to_qml_from_qml("Please Select Approve User",false)
                     }
                     textField.clear()
            }
        }
        Button {
            id:fetch
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Print On Printer"
            onClicked: {
               lib1.notify_to_qml_from_qml("Work in Progress",true)
            }
        }
        Button {
            id: button1
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: qsTr("EXIT")
            onClicked: {
                cpdf.enabled=false
                cpdf.visible=false
            }
        }
}
        TextField {
            id: textField
            x: 239
            y: 52
            visible: model.count>0?true:false
            enabled:  model.count>0?true:false
            echoMode: TextInput.Password
            width: 200
            height: 43
            placeholderText: qsTr("PASSWORD")
        }


    }

    Rectangle{
        id:calender_window
        anchors.fill: parent
        visible: false
        enabled: false
        B.Calendar{
            id:calender
            x: 32
            y: 8
           onSelectedDateChanged: {

           }

           minimumDate: machine_start_date
           maximumDate: new Date()
            width:354
        height:345


        }

        Button {
            id: button2
            x: 682
            y: 312
            text: qsTr("Ok")
            onClicked: {

                       if(!which_text_field)
                       {
                            from_Date=calender.selectedDate
                               from_Date.setMonth(from_Date.getMonth()+1)
                           from_Date.setFullYear(calender.selectedDate.getYear()+1900)
                           temp_date=from_Date.getDate().toString()
                           temp_month=from_Date.getMonth().toString()
                           if(from_Date.getDate()<10)
                           {
                               temp_date="0"+from_Date.getDate()
                           }

                           if(from_Date.getMonth()<10)
                           {
                                 temp_month="0"+(from_Date.getMonth())

                           }
                            textField_from.text=temp_date+"/"+temp_month+"/"+from_Date.getFullYear()
                            from_date_string="A_"+temp_date+"_"+temp_month+"_"+from_Date.getFullYear()
                           console.log(from_date_string,"from_date_string")
                       }
                       else{
                           to_Date=calender.selectedDate
                           to_Date.setMonth(to_Date.getMonth()+1)
                           to_Date.setFullYear(calender.selectedDate.getYear()+1900)
                           temp_date=to_Date.getDate().toString()
                           temp_month=to_Date.getMonth().toString()
                           if(to_Date.getDate()<10)
                           {
                               temp_date="0"+to_Date.getDate().toString()
                           }

                           if(to_Date.getMonth()<10)
                           {
                                 temp_month="0"+to_Date.getMonth().toString()

                           }
                         textField_to.text=temp_date+"/"+temp_month+"/"+to_Date.getFullYear()
                           to_date_string="A_"+temp_date+"_"+temp_month+"_"+to_Date.getFullYear()
                          console.log(to_date_string,"to_date_string")
                           libraryModel.clear()
                           if(sort_combo.currentIndex==0)
                           {
                              bhanu.fetch("All", name,from_date_string,to_date_string,which_text_field,sort_array_list)
                           }
                           else
                           {
                             bhanu.fetch("", name,from_date_string,to_date_string,which_text_field,sort_array_list)
                           }
                       }

                       calender_window.visible=false
                       calender_window.enabled=false

            }
        }

        Button {
            id: button3
            x: 682
            y: 248
            text: qsTr("Exit")
            onClicked: {
                calender_window.visible=false
                calender_window.enabled=false
            }
        }

        Text {
            id: selected_date
            x: 604
            y: 76
            text: calender.selectedDate.getDate()+"/"+calender.selectedDate.getMonth()+"/"+(calender.selectedDate.getYear()+1900)
            font.pixelSize: 12
        }

    }

Popup{
    width:800
    y:48
    id:sorting_rect
onClosed: {
    anim_height=0
    sorting_rect.height=0
    sorting_rect.close()
    if(sort_array_list.length==0)
    {
        sort_combo.currentIndex=0
    }
}
    Behavior on height {

    PropertyAnimation{
        target: sorting_rect
        properties: "height"
        from:0
        to:anim_height
        duration: 500
    }
   }

    ScrollView{
      anchors.fill: parent
       clip: true
        RowLayout{
             id: columnLayout
           anchors.fill: parent
               ColumnLayout{
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                       text: "M/c Switch ON"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }

                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"M/C Switched OFF"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                      text: "RC/Total RC"
                      onCheckedChanged: {
                              if(checked)
                              {
                                  sort_array_list.push(text)
                              }
                              else{
                                  sort_array_list.splice(sort_array_list.indexOf(text),1)
                              }
                      }
                  }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"User Added"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"User PW Changed"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true

                        text:"User Deleted"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true

                        text:"Loged-in_FP"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Loged-in"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Loged-out"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"THR-S Changed"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }

               }

               ColumnLayout{
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                     text:"Customer Name Changed"
                     onCheckedChanged: {
                             if(checked)
                             {
                                 sort_array_list.push(text)
                             }
                             else{
                                 sort_array_list.splice(sort_array_list.indexOf(text),1)
                             }
                     }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Customer Location Changed"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Machine-ID Changed"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                   }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                            text: "THR-A Changed"
                            onCheckedChanged: {
                                    if(checked)
                                    {
                                        sort_array_list.push(text)
                                    }
                                    else{
                                        sort_array_list.splice(sort_array_list.indexOf(text),1)
                                    }
                            }
                        }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                     text:"MPHS Changed"
                     onCheckedChanged: {
                             if(checked)
                             {
                                 sort_array_list.push(text)
                             }
                             else{
                                 sort_array_list.splice(sort_array_list.indexOf(text),1)
                             }
                     }
                 }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        x: 596
                        y: 70
                        text:"Product Loaded"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Product Added"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                   onCheckedChanged: {
                           if(checked)
                           {
                               sort_array_list.push(text)
                           }
                           else{
                               sort_array_list.splice(sort_array_list.indexOf(text),1)
                           }
                   }
                        text:"Product Deleted"
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                         text: "DD Power Factor Changed"
                         onCheckedChanged: {
                                 if(checked)
                                 {
                                     sort_array_list.push(text)
                                 }
                                 else{
                                     sort_array_list.splice(sort_array_list.indexOf(text),1)
                                 }
                         }
                          }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                      text:"DD Power Changed"
                      onCheckedChanged: {
                              if(checked)
                              {
                                  sort_array_list.push(text)
                              }
                              else{
                                  sort_array_list.splice(sort_array_list.indexOf(text),1)
                              }
                      }
                  }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                      text: "DD Frequency Changed"
                      onCheckedChanged: {
                              if(checked)
                              {
                                  sort_array_list.push(text)
                              }
                              else{
                                  sort_array_list.splice(sort_array_list.indexOf(text),1)
                              }
                      }
                  }
               }

               ColumnLayout{
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-1 Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-1 Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-2 Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-2 Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-3 Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-3 Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-4 Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true

                        text:"Auto Val-4 Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }

                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                      text: "Last Active Product Loaded"
                      onCheckedChanged: {
                              if(checked)
                              {
                                  sort_array_list.push(text)
                              }
                              else{
                                  sort_array_list.splice(sort_array_list.indexOf(text),1)
                              }
                      }
                  }

               }

               ColumnLayout{
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-1 Time Changed + Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-1 Time Changed + Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-2 Time Changed + Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-2 Time Changed + Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-3 Time Changed + Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-3 Time Changed + Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-4 Time Changed + Enabled"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
                   CheckBox {
                       Layout.fillWidth: true
                   Layout.fillHeight: true
                        text:"Auto Val-4 Time Changed + Disable"
                        onCheckedChanged: {
                                if(checked)
                                {
                                    sort_array_list.push(text)
                                }
                                else{
                                    sort_array_list.splice(sort_array_list.indexOf(text),1)
                                }
                        }
                    }
               }




     }

    }

    Button{
        text: "OK"
        width:60
        height: 40
        visible: parent.height>0?true:false
                enabled: parent.height>0?true:false
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
     onClicked: {
         console.log(sort_array_list.toString(),sort_array_list.length)
         libraryModel.clear()
         if(sort_combo.currentIndex==0)
         {
            bhanu.fetch("All", name,from_date_string,to_date_string,which_text_field,sort_array_list)
         }
         else
         {
           bhanu.fetch("", name,from_date_string,to_date_string,which_text_field,sort_array_list)
         }
         anim_height=0
        sorting_rect.height=0
         sorting_rect.close()
     }
    }







}


}









