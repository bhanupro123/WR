import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
Rectangle {
    id:select_user_type_main_rect
    width: stack_B.width
    height: stack_B.height
    color: "white"
    Connections{
        target: bhanu
        onList:{
            console.log(str1)
            models.append({text:str1})

        }
    }
    Rectangle
    {
        id:blur_rect
        anchors.fill: parent
        RowLayout{

            height: parent.height*0.35
            anchors.centerIn: parent
            width: parent.width-80
            spacing: 20
            ColumnLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    radius: 5
                    Rectangle{
                        width:Math.min(parent.height,parent.width)*0.75
                        height: width
                        anchors.centerIn: parent
                        radius: 10
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
                    Text{
                        color: baseBlueColor
                        text: "Admin"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        font.pointSize: s003_font_size_small
                        font.weight: Font.Bold
                        anchors.bottom: parent.bottom
                        height: 2

                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            selected_user_type_SlectUserType=0
                            popup_select_user_type.open()
                        }
                    }
                }



            }
            ColumnLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    radius: 5
                    Rectangle{
                        width:Math.min(parent.height,parent.width)*0.75
                        height: width
                        anchors.centerIn: parent
                        radius: 10
                        color: supervisor_yellow_color
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
                    Text{
                        color: baseBlueColor
                        text: "Supervisor"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        font.pointSize: s003_font_size_small
                        font.weight: Font.Bold
                        anchors.bottom: parent.bottom
                        height: 2

                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            selected_user_type_SlectUserType=1
                            popup_select_user_type.open()
                        }
                    }
                }



            }
            ColumnLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    radius: 5
                    Rectangle{
                        width:Math.min(parent.height,parent.width)*0.75
                        height: width
                        anchors.centerIn: parent
                        radius: 10
                        color: operator_green_color
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
                    Text{
                        color: baseBlueColor
                        text: "Operator"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        font.pointSize: s003_font_size_small
                        font.weight: Font.Bold
                        anchors.bottom: parent.bottom
                        height: 2


                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            selected_user_type_SlectUserType=2
                            popup_select_user_type.open()
                        }
                    }
                }



            }
            ColumnLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    radius: 5
                    Rectangle{
                        width:Math.min(parent.height,parent.width)*0.75
                        height: width
                        anchors.centerIn: parent
                        radius: 10
                        border.color: baseBlueColor
                        border.width: 1
                        Image {
                            anchors.centerIn: parent
                            width:Math.min(parent.height,parent.width)
                            height: width
                            fillMode: Image.PreserveAspectFit
                            sourceSize.width: width
                            sourceSize.height: width
                            source: "qrc:/SVG/select profile/finger print.svg"

                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                stack_B.push(finger_print_screen)
                            }
                        }

                    }
                    Text{
                        color: baseBlueColor
                        text: "Finger Print"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        font.pointSize: s003_font_size_small
                        font.weight: Font.Bold
                        anchors.bottom: parent.bottom
                        height: 2

                    }
                }



            }
        }

    }


    Popup{
        id:popup_select_user_type
        width: parent.width
        height: parent.height

        focus:true
         closePolicy: "NoAutoClose"
        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0
        onOpened: {
            if(selected_user_type_SlectUserType==0)
            {
                  models.append({text:"ADMIN"})
            }
            bhanu.ulist(selected_user_type_SlectUserType)
            is_popup_opened=true
        }
        onClosed: {
            models.clear()
            listView.currentIndex=-1
            is_popup_opened=false
        }

        FastBlur{
            anchors.fill: parent
            visible: popup_select_user_type.opened?true:false
            source: blur_rect
            radius: 40

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    popup_select_user_type.close()
                }
            }
        }

        Rectangle{
            anchors.centerIn: parent
            radius: 6
            visible: listView.currentIndex>=0?false:true
            enabled: listView.currentIndex>=0?false:true
            width: parent.width*0.50
            height: parent.height*0.75
            border.width: 1
            ListView {
                id: listView
                cacheBuffer: 0
                width: parent.width-10
                visible: models.count>0?true:false
                height: parent.height-5
                anchors.centerIn: parent
                flickableDirection: Flickable.VerticalFlick
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                currentIndex: -1
                onCurrentIndexChanged: {
                    if(currentIndex>=0)
                    {

                         if(selected_user_type_SlectUserType==0)
                        {
                            selected_current_user_from_select_profile="A-"+models.get(listView.currentIndex).text
                        }
                       else if(selected_user_type_SlectUserType==1)
                        {
                            selected_current_user_from_select_profile="S-"+models.get(listView.currentIndex).text
                        }
                       else if(selected_user_type_SlectUserType==2)
                        {
                            selected_current_user_from_select_profile="O-"+models.get(listView.currentIndex).text
                        }

                         if(selected_which_action_of_user_form==0)////login
                        {
                             if(models.get(listView.currentIndex).text==="ADMIN")
                             {
                                 selected_current_user_from_select_profile=models.get(listView.currentIndex).text
                                 popup_select_user_type.close()
                                  stack_B.push(login_qml)
                                return;
                             }

                             popup_select_user_type.close()
                        stack_B.push(login_qml)
                        }
                        else if(selected_which_action_of_user_form==1)
                        {
                             if(models.get(listView.currentIndex).text==="ADMIN")
                             {
                                 selected_current_user_from_select_profile=models.get(listView.currentIndex).text
                                 popup_select_user_type.close()
                                  stack_B.push(edit_user)
                                return;
                             }
                             popup_select_user_type.close()
                        stack_B.push(edit_user)
                        }
                        else if(selected_which_action_of_user_form==2)
                        {
                             if(models.get(listView.currentIndex).text==="ADMIN")
                             {
                                 selected_current_user_from_select_profile=models.get(listView.currentIndex).text
                                       popup_select_user_type.close()
                                 show_dialog_function("You can not delete ADMIN",true)
                                return;
                             }
                             popup_select_user_type.close()
                        stack_B.push(delete_user)
                        }



                    }
                }

                model:ListModel {
                    id:models

                }
                ScrollBar.vertical: ScrollBar {
                    id:sv
                    active: true
                    policy: ScrollBar.AlwaysOn
                    background:
                        Rectangle{
                        width:5
                        height:listView.height
                        color: "white"
                    }
                }
                highlight: Rectangle {
                    width:listView.width-120
                    height: 40
                    border.color: "red"
                    border.width: 1
                    radius: 7
                    color: "#00000000"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("clicked")
                        }
                    }
                }
                delegate:Item {
                    x:5
                    width: parent.width*0.9
                    height: 50
                    Text {
                        width: parent.width
                        anchors.verticalCenter: parent.verticalCenter

                        text: modelData
                        color: "black"
                        font.pointSize: 12

                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width:parent.width
                        height: 1.5
                        color: baseBlueColor
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            listView.currentIndex=index
                        }

                    }
                }

            }

            Text {
                visible: models .count==0?true:false
                text: qsTr("Data Not Existed")
                anchors.centerIn: parent
                color: baseBlueColor
                font.pointSize: s003_font_size
            }

        }



    }




}

