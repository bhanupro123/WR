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

Image {
       id: bug
       source:button.down? "qrc:/SVG/Screen 1/Red_image.png":"qrc:/SVG/Screen 1/BlueDots.png"
       sourceSize: Qt.size(parent.width, parent.height)
       smooth: true
         fillMode: Image.PreserveAspectFit
       visible: false
       onSourceChanged: {
           is_metel_detected=!is_metel_detected
           anim.start()
       }

   }

FastBlur {
    id:fastblur
        anchors.fill: bug
        source: bug
        radius: 32

               states: State {
                       name: "mouse-over"; when:fastblur.source
                       PropertyChanges { target: fastblur; scale: 0.8; opacity: 0}
                       PropertyChanges { target: fastblur; scale: 0.8; opacity: 1}
                   }
               transitions: Transition {
                       NumberAnimation { properties: "scale, opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
                   }
    }

Text {
   font.pointSize: font_size_s001
   font.weight: Font.DemiBold

   y: 20
   x: 40

    text: qsTr("Metal Detection")

}
Text {
    font.pointSize: font_size_s001
    font.weight: Font.DemiBold

   anchors.bottomMargin: 60
   anchors.leftMargin: 40

   anchors.bottom: parent.bottom
    x: 40
    text: "Batch No: "+batch_no
}
Text {
    font.pointSize: font_size_s001
    font.weight: Font.DemiBold

   anchors.rightMargin: 40
    anchors.bottomMargin: 60
   anchors.right: parent.right
   anchors.bottom: parent.bottom

    text: "Reject Count Since M/c ON : "+reject_Count_Since_ON
}


Text {
    id: logo_metal_detect
    anchors.centerIn: parent
    visible: is_metel_detected?false:true
    font.pointSize: 30
    color: baseBlueColor
    font.weight: Font.DemiBold
    text: qsTr("WinRender Systems LLP")
}
RowLayout{
     spacing: 10
     visible: is_metel_detected?true:false
    anchors.centerIn: parent
    Text {

        font.pointSize: 30
        font.weight: Font.DemiBold
        text: qsTr("Metal")
    }
    Text {

        font.pointSize: 30
        font.weight: Font.DemiBold
        text: qsTr("Detected")
        color: "red"
    }
}

ParallelAnimation{
    id:anim
    ScaleAnimator {
        target: fastblur
        from: 0
        to:0.8
        duration: 300
        easing.type: Easing.InOutQuad
    }
    OpacityAnimator {
        target: fastblur
        from: 0
        to:1
        duration: 300
        easing.type: Easing.InOutQuad
    }

}

Button{
    id:button
 width: 100
 height: 40
 text: "test"
  opacity: 0
}
    }









