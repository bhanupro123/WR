import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick 2.10
import QtQuick.Controls 2.2
Rectangle{
    id: rectangle
    width: 800
    height: 360
    enabled: usertype_predict=="A"||usertype_predict=="E"?true:false
    color: "#dcbebe"
    radius: 0
    property string code_Hold_Delay:"F"
    property string  code_Operate_Delay:"G"

  property string  code_LPF1:"H"
   property string  code_LPF2:"I"
  property string  code_HPF1:"J"
    property string  code_HPF2:"K"

    property string  code_Digital_Gain:"L"
    property string  code_analog_Gain:"M"
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
    border.width: 0
    Connections{
     target: lib1
     onFilter_values_toqml:{
        // console.log(lPF1,lPF2,hPF1,hPF2,operatedelayvalue,holddelayvalue,digitalgainvalue)
         lPF_1= lPF1
         lPF_2=lPF2
         hPF_1= hPF1
         hPF_2= hPF2
         operate_delay_value=operatedelayvalue
         hold_delay_value=holddelayvalue
         digital_gain_value=digitalgainvalue
         analog_gain_value= analoggainvalue
     }

     onKeysignal:{

         placeHolder_Value=key
         textField.text=placeHolder_Value
         if(placeHolder_Value==0)
         {
             textField.clear()
         }
     }

    }


    property var fun: function(){

        if(mousevalue==1&&placeHolder_Value<=50&&placeHolder_Value>0)
        {

            lib1.share_on_serialport(placeHolder_Value.toString(),code_LPF1)
            lib1.history(lPF_1,placeHolder_Value,"LPF-1 changed")
            lPF_1=placeHolder_Value
            textField.text=""
         lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
         lib1.keyboardData("CLR")

        }
       else if(mousevalue==2&&placeHolder_Value<=50&&placeHolder_Value>0)
        {
            console.log(placeHolder_Value,mousevalue)
             lib1.share_on_serialport(placeHolder_Value.toString(),code_LPF2)
            lib1.history(lPF_2,placeHolder_Value,"LPF-2 changed")
             textField.text=""
            lPF_2=placeHolder_Value
             lib1.keyboardData("CLR")
 lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value ,digital_gain_value,analog_gain_value)
        }
       else   if(mousevalue==3&&placeHolder_Value>=5&&placeHolder_Value<=50)
        {
             lib1.share_on_serialport(placeHolder_Value.toString(),code_HPF1)
            lib1.history(hPF_1,placeHolder_Value,"hPF_1 changed")
            textField.text=""
            hPF_1=placeHolder_Value
 lib1.keyboardData("CLR")
           lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
        }
       else   if(mousevalue==4&&placeHolder_Value>=5&&placeHolder_Value<=50)
        {
             lib1.share_on_serialport(placeHolder_Value.toString(),code_HPF2)
            lib1.history(hPF_2,placeHolder_Value,"hPF_2 changed")
            hPF_2=placeHolder_Value
            textField.text=""
             lib1.keyboardData("CLR")
            lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
        }
       else   if(mousevalue==5&&placeHolder_Value>=0&&placeHolder_Value<=20000)
        {
             lib1.share_on_serialport(placeHolder_Value.toString(),code_Operate_Delay)
          lib1.history(operate_delay_value,placeHolder_Value,"O/D changed")
            operate_delay_value=placeHolder_Value
            textField.text=""
             lib1.keyboardData("CLR")
             lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
        }
        else  if(mousevalue==6&&placeHolder_Value>=50&&placeHolder_Value<=20000)
        {
             lib1.share_on_serialport(placeHolder_Value.toString(),code_Hold_Delay)
       lib1.history(hold_delay_value,placeHolder_Value,"H/D changed")
          hold_delay_value =placeHolder_Value
            textField.text=""
             lib1.keyboardData("CLR")
           lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
        }
        else if(mousevalue==8&&placeHolder_Value<=10&&placeHolder_Value>=1)
         {
            // if(parseFloat(textField.text)<10&&parseFloat(textField.text)>0)
            // {
                 lib1.analog_gain(analog_gain_value,parseInt(textField.text))
                  lib1.share_on_serialport(parseFloat(textField.text).toString(),code_analog_Gain)
                  lib1.history(digital_gain_value,parseInt(textField.text),"A/G changed")
                 a_g_text.text=parseFloat(textField.text)
                 analog_gain_value =parseFloat(textField.text)
                lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)

             textField.text=""
              lib1.keyboardData("CLR")
             //}
         }

         else{
            lib1.notify_to_qml_from_qml("Please Enter Valid Values",false)
        }

  //console.log(lPF_1,lPF_2,hPF_1,hPF_2,operate_delay_value,hold_delay_value,digital_gain_value)


    }
