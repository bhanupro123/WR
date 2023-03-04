import QtQuick.Controls 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Layouts 1.0
import Qt.labs.calendar 1.0
import QtQuick 2.9

Rectangle {
    id: rectangle
    visible: true
    width: 800
    height: 360
    color: "#ebba5b"
    Connections{
        target: lib1
        onDefault_values_to_qml:{
            if(status_v==1)
            {
           console.log(thresh_qml,amplitude_qml,phase_qml,freq_qml,power_qml,power_factor_qml
               ,dg_qml,analoggain_qml,drivepower_qml)
            signall.text="Signal : "+thresh_qml
            amplitude.text="Amplitude : "+amplitude_qml
            phase.text="Phase : "+phase_qml
            dd_freq.text="DD_Frequency : "+freq_qml
            dd_power.text="DD_Power : "+power_qml
            dd_power_factor.text="DD_Power_Factor: "+power_factor_qml
             dg_gain.text="Digital Gain : "+dg_qml
            analog_angle.text="Analog Gain : "+analoggain_qml
            drive_power.text="Drive Power : "+drivepower_qml

        }
      }
    }

    Timer{
        running:true
         repeat:false
         interval:10
         onTriggered:{
             lib1.default_values(1)
         }
    }

    property int val: 0
    property real dg_value: (dg_spin.value/10).toFixed(1)
    property real pf_value: (con33.value/10).toFixed(1)
           property real freq: (control.value/10).toFixed(1)
property int dd_power_v: con3.value
       ScrollView{
           id: scrollView
           anchors.fill: parent
           Text {
               id: element
               x: 390
               y: 8
               color: "#ffffff"
               text: qsTr("Default Product Settings :")
               anchors.horizontalCenter: parent.horizontalCenter
               font.bold: true
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignHCenter
               wrapMode: Text.WordWrap
               font.pixelSize: 30
           }
           CheckBox
           {
               id: sw
               x: 624
               y: 9
               text: qsTr("Edit Parameters")
           }
     clip: true
     ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
         contentHeight:  sw.checked?800:360
         Rectangle{
             id: re
             border.width: 2
             radius: 10
             y:80
             anchors.horizontalCenter: parent.horizontalCenter
             width: 700
             height:200
             Column{
                      y: 35
                      spacing: 30
                  width:parent.width*0.3
                  height:103
                  anchors.left: parent.left
                  anchors.leftMargin: 5
                  Text {
                      id:signall
                      width:parent.width
                      text: qsTr("Signal :00000")
                      font.family: "Piboto Condensed"
                      font.pointSize: 18
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft

                  }
                  Text {
                      id:dd_freq
                      text: qsTr("DD_Frequency : 000")
                      font.family: "Piboto Condensed"
                      font.pointSize: 18
                       width:parent.width
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft
                  }
                  Text {
                      id:analog_angle
                      text: qsTr("Analog_Angle : 000")
                      font.family: "Piboto Condensed"
                      font.pointSize: 18
                       width:parent.width
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft
                  }

              }

          Column {
              x: 33
              y: 35
              height: 103
              spacing: 30
              anchors.horizontalCenter: parent.horizontalCenter
             width:parent.width*0.3
               Text {
                    id:phase
                     width:parent.width
                    text: qsTr("Phase :000.0")
                    font.family: "Piboto Condensed"
                    font.pointSize: 18
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft

               }
                Text {
                    id:dd_power_factor
                    text: qsTr("DD_Power_Factor : 000")
                    font.family: "Piboto Condensed"
                    font.pointSize: 18
                     width:parent.width
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }
                Text {
                    id: dg_gain

                    text: qsTr("Digital_Gain: 0.0")
                    font.family: "Piboto Condensed"
                    font.pointSize: 18
                     width:parent.width
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }
          }

           Column {
               x: 564
                y: 35
                width:parent.width*0.3
                height: 103
                anchors.right: parent.right
               anchors.rightMargin: 5
               spacing: 30
               Text {
                   id:amplitude
                   text: qsTr("Amplitude : 00000")
                   font.family: "Piboto Condensed"
                   font.pointSize: 18
                   width:parent.width
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignRight
               }
               Text {
                   id:dd_power
                    width:parent.width
                   text: qsTr("DD_Power : 000")
                   font.family: "Piboto Condensed"
                   font.pointSize: 18
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignRight
               }
               Text {
                   id:drive_power
                    width:parent.width
                   text: qsTr("Drive_Power : 000")
                   font.family: "Piboto Condensed"
                   font.pointSize: 18
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignRight
               }

           }



         }

         Rectangle
         {
             y:300
             width:800
            height: 279
            color: "#ebba5b"
            visible:  sw.checked?true:false
               enabled: sw.checked?true:false
               RowLayout{
                   spacing: 10
                   width: 700
                   height:40
                   anchors.horizontalCenter: parent.horizontalCenter
               TextField {
                   id:signalll
                     inputMethodHints: Qt.ImhDigitsOnly
                   visible:  sw.checked?true:false
                      enabled: sw.checked?true:false
                 Layout.fillHeight: true
                 Layout.fillWidth: true
                   placeholderText: "Signal 350 to 14000"
                   onAccepted: {
                       if(parseInt(signalll.text)>=350&&parseInt(signalll.text)<=14000)
                       {
                              lib1.default_thresh_hold(parseInt(signalll.text))
                       }
                   }
               }
               TextField {
                   id: mphs
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   onAccepted: {
                       if(parseFloat(mphs.text).toFixed(1)>=45&&parseFloat(mphs.text).toFixed(1)<=180)
                       {
                              lib1.default_phase(parseFloat(mphs.text).toFixed(1))
                       }
                   }
                   inputMethodHints: Qt.ImhDigitsOnly
                   visible:  sw.checked?true:false
                      enabled: sw.checked?true:false
                      placeholderText: "Phase 10.0 to 180.0"
               }
               TextField {
                   id: amplitude1

                   inputMethodHints: Qt.ImhDigitsOnly
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   visible:  sw.checked?true:false
                      enabled: sw.checked?true:false
                      placeholderText: "Amp 500 to 14000"
                      onAccepted: {
                          if(parseInt(amplitude1.text)>=500&&parseInt(amplitude1.text)<=14000)
                          {
                       lib1.default_amplitude(parseInt(amplitude1.text))
                      }
                      }
               }
               TextField {
                   id: analog_gain_textfiled
                   inputMethodHints: Qt.ImhDigitsOnly
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   visible:  sw.checked?true:false
                      enabled: sw.checked?true:false
                      placeholderText: "Analog gain 1 to 100"
                      onAccepted: {
                          if(parseInt(analog_gain_textfiled.text)>=1&&parseInt(analog_gain_textfiled.text)<=100)
                          {
                       lib1.default_analog_gain(parseInt(analog_gain_textfiled.text))
                      }

               }
               }
               TextField {
                   id: drive_power_textfield

                   inputMethodHints: Qt.ImhDigitsOnly
                   Layout.fillHeight: true
                   Layout.fillWidth: true
                   visible:  sw.checked?true:false
                      enabled: sw.checked?true:false
                      placeholderText: "Drive Power 1 to 100"
                      onAccepted: {
                          if(parseInt(drive_power_textfield.text)>=1&&parseInt(drive_power_textfield.text)<=100)
                          {
                       lib1.default_drive_power(parseInt(drive_power_textfield.text))
                      }

               }

               }
               }


         ColumnLayout{
             width:700
             height:360
             anchors.horizontalCenterOffset: -5
             anchors.horizontalCenter: parent.horizontalCenter
             visible:  sw.checked?true:false
           enabled: sw.checked?true:false

          y: 80
          anchors.margins: 20
          spacing: 12
         RowLayout{
             Layout.fillWidth: true
             Layout.fillHeight: true
             spacing: 12
             Rectangle{
                 id:r0
                 enabled: sw.checked?true:false
                 Layout.fillWidth: true
                 Layout.fillHeight: true
                 radius: width*0.01
                        color: sw.checked? "#F7C59F" :"#b9c460"
                        Text{
                            font.bold: true
                            font.family: "Piboto Condensed"
                            font.pointSize: 12
                            anchors.bottom: dg_value_text.top
                            anchors.bottomMargin: 10
                            x:dg_value_text.x
                            color: "#56595b"
                            text: "Min:1.0"
                        }
                        Text{
                        font.family: "Piboto Condensed"
                            anchors.top: dg_value_text.bottom
                            anchors.topMargin: 10
                            x:dg_value_text.x
                            color: "#56595b"
                            font.bold: true
                            font.pointSize: 12
                            text: "Max:9.9"
                        }
                   Text {

                       font.bold: true
                       font.pointSize: 12
                        anchors.margins: 5
                         font.family: "Piboto Condensed"

                       text: qsTr("Digital Gain")
                       anchors.top: parent.top
                       anchors.right: parent.right
                   }
                   Text {
                       id:dg_value_text
                       x:parent.width*0.12
                       text: dg_value
                        font.family: "Piboto Condensed"
                       anchors.verticalCenter: parent.verticalCenter
                       font.bold: true
                       font.pointSize: 25
         //
                   }

                   SpinBox{
                       id:dg_spin
                       from:10
                       to:99
                       value: 10
                       onValidatorChanged: {

         }
                       height:width/2.2
                       stepSize: 1
                       width: parent.height*0.9
                       anchors.centerIn: parent
                       contentItem:
                           Text {
                           width:0
                           height: 0
                           rotation: 90
                           text: ""
                       }

                       background:
                         Rectangle{
                           width:con33.width
                           height: con33.height

                                color: sw.checked? "#F7C59F" :"#b9c460"
                           }




                       up.indicator: Rectangle {
                               x: dg_spin.mirrored ? 0 : parent.width - width
                               width: parent.height
                               anchors.verticalCenter: parent.verticalCenter
                               radius: width/2
                             height:width
                              border.width: 3
                               color: dg_spin.up.pressed ? "#e4e4e4" : "#f6f6f6"
                               border.color: enabled ? "#21be2b" : "#bdbebf"

                               Text {
                                   text: "UP"
                                   rotation: 90
                                   font.bold: true
                                     font.family: "Piboto Condensed"
                                  font.pointSize: 12
                                    color: sw.checked? "black" :"grey"
                                   anchors.fill: parent
                                   fontSizeMode: Text.Fit
                                   horizontalAlignment: Text.AlignHCenter
                                   verticalAlignment: Text.AlignVCenter
                               }
                           }

                           down.indicator: Rectangle {
                               x: dg_spin.mirrored ? parent.width - width : 0
                               width: parent.height
                               anchors.verticalCenter: parent.verticalCenter
                               radius: width/2
                             height:width
                             border.width: 3
                               color: dg_spin.down.pressed ? "#e4e4e4" : "#f6f6f6"
                               border.color: enabled ? "#21be2b" : "#bdbebf"

                               Text {
                                    rotation: 90
                                   text: "DN"
                                    font.bold: true
                                     font.family: "Piboto Condensed"
                                   font.pointSize: 12
                                  color: sw.checked? "black" :"grey"
                                   anchors.fill: parent
                                   fontSizeMode: Text.Fit
                                   horizontalAlignment: Text.AlignHCenter
                                   verticalAlignment: Text.AlignVCenter
                               }
                           }

                       rotation: 270
                   }


                   Button{
                       id:save_dg
                      anchors.margins: 10
                      anchors.right: parent.right
                      anchors.bottom: parent.bottom
                       background:Rectangle {
                           implicitWidth: 50
                           implicitHeight: width
                           radius: width/2
                           color: save_dg.down? "grey" :"white"
                           Text {
                               font.bold: true
                               font.pointSize: 12
                          font.family: "Piboto Condensed"
                               anchors.centerIn: parent
                               text: qsTr("SAVE")
                           }
                       }
                        onClicked: {
                            lib1.default_digital_gain(dg_value)
                        }

                   }
             }

             Rectangle{
                 id:r1
                 enabled: sw.checked?true:false
                 Layout.fillWidth: true
                 Layout.fillHeight: true
                 radius: width*0.01
                        color: sw.checked? "#F7C59F" :"#b9c460"
                        Text{
                            font.bold: true
                            font.family: "Piboto Condensed"
                            font.pointSize: 12
                            anchors.bottom: r1_value.top
                            anchors.bottomMargin: 10
                            x:r1_value.x
                            color: "#56595b"
                            text: "Min:20.0"
                        }
                        Text{
                        font.family: "Piboto Condensed"
                            anchors.top: r1_value.bottom
                            anchors.topMargin: 10
                            x:r1_value.x
                            color: "#56595b"

                            font.bold: true
                            font.pointSize: 12
                            text: "Max:80.0"
                        }
                   Text {

                       font.bold: true
                       font.pointSize: 12
                        anchors.margins: 5
                         font.family: "Piboto Condensed"

                       text: qsTr("DD Power Factor")
                       anchors.top: parent.top
                       anchors.right: parent.right
                   }
                   Text {
                       id:r1_value
                       x:parent.width*0.12
                        font.family: "Piboto Condensed"
                       anchors.verticalCenter: parent.verticalCenter
                       font.bold: true
                       font.pointSize: 25
                       text: pf_value
         //              text: con33.value+"."+con4.value
                   }

                   SpinBox{
                       id:con33
                       from:200
                       to:800
                       value: 500

                       height:width/2.2
                       width: parent.height*0.9
             anchors.centerIn: parent
                       contentItem:
                           Text {
                           width:0
                           height: 0
                           rotation: 90
                           text: ""
                       }

                       background:
                         Rectangle{
                           width:con33.width
                           height: con33.height
         //                  color: "red"
                                color: sw.checked? "#F7C59F" :"#b9c460"
                           }




                       up.indicator: Rectangle {
                               x: con33.mirrored ? 0 : parent.width - width
                               width: parent.height
                               anchors.verticalCenter: parent.verticalCenter
                               radius: width/2
                             height:width
                              border.width: 3
                               color: con33.up.pressed ? "#e4e4e4" : "#f6f6f6"
                               border.color: enabled ? "#21be2b" : "#bdbebf"

                               Text {
                                   text: "UP"
                                   rotation: 90
                                   font.bold: true
                                     font.family: "Piboto Condensed"
                                  font.pointSize: 12
                                    color: sw.checked? "black" :"grey"
                                   anchors.fill: parent
                                   fontSizeMode: Text.Fit
                                   horizontalAlignment: Text.AlignHCenter
                                   verticalAlignment: Text.AlignVCenter
                               }
                           }

                           down.indicator: Rectangle {
                               x: con33.mirrored ? parent.width - width : 0
                               width: parent.height
                               anchors.verticalCenter: parent.verticalCenter
                               radius: width/2
                             height:width
                             border.width: 3
                               color: con33.down.pressed ? "#e4e4e4" : "#f6f6f6"
                               border.color: enabled ? "#21be2b" : "#bdbebf"

                               Text {
                                    rotation: 90
                                   text: "DN"
                                    font.bold: true
                                     font.family: "Piboto Condensed"
                                   font.pointSize: 12
                                  color: sw.checked? "black" :"grey"
                                   anchors.fill: parent
                                   fontSizeMode: Text.Fit
                                   horizontalAlignment: Text.AlignHCenter
                                   verticalAlignment: Text.AlignVCenter
                               }
                           }

                       rotation: 270
                   }


                   Button{
                       id:save2
                      anchors.margins: 10
                      anchors.right: parent.right
                      anchors.bottom: parent.bottom
                        onClicked: {
                            lib1.default_dd_power_factor(pf_value)
                        }

                       background:Rectangle {
                           implicitWidth: 50
                           implicitHeight: width
                           radius: width/2
                           color:save2.down? "grey" :"white"
                           Text {
                               font.bold: true
                               font.pointSize: 12
                          font.family: "Piboto Condensed"
                               anchors.centerIn: parent
                               text: qsTr("SAVE")
                           }
                       }


                   }
             }

         }
         RowLayout{
             Layout.fillWidth: true
             Layout.fillHeight: true
             spacing: 12
             Rectangle{
                 id:r3
                 radius: width*0.01
                     color: sw.checked? "#F7C59F" :"#b9c460"
                       enabled: sw.checked?true:false
                 Layout.fillWidth: true
                 Layout.fillHeight: true
                 Text{
                     font.bold: true
                       font.family: "Arial"
                     font.pointSize: 12
                     anchors.bottom: r3_value.top
                     anchors.bottomMargin: 10
                     x:r3_value.x
                     color: "#56595b"
                     text: "Min:0"
                 }
                 Text{

                     anchors.top: r3_value.bottom
                     anchors.topMargin: 10
                     x:r3_value.x
                     color: "#56595b"
                     font.bold: true

                      font.family: "Piboto Condensed"
                     font.pointSize: 12
                     text: "Max:100"
                 }

                 Text {
                     font.bold: true
                     font.pointSize: 12
                   anchors.margins: 5
                   font.family: "Piboto Condensed"
                     anchors.top: parent.top
                     anchors.right: parent.right
                     text: qsTr("DD Power")

                 }
                 Text {
                     id:r3_value
                     x:parent.width*0.12
                     anchors.verticalCenter: parent.verticalCenter
                     font.bold: true
                     font.pointSize: 25
                      font.family: "Piboto Condensed"
                     text: con3.value
                 }
                 SpinBox{
                     id:con3
                     stepSize: 1
                     from:20
                     to:100
                     height:width/2.2
                     width: parent.height*0.9
                     anchors.centerIn: parent
                     value: 20
                     contentItem:
                         Text {
                         rotation: 90
                         text: ""
                     }

                     background:
                       Rectangle{
                         width:con3.width
                         height: con3.height
                               color: sw.checked? "#F7C59F" :"#b9c460"
                         }

                     up.indicator: Rectangle {
                             x: con3.mirrored ? 0 : parent.width - width
                             width: parent.height
                             anchors.verticalCenter: parent.verticalCenter
                             radius: width/2
                           height:width
                            border.width: 3
                             color: con3.up.pressed ? "#e4e4e4" : "#f6f6f6"
                             border.color: enabled ? "#21be2b" : "#bdbebf"

                             Text {
                                 text: "UP"
                                 rotation: 90
                                 font.bold: true
                                    font.family: "Piboto Condensed"
                                font.pointSize: 12
                                  color: sw.checked? "black" :"grey"
                                 anchors.fill: parent
                                 fontSizeMode: Text.Fit
                                 horizontalAlignment: Text.AlignHCenter
                                 verticalAlignment: Text.AlignVCenter
                             }
                         }

                         down.indicator: Rectangle {
                             x: con3.mirrored ? parent.width - width : 0
                             width: parent.height
                             anchors.verticalCenter: parent.verticalCenter
                             radius: width/2
                           height:width
                            border.width: 3
                             color: con3.down.pressed ? "#e4e4e4" : "#f6f6f6"
                             border.color: enabled ? "#21be2b" : "#bdbebf"

                             Text {
                                  rotation: 90
                                 text: "DN"
                                  font.bold: true
                                   font.family: "Piboto Condensed"
                                 font.pointSize: 12
                                color: sw.checked? "black" :"grey"
                                 anchors.fill: parent
                                 fontSizeMode: Text.Fit
                                 horizontalAlignment: Text.AlignHCenter
                                 verticalAlignment: Text.AlignVCenter
                             }
                         }
                     rotation: 270
                 }

                 Button{
                     id:three
                    anchors.margins: 10
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    onClicked: {
                        console.log(dd_power_v)
                        lib1.default_dd_power(dd_power_v)
                    }
                     background:Rectangle {
                         implicitWidth: 50
                         implicitHeight: width
                         radius: width/2
                         color: three.down?"grey" :"white"
                         Text {
                             font.bold: true
                             font.pointSize: 12
                                font.family: "Piboto Condensed"
                             anchors.centerIn: parent
                             text: qsTr("SAVE")
                         }
                     }


                 }
             }
             Rectangle{
                 id:r2
                 radius: width*0.01
                 color: sw.checked? "#F7C59F" :"#b9c460"
                 enabled: sw.checked?true:false
                 Layout.fillWidth: true
                 Layout.fillHeight: true
                 Text{
                     font.bold: true
                     font.pointSize: 12
                     anchors.bottom: r2_value.top
                     anchors.bottomMargin: 10
                     x:r2_value.x
                   font.family: "Piboto Condensed"
                     color: "#56595b"
                     text: "Min:10.0"
                 }
                 Text{

                     anchors.top: r2_value.bottom
                     anchors.topMargin: 10
                     x:r2_value.x
                     color: "#56595b"
                     font.family: "Piboto Condensed"
                     font.bold: true
                     font.pointSize: 12
                     text: "Max:40.0"
                 }

                   Text {
                       font.bold: true
                       font.pointSize: 12
                          font.family: "Piboto Condensed"
                        anchors.margins: 5
                       anchors.top: parent.top
                       anchors.right: parent.right
                       text: qsTr("DD Frequency")
                   }
                   Text {
                       id:r2_value
                       x:parent.width*0.12
                  font.family: "Piboto Condensed"
                       anchors.verticalCenter: parent.verticalCenter
                       font.bold: true
                       font.pointSize: 25
                       text: freq
                   }


                       SpinBox{
                           id:control
                           from:180
                          anchors.centerIn: parent
                           height:width/2.2
                           width: parent.height*0.9
                           to:400

                              value: 180
                              contentItem:
                                  Text {
                                  rotation: 90
                                  text: ""
                              }

                              Rectangle{
                                width:control.width
                                height: control.height
                                      color: sw.checked? "#F7C59F" :"#b9c460"
                                }
                           up.indicator: Rectangle {
                                   x: control.mirrored ? 0 : parent.width - width
                                   width: parent.height
                                   anchors.verticalCenter: parent.verticalCenter
                                   radius: width/2
                                 height:width
                                  border.width: 3
                                   color: control.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                   border.color: enabled ? "#21be2b" : "#bdbebf"

                                   Text {
                                       text: "UP"
                                       rotation: 90
                                    font.family: "Piboto Condensed"
                                       font.bold: true
                                      font.pointSize: 12
                                        color: sw.checked? "black" :"grey"
                                       anchors.fill: parent
                                       fontSizeMode: Text.Fit
                                       horizontalAlignment: Text.AlignHCenter
                                       verticalAlignment: Text.AlignVCenter
                                   }
                               }

                               down.indicator: Rectangle {
                                   x: control.mirrored ? parent.width - width : 0
                                   width: parent.height
                                   anchors.verticalCenter: parent.verticalCenter
                                   radius: width/2
                                   border.width: 3
                                 height:width
                                   color: control.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                   border.color: enabled ? "#21be2b" : "#bdbebf"

                                   Text {
                                        rotation: 90
                                       text: "DN"
                                        font.bold: true
                                          font.family: "Piboto Condensed"
                                       font.pointSize: 12
                                      color: sw.checked? "black" :"grey"
                                       anchors.fill: parent
                                       fontSizeMode: Text.Fit
                                       horizontalAlignment: Text.AlignHCenter
                                       verticalAlignment: Text.AlignVCenter
                                   }
                               }
                           rotation: 270

                 }

                       Button{
                           id:four
                          anchors.margins: 10
                          anchors.right: parent.right
                          anchors.bottom: parent.bottom
                          onClicked: {
                              lib1.default_dd_freq(freq)
                          }
                           background:Rectangle {
                               implicitWidth: 50
                               implicitHeight: width
                               radius: width/2
                               color: four.down? "grey" :"white"
                               Text {
                                   font.bold: true
                                   font.pointSize: 12
                                      font.family: "Piboto Condensed"
                                   anchors.centerIn: parent
                                   text: qsTr("SAVE")
                               }
                           }
                       }
             }
         }
         }


       }
}


      }






/*##^##
Designer {
    D{i:25;anchors_height:20;anchors_width:20}
}
##^##*/


