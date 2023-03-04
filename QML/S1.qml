import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick 2.5
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick 2.10
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import QtQuick.Extras 1.4 as bhanup
Rectangle{
   id: rectangle
   width: 800
   height: 360
   gradient: Gradient {
       GradientStop {
           position: 0
           color: "#909ba1"
       }

       GradientStop {
           position: 1
           color: "#253d4d"
       }
   }
property int la:rectangle.height*0.6
   property real val1:dial2.value
   property int val2: dial1.value
   property int val0: dial0.value
   property var  fun : function(){
          tf.color="black"
       column.string_value=""
       storage_satus=0
       rect.x=-rect.width
          rect.visible=false
          rect.enabled=false
       swipe.interactive=true
   }

 MouseArea{
   id:main_ma
   anchors.fill: parent
onClicked: {
fun()
}

 }
 Timer {

             interval: 10; running: true; repeat: false
             onTriggered: {
                 lib1.dD_on_off(false);
                  lib1.default_values(0)
         }
 }
   Timer {
               id:time2
               interval: 10; running: true; repeat: false
               onTriggered: {
                   bhanu.finduser()

           }
   }

   Connections{
    target: lib1
    onValid_value:{
            notify_model.append({

                                    "time": value_s,
                                    "title": "",
                                    "category": ""
                                })
    }


    onGet_defect_emit_thresh_hold_signal:{
        defect_signal_get_value=get_defect_emit_thresh_hold_signal
    }
    onGet_defect_emit_thresh_hold_phase:{
        defect_phase_get_value=(get_defect_emit_thresh_hold_phase/10).toFixed(1)

    }
    onGet_defect_emit_thresh_hold_amplitude:{
        defect_amplitude_get_value=get_defect_emit_thresh_hold_amplitude
    }
    onGet_defect_emit_thresh_hold_coil_output:{
        defect_coil_output_get_value=get_defect_emit_thresh_hold_coil_output
    }

   onGet_emit_thresh_hold_signal:{
//signal_get_value=get_emit_thresh_hold_signal
       bhanupro.text=get_emit_thresh_hold_signal
//       canvasin11.requestPaint()
//       canvas2.requestPaint()
      // lib1.s0(signal_get_value)
   }
  onGet_emit_thresh_hold_phase:{

      phase_get_value=(get_emit_thresh_hold_phase/10).toFixed(1)
            lib1.s1(phase_get_value)
            colorchange.color="#c30b68"
      name.rotation=((phase_get_value*1.5555556)-138)*-1

          phaseTimer.restart()


   }
  onGet_emit_thresh_hold_amplitude:{
      amplitude_get_value=get_emit_thresh_hold_amplitude
      lib1.s2(amplitude_get_value)
      canvasnew.requestPaint()
      canvas1.requestPaint()
   }
  onGet_emit_thresh_hold_coil_output:{
 coil_output_get_value=get_emit_thresh_hold_coil_output
        lib1.cp(coil_output_get_value)
        can_green.requestPaint()
   }

        onDefault_values_to_qml:{
        // console.log(thresh_qml,amplitude_qml,phase_qml,freq_qml,power_qml,power_factor_qml,dg_qml,analoggain_qml,drivepower_qml)

            if(status_v==0||status_v==3)
            {
            val0=thresh_qml
                canvas2.requestPaint()
                canvasin2.requestPaint()
                canvasin11.requestPaint()
            val2=amplitude_qml
            val1=(phase_qml).toFixed(1);
                if (key_value == Math.floor(key_value)) {

//                    notify_model.append({

//                                            "time": val1,
//                                            "title": "",
//                                            "category": ""
//                                        })
                    phaseText.text="MPHS\n"+val1+".0"
                }
                else
                {
//                    notify_model.append({

//                                            "time": val1,
//                                            "title": "",
//                                            "category": ""
//                                        })
                   phaseText.text="MPHS\n"+val1
                }
                phaseTimer.restart()
                canvas1.requestPaint()
                canvasnew.requestPaint()
                canvasin.requestPaint()
                rect.visible=false
                rect.enabled=false
            }
        }
   onKeysignal1:{
   key_value=key
       key_value=key_value.toFixed(1)

       if(storage_satus==2)
       {

            if(key_value<=180)
               {

                lib1.s4(val1,key.toFixed(1))
         val1=key_value.toFixed(1)
                if (key_value == Math.floor(key_value)) {

                    phaseText.text="MPHS\n"+val1+".0"
                }
                else
                {
                   phaseText.text="MPHS\n"+val1
                }

          phaseTimer.restart()
           rect.visible=false
           rect.enabled=false
                 }
                     else
                {
           tf.color="#c30b68"
       }
   }

   if(storage_satus==1)
   {
       if(key<=14000&&key>=10)
       {
           lib1.s3(val0,key)
           val0=key
           canvas2.requestPaint()
           canvasin2.requestPaint()
           canvasin11.requestPaint()
           rect.visible=false
           rect.enabled=false
       }
       else
       {
           tf.color="#c30b68"
       }
   }
   if(storage_satus==3)
   {
       if(key<=14000&&key>=10)
       {
           lib1.s5(val2,key)
           val2=key
           canvas1.requestPaint()
           canvasnew.requestPaint()
           canvasin.requestPaint()
           rect.visible=false
           rect.enabled=false

       }
       else
       {
           tf.color="#c30b68"
       }
   }

   }
   }


   Text {
       id:bhanupro
       text: "0"
     x:5
     y:5
       font.pointSize: 25
       color: "red"
   }

   NumberAnimation {
       targets: ["rect0","rect2"]
       properties: "y"
       from: 0

       duration: 800
   }
   ParallelAnimation {
          running: true
          NumberAnimation { target: rect0; property: "y"; to: 60; duration: 600 }
          NumberAnimation { target: rect2; property: "y"; to: 60; duration: 600 }
          NumberAnimation { target: rect1; property: "opacity"; from:0;to: 1; duration: 600 }
          NumberAnimation { target: right_circle; property: "opacity"; from:0;to: 1; duration: 600 }
          NumberAnimation { target: left_circle; property: "opacity"; from:0;to: 1; duration: 600 }
      }
Rectangle{
  id:rect0
  y:0
  anchors.left: parent.left
  anchors.leftMargin: parent.width*0.04
  width: height
  height: la
  radius: height/2
  color: "#ffffff"

  gradient: Gradient {
      GradientStop {
          position: 0
          color: "#FCFCFC"
      }

      GradientStop {
          position: 1
          color: "#DDDDDE"
      }
  }

  Behavior on height {

      NumberAnimation {
          target: rect0
          property: "height"
          duration: 500

      }
  }


  MouseArea{
      id:m0
      enabled: true
      anchors.fill: parent
      onClicked: {
          if(usertype_predict !=="")
          {
                 tf.color="black"
              column.string_value=""
              storage_satus=1
              column11.text="Threshold-Sig (THR-S)"
               min_text.text="Min:10"
              max_text.text="Max:14000"
              rect.x=0
        rect.visible=true
        rect.enabled=true
        swipe.interactive=false
          }
      //    else{
//              is_create_in_active=false
//        stack_B.push( finger_print_scan)
        //  }

      }

  }

       Rectangle{
           anchors.centerIn: parent
           width:parent.width*0.9
           height:width
radius: width/2
Rectangle{

    width:parent.width*0.9
    height:width
    radius: width/2
    border.width: 0
 anchors.centerIn: parent
 gradient: Gradient {
     GradientStop {
         position: 0
           color: "#c3c2c0"
     }

     GradientStop {
         position: 1
         color: "white"
     }

    }
           Text{
              id:text0
              y:parent.height/2-40
//                anchors.centerIn: parent
              anchors.horizontalCenter: parent.horizontalCenter
              text:"SIGNAL\n"+signal_get_value
                 font.family: "Piboto Condensed"
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter
                font.bold: true
              color: incdec*1000+val0>signal_get_value ?"green":"#c30b68"
              font.pointSize:rect0.width*0.07
           }
           }




      Rectangle{
          width:parent.width*0.4
          height: width
          radius: width/2

          anchors.bottom: parent.bottom
          anchors.horizontalCenter: parent.horizontalCenter
          gradient: Gradient {
              GradientStop {
                  position: 0
                  color: "white"
              }

              GradientStop {
                  position: 1
                  color: "#c3c2c0"
              }
          }
          Text {

              font.bold: true
              anchors.fill: parent
                 font.family: "Piboto Condensed"
                   color: "#443c3c"
             text: qsTr("THR-S\n")+(incdec*1000+val0)
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             font.pointSize: rect0.width*0.07
          }

      }

}

  Canvas {
  id: canback22
  width: parent.width-5
  height: width
  anchors.centerIn: parent
  enabled: false

      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
          ctx.strokeStyle = "grey"
        ctx.lineWidth = rect0.width*0.05
          ctx.beginPath()
          var startAngle=40
          var endAngle = startAngle + 1* Math.PI / 5 * 7.8
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()
      }
  }
  Canvas {
      id: canvasin2
      width: parent.width-5
      height: width
      anchors.centerIn: parent
      enabled: false
      Connections {
          target: dial0
          //function onValueChanged() { canvasin2.requestPaint()}
      }



      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)

          ctx.strokeStyle = "#f4a259"    //yellow
          ctx.lineWidth = rect0.width*0.05
          ctx.beginPath()
          var startAngle = 40
          var endAngle=0
          if(incdec*1000+val0<=800)
          {
               endAngle= startAngle + ((incdec*1000+val0)*0.5)/800* Math.PI / 5 * 7.8
          }
              else
          {
              endAngle= startAngle + (800*0.5)/800* Math.PI / 5 * 7.8
             var i=(incdec*1000+val0)-800
              endAngle= endAngle + (i*0.5)/13200* Math.PI / 5 * 7.8

          }
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()
      }
  }
  Canvas{
      width: (rect0.width-rect0.width*0.05)-15
      height: width
      anchors.centerIn: parent
      enabled: false
      id:canvasin11
   onPaint: {
       var ctx = getContext("2d")
       ctx.clearRect(0, 0, width, height)
       ctx.lineWidth = rect0.width*0.05
       ctx.beginPath()
       var startAngle = 40
       var endAngle = 0
       var midAngle=180
       ctx.strokeStyle = "#C40B69"
       if(signal_get_value<=incdec*1000+val0&&is_Thresh_hold_Crossed)
       {
           if(is_validation_running)  //manual validation
           {
               which_item_status=which_item_status+1
               if(which_item_status==1)
               {
                   button_1.color="blue"
                   button_2.color="grey"
                   button_3.color="grey"
                   time_limit_count=9
               }
               else if(which_item_status==2)
               {
                   button_1.color="blue"
                   button_2.color="yellow"
                   button_3.color="grey"
                   time_limit_count=9
               }
               else if(which_item_status==3)
               {

                   button_1.color="blue"
                   button_2.color="yellow"
                   button_3.color="green"
                   time_limit_count=9
                   limit_timer.stop()
                   run.enabled=true
                   if(which_validation!="")
                   {
                        lib1.notify_to_qml_from_qml(which_validation+"Validation Done",false)
                       lib1.history("",which_validation,"Auto Validation Done")
                       which_validation=""
                   }
                   if(is_mannual_validation)
                   {
                        lib1.notify_to_qml_from_qml("Manual Validation Done ",false)
                       lib1.history("","","Manual Val done")
                       is_mannual_validation=false
                   }

                   footer_validate.visible=false
                   footer_validate.visible=false
                   footer.visible=true
                   footer.enabled=true
               }


               image.visible=false
                 metal_detected.visible=true
                  detect_timer.start()
           }
           else  //normal metal detection
           {
               lib1.notify_to_qml_from_qml("",false)
               image.visible=false
                 metal_detected.visible=true
                  detect_timer.start()
           }
           is_Thresh_hold_Crossed=false

           if(signal_get_value<=800)
           {
            endAngle= startAngle + (signal_get_value*0.5)/800* Math.PI / 5 * 7.8
           }
           else{
               if(signal_get_value>incdec*1000+val0)
               {
                   lib1.notify_to_qml_from_qml("Metal Detected",false)
                   is_Thresh_hold_Crossed=true
                    endAngle= startAngle + (800*0.5)/800* Math.PI / 5 * 7.8
                   var i=signal_get_value-800
                    endAngle= endAngle + (i*0.5)/13200* Math.PI / 5 * 7.8
        //       endAngle = startAngle+ (signal_get_value*0.5)/13200* Math.PI / 5 * 7.8
               }
               if(signal_get_value<=incdec*1000+val0)
               {



              endAngle = startAngle
               }
           }

       }
           else{
       if(signal_get_value>incdec*1000+val0)
       {
           lib1.notify_to_qml_from_qml("Metal Detected",false)
           is_Thresh_hold_Crossed=true
            endAngle= startAngle + (800*0.5)/800* Math.PI / 5 * 7.8
           var ii=signal_get_value-800
            endAngle= endAngle + (ii*0.5)/13200* Math.PI / 5 * 7.8
//       endAngle = startAngle+ (signal_get_value*0.5)/13200* Math.PI / 5 * 7.8
       }
       if(signal_get_value<=incdec*1000+val0)
       {
           if(is_Thresh_hold_Crossed)
           {
               lib1.notify_to_qml_from_qml("Metal Detected",false)
               image.visible=false
                 metal_detected.visible=true
                  detect_timer.start()
           }
           is_Thresh_hold_Crossed=false

      endAngle = startAngle
       }

       }
      ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
      ctx.stroke()


  }
  }

  Canvas {
  id: canvas2
  width: (rect0.width-rect0.width*0.05)-15
  height: width
  anchors.centerIn: parent
  enabled: false
      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
          ctx.strokeStyle = "green"
          ctx.lineWidth = rect0.width*0.05
          ctx.beginPath()
          var startAngle=40
          var endAngle=0

          if(signal_get_value>=incdec*1000+val0)    //incdec
          {
              if((incdec*1000+val0)<=800)
              {
                   endAngle= startAngle + ((incdec*1000+val0)*0.5)/800* Math.PI / 5 * 7.8
              }
              else{
                  endAngle= startAngle + (800*0.5)/800* Math.PI / 5 * 7.8
                 var i=(incdec*1000+val0)-800
                  endAngle= endAngle + (i*0.5)/13200* Math.PI / 5 * 7.8
              }
             }
      if(signal_get_value<incdec*1000+val0) //slider
      {

          if((signal_get_value)<=800)
          {
               endAngle= startAngle + (signal_get_value*0.5)/800* Math.PI / 5 * 7.8
          }
          else{
              endAngle= startAngle + (800*0.5)/800* Math.PI / 5 * 7.8
             var j=(signal_get_value)-800
              endAngle= endAngle + (j*0.5)/13200* Math.PI / 5 * 7.8
          }
      }
          endangleofI=endAngle
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()



      }


  }

}