Rectangle{
    id:mainRect
    width: parent.width
    height: parent.height
    color: "#ff9a9e"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#fffeff"
        }

        GradientStop {
            position: 1
            color: "#d7fffe"
        }
    }
       MouseArea{
    anchors.fill: parent
    onClicked: {
        mainRect.width=rectangle.width
             lib1.keyboardData("CLR")
    }
}
       Behavior on width{
    NumberAnimation
    {
        target:mainRect
        property: "width"
        duration: 800
        easing.type: Easing.InOutQuad
    }

}


    RowLayout{

        id:row1
        height: 60
        anchors.top: parent.top
        anchors.topMargin: 20
        width:rectangle.width*0.75
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 15

        //1

        Rectangle{
            id: rectangle2

            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11



           Rectangle{

            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height/1.5
            color: "green"
            radius: 15
            Text {
                id: lpf_1_text

                color: "#fbfbfb"
                text: lPF_1+" Hz"
                font.bold: true
                  font.family: "Piboto Condensed"
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

            }
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter

           }

           Rectangle{
               id: rectangle1
               y: 12

               width:parent.width/1.5
               height: 20
               color: "#fbfb29"
               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 49
                   height: 20
                   text: qsTr("LPF-1")
                     font.family: "Piboto Condensed"
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#000000"
               }

           }
           MouseArea{
               id:lpf_1_ma
               anchors.fill: parent
               onClicked: {
                   lib1.keyboardData("CLR")
                   mainRect.width=rectangle.width-rectslider.width
                   function_name="LPF-1"                               //m1
                   min.text="Min : 1"
                   max.text="Max :50"

                   textField.maximumLength=2
                 textField.placeholderText=lPF_1
                 textField.text=""
                   mousevalue=1
               }
           }

        }

//2

        Rectangle{
            id: rectangle3

            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11



           Rectangle{

            anchors.bottom: parent.bottom
            width: parent.width

            height: parent.height/1.5
            color: "green"
            radius: 15
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: lpf_2_text
                color: "#fbfbfb"
                text: lPF_2+" Hz"
                   font.family: "Piboto Condensed"
                font.bold: true
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom: parent.bottom
                 anchors.bottomMargin: 2


            }
           }

           Rectangle{
               y: 12

               width:parent.width/1.5

               height: 20
               color: "yellow"

               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 49
                   height: 20
   font.family: "Piboto Condensed"
                   text: qsTr("LPF-2")
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#020202"
               }
           }
           MouseArea{
           id:lpf_2_ma
               anchors.fill: parent
               onClicked: {
                   lib1.keyboardData("CLR")
                mainRect.width=rectangle.width-rectslider.width
                    function_name="LPF-2"
                   min.text="Min : 1"                                //m2
                   max.text="Max :50"
                     textField.maximumLength=2
                   textField.placeholderText=lPF_2
                   textField.text=""
                   mousevalue=2
               }
           }

            }

