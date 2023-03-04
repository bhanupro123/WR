import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import QtQuick.VirtualKeyboard 2.1
import QtQuick.Controls 2.2
ApplicationWindow {
    id: base
    width: 800
    height: 480
    minimumHeight: 480
    minimumWidth: 800
    // flags: Qt.FramelessWindowHint
    visible: true
    color: "yellow"

    //C_int
     property int coil_output:0

    property int header_height : 0
    property int image_icon_height : 13
    property int reject_Count_Since_ON: 0

    property int signal_Get_value : 0
    property int signal_Set_value: 0
    property int font_size_s001: 18

    property int amplitude_Get_value : 0
    property int amplitude_Set_value: 0

    property int s003_font_size: 18
    property int s003_font_size_medium: 15
    property int s003_font_size_small: 13
    property int time_out_value: 180
    property int s001_font_size: 13
    property int s001_font_size_10: 10
    property real phase_Get_value : 0
    property real phase_Set_value: 0

    property int dD_Power:0   //0 to 100
    property real dD_Frequency:20.0    //20.0 to 80.0
    property real dD_Power_Factor:10.0  //10.0 to 40.0
    property int analog_gain:  0           //0 to 10
    property real digital_gain:0.1           //0.1 to 9.9
    //1-50
    property int lPF1:0
    property int lPF2:0
    property int hPF1:0
    property int hPF2:0


    property int operate_delay:0   //0-20,000
    property int hold_delay:0       //100-20,000
    property int relay_delay:0


    //C_boolean

    property bool is_metel_detected: true
    property bool dd_on_off_status:false
    //C_string

    //library
    property string product_code: "1234"
    property string product_name : "abcdefghijklmnopqrstuvwxyz"
    property string batch_no : "123456"
    property string product_gr_no : "01"
    property string product_sr_no : "001"

    //user
    property string currunt_user : "Bhanuprasad-In"
    property string notification_msg : "notification_msg"
    //C_Color
    property color white_color:"white"
    property color secondarybaseBlueColor :"#0079FF"
    property color baseBlueColor :"#2F48BC"
    property color admin_purple_color :"#6C47FF"
    property color supervisor_yellow_color :"#EEA620"
    property color operator_green_color :"#1C4B3B"
     property color grey_text :"#5A5A5A"
      property color finger_shadow_color :"#85FFFF"

    property color apply_blur_effect :"#50FFFFFF"

    //C_Component

    property Component welcome:Welcome{}
    property Component welcome_scrren2:WelcomeScreen2{}
    property Component dashboard:DashBoard_Swipe{}
    property Component select_user_type:SelectUserType{}
property Component login_qml: Login{}

    property Component finger_print_screen: FingerPrintScreen{}

    //select user type

    property int selected_user_type_SlectUserType:3
    property bool is_popup_opened: false
    property string selected_current_user_from_select_profile: ""

    //C_Timer
    Timer{
        id:welcome_timer
        running: true
        repeat: false
        interval: 2000
        onTriggered: {
            base_stackview.push(welcome_scrren2)
        }
    }
    Timer{
        id:timer_time_out_value
        running: false
        repeat: false
        interval: 1000
        onTriggered: {
            time_out_value =time_out_value-1
            timer_time_out_value.restart()
            if(time_out_value==0)
            {
                timer_time_out_value.stop()
                // bhanu.logout(false)
            }
            canvas_time.requestPaint()
        }
    }


    //
    header: Rectangle{
        height: header_height
        width: parent.width
        enabled: is_popup_opened?false:true
        color: baseBlueColor

        RowLayout{
            anchors.centerIn: parent
            width:parent.width-40
            height: parent.height
            spacing: 20
            Image {
                width:header_height
                height: header_height
                enabled: base_stackview.depth>3?true:false
                visible:  base_stackview.depth>3?true:false
                fillMode: Image.PreserveAspectFit
                sourceSize.width:header_height/2
                sourceSize.height: header_height/2-10
                smooth: true
                source: "qrc:/SVG/Back_button.svg"
                MouseArea{
                    width:header_height
                    height: header_height
                    onClicked: {
                        base_stackview.pop()
                    }
                }
            }
            Text{
                color: "white"
                font.pointSize: s001_font_size
                height: header_height
                enabled: base_stackview.depth>3?true:false
                visible:  base_stackview.depth>3?true:false
                text: "HOME"
                font.weight: Font.DemiBold
            }
            Text{
                color: "white"
                font.pointSize: s001_font_size
                height: header_height
                enabled: base_stackview.depth<=3?true:false
                visible:  base_stackview.depth<=3?true:false
                text: "A-P :01:001"
                font.weight: Font.DemiBold
            }
            Image {
                width:header_height
                height: header_height
                fillMode: Image.PreserveAspectFit
                sourceSize.width:header_height/2
                sourceSize.height: header_height/2
                smooth: true
                source: "qrc:/SVG/Notification_White.svg"
            }
            ColumnLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text{

                    Layout.fillWidth: true
                    color: "white"
                    font.pointSize: s001_font_size
                    text: notification_msg +base.width+" X "+base.height+"_"+base_stackview.depth
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                Rectangle{
                    Layout.fillWidth: true
                    height: 1

                }
            }
            RowLayout{
                spacing: 5
                Image {
                    width:header_height
                    height: header_height
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width:header_height/2
                    sourceSize.height: header_height/2
                    smooth: true
                    source: "qrc:/SVG/Contacts icon.svg"
                }
                Text{
                    color: "white"
                    font.pointSize: s001_font_size
                    text: currunt_user
                    font.weight: Font.DemiBold
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                MouseArea{
                   height: parent.height
                   width: parent.width
                    onClicked: {
                        base_stackview.push(select_user_type)
                    }
                }


            }


            Canvas {
                id: canvas_time
                implicitHeight: header_height
                implicitWidth: header_height

                Text {
                    color: "white"
                    font.pointSize: 10

                    text:time_out_value
                    font.weight: Font.DemiBold
                    anchors.centerIn: parent

                }



                onPaint: {

                    var ctx = getContext("2d")
                    ctx.clearRect(0,0, width, height)
                    ctx.strokeStyle =  "white"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 2.5
                    var endAngle = startAngle + time_out_value/180 * Math.PI / 5 * 10.5
                    ctx.arc(width / 2, height / 2, width / 2- ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }





        }


    }
    StackView{
        id:base_stackview
        width:parent.width
        height: parent.height
        initialItem:welcome
    }
    property var keyboardLayout: inputPanel.keyboard.layout
    function findChildByProperty(parent, propertyName, propertyValue, compareCb) {
        var obj = null
        if (parent === null)
            return null
        var children = parent.children
        for (var i = 0; i < children.length; i++) {
            obj = children[i]

            if (obj.hasOwnProperty(propertyName)) {
                if (compareCb !== null) {
                    if (compareCb(obj[propertyName], propertyValue))
                        break
                } else if (obj[propertyName] === propertyValue) {
                    break
                }
            }
            obj = findChildByProperty(obj, propertyName, propertyValue,
                                      compareCb)
            if (obj)
                break
        }
        return obj
    }
    function disableKey(parent, objectText) {
        var obj = null
        if (parent === null)
            return null
        var children = parent.children
        for (var i = 0; i < children.length; i++) {

            obj = children[i]
            if (obj.text === objectText) {

                obj.enabled = false
                //                  obj.visible = false
            }
            obj = disableKey(obj, objectText)
            if (obj)
                break
        }
        return obj
    }


    InputPanel {
        id: inputPanel
        z: 99
        y: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        onYChanged: {
            disableKey(inputPanel.keyboard, ":-)")
            disableKey(inputPanel.keyboard, " ")
            var ChangeLanguageKey = findChildByProperty(inputPanel.keyboard,
                                                        "objectName",
                                                        "changeLanguageKey",
                                                        null)
            if (ChangeLanguageKey) {
                ChangeLanguageKey.enabled = false
                ChangeLanguageKey.visible = false
            }
        }

        states: State {
            name: "visible"
            onCompleted: {

            }
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: parent.height - inputPanel.height + 30
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 400
                    easing.type: Easing.InOutBack
                }
            }
        }
    }


}
