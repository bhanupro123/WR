import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
Rectangle{
    width: base_stackview.width
    height: base_stackview.height
SwipeView
{
    id:swipe_dashboard_base
anchors.fill: parent
S001{}
S002{}
S003{}
//S004{}
}
RowLayout{
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 10
    spacing: 25
 anchors.horizontalCenter: parent.horizontalCenter
 Image {
     width: image_icon_height
     height: image_icon_height
     fillMode: Image.PreserveAspectFit
     sourceSize.width: image_icon_height
     sourceSize.height: image_icon_height
      rotation: 90
     source: "qrc:/SVG/SwipeLeft.svg"
        MouseArea{
            anchors.fill: parent
            enabled: swipe_dashboard_base.currentIndex>0?true:false
            onClicked: {
                if(swipe_dashboard_base.currentIndex==0)
                {
                    swipe_dashboard_base.currentIndex=swipe_dashboard_base.count-1
                }
                else{
                    swipe_dashboard_base.currentIndex=swipe_dashboard_base.currentIndex-1
                }
            }
        }
    }
    PageIndicator {
            id: control
            count:swipe_dashboard_base.count
            currentIndex: swipe_dashboard_base.currentIndex
            delegate: Rectangle {
                implicitWidth: 15
                implicitHeight:width
                radius: width / 2
                color: index === control.currentIndex ?baseBlueColor :"white"
                border.width: 2
                border.color: baseBlueColor
               // opacity: index === control.currentIndex ? 0.95 : pressed ? 0.7 : 0.35

            }
    }
    Image {
        width: image_icon_height

         height: image_icon_height
         fillMode: Image.PreserveAspectFit
         rotation: 270
         source: "qrc:/SVG/SwipeLeft.svg"
         sourceSize.width: image_icon_height
         sourceSize.height: image_icon_height
         MouseArea{
             anchors.fill: parent
             onClicked: {
                 if(swipe_dashboard_base.currentIndex==swipe_dashboard_base.count-1)
                 {
                     swipe_dashboard_base.currentIndex=0
                 }
                 else{
                     swipe_dashboard_base.currentIndex=swipe_dashboard_base.currentIndex+1
                 }
             }
         }
    }
}



}