//3
        Rectangle{
            id: rectangle4
            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11
           Rectangle{
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height/1.5
            color: "green"
            radius: 15
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: hpf_1_text
                color: "#fbfbfb"
                text:hPF_1+" Hz"
                font.bold: true
                font.family: "Piboto Condensed"
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

            }

           }

           Rectangle{
               y: 12

               width:parent.width/1.5
               height: 20
               color: "yellow"
               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 55
                   height: 20
   font.family: "Piboto Condensed"
                   text: qsTr("HPF-1")
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#000000"
               }
           }
           MouseArea{
           id:hpf_1_ma
               anchors.fill: parent
               onClicked: {
               lib1.keyboardData("CLR")
               mainRect.width=rectangle.width-rectslider.width
                   function_name="HPF-1"                              //m3
                   min.text="Min : 5"
                   max.text="Max :50"
                   textField.placeholderText=hPF_1
                     textField.maximumLength=2
                   textField.text=""
                   mousevalue=3
               }
           }

        }



  //4

    Rectangle{
        id: rectangle5
        Layout.fillWidth: true
        Layout.fillHeight: true
        height: parent.height
       color: "#00000000"
       radius: 11
       Rectangle{

        anchors.bottom: parent.bottom
        width: parent.width

        height: parent.height/1.5
        color: "green"
        Text {
            id: hpf_2_text
            color: "#fbfbfb"
            text: hPF_2+" Hz"
               font.family: "Piboto Condensed"
            font.bold: true
            font.pointSize: 13
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
             anchors.bottom: parent.bottom
             anchors.bottomMargin: 2


        }
        radius: 15
        anchors.bottomMargin: 3
        anchors.horizontalCenter: parent.horizontalCenter



       }

       Rectangle{
           y: 12

           width:parent.width/1.5
           height: 20
           color: "yellow"
           radius: parent.width/5
           anchors.horizontalCenter: parent.horizontalCenter
           Text {
               width: 55
               height: 20
   font.family: "Piboto Condensed"
               text: qsTr("HPF-2")
               font.pointSize: 13
               font.bold: true
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.top: parent.top
               color: "#000000"
           }
       }
       MouseArea{
       id:hpf_2_ma
           anchors.fill: parent
           onClicked: {
               lib1.keyboardData("CLR")
             mainRect.width=rectangle.width-rectslider.width
                function_name="HPF-2"                                    //m4
               min.text="Min : 5"
               max.text="Max :50"
               textField.placeholderText=hPF_2
               textField.text=""
               textField.maximumLength=2
                mousevalue=4
           }
       }

    }


    }
    //row2

    RowLayout{
        id:row2
         width:rectangle.width*0.5
        height: 70
        anchors.centerIn: parent
        spacing: 15

        //1

        Rectangle{


            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11
           Rectangle{

            anchors.bottom: parent.bottom
            width: parent.width

            height: parent.height/1.5
            color: "green"
            radius: 15
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                   font.family: "Piboto Condensed"
                id: od_text
                color: "#fbfbfb"
                text: operate_delay_value+" mSec"
                font.bold: true
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom: parent.bottom
                 anchors.bottomMargin: 5


            }
           }

           Rectangle{
               y: 12

               width:parent.width/1.5
               height: 20
               color: "yellow"
               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 49
                   height: 20
   font.family: "Piboto Condensed"
                   text: qsTr("O/D")
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#020202"
               }
           }
           MouseArea{
           id:od_ma
               anchors.fill: parent
               onClicked: {
                   lib1.keyboardData("CLR")
                   mainRect.width=rectangle.width-rectslider.width
                    function_name="OPERATE DELAY"
                   min.text="Min : 0"                                //m2
                   max.text="Max :20000"
                     textField.maximumLength=5
                   textField.placeholderText=operate_delay_value
                   textField.text=""
                   mousevalue=5
               }
           }


        }

        //2
        Rectangle{


            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11
           Rectangle{

            anchors.bottom: parent.bottom
            width: parent.width

            height: parent.height/1.5
            color: "green"
            radius: 15
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: hd_text
                   font.family: "Piboto Condensed"
                color: "#fbfbfb"
                text: hold_delay_value+" mSec"
                font.bold: true
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom: parent.bottom
                 anchors.bottomMargin: 5


            }
           }

           Rectangle{
               y: 12

               width:parent.width/1.5
               height: 20
               color: "yellow"
               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 49
                   height: 20
   font.family: "Piboto Condensed"
                   text: qsTr("H/D")
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#020202"
               }
           }
           MouseArea{
           id:hd_ma
               anchors.fill: parent
               onClicked: {
                   lib1.keyboardData("CLR")
              mainRect.width=rectangle.width-rectslider.width
                    function_name="HOLD DELAY"
                   min.text="Min : 100"                                //m2
                    max.text="Max :20000"
                     textField.maximumLength=5
                   textField.placeholderText=hold_delay_value
                   textField.text=""
                   mousevalue=6
               }
           }


        }

    }

    //end row2

    //Row 3
    RowLayout{
        height: 70
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 22
        width:rectangle.width*0.25
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
         //1 digital gain

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            height: parent.height
           color: "#00000000"
           radius: 11
           Rectangle{
            anchors.bottom: parent.bottom
            width: parent.width
         height: parent.height/1.5
            color: "green"
            radius: 15
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                            id: dg_text
                            color: "#fbfbfb"
                               font.family: "Piboto Condensed"
                        text:digital_gain_value
                            font.bold: true
                            font.pointSize: 13
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                             anchors.bottom: parent.bottom
                             anchors.bottomMargin: 5

                        }
           }

           Rectangle{
               y:12
               width:parent.width/1.5
               height: 20
               color: "yellow"
               radius: parent.width/5
               anchors.horizontalCenter: parent.horizontalCenter
               Text {
                   width: 49
                   height: 20
                      font.family: "Piboto Condensed"
                   text: qsTr("D/G")
                   font.pointSize: 13
                   font.bold: true
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.top: parent.top
                   color: "#020202"
               }
           }

           MouseArea{
           id:dg_ma
               anchors.fill: parent
               onClicked: {
                   lib1.keyboardData("CLR")
                   mainRect.width=rectangle.width-rectslider.width
                    function_name="Digital Gain"
                   min.text="Min : 0.1"                                //m2
                   max.text="Max :9.9"
                     textField.maximumLength=3
                   textField.placeholderText=digital_gain_value
                   textField.clear()
                   mousevalue=7
               }
           }

        }


        //2 analog gain


         Rectangle{


             Layout.fillWidth: true
             Layout.fillHeight: true
             height: parent.height
            color: "#00000000"
            radius: 11
            Rectangle{

             anchors.bottom: parent.bottom
             width: parent.width

             height: parent.height/1.5
             color: "green"
             radius: 15
             anchors.bottomMargin: 3
             anchors.horizontalCenter: parent.horizontalCenter
             Text {
                 id: a_g_text
                    font.family: "Piboto Condensed"
                 color: "#fbfbfb"
                 text: analog_gain_value
                 font.bold: true
                 font.pointSize: 13
                 verticalAlignment: Text.AlignVCenter
                 horizontalAlignment: Text.AlignHCenter
                 anchors.horizontalCenter: parent.horizontalCenter
                  anchors.bottom: parent.bottom
                  anchors.bottomMargin: 5


             }
            }

            Rectangle{
                y: 12

                width:parent.width/1.5
                height: 20
                color: "yellow"
                radius: parent.width/5
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    width: 49
                    height: 20
    font.family: "Piboto Condensed"
                    text: qsTr("A/G")
                    font.pointSize: 13
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    color: "#020202"
                }
            }
            MouseArea{
            id:a_g
                anchors.fill: parent
                onClicked: {
                    lib1.keyboardData("CLR")
               mainRect.width=rectangle.width-rectslider.width
                     function_name="Analog Gain"
                    min.text="Min : 1"                                //m2
                    max.text="Max :10"
                      textField.maximumLength=3
                    textField.placeholderText=analog_gain_value
                    textField.text=""
                    mousevalue=8
                }
            }


         }




    }



   }

