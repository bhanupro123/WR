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
    property int which_button:0
    Rectangle{
        id:sub_rect_s003
        anchors.fill: parent
        Text {
            font.pointSize: s003_font_size
            color: baseBlueColor
            x: 40
            y:20
            text: qsTr("Product Information  >  Active Product : 01-001")
        }
        RowLayout{
            height: parent.height*0.35
            anchors.centerIn: parent
            width: parent.width-80

            spacing: 10

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                border.color: baseBlueColor
                radius: 10
                RowLayout{
                    anchors.centerIn: parent
                    Text {
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        color: baseBlueColor
                        text: qsTr("Active Product")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    } Rectangle{
                        color: baseBlueColor
                        Layout.fillWidth: true
                        height: 2
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        which_button=1
                        popup_activeproduct.open()
                    }
                    onReleased: {
                        parent.color="white"
                    }
                }

            }
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                border.color: baseBlueColor
                radius: 10
                RowLayout{
                    anchors.centerIn: parent
                    Text {
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        color: baseBlueColor
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("D-Duster")
                    } Rectangle{
                        color: baseBlueColor
                        Layout.fillWidth: true
                        height: 2
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        which_button=2

                        popup_activeproduct.open()
                    }
                    onReleased: {
                        parent.color="white"
                    }
                }

            }
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                border.color: baseBlueColor
                radius: 10
                RowLayout{
                    anchors.centerIn: parent
                    Text {
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        color: baseBlueColor
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("Gain,Delay\n & Filter")
                    } Rectangle{
                        color: baseBlueColor
                        Layout.fillWidth: true
                        height: 2
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        which_button=3

                        popup_activeproduct.open()
                    }
                    onReleased: {
                        parent.color="white"
                    }
                }
            }

        }
    }
    Popup{
        id:popup_activeproduct
        width: parent.width
        height: parent.height

        focus:true
        closePolicy: Popup.CloseOnPressOutside
        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0
        onClosed: {
            which_button=0
        }

        FastBlur{
            anchors.fill: parent
            visible: popup_activeproduct.opened?true:false
            source: sub_rect_s003
            radius: 30


        }
        Rectangle{
            anchors.centerIn: parent
            radius: 10
            width: parent.width*0.75
            color: "#50FFFFFF"
            visible: which_button==1?true:false
            border.width: 2
            height: parent.height*0.75


            ColumnLayout{
                anchors.horizontalCenter: parent.horizontalCenter
                y:10
                Text {
                    font.weight: Font.Medium
                    font.pointSize: s003_font_size
                    verticalAlignment: Text.AlignVCenter

                    text:"Active Product : "+product_gr_no+":"+product_sr_no

                }
                Rectangle{
                    color: baseBlueColor
                    Layout.fillWidth: true
                    height: 2
                }
            }
            RowLayout{
                anchors.centerIn: parent
                ColumnLayout{

                    spacing: 12
                    Text {
                        Layout.fillWidth: true
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.pointSize: s003_font_size_small
                        text: "Product Name : "
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.pointSize: s003_font_size_small
                        text: "Product Code : "
                        font.weight: Font.Light

                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "Batch No : "
                    }Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "Threshold-S : "
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "Threshold-A : "
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "M/c Phase : "
                    }
                }
                ColumnLayout{

                    spacing: 12
                    Text {
                        Layout.fillWidth: true
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter

                        font.pointSize: s003_font_size_small
                        text: product_name
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.pointSize: s003_font_size_small
                        text: product_code
                        font.weight: Font.Light

                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: +batch_no
                    }Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: signal_Set_value
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: amplitude_Set_value
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: phase_Set_value
                    }
                }

            }
        }
        Rectangle{
            anchors.centerIn: parent
            radius: 10
            width: parent.width*0.75
            color: "#50FFFFFF"
            visible: which_button==2?true:false
            border.width: 2
            height: parent.height*0.75
            ColumnLayout{
                anchors.horizontalCenter: parent.horizontalCenter
                y:10
                Text {
                    font.weight: Font.Medium
                    font.pointSize: s003_font_size
                    text:"D Duster"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
                Rectangle{
                    color: baseBlueColor
                    Layout.fillWidth: true
                    height: 2
                }
            }
            RowLayout{
                anchors.centerIn: parent
                ColumnLayout{

                    spacing: 15
                    Text {
                        Layout.fillWidth: true
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.pointSize: s003_font_size_small
                        text: "DD Status : "
                    }
                    Text {
                        Layout.fillWidth: true
                        font.pointSize: s003_font_size_small
                        text: "Power : "
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight

                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "Factor : "
                    }Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: "Frequency : "
                    }
                }

                ColumnLayout{

                    spacing: 15
                    Text {
                        Layout.fillWidth: true
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter

                        font.pointSize: s003_font_size_small
                        text: dd_on_off_status? "ON":"OFF"
                    }
                    Text {
                        Layout.fillWidth: true
                        font.pointSize: s003_font_size_small
                        text: dD_Power
                        font.weight: Font.Light
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: dD_Power_Factor
                    }Text {
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        font.weight: Font.Light
                        font.pointSize: s003_font_size_small
                        text: dD_Frequency
                    }
                }
            }
        }



        Rectangle{
            anchors.centerIn: parent
            radius: 10
           color: "#50FFFFFF"
            width: parent.width*0.9
            visible: which_button==3?true:false
            height: parent.height*0.75
            border.width: 1


            RowLayout{
                y:10
                width: parent.width
                ColumnLayout{
                    Layout.fillWidth: true

                    Text {
                        id:gain_text
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        text:"Gain"

                    }
                    Rectangle{
                        Layout.alignment:Qt.AlignHCenter
                        color: baseBlueColor
                        width:gain_text.width
                        height: 2
                    }
                }
                ColumnLayout{
                    Layout.fillWidth: true
                    Text {
                        id:delay_text
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        text:"Delay"
                    }
                    Rectangle{
                        color: baseBlueColor
                        width:delay_text.width
                        Layout.alignment:Qt.AlignHCenter
                        height: 2
                    }
                }
                ColumnLayout{
                    Layout.fillWidth: true
                    Text {
                        Layout.fillWidth: true
                        id:filter_text
                        Layout.alignment:Qt.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.weight: Font.Medium
                        font.pointSize: s003_font_size
                        text:"Filter"

                    }
                    Rectangle{
                        color: baseBlueColor
                        Layout.alignment:Qt.AlignHCenter
                        width:filter_text.width
                        height: 2
                    }
                }


            }


            RowLayout{
                y:60
                width: parent.width-8
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5

                height: parent.height-65
                Rectangle
                {
                    border.width: 0
                     color: "#50FFFFFF"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    RowLayout{
                        anchors.centerIn: parent
                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.pointSize: s003_font_size_small
                                text: "Analog Gain : "
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: "Digital Gain : "
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight

                            }

                        }

                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter

                                font.pointSize: s003_font_size_small
                                text:analog_gain
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: digital_gain
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                            }

                        }
                    }

                }
                Rectangle{
                    implicitHeight:( parent.height-65)/2
                    implicitWidth: 2
                    color: baseBlueColor
                }

                Rectangle
                {
                     border.width: 0
                     color: "#50FFFFFF"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    RowLayout{
                        anchors.centerIn: parent
                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.pointSize: s003_font_size_small
                                text: "Opt. Delay : "
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: "Hold Delay : "
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight

                            }
                            Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: "Relay Delay : "
                            }
                        }

                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter

                                font.pointSize: s003_font_size_small
                                text: operate_delay+" mS"
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: hold_delay+" mS"
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                            }
                            Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter

                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: relay_delay+" mS"
                            }
                        }
                    }

                }
                Rectangle{
                    implicitHeight:( parent.height-65)/2
                    implicitWidth: 2
                    color: baseBlueColor
                }
                Rectangle
                {
                    color: "#50FFFFFF"
                    border.width: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    RowLayout{
                        anchors.centerIn: parent
                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.pointSize: s003_font_size_small
                                text: "LPF 1 : "
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: "LPF 2 : "
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight

                            }
                            Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: "HPF 1 : "
                            }Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignRight
                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: "HPF 2 : "
                            }
                        }

                        ColumnLayout{

                            spacing: 15
                            Text {
                                Layout.fillWidth: true
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter

                                font.pointSize: s003_font_size_small
                                text: lPF1+" Hz"
                            }
                            Text {
                                Layout.fillWidth: true
                                font.pointSize: s003_font_size_small
                                text: lPF2+" Hz"
                                font.weight: Font.Light
                                verticalAlignment: Text.AlignVCenter
                            }
                            Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter

                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: hPF1+" Hz"
                            }Text {
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter

                                font.weight: Font.Light
                                font.pointSize: s003_font_size_small
                                text: hPF2+" Hz"
                            }
                        }
                    }

                }

        }



        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                popup_activeproduct.close()
            }
        }
    }


}









