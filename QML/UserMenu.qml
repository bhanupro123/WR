import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import QtQuick.VirtualKeyboard 2.1
Rectangle {
    id:select_user_type_main_rect
    width: stack_B .width
    height: stack_B.height
    Rectangle{
        width:Math.min(parent.height,parent.width)*0.3
        height: width*0.9
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 10
        y:parent.height/2-width-width/4

        color: admin_purple_color
        Image {
            anchors.centerIn: parent
            width:Math.min(parent.height,parent.width)*0.75
            height: width
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            sourceSize.height: width
            source: "qrc:/SVG/select profile/user_white_icon.svg"

        }

    }
    Text {
        anchors.centerIn: parent
        font.pointSize: s001_font_size
        font.weight: Font.DemiBold
        text: "User"
    }


    RowLayout{
        anchors.horizontalCenter: parent.horizontalCenter
        y:parent.height*0.7
        spacing: 10
        Button{
            visible: currunt_user==""?true:false
            enabled:  currunt_user==""?true:false
            text: ""
            background:
                Rectangle{
                implicitHeight: 40
                implicitWidth: 150
                radius: 15
                border.width: 2
                border.color: baseBlueColor
                Text {
                    anchors.centerIn:  parent
                    color: baseBlueColor
                    font.pointSize: s003_font_size_medium
                    text: qsTr("Login")
                }

            }
            onClicked: {
                selected_which_action_of_user_form=0
                stack_B.push(select_profile_screen)
            }

        }

        Button{
            text: ""
            background:
                Rectangle{
                implicitHeight: 40
                implicitWidth: 150
                radius: 15
                border.width: 2
                border.color: baseBlueColor
                Text {
                    anchors.centerIn:  parent
                    color: baseBlueColor
                    font.pointSize: s003_font_size_medium
                    text: qsTr("Add User")
                }

            }
            onClicked: {
                stack_B.push(create_User)
            }

        }
        Button{
            text: ""
            background:
                Rectangle{
                implicitHeight: 40
                implicitWidth: 150
                radius: 15
                border.width: 2
                border.color: baseBlueColor
                Text {
                    anchors.centerIn:  parent
                    color: baseBlueColor
                    font.pointSize: s003_font_size_medium
                    text: qsTr("Edit User")
                }

            }
            onClicked: {
                selected_which_action_of_user_form=1
                stack_B.push(edit_user)
            }
        }
        Button{
            text: ""
            background:
                Rectangle{
                implicitHeight: 40
                implicitWidth: 150
                radius: 15
                border.width: 2
                border.color: baseBlueColor
                Text {
                    anchors.centerIn:  parent
                    color: baseBlueColor
                    font.pointSize: s003_font_size_medium
                    text: qsTr("Delete User")
                }

            }
            onClicked: {
                selected_which_action_of_user_form=2
                stack_B.push(delete_user)
            }

        }

    }

}



