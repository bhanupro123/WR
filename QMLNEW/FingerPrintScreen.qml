import QtQuick 2.9
import QtQuick.Window 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
Rectangle{
    id:rect_fp
    width: base_stackview.width
    height: base_stackview.height
    property bool is_scanning : false

    Text{
        text: ""
    }

 Rectangle{
      id:finger_rect
        width: Math.min(parent.height,parent.width)*0.3
         height: width
         anchors.verticalCenter: parent.verticalCenter
         anchors.left: parent.left
         anchors.leftMargin: 20
         border.color: baseBlueColor
         border.width: 2
         radius: 10
    Image {

       anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        sourceSize.width: width
        sourceSize.height: width
        source: "qrc:/SVG/select profile/finger print.svg"
    }
    Rectangle{
         y:0
         id:scan_mode_shadow
        color: finger_shadow_color
        width: parent.width+10
        height:2
        visible: false


    }
    DropShadow {
           id: rectShadow
           width:parent.width+10
           height:parent.height*0.3
           cached: true
           anchors.horizontalCenter: parent.horizontalCenter
           horizontalOffset: 0
           verticalOffset: 6
           radius: 18.0
           samples: 100
           color: "#7085FFFF"
           smooth: true
           source: scan_mode_shadow
           PropertyAnimation on y{
               id:anim_finger_scan
               running: true

              loops: Animation.Infinite
               from:0
               to:100
               duration: 1000
           }
       }

}
}
