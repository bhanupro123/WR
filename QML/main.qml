import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.VirtualKeyboard 2.1
import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    color: "#202830"

 //   visibility: "Maximized"
    width: 800
    height: 480
    //flags: Qt.FramelessWindowHint
    title: qsTr("Hello World")
    property int lPF_1: 0
    property int lPF_2: 0
    property int hPF_1: 0
    property int hPF_2: 0
    property int operate_delay_value: 0
    property int hold_delay_value: 0
    property real digital_gain_value: 0
     property real analog_gain_value: 0
    //property int temp: 5

    property string function_name: ""
    property real placeHolder_Value: 0
    property int mousevalue: 0
    property string time_store: ""
        property int time_limit_count:9
    property bool is_validation_running : false
    property int val: 0
 property bool is_mannual_validation: false
 property int  initali: 0
 property bool notify_status2: true
 property string which_validation: ""
    property string where_i_am: ""
        property string username_predict: ""
        property string usertype_predict: ""
    property int reject_count_since_power_ON:0
    property int five_minut_reject_count : 0
    property int click_count: 0
        property bool tr:  false
    property int which_item_status: 0
    property string total_reject_count_since_power_ON:"Total Reject Count Since Power ON: "
    property bool value: true

    property int timeout_value:180
    property bool limit_count_entered: false



    property real key_value: 0

    property bool allow: usertype_predict?true:false

    property int signal_get_value: 0
   property int amplitude_get_value:0
   property real phase_get_value: 0
   property int coil_output_get_value:0

    property int defect_signal_get_value: 0
   property int defect_amplitude_get_value:0
   property real defect_phase_get_value: 0
   property int defect_coil_output_get_value:0


    property int incdec: 0
    property int endangleofI: 0
  property int storage_satus: 0
    property bool is_Thresh_hold_Crossed: false

    property color secondarybaseBlueColor :"#0079FF"
        property color baseBlueColor :"#2F48BC"
        property color admin_purple_color :"#6C47FF"
        property color supervisor_yellow_color :"#EEA620"
        property color operator_green_color :"#1C4B3B"
         property color grey_text :"#5A5A5A"
          property color finger_shadow_color :"#85FFFF"

        property color apply_blur_effect :"#50FFFFFF"

    property bool is_create_in_active: false

    property Component screen_1: S001 {
    }
    property Component dateandtime: DateAndTime{}
property Component brightnessandvolume: BrightnessandVolume{}

property Component configureAutovalidation: ConfigureAutoValidation{}
property Component configureESignature:ConfigureESignature{}
property Component customerSettings:CustmerSettings{}
property Component autolearn: AutoLearn{}
    property Component filter_Setting: Filter_Setting{}


    //property Component logo:Logo{}




    Timer
    {
        running: true
        repeat: false
        interval: 100
        onTriggered: {
            lib1.fetch_filter_values()
        }
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

    StackView {
        id: stack_A
        anchors.fill: parent
        initialItem: screen_1
        pushEnter: Transition {
            PropertyAnimation {
                property: "x"
                from: stack_A.width
                to: 0
                duration: 1
            }
        }
        //        popExit: Transition {
        //            PropertyAnimation {
        //                property: "x"
        //            to :     stack_A.width
        //         from:0
        //                duration: 500
        //            }
        //           }
    }
}
