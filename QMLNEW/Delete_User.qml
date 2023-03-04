import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
Rectangle{
    color: "#00000000"
 width: base_stackview.width
 height: base_stackview.height
 Component.onCompleted: {
time_out_value=time_out_value_setby_user
 }
 FastBlur{
     anchors.fill: parent

     source: base_stackview
     radius: 20

 }


        Rectangle{
            anchors.centerIn: parent
            width: parent.width*0.5
            height: parent.height*0.45
            radius: 20
            border.color: admin_purple_color
            border.width:1
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Delete User : ")
                font.pointSize: s003_font_size
                y:10
            }

            Text {
                y:50
                x:20
          font.pointSize: s003_font_size_medium
                color: grey_text
                text: qsTr("Selected User: "+selected_current_user_from_select_profile)
            }

            Button{

                text: ""
                anchors.bottom: parent.bottom
                anchors.margins: 20
                anchors.left: parent.left

                background:
                    Rectangle{
                    implicitHeight: 40
                    implicitWidth: 150
                    radius: 8
                    Text {
                        anchors.centerIn:  parent
                        color: "white"
                        font.pointSize: s003_font_size_medium
                        text: qsTr("Delete User")
                    }
                    color:baseBlueColor

                }
                onClicked: {
                    bhanu.delet(selected_current_user_from_select_profile)
                      base_stackview.pop()
                }

            }
            Button{
                text: ""
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 20
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
                        text: qsTr("No")
                    }
                    color:"white"

                }
                onClicked: {
                      base_stackview.pop()
                }

            }


        }


}