Rectangle{
   id: rect1
   width: height
   height: rectangle.height*0.6
   radius: height/2
   color: "#202830"
   visible: true
   opacity: 0
   border.width: 0
   anchors.horizontalCenter: parent.horizontalCenter
   anchors.top: parent.top
   anchors.topMargin: 20
   smooth: true

  Behavior on opacity {

      NumberAnimation {
          target: rect1
          property: "opacity"
          duration: 800
          easing.type: Easing.InOutQuad
      }
  }


 Behavior on x {

     NumberAnimation {
         target: rect1
         property: "x"
         duration: 500

     }
 }

   Behavior on height {

       NumberAnimation {
           target: rect1
           property: "height"
           duration: 500


       }
   }
  MouseArea{
      id:m2
      anchors.fill: parent
      onClicked: {
        if(usertype_predict !=="")
          {
              column.string_value=""
                 tf.color="black"
              storage_satus=2
              column11.text="Machine Phase (MPHS)"
               min_text.text="Min:0.0"
              max_text.text="Max:180.0"
              rect.x=rectangle.width/2-rect.width/2
                 rect.visible=true
                 rect.enabled=true

          swipe.interactive=false

               }
//          else{
//            is_create_in_active=false
//      stack_B.push( finger_print_scan)
//          }
      }
  }

          Rectangle {
              id: id_speed
              border.width: 0
              property int numberIndexs: 19
              property int startAngle: 219
              property real angleLength: 15.58
              property int maxSpeed: 180

              anchors.centerIn: parent
              height: Math.min(parent.width, parent.height)
              width: height
              radius: width/2
              color: "white"



              Repeater {
                  model: id_speed.numberIndexs

                  Item {
                      id:rot
                      height: id_speed.height/2
                      transformOrigin: Item.Bottom
                      rotation: 280-index * id_speed.angleLength + id_speed.startAngle
                      x: id_speed.width/2


                      Rectangle {
                          id:re
                          height:5
                          width: height
                          radius: width/2
                           color: "#c40b69"
                          antialiasing: true
                          anchors.horizontalCenter: parent.horizontalCenter
                          anchors.top: parent.top
                          anchors.topMargin: id_speed.height * 0.03
                      }


                      Text {
                          anchors {
                              horizontalCenter: parent.horizontalCenter
                          }

                          x: 0
                             font.family: "Piboto Condensed"
                          y: id_speed.height * 0.09
                          color: "black"
                          rotation: 360-rot.rotation
                          text: index * 10
                         // rotation: 360 - (index * id_speed.angleLength + id_speed.startAngle)
//                           anchors.top: parent.top
//                           anchors.topMargin: -30
                          font.pixelSize: id_speed.height * 0.05

                      }
                  }
              }

          Rectangle{
              anchors.centerIn: parent
              width:parent.width*0.6
              height: width
              radius: width/2
              gradient: Gradient {
                  GradientStop {
                      position: 0
                      color: "white"
                  }

                  GradientStop {
                      position: 1
                      color: "#c3c2c0"
                  }
              }

                }

          Text{
              id: phaseText
  font.family: "Piboto Condensed"
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter
       color: "#443c3c"
       anchors.bottom:  parent.bottom
       font.bold: true
       anchors.horizontalCenter: parent.horizontalCenter
          text:"MPHS\n"+val1
   font.pointSize: rect1.width*0.07
       }
      }


  Image {
      id: name
      source: "qrc:/PNG/needle.png"
      width: parent.width/2
      height: width
      anchors.bottom: parent.Center
      anchors.horizontalCenter: parent.horizontalCenter
      rotation: ((phase_get_value*1.5555556)-138)*-1
      transformOrigin:Item.Bottom
      fillMode: Image.PreserveAspectFit
      ColorOverlay{
          anchors.fill: name
          source: name
          color: "grey"
          id:colorchange
      }

  }
  Rectangle{
      anchors.centerIn: parent
      width: parent.width/2
      height: width

      radius: width/2

border.width: 3
border.color: "#1488D5"     //"#c30b68"
Rectangle{
   anchors.centerIn: parent
   width:parent.width-15
   height: width
   radius: width/2
   color: "#6b6b6b"
   Text {
      id: element2
      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter
      font.pointSize: rect1.width*0.07
      font.bold: true
         font.family: "Piboto Condensed"
         color: "white"
          text:"PPHS\n"+phase_get_value

         anchors.centerIn: parent
     width:parent.width
     height:parent.height
   }
     }
anchors.horizontalCenter: parent.horizontalCenter
  }
}

