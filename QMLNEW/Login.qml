import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0

Rectangle {
    id:select_user_type_main_rect
    width: base_stackview.width
    height: base_stackview.height
    color: "white"
    property bool show_password_or_not: false
    Component.onCompleted: {
  time_out_value=time_out_value_setby_user
    }

    Rectangle {
        id: login
        anchors.centerIn: parent
        radius: 6
        width: parent.width*0.50
        height: parent.height*0.75
        color: "#E6E6E6"
        border.width: 1
        border.color: "#808080"

        Rectangle{
            anchors.centerIn: parent
            color: "#E6E6E6"

            width: parent.width*0.9
            height:parent.height*0.9


            ColumnLayout{
                width: parent.width
                spacing: 15

                Rectangle{
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 50

                    Text{
                        x:10
                        anchors.verticalCenter: parent.verticalCenter
                        text:selected_current_user_from_select_profile
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: s003_font_size_medium
                    }
                    Text{
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
                            color: text.length>=4? "green":"red"

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
                    Text{
                        anchors.leftMargin: 10
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        text: selected_user_type_SlectUserType==0?"Admin":selected_user_type_SlectUserType==1?"Supervisor":"Operator"
                        font.pointSize: s001_font_size
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        text: "user type"
                        color: grey_text
                        font.pointSize: s001_font_size_10
                    }
                }
                Rectangle{
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 20
                    color: "#E6E6E6"
                    Text{
                        anchors.rightMargin: 10
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Forgot password ?"
                        color: grey_text
                        font.pointSize: s001_font_size_10
                    }
                }
                Rectangle{
                    width: parent.width-10
                    radius: 8
                    Layout.fillWidth: true
                    implicitHeight: 70
                    color: "#E6E6E6"
                    Button{
                        id:login_button
                        text: ""
                        enabled: textField.text.length>=4?true:false
                        anchors.verticalCenter: parent.verticalCenter
                        background:
                            Rectangle{
                            implicitHeight: 40
                            implicitWidth: 100
                            radius: 8
                            Text {
                                anchors.centerIn:  parent
                                color: "white"
                                font.pointSize: s003_font_size_medium
                                text: qsTr("Login")
                            }
                            color:login_button.down ?operator_green_color:baseBlueColor

                        }
                        onClicked: {
                            if(selected_current_user_from_select_profile=="ADMIN")
                            {
                                bhanu.admin(selected_current_user_from_select_profile,textField.text,0)
                                return;
                            }

                            bhanu.verify(selected_current_user_from_select_profile,textField.text)
                            textField.clear()
                        }

                    }
                    Button{
                        id:clear_button
                        text: ""
                        anchors.centerIn: parent
                        background:
                            Rectangle{
                            border.color: baseBlueColor
                            implicitHeight: 40
                            border.width: 2
                            implicitWidth: 100
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
                        }

                    }
                    Image {
                        width: 70
                        height: 70
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter

                        fillMode: Image.PreserveAspectFit
                        sourceSize.width: 70
                        sourceSize.height: 70

                        source: "qrc:/SVG/select profile/red_fp.svg"
                    }



                }


            }

        }

    }


}
