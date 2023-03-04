import QtQuick 2.9
import QtQuick.Window 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2

import QtGraphicalEffects 1.0
Rectangle{
    id:rect
    width: base_stackview.width
    height: base_stackview.height





    //###################################


    RowLayout{
        height: parent.height*0.80
        anchors.centerIn: parent
        width: parent.width-80
        spacing: 20
        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Rectangle{
                id:id_s
                Layout.fillHeight: true
                Layout.fillWidth: true
                   border.color: "red"
                   border.width: 0
                radius: 5


                    Rectangle {
                        id: id_speed

                        border.width: 0
                        x: 0
                        property int startAngle: 90
                        property real angleLength:5

                       height: parent.height
                        radius: width/2
                        color: "white"
                        ColumnLayout
                        {
                            anchors.verticalCenter: parent.verticalCenter
                            x:0
                            spacing: 4
                            Text {
                                font.pointSize:18
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:phase_Get_value.toString().indexOf(".")===-1?phase_Get_value.toString()+".0":phase_Get_value

                            }
                            Text {
                                font.pointSize:14
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: baseBlueColor
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"P-Phase"
                            }
                            Rectangle{
                                color: "#0079FF"
                                Layout.fillWidth: true
                                height: 2
                            }

                            Text {
                                font.pointSize:18
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:phase_Set_value.toString().indexOf(".")===-1?phase_Set_value.toString()+".0":phase_Set_value
                            }
                            Text {
                                font.pointSize:14
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: baseBlueColor
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"M-Phase"
                            }
                        }
                        Item {
                            id:rrr
                            y: id_speed.height * 0.09+8
                            height: id_speed.height/2-y
                            transformOrigin: Item.Bottom
                            rotation: phase_Set_value
                            x: id_speed.width/2
                            Image {
                                id: name
                                source: "qrc:/SVG/Triangle.svg"
                                height:20
                                width: 10
                                antialiasing: true
                                sourceSize.width:width
                                sourceSize.height: height
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                anchors.topMargin: id_speed.height * 0.03
                            }
                        }
                        Item {

                            height: id_speed.height/2
                            transformOrigin: Item.Bottom
                            rotation: phase_Get_value
                            x: id_speed.width/2
                            Rectangle {

                                height:16
                                width: 8

                                color: "yellow"
                                antialiasing: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                anchors.topMargin: id_speed.height * 0.03
                            }
                        }


                        Repeater {
                            x:0
                            model: 37
                            Item {
                                id:rot
                                height:Math.min(id_s.height/2,id_s.width)
                                y:(parent.height/2-height)
                                transformOrigin: Item.Bottom
                                rotation: 270+index * id_speed.angleLength + id_speed.startAngle
                                x: 0
                                Rectangle {
                                    id:re
                                    height:index%2==0?10:7
                                    width: 2

                                    radius: width/1
                                    color: "black"
                                    antialiasing: true
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.top: parent.top
                                    anchors.topMargin: id_speed.height * 0.03
                                }


                                Text {
                                    anchors {
                                        horizontalCenter: parent.horizontalCenter
                                    }
                                    visible: index%2==0?true:false
                                    x: 0

                                    y: id_speed.height * 0.09
                                    color: "black"
                                    rotation: 360-rot.rotation
                                    text: index * 5

                                    //rotation: 360 - (index * id_speed.angleLength + id_speed.startAngle)
                                    //                           anchors.top: parent.top
                                    //                           anchors.topMargin: -30
                                    //font.pixelSize: id_speed.height * 0.07

                                }


                            }
                        }



                    }



                }

         }


        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true

                radius: 5
                Rectangle{
                    width:Math.min(parent.height,parent.width)
                    height: width
                    anchors.centerIn: parent
                    radius: 10
                    border.color: admin_purple_color
                    border.width: 0

                    Image{
                        id:butterfly_signal
                        anchors.fill: parent
                        sourceSize.width: height
                         fillMode: Image.PreserveAspectFit
                        sourceSize.height: height
                        source: "qrc:/SVG/Screen2/Group 602.svg"
                        smooth: true
                        visible: false
                    }
                    DropShadow {
                        anchors.fill: butterfly_signal
                        horizontalOffset: 5
                        verticalOffset: 5
                        radius: 6.0
                        samples: 12
                        color: "#60000000"
                        source: butterfly_signal
                        Item {
                            id: root

                            anchors.fill: parent

                            property int size: parent.width               // The size of the circle in pixel
                            property real arcBegin: 0            // start arc angle in degree
                            property real arcEnd_set_signal: (signal_Set_value/14000)*360          // end arc angle in degree
                            property real arcEnd_get_signal: (signal_Get_value/14000)*360
                            property bool showBackground: true  // a full circle as a background of the arc
                            property real lineWidth: width/15          // width of the line
                            property string getColor_outer: "#785FDB"
                            property string setColor_inner: "#FF98AA"



                            property int animationDuration: 150

                            onArcEnd_set_signalChanged: {
                                set_signal_canvas.requestPaint()
                                get_signal_canvas.requestPaint()
                            }
                            onArcEnd_get_signalChanged:{
                                set_signal_canvas.requestPaint()
                                get_signal_canvas.requestPaint()
                            }


                            Behavior on arcEnd_set_signal {
                                id: animationArcEnd_set_signal
                                enabled: true
                                NumberAnimation {
                                    duration: root.animationDuration
                                    easing.type: Easing.InOutCubic
                                }
                            }
                            Behavior on arcEnd_set_signal {
                                id: animationArcEnd_get_signal
                                enabled: true
                                NumberAnimation {
                                    duration: root.animationDuration
                                    easing.type: Easing.InOutCubic
                                }
                            }

                            Canvas {
                                id: set_signal_canvas
                                width: parent.width
                                height: parent.height
                                anchors.centerIn: parent
                                rotation: -90
                                onPaint: {
                                    var ctx = getContext("2d")
                                    var x = width / 2
                                    var y = height / 2
                                    var start = Math.PI * (parent.arcBegin / 180)
                                    var end = Math.PI * (parent.arcEnd_get_signal / 180)
                                    ctx.reset()
                                    ctx.beginPath();
                                    ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, start, end, false)
                                    ctx.lineCap = "round"
                                    ctx.lineWidth = root.lineWidth
                                    ctx.strokeStyle = root.setColor_inner
                                    ctx.stroke()
                                }

                            }
                            Canvas {
                                id: get_signal_canvas
                                width: parent.width-parent.lineWidth*2
                                height: parent.height-parent.lineWidth*2
                                anchors.centerIn: parent
                                rotation: -90
                                onPaint: {
                                    var ctx = getContext("2d")
                                    var x = width / 2
                                    var y = height / 2
                                    var start = Math.PI * (parent.arcBegin / 180)
                                    var end = Math.PI * (parent.arcEnd_set_signal/ 180)
                                    ctx.reset()
                                    ctx.beginPath();
                                    ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, start, end, false)
                                    ctx.lineCap = "round"
                                    ctx.lineWidth = root.lineWidth
                                    ctx.strokeStyle = root.getColor_outer
                                    ctx.stroke()
                                }

                            }
                        }
                        ColumnLayout
                        {
                            anchors.centerIn: parent
                            spacing: 3
                            Text {
                                font.pointSize:14
                                font.weight: Font.DemiBold
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:signal_Get_value


                            }
                            Text {
                                font.pointSize:14
                                color: baseBlueColor
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"Signal"
                            }
                            Rectangle{
                                color: "#0079FF"
                                Layout.fillWidth: true
                                height: 2
                            }

                            Text {
                                font.pointSize:14
                                font.weight: Font.DemiBold
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:signal_Set_value
                            }
                            Text {
                                font.pointSize:14
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: baseBlueColor
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"Thr-S"
                            }
                        }
                    }


                }
            }



        }





        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true

                radius: 5
                Rectangle{
                    width:Math.min(parent.height,parent.width)
                    height: width
                    anchors.centerIn: parent
                    radius: 10
                    border.color: admin_purple_color
                    border.width: 0

                    Image{
                        id:butterfly_amp
                        anchors.fill: parent
                        sourceSize.width: height
                         fillMode: Image.PreserveAspectFit
                        sourceSize.height: height
                        source: "qrc:/SVG/Screen2/Group 602.svg"
                        smooth: true
                        visible: false
                    }
                    DropShadow {
                        anchors.fill: butterfly_amp
                        horizontalOffset: 5
                        verticalOffset: 5
                        radius: 6.0
                        samples: 12
                        color: "#60000000"
                        source: butterfly_amp
                        Item {
                            id: root_amp
                            anchors.fill: parent
                            property real arcBegin: 0            // start arc angle in degree
                            property real arcEnd_set_amplitude: (amplitude_Set_value/14000)*360          // end arc angle in degree
                            property real arcEnd_get_amplitude:(amplitude_Get_value/14000)*360
                            property bool showBackground: true  // a full circle as a background of the arc
                            property real lineWidth: width/15         // width of the line
                            property int animationDuration: 150
                            property string getColor_outer: "#785FDB"
                            property string setColor_inner: "#FF98AA"
                            onArcEnd_set_amplitudeChanged: {

                                set_amplitude_canvas.requestPaint()
                                get_amplitude_canvas.requestPaint()
                            }
                            onArcEnd_get_amplitudeChanged:{

                                set_amplitude_canvas.requestPaint()
                                get_amplitude_canvas.requestPaint()
                            }
                            Behavior on arcEnd_set_amplitude {
                                id: animationArcEnd_set_amp
                                enabled: true
                                NumberAnimation {
                                    duration: root_amp.animationDuration
                                    easing.type: Easing.InOutCubic
                                }
                            }
                            Behavior on arcEnd_set_amplitude {
                                id: animationArcEnd_get_amp
                                enabled: true
                                NumberAnimation {
                                    duration: root_amp.animationDuration
                                    easing.type: Easing.InOutCubic
                                }
                            }

                            Canvas {
                                id: set_amplitude_canvas
                                width: parent.width-parent.lineWidth*3.5
                                height: parent.height-parent.lineWidth*3.5
                                anchors.centerIn: parent
                                rotation: -90
                                onPaint: {
                                    var ctx = getContext("2d")
                                    var x = width / 2
                                    var y = height / 2
                                    var start = Math.PI * (parent.arcBegin / 180)
                                    var end = Math.PI * (parent.arcEnd_set_amplitude/ 180)
                                    ctx.reset()
                                    ctx.beginPath();
                                    ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, start, end, false)
                                    ctx.lineCap = "round"
                                    ctx.lineWidth = root_amp.lineWidth
                                    ctx.strokeStyle = root_amp.setColor_inner
                                    ctx.stroke()
                                }

                            }
                            Canvas {
                                id: get_amplitude_canvas
                                width: parent.width-parent.lineWidth*1.5
                                height: parent.height-parent.lineWidth*1.5
                                anchors.centerIn: parent
                                rotation: -90
                                onPaint: {
                                    var ctx = getContext("2d")
                                    var x = width / 2
                                    var y = height / 2
                                    var start = Math.PI * (parent.arcBegin / 180)
                                    var end = Math.PI * (parent.arcEnd_get_amplitude / 180)
                                    ctx.reset()
                                    ctx.beginPath();
                                    ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, start, end, false)
                                    ctx.lineCap = "round"
                                    ctx.lineWidth = root_amp.lineWidth
                                    ctx.strokeStyle = root_amp.getColor_outer
                                    ctx.stroke()
                                }

                            }
                            ColumnLayout
                            {
                                anchors.centerIn: parent
                                spacing: 3
                                Text {
                                    font.pointSize:14
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text:amplitude_Get_value
                                    font.weight: Font.DemiBold
                                }
                                Text {
                                    font.pointSize:14
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: baseBlueColor
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text:"Amplitude"
                                }
                                Rectangle{
                                    color: "#0079FF"
                                    Layout.fillWidth: true
                                    height: 2
                                }

                                Text {
                                    font.pointSize:14
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text:amplitude_Set_value
                                    font.weight: Font.DemiBold
                                }
                                Text {
                                    font.pointSize:14
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: baseBlueColor
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text:"Thr-A"
                                }
                            }


                        }

                    }

                }
            }



        }
  }

    Slider{
        id:slider
        width:200
        height: 30
        from: 0
        value: 1000
        anchors.left: parent.left
        to:14000
        onValueChanged: {
            signal_Set_value=value
            signal_Get_value=value
            amplitude_Set_value=value
            amplitude_Get_value=value
            coil_output =value
            cp_ca.requestPaint()
            phase_Get_value=((value/14000)*180).toFixed(1)
            phase_Set_value=((value/14000)*180).toFixed(1)
        }

    }

    Rectangle {
        width: 150
        height: 35
        y: 20
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 20
        border.color: baseBlueColor
        border.width: 1
        Text {
            anchors.centerIn: parent
            text: qsTr("Validation")
            color: baseBlueColor
            font.pointSize: 18
        }

    }
    Rectangle{
        id:coil_output_rectangle
        width:butterfly_amp.width-20
        height: 23
        anchors.topMargin: 20
        anchors.top: parent.top
        anchors.right: parent.right
          anchors.rightMargin: 40
        x:butterfly_amp.x
        border.width: 3
        radius:8
        Canvas
        {
            x:2
            y:2
             width: coil_output*(parent.width-4)/14000
            id:cp_ca
            height: 18
            property string getGreen: "#007500"
            onPaint: {
                var context = getContext("2d")
                var gradient = context.createLinearGradient(0, 0, 170, 0);


                context.lineCap = "round"
                context.beginPath();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineWidth = 50;
                context.fillStyle = "green"
                        if(coil_output>=10000)
                        {
                            gradient.addColorStop(0, "#007500")
                             gradient.addColorStop(0.6, "yellow")
                         gradient.addColorStop(1, "red")

                        }
                        else if(coil_output>=7000&&coil_output<10000)
                        {
                            gradient.addColorStop(0, "#007500")
                             gradient.addColorStop(0.6, "yellow")

                        }
                        else
                        {
                            gradient.addColorStop(0, "#007500")
                            gradient.addColorStop(1, "#007500")

                        }
context.strokeStyle = gradient;
                context.stroke();


            }
            Rectangle{
                height:29
                width:3
                radius: 1


                color: "black"
                x:cp_ca.width
                y:-5
            }


        }


    }
    Text{
        anchors.top: coil_output_rectangle.bottom
        width: coil_output_rectangle.width
        x:coil_output_rectangle.x
        topPadding: 10

        text:coil_output
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: s003_font_size_small
    }
}