Rectangle{
   id:rect2
   width: height
   height: la
   anchors.right: parent.right
   anchors.rightMargin: parent.width*0.04
   radius: height/2
   color: "#ffffff"
   gradient: Gradient {
       GradientStop {
           position: 0
           color: "#FCFCFC"
       }

       GradientStop {
           position: 1
           color: "#DDDDDE"
       }
   }


 Behavior on height {

     NumberAnimation {
         target: rect2
         property: "height"
         duration: 500

     }
 }

  MouseArea{
      id:m1
      enabled: true
      anchors.fill: parent
      onClicked: {
       if(usertype_predict !=="")
          {
              column.string_value=""
              tf.color="black"
              storage_satus=3
               column11.text="Threshold-Amp (THR-A)"
               min_text.text="Min:50"
              max_text.text="Max:14000"
           rect.x=rectangle.width-rect.width
              rect.visible=true
              rect.enabled=true
          swipe.interactive=false
          }
         // else{
//           is_create_in_active=false
//     stack_B.push( finger_print_scan)
       //   }


      }

  }


       Rectangle{
           anchors.centerIn: parent
           width:parent.width*0.9
           height:width
           radius: width/2
           border.width: 0

           Rectangle{
               id:inner_2
               width:parent.width*0.9
               height:width
               radius: width/2
               border.width: 0
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {
                    position: 0
                      color: "#c3c2c0"
                }

                GradientStop {
                    position: 1
                    color: "white"
                }

               }
           Text{
              id:text0_2
              y:parent.height/2-40
//                anchors.centerIn: parent
              anchors.horizontalCenter: parent.horizontalCenter
//                anchors.bottomMargin:10
              text:"AMPLITUDE\n"+amplitude_get_value
                 font.family: "Piboto Condensed"
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter
                font.bold: true
              color: val2>amplitude_get_value ?"green":"#c30b68"
              font.pointSize:rect2.width*0.07
           }
           }
           gradient: Gradient {
               GradientStop {
                   position: 0
                   color: "#FCFCFC"
               }

               GradientStop {
                   position: 1
                   color: "#DDDDDE"
               }

       }



      Rectangle{
          width:parent.width*0.4
          height: width
          radius: width/2
          anchors.bottom: parent.bottom
          anchors.horizontalCenter: parent.horizontalCenter
          gradient: Gradient {
              GradientStop {
                  position: 0
                  color: "white"
              }

              GradientStop {
                  position: 1
                  color: "#c3c2c0"
              }
          }
          Text {
            anchors.fill: parent
              font.bold: true
               color: "#443c3c"
                 font.family: "Piboto Condensed"
             text: qsTr("THR-A\n")+val2
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             font.pointSize: rect2.width*0.07
          }

      }
  }

  Canvas {
      id: canback2

width: parent.width-5
height: width
 anchors.centerIn: parent
  enabled: false

      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
          ctx.strokeStyle = "grey"
          ctx.lineWidth = rect2.width*0.05
          ctx.beginPath()
          var startAngle = 40
          var endAngle = startAngle + 1* Math.PI / 5 * 7.8
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()
      }
  }
  Canvas {
      id: canvasin

width: parent.width-5
height: width
  anchors.centerIn: parent
  enabled: false

      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
          ctx.strokeStyle = "#f4a259"
          ctx.lineWidth = rect2.width*0.05
          ctx.beginPath()
          var startAngle =40
          var endAngle = startAngle + (val2)/14000* Math.PI / 5 * 7.8
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()
      }
  }

  Canvas {
      id: canvas1

width: parent.width-(rect2.width*0.05)-15
height: width
  anchors.centerIn: parent
  enabled: false
//      Connections {
//          target: slider1
//          function onValueChanged() { canvas1.requestPaint()}
//      }

      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "#c30b68"
          if(amplitude_get_value>val2)
          {
          ctx.lineWidth = rect2.width*0.05
          ctx.beginPath()
          var startAngle = 40
          var endAngle = startAngle + (amplitude_get_value)/14000* Math.PI / 5 * 7.8
          ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
          ctx.stroke()
          }
      }
  }
  Canvas {
  id: canvasnew
width: parent.width-(rect2.width*0.05)-15
  height: width
     anchors.centerIn: parent
     enabled: false
      onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)
          ctx.strokeStyle = "green"
          ctx.lineWidth = rect0.width*0.05
          ctx.beginPath()
          var startAngle=0
          var endAngle=0

      if(amplitude_get_value<val2){
         startAngle = 40
          endAngle = startAngle + (amplitude_get_value)/14000* Math.PI / 5 * 7.8
      }
