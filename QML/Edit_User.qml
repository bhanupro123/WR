import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import QtQuick.VirtualKeyboard 2.1



Rectangle {
    property bool show_password_or_not: false

    width: base_stackview.width
    height: base_stackview.height
    FastBlur{
        anchors.fill: parent
        source: base_stackview
        radius: 40

    }
Component.onCompleted: {
//time_out_value=time_out_value_setby_user

}


    Rectangle {
        id: create
        radius: 6
y:is_dragable_to_input? 0:parent.width/2-create.height
        width: parent.width*0.5
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height*0.8
        color: "#E6E6E6"
        border.width: 1
        border.color: "#808080"
        Rectangle{
            anchors.centerIn: parent
            color: "#E6E6E6"
            width: parent.width*0.9
            height:parent.height*0.9
            ColumnLayout{
                anchors.centerIn: parent
                width: parent.width
                spacing: 15


                Rectangle{
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 50
                    Text {
                        width: parent.width*0.7
                        id: textField0
                        text: selected_current_user_from_select_profile
                        anchors.verticalCenter: parent.verticalCenter
                        x:10
                        anchors.leftMargin: 10
                        font.pointSize: 11
                        color: text.length>=5? "green":"red"
                    }
                    Text{
                        Layout.fillWidth: true
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        text: "user name"
                        color: grey_text
                        font.pointSize: s001_font_size_10
                    }




                }
                Rectangle{
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 50


                    RowLayout{
                        width: parent.width-20
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.centerIn: parent
                        //anchors.verticalCenter: parent.verticalCenter

                        spacing: 15
                        TextField {
                            id: textField
                            text: ""
                            Layout.fillWidth: true
                            font.pointSize: 11
                            placeholderText: "Enter Password"
                            color: text.length>=5? "green":"red"
                            echoMode:show_password_or_not?TextInput.Normal:TextInput.Password
                        }
                        Image {
                            width: image_icon_height
                            height: image_icon_height
                            fillMode: Image.PreserveAspectFit
                            sourceSize.width: image_icon_height
                            sourceSize.height: image_icon_height
                            source: show_password_or_not?"qrc:/SVG/Login/icons8-eye-96.png":"qrc:/SVG/Login/icons8-hide-96.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    show_password_or_not=!show_password_or_not
                                }
                            }
                        }

                        Text{
                            text: "password"
                            color: grey_text
                            font.pointSize: s001_font_size_10
                        }

                    }
                }
                Rectangle{
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 50
                    RowLayout{
                        width: parent.width-20
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.centerIn: parent
                        //anchors.verticalCenter: parent.verticalCenter

                        spacing: 15
                        TextField {
                            id: textField1
                            focus: true
                            onPressed: {
                                    is_dragable_to_input=true
                            }
                            onReleased: {
                            }
                            onActiveFocusOnPressChanged: {
                                console.log("FOCUS CHANGED")
                            }
                            onActiveFocusChanged: {
                             console.log("FOCUS CHANGED 1234 q  ")
                            }
                            text: ""
                            Layout.fillWidth: true
                            font.pointSize: 11
                            placeholderText: "Enter Password"
                            color: text.length>=5? "green":"red"
                        echoMode:show_password_or_not?TextInput.Normal:TextInput.Password
                        }
                        Image {
                            width: image_icon_height
                            height: image_icon_height
                            fillMode: Image.PreserveAspectFit
                            sourceSize.width: image_icon_height
                            sourceSize.height: image_icon_height
                            source: show_password_or_not?"qrc:/SVG/Login/icons8-eye-96.png":"qrc:/SVG/Login/icons8-hide-96.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    show_password_or_not=!show_password_or_not
                                }
                            }
                        }

                        Text{
                            text: "Conform password"
                            color: grey_text
                            font.pointSize: s001_font_size_10
                        }

                    }
                }
              Rectangle{
                    width: parent.width-10
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 70
                    color: "#E6E6E6"
                    Button{
                        id:edit_button
                        text: ""
                        width: parent.width*0.45

                        anchors.verticalCenter: parent.verticalCenter
                        background:
                            Rectangle{
                            border.color: "red"
                            border.width: 0
                            implicitHeight: 40
                            implicitWidth:edit_button.width
                            radius: 8
                            Text {
                                anchors.centerIn:  parent
                                color: "white"
                                font.pointSize: s003_font_size_medium
                                text: qsTr("Edit")
                            }
                            color:edit_button.down ?operator_green_color:baseBlueColor

                        }
                        onClicked: {
                              if(currunt_user=="")
                              {
                                  notification_msg_color=supervisor_yellow_color
                                     notification_msg="User not Loged IN"
                                  return;
                              }
                              if(textField.text.length<5)
                             {
                                 notification_msg_color=supervisor_yellow_color
                                    notification_msg="Password 1 is min required 5 char"
                                 return;
                             }
                             else if(textField1.text.length<5)
                             {
                                 notification_msg_color=supervisor_yellow_color
                                    notification_msg="Password 2 is min required 5 char"
                              return;
                             }

                            else if(textField.text!=textField1.text)
                            {
                                notification_msg_color=supervisor_yellow_color
                                   notification_msg="Password Not matched"
                               return;

                            }
                              if(selected_current_user_from_select_profile=="ADMIN")
                              {
                                  bhanu.admin("ADMIN",textField.text,1)
                                  textField.clear()
                                   textField1.clear()
                                  return;
                              }
                              bhanu.update(selected_current_user_from_select_profile,textField.text)
                                   textField.clear()
                                    textField1.clear()
                        }

                    }
                    Button{
                        id:clear_button
                        text: ""
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width*0.45
                        anchors.right: parent.right
                        background:
                            Rectangle{

                            border.color: baseBlueColor
                            implicitHeight: 40
                            border.width: 2
                            implicitWidth: clear_button.width
                            radius: 8
                            Text {
                                anchors.centerIn:  parent
                                color: baseBlueColor
                                font.pointSize: s003_font_size_medium
                                text: qsTr("Clear")
                            }
                            color:"white"

                        }
                        onClicked: {
                            textField.clear()
                            textField0.clear()
                            textField1.clear()

                        }

                    }
                    //                    Image {
                    //                        width: 70
                    //                        height: 70
                    //                        anchors.right: parent.right
                    //                        anchors.verticalCenter: parent.verticalCenter

                    //                        fillMode: Image.PreserveAspectFit
                    //                        sourceSize.width: 70
                    //                        sourceSize.height: 70

                    //                        source: "qrc:/SVG/select profile/red_fp.svg"
                    //                    }



                }


            }

        }

    }



}




