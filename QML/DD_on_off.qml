import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
Rectangle {
    id: rectangle
    width:800
    height:480
       color: "#b7bedf"

              property real pf_value: (con33.value/10)
              property real freq: (control.value/10)
          property int dd_power: (con3.value)

       property real pf_value_temp: 0
       property real freq_temp: 0
   property int dd_power_temp: 0

       property bool user_logged_in_or_not: false

       Connections{
        target: lib1
            onDefault_values_to_qml:{
                console.log(power_factor_qml.toFixed(1),"power_factor_qml",status_v)
               // console.log(thresh_qml,amplitude_qml,phase_qml,freq_qml,power_qml,power_factor_qml,dg_qml,analoggain_qml,drivepower_qml,"DD_on_off")

                if(status_v==0)
                {

                    con3.value=power_qml
                    dd_power_temp=power_qml
                    con33.value=power_factor_qml*10
                    pf_value=power_factor_qml.toFixed(1)
                    control.value=freq_qml*10
                    freq_temp=freq_qml
                }
            }
       }


ColumnLayout{
anchors.fill: parent
anchors.margins: 12
spacing: 12
RowLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 12
    Rectangle{
        id:r0
       color: sw.checked? "#F7C59F" :"#b9c460"
        Layout.fillWidth: true

        Layout.fillHeight: true
        radius: width*0.01
     Text {
         font.bold: true
         font.pointSize: 12
       anchors.margins: 5
         anchors.top: parent.top
         anchors.right: parent.right
         text: qsTr("DD Status")
           font.family: "Piboto Condensed"

         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter

        }
        Switch{
            id:sw

            text:tr?"ON":"OFF"
            checked: tr?true:false
   font.family: "Piboto Condensed"
            anchors.centerIn:parent
            onCheckedChanged: {
                tr=checked
                lib1.dD_on_off(tr)
            }

            font.bold: true
            font.pointSize: 25
            indicator: Rectangle {
                   implicitWidth: 120
                   implicitHeight: 40
                   x: sw.leftPadding
                   y: parent.height / 2 - height / 2
                   radius: height/2
                   color: sw.checked ? "#17a81a" : "red"
                   border.color: sw.checked ? "#17a81a" : "#cccccc"

                   Rectangle {
                       x: sw.checked ? parent.width - width : 0
                       width: 60
                       anchors.verticalCenter: parent.verticalCenter
                       height: width
                       radius: width/2
                       color: sw.down ? "#cccccc" : "#ffffff"
                       border.width: 2
                       border.color: sw.checked ? (sw.down ? "#17a81a" : "#17a81a") : "red"
                       Text {
                           anchors.centerIn: parent
                           color: "grey"
                           font.family: "Piboto Condensed"
                           font.bold: true
//                             font.family: "Arial"
                           font.pointSize: 18
                           text: "DD"
                       }
                   }
               }

        }


    }
    Rectangle{
        id:r1
     enabled: usertype_predict!=""&&sw.checked?true:false
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
              value: 0
onValueChanged: {
    pf_value=con33.value/10
lib1.dd_power_factor(pf_value_temp,pf_value,false)



}
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
                console.log(pf_value_temp,pf_value,"default values")
                lib1.dd_power_factor(pf_value_temp,pf_value,true)
                pf_value_temp=pf_value
                // lib1.powerFactor(pf_value,freq)  to text dd width high and low
            }
              background:Rectangle {
                  implicitWidth: 50
                  implicitHeight: width
                  radius: width/2
                  color: sw.checked||save2.down? "white" :"grey"
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
    id:rl2
    Layout.fillWidth: true
    Layout.fillHeight: true
    enabled: usertype_predict!=""&&sw.checked?true:false
    spacing: 12
    Rectangle{
        id:r3
        radius: width*0.01
            color: sw.checked? "#F7C59F" :"#b9c460"

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
            from:0
            to:100
            height:width/2.2
            width: parent.height*0.9
            anchors.centerIn: parent
            value: 0
            onValueChanged: {
                dd_power=con3.value

                    if(stack_B.depth==1)
                    {
           lib1.dd_power(dd_power_temp,dd_power,false)
            }
            }
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
           anchors.margins: 10
           anchors.right: parent.right
           anchors.bottom: parent.bottom

           onClicked: {
            lib1.dd_power(dd_power_temp,dd_power,true)
            dd_power_temp=dd_power
           }
            background:Rectangle {
                implicitWidth: 50
                implicitHeight: width
                radius: width/2
                color: sw.checked? "white" :"grey"
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
                  from:100
                 anchors.centerIn: parent
                  height:width/2.2
                  width: parent.height*0.9
                  to:400
onValueChanged: {
    freq= control.value/10
    lib1.dd_frequency(freq_temp/10,freq,false)


}
                     value: 1
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
                 anchors.margins: 10
                 anchors.right: parent.right
                 anchors.bottom: parent.bottom

                 onClicked: {

                     lib1.dd_frequency(freq_temp,freq,true)
                     freq_temp=freq
                 }
                  background:Rectangle {
                      implicitWidth: 50
                      implicitHeight: width
                      radius: width/2
                      color: sw.checked? "white" :"grey"
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