else{
         startAngle = 40
          endAngle = startAngle + (val2)/14000* Math.PI / 5 * 7.8
      }
      ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
      ctx.stroke()



      }
  }
}
//left circle
Rectangle{
   id:left_circle
   opacity:0
  x:parent.width*0.3
  anchors.bottom: parent.bottom
  anchors.bottomMargin: 30
   width:parent.width*0.12
   height: width
   radius: width/2

   Rectangle{
       width:parent.width*0.9
       height:width
       radius: width/2
    anchors.centerIn: parent
    gradient: Gradient {
        GradientStop {
            position: 0
              color: "#c3c2c0"
        }

        GradientStop {
            position: 1
            color: "white"
        }

}
    Canvas {
        id:can_green
 anchors.fill: parent
    enabled: false
    Text {
       anchors.centerIn: parent
       text: "Coil\n"+coil_output_get_value
         color: "#443c3c"
         font.family: "Piboto Condensed"
       verticalAlignment: Text.AlignVCenter
       horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pointSize: 12
    }

            onPaint: {
                var startAngle = 40
                 var ctx0 = getContext("2d")
                var ctx = getContext("2d")
                var ctx1 = getContext("2d")
                var ctx2 = getContext("2d")

                ctx0.lineWidth = 7
                ctx1.strokeStyle = "black"
                ctx1.lineWidth = 7
                ctx1.clearRect(0,0, width, height)
                ctx2.strokeStyle = "#c30b68"
                ctx2.lineWidth = 7
                ctx0.clearRect(0,0, width, height)
                ctx2.clearRect(0,0, width, height)

                            ctx.lineWidth = 7
                            ctx.clearRect(0,0, width, height)
                var endAngle10 = 0

                var endAngle11 =0
                 var endAngle12 =0
             ctx0.strokeStyle = "grey"
             ctx0.beginPath()
             ctx0.arc(width / 2, height / 2, width / 2 - ctx0.lineWidth / 2 - 2, startAngle, startAngle +  Math.PI / 5 * 7.8)
             ctx0.stroke()
                if(coil_output_get_value<=3000)
                {
                    ctx.strokeStyle = "green"
                    endAngle10 =startAngle + (coil_output_get_value/10000)* Math.PI / 5 * 7.8
                    ctx.beginPath()
                  ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle10)
                 ctx.stroke()
                }
                if(coil_output_get_value>3000&&coil_output_get_value<=6000)
                {
                 ctx.strokeStyle = "green"
                   endAngle10 =startAngle + (3000/10000)* Math.PI / 5 * 7.8
                    endAngle11 =startAngle+(coil_output_get_value/10000)* Math.PI/ 5 * 7.8
                                ctx.beginPath()
                             ctx.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, startAngle, endAngle10)
                            ctx.stroke()
                         ctx1.strokeStyle = "#f4a259"
                              ctx1.beginPath()
                             ctx1.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, endAngle10, endAngle11)
                            ctx1.stroke()
                }
                if(coil_output_get_value>6000){
                    ctx.strokeStyle = "green"
                      endAngle10 =startAngle + (3000/10000)* Math.PI / 5 * 7.8
                       endAngle11 =startAngle+(6000/10000)* Math.PI/ 5 * 7.8
                    endAngle12 =startAngle+(coil_output_get_value/10000)* Math.PI/ 5 * 7.8
                                   ctx.beginPath()
                                ctx.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, startAngle, endAngle10)
                               ctx.stroke()
                            ctx1.strokeStyle = "black"
                                 ctx1.beginPath()
                                ctx1.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, endAngle10, endAngle11)
                               ctx1.stroke()
                    ctx2.strokeStyle = "#c30b68"
                                           ctx2.beginPath()
                                           ctx2.arc(width / 2, height / 2, width / 2- ctx2.lineWidth / 2 - 2, endAngle11, endAngle12)
                                          ctx2.stroke()


                           }
                }
            }
        }
   gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }

   }

