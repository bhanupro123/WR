import QtQuick 2.9
import QtQuick.Window 2.2
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
Rectangle{
    id:rect_fp
    width: stack_B.width
    height: stack_B.height
    property bool is_scanning : true
    Button{
        enabled: is_scanning?false:status_score?false:true
        visible: is_scanning?false:status_score?false:true

        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom

        text: "Try Again !"
        width:100
        height:40
        onClicked: {
            is_scanning=true
            status_of_score.text=""
            anim_finger_scan.restart()
            get_in_scan_mode_timer.restart()

        }
    }

    Timer
    {
        id:get_in_scan_mode_timer
        running: true
        repeat: false
        interval: 1000
        onTriggered: {
            is_scanning=true
            if(is_create_in_active)
            {
                bhanu.detect1()
            }
            else{
                bhanu.getscore()
            }


        }
    }
    property bool status_score: false
    Connections{
        target: bhanu
        onFinger_got_score:{
            console.log(type_of_status," Statussss")
            is_scanning=false
            anim_finger_scan.stop()
            if(type_of_status==2)
            {
                status_score=status_of_finger
                status_of_score.text=finger_got_score
                type_of_text_status.text="Successfully Created"
                show_status_of_action.open()
            }
            else if(type_of_status==1){
                status_score=status_of_finger
                status_of_score.text=finger_got_score
                type_of_text_status.text="Successfully Logined"
               show_status_of_action.open()
            }
            else{
                status_score=status_of_finger
                status_of_score.text=finger_got_score
            }
        }
    }
    Text {
        font.pointSize: 18
        anchors.bottom: parent.bottom
        visible: is_scanning?true:false
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: baseBlueColor
        text: "Place Your Finger on Scanner"
    }

    Text{
        id:status_of_score
        text: ""
        y:20
        color: status_score?baseBlueColor:"red"
        anchors.horizontalCenter: parent.horizontalCenter

    }

    Rectangle{
        id:finger_rect
        width: Math.min(parent.height,parent.width)*0.3
        height: width
        anchors.centerIn: parent
        border.color: baseBlueColor
        border.width: 2
        radius: 10
        Image {

            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            sourceSize.height: width
            source: is_scanning? "qrc:/SVG/select profile/finger print.svg":status_score?"qrc:/SVG/select profile/fp_green.svg":"qrc:/SVG/select profile/red_fp.svg"
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
            color: "#9085FFFF"
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
    Popup{
        id:show_status_of_action
        width:parent.width
        height:parent.height
        padding: 0
        onOpened: {
            is_popup_opened=true
        }
        onClosed: {
            is_popup_opened=false
            stack_B.pop()
        }

        Text {
            id:type_of_text_status
            anchors.centerIn: parent
            text: "bhanuuuuuuuuuuuuuuuu"
            color: "green"
            font.pointSize: 18
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                show_status_of_action.close()
            }
        }
    }
}
