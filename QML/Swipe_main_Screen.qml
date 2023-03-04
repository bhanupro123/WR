import QtQuick 2.0
import QtQuick.Controls 2.0
Rectangle{
    width: stack_B.width
    height: stack_B.height
    SwipeView{

anchors.fill: parent
        currentIndex: 0

        id:swipe
              S1{}
              DD_on_off{}
              LastDefectValues{}
            BrightnessandVolume{}
}
PageIndicator {
        id: control
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 2
        width: 72
        height: 18
        count:swipe.count
        currentIndex: swipe.currentIndex
        anchors.horizontalCenter: parent.horizontalCenter
        delegate: Rectangle {
            implicitWidth: 10
            implicitHeight:width
            radius: width / 2
            color: "white"
            border.width: 0
            border.color: "black"
            opacity: index === control.currentIndex ? 0.95 : pressed ? 0.7 : 0.35

        }

}
}