///  right circle
Rectangle{
   id:right_circle
   opacity:0
   x:parent.width-parent.width*0.3-width
  anchors.bottom: parent.bottom
  anchors.bottomMargin: 30
   width:parent.width*0.12
   height: width
   radius: width/2
   Rectangle{
       id:ddr_rect
       width:parent.width*0.9
       height:width
       radius: width/2
       border.color: tr?"green":"#c30b68"
       border.width: 5
    anchors.centerIn: parent





    gradient: Gradient {
        GradientStop {
            position: 0
              color: "#c3c2c0"
        }

        GradientStop {
            position: 1
            color: "white"
        }

}

   }
   gradient: Gradient {
       GradientStop {
           position: 0
           color: "#FCFCFC"
       }

       GradientStop {
           position: 1
           color: "#DDDDDE"
       }

   }

   Text {
       id:ddr_text
       font.bold: true
       anchors.centerIn: parent
       font.pointSize: 12
         font.family: "Piboto Condensed"
       text: tr?"DD\nON":"DD\nOFF"
   color: "#443c3c"
       verticalAlignment: Text.AlignVCenter
       horizontalAlignment: Text.AlignHCenter

   }
   MouseArea{
    anchors.fill: parent
    onDoubleClicked: {
        tr=!tr
    }

  }
}