Rectangle {
    id: rectslider
    x: mainRect.width
    y: 0
    width: rectangle.width*0.25
    height: parent.height
    color: "#455dda"


    Text {
        id: id
        color: "#ffffff"
        text: function_name
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
           font.family: "Piboto Condensed"
        font.pointSize: 13
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter


    }
    Text {
        id: min
        x: 18
        y: 35
        color: "#ffffff"
           font.family: "Piboto Condensed"
        text: qsTr("Min :")
        font.pixelSize: 14
    }
    Text {
        id: max
        anchors.rightMargin: 10
        anchors.right: parent.right
        y: 33
        width: 111
        height: 22
        color: "#ffffff"
           font.family: "Piboto Condensed"
        text: qsTr("Max :")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }
    TextField {
        id: textField
       anchors.top: id.bottom
        width: parent.width-10
           font.family: "Piboto Condensed"
        height: 40
        maximumLength: 5
        text:""
        anchors.horizontalCenterOffset: 0
        inputMethodHints:Qt.ImhDigitsOnly
        horizontalAlignment: Text.AlignRight
        font.pointSize: 13
        anchors.topMargin: 41
        placeholderText: "   Value"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button{
        text: "EXIT"
        anchors.bottomMargin: 5
          font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        flat: false
        width:parent.width-5
        height: 30
        anchors.bottom: parent.bottom
        onClicked: {
            mainRect.width=rectangle.width

                 lib1.keyboardData("CLR")
        }
    }

    RowLayout{
        id:inrow1
        width:parent.width-10
        height:30
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        x: 0
        anchors.topMargin: 10
      anchors.top: textField.bottom
      anchors.bottomMargin: 10
    Button {
        id: one
        Layout.fillHeight: true
Layout.fillWidth: true
        flat: false
        text: qsTr("1")
        font.pointSize: 13
enabled: textField.maximumLength>textField.text.length ?true :false
        onClicked:
            {
              if(mousevalue==7)
            {
                textField.text=textField.text.concat("1")
            }
            else
            {
          lib1.keyboardData("1")
            }
            }


    }
    Button {
        id:two
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
text: qsTr("2")
font.pointSize: 13
enabled: textField.maximumLength>textField.text.length?true :false
onClicked: {

       if(mousevalue==7)
    {
        textField.text=textField.text.concat("2")
    }
    else
    {
            lib1.keyboardData("2")
    }
}


    }
    Button {
        id: three
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
        text: qsTr("3")
        font.pointSize: 13
        enabled: textField.maximumLength> textField.text.length?true :false
        onClicked: {
               if(mousevalue==7)
            {
                textField.text=textField.text.concat("3")
            }
            else
            {
          lib1.keyboardData("3")
            }
        }
    }
    }


    //inrow2

    RowLayout{
        id:inrow2
        width:parent.width-10
        height:30
        anchors.topMargin: 6
        anchors.top: inrow1.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        x: 0
        y: 236
    Button {
        id: f
        Layout.fillHeight: true
Layout.fillWidth: true
        flat: false
        text: qsTr("4")
        font.pointSize: 13
        enabled: textField.maximumLength>textField.text.length?true :false
        onClicked: {

                if(mousevalue==7)
            {
                textField.text=textField.text.concat("4")
            }
            else
            {
          lib1.keyboardData("4")
            }
        }

    }
    Button {
        id:five
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
text: qsTr("5")
font.pointSize: 13
enabled: textField.maximumLength>textField.text.length?true :false
onClicked: {

        if(mousevalue==7)
    {
        textField.text=textField.text.concat("5")
    }
    else
    {
  lib1.keyboardData("5")
    }
}
    }
    Button {
        id: six
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
        text: qsTr("6")
        font.pointSize: 13
        enabled: textField.maximumLength>textField.text.length ?true :false
        onClicked: {
          if(mousevalue==7)
            {
                textField.text=textField.text.concat("6")
            }
            else
            {
          lib1.keyboardData("6")
            }
        }
    }
    }

    //inrow3
    RowLayout{
        id:inrow3
        width:parent.width-10
        height:30
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: inrow2.bottom
    Button {
        id: seven
        Layout.fillHeight: true
Layout.fillWidth: true
        flat: false
        text: qsTr("7")
        font.pointSize: 13
        enabled: textField.maximumLength>textField.text.length ?true :false
        onClicked: {
                if(mousevalue==7)
            {
                textField.text=textField.text.concat("7")
            }
            else
            {
          lib1.keyboardData("7")
            }
        }
    }
    Button {
        id:eight
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
text: qsTr("8")
font.pointSize: 13
enabled: textField.maximumLength>textField.text.length?true :false
onClicked: {
      if(mousevalue==7)
    {
        textField.text=textField.text.concat("8")
    }
    else
    {
  lib1.keyboardData("8")
    }
}
    }
    Button {
        id: nine
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
        text: qsTr("9")
        font.pointSize: 13
        enabled: textField.maximumLength>textField.text.length ?true :false
        onClicked: {

             if(mousevalue==7)
            {
                textField.text=textField.text.concat("9")
            }
            else
            {
          lib1.keyboardData("9")
            }
        }
    }
    }

//   inrow4
    RowLayout{
        id:inrow4
        width:parent.width-10
        height:30
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: inrow3.bottom
    Button {
        id: dot
        Layout.fillHeight: true
        enabled: mousevalue==7&&textField.text.length>0 ?true :false
Layout.fillWidth: true
        flat: false
        text: qsTr(".")
        font.bold: true
        font.pointSize: 13
        onClicked: {
            if(mousevalue==7)
            {
                textField.text=textField.text.concat(".")
            }
            else
            {
          lib1.keyboardData(".")
            }
        }
    }
    Button {
        id:zero
        flat: false
        Layout.fillHeight: true
Layout.fillWidth: true
enabled: textField.maximumLength>textField.text.length ?true :false
text: qsTr("0")
font.pointSize: 13
onClicked: {
      if(mousevalue==7||mousevalue==8)
    {
        textField.text=textField.text.concat("0")
    }
    else
    {
  lib1.keyboardData("0")
    }
}
    }
    Button {
        id: enter
        flat: false
        Layout.fillHeight: true
        Layout.fillWidth: true
        text: qsTr("BS")
        font.pointSize: 12
        onClicked: {
              if(mousevalue==7)
            {
                textField.text=textField.text.slice(0,-1)
            }
            else
            {
          lib1.keyboardData("BACK")
            }

        }
    }
    }
 //inrow5
    RowLayout{
        width:parent.width-10
        height:30
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: inrow4.bottom
    Button {
        id: clr
        Layout.fillHeight: true
Layout.fillWidth: true
        flat: false
          font.pointSize: 12
        text: qsTr("CLR")
        onClicked: {
               if(mousevalue==7)
            {
                textField.text=textField.clear()
            }
            else
            {
           lib1.keyboardData("CLR",mousevalue)
            }

        }
    }
    Button {
        id: back
        flat: false
        Layout.fillHeight: true
        Layout.fillWidth: true
        text: qsTr("ENTER")
        font.pointSize: 12
        enabled: textField.text.length>0
        onClicked: {
            timeout_value=180
            if(mousevalue==7&&textField.text.length<=3&&textField.text.length>0)
            {
                if(parseFloat(textField.text)<10&&parseFloat(textField.text)>0)
                {
                      lib1.digital_gain(digital_gain_value,parseFloat(textField.text))

                     lib1.share_on_serialport((parseFloat(textField.text)*10).toString(),code_Digital_Gain)
                     lib1.history(digital_gain_value,parseFloat(textField.text),"D/G changed")
                     dg_text.text=parseFloat(textField.text)
                     digital_gain_value=parseFloat(textField.text)

                     //lib1.filter_values(lPF_1, lPF_2, hPF_1, hPF_2, operate_delay_value,  hold_delay_value,digital_gain_value,analog_gain_value)
                     textField.text=""
                     lib1.keyboardData("CLR")
                }
                else{
                   lib1.notify_to_qml_from_qml("Please Enter Valid Values",false)
               }

            }

            else{
          lib1.keyboardData("ENTER")
            textField.placeholderText=placeHolder_Value
          fun()
            }
        }
    }
    }





}

    }