Timer{
  id:phaseTimer
  running: false
  repeat: false
  interval:10
  onTriggered: {
      colorchange.color="grey"
  name.rotation=((val1*1.5555556)-138)*-1
  }
}

//Slider{
//    id:checking_lpc
//    from:0
//    to:180
//    value:0
//    stepSize: 1
//    onValueChanged: {

//    }
//}

Rectangle{
   id:rect
  width:parent.width*0.33
  height: parent.height
    color: "white"
    border.width: 0
   visible: false
   enabled: false
   MouseArea{
       anchors.fill: parent
   }
   Behavior on x{
ParallelAnimation{
       NumberAnimation {
           target: rect
           property: "x"
           duration: 500
           easing.type: Easing.InOutQuad
       }
       OpacityAnimator{
           target: rect
           from: 0
           to:1
           duration: 500
           easing.type: Easing.InOutQuad
       }
   }
   }
Rectangle{
   id:blue_rect
   width:parent.width-20
   height: 50
   radius: 5
   color: "lightblue"
   anchors.horizontalCenter: parent.horizontalCenter
   anchors.bottom:column.top
   anchors.margins: 10
   Text{
       id:tf
      anchors.centerIn: parent
        font.family: "Piboto Condensed"
              color: "black"
       text:column.string_value
       horizontalAlignment: Text.AlignHCenter
       font.bold: true
       font.pointSize: 18

   }
}
   Text {
       id:column11
       anchors.top: parent.top
       anchors.topMargin: 10
       color: "#1488D5"
       font.bold: true
         font.family: "Piboto Condensed"
       font.pointSize: 16
      anchors.horizontalCenter: parent.horizontalCenter
       text: qsTr("MPHS (Machine Phase)")
   }
   Text {
      id:min_text
      anchors.left: parent.left
 font.family: "Piboto Condensed"
      color: "grey"
      font.bold: true
      font.pointSize: 12
      anchors.margins: 10
      anchors.bottom: blue_rect.top
      text: qsTr("Min: 0.0")
   }
   Text {
       id:max_text
       anchors.right: parent.right
       anchors.bottom: blue_rect.top
 font.family: "Piboto Condensed"
       color: "grey"
       font.bold: true
       font.pointSize: 12
       anchors.margins: 10
       text: qsTr("Max: 180.0")
   }
  ColumnLayout {
      id: column
      width: rect.width-20
      height: rect.height/1.8
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
      anchors.margins: 10
      spacing: 7
      property int v: 40
      property string string_value: ""
      property int min_rect1:4
      RowLayout
      {
       Layout.fillHeight: true
       Layout.fillWidth: true
       spacing: 5
       Button{
           id:b1
       Layout.fillHeight: true
       Layout.fillWidth: true
       width:column.v
       height: 50
       text: "1"
       font.bold: true
       font.pointSize: 14

       onClicked:
       {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat("1")
       }
       }
       }
       Button
       {
           id:b2
       Layout.fillHeight: true
       Layout.fillWidth: true
       width:column.v
       height: 50
       text: "2"
       font.family: "Piboto Condensed"
       font.bold: true
       font.pointSize: 14
       onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat("2")
        }
       }
       }
       Button{
           id:b3
       Layout.fillHeight: true
       Layout.fillWidth: true
       width:column.v
       height:50
       text: "3"
       font.bold: true
       font.pointSize: 14
       font.family: "Piboto Condensed"


       onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat("3")
       }
       }
       }
       Button{
        id:bs
       Layout.fillHeight: true
       Layout.fillWidth: true
       width:column.v
       height: width
       text: "BS"
       font.bold: true
       font.pointSize: 14
       highlighted: false
       onClicked:
       {
       if(column.string_value.length>=0)
       {
       column.string_value=column.string_value.substring(0,column.string_value.length-1)
       }
       }
       }
       }
RowLayout
{
   spacing: 5
   Layout.fillHeight: true
Layout.fillWidth: true
Button{

   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "4"
   font.bold: true
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
     text: "5"
      font.family: "Piboto Condensed"
   font.bold: true
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "6"
   font.bold: true
      font.family: "Piboto Condensed"
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "CLR"
      font.family: "Piboto Condensed"
     highlighted: true
   font.bold: true
   font.pointSize: 14
   onClicked: {
     column.string_value=column.string_value.substring(0,0)
   }
}

}
RowLayout
{

   Layout.fillHeight: true
Layout.fillWidth: true

   spacing: 5
Button{
   width:column.v
   id:button_7
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "7"
   font.bold: true
      font.family: "Piboto Condensed"
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "8"
      font.family: "Piboto Condensed"
   font.bold: true
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
      font.family: "Piboto Condensed"
   text: "9"
   font.bold: true
   font.pointSize: 14
   onClicked: {
       if(column.string_value.length<=column.min_rect1)
       {
       column.string_value=column.string_value.concat(text)
   }
   }
}
Button{
   width:column.v
   Layout.fillHeight: true
Layout.fillWidth: true
   height: 50
   text: "ESC"
     highlighted: true
        font.family: "Piboto Condensed"
   font.bold: true
   font.pointSize: 14
   onClicked: {
       column.string_value=""
       rect.visible=false
       rect.enabled=false
       m2.enabled=true
       m2.visible=true
       rect1.visible=true
       rect1.opacity=1
   }
}

}
Row
{
height: button_7.height
width:column.width
spacing: 5
Button{

    width:button_7.width
    height: button_7.height
    text: "0"
    font.bold: true
       font.family: "Piboto Condensed"
    font.pointSize: 14
    onClicked: {
        if(column.string_value.length<=column.min_rect1)
        {
        column.string_value=column.string_value.concat(text)
    }
    }
}
Button{
    width:button_7.width
    height: button_7.height
    font.bold: true
    text: "."
       font.family: "Piboto Condensed"

    font.pointSize: 14
    onClicked: {
        if(column.string_value.length<=column.min_rect1)
        {
        column.string_value=column.string_value.concat(".")
    }
    }
}
Button{
    implicitWidth:2*button_7.width+spacing
    height: button_7.height
    text: "ENT"
       font.family: "Piboto Condensed"
      highlighted: true
    font.bold: true
    font.pointSize: 14
    onClicked: {
        lib1.keyboardData1(column.string_value)
    }
}
}

  }
}



}

