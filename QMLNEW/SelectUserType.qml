import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
Rectangle {
    id:select_user_type_main_rect
    width: base_stackview.width
    height: base_stackview.height
    color: "white"
    Connections{
        target: bhanu
        onList:{
            console.log(str1)
            model.append({text:str1})

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
                                base_stackview.push(finger_print_screen)
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
        closePolicy: Popup.CloseOnPressOutside
        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0
        onOpened: {
            bhanu.ulist(selected_user_type_SlectUserType)

            is_popup_opened=true
        }

        onClosed: {

            model.clear()
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
                            selected_current_user_from_select_profile="A-"+model.get(listView.currentIndex).text
                        }
                       else if(selected_user_type_SlectUserType==1)
                        {
                            selected_current_user_from_select_profile="S-"+model.get(listView.currentIndex).text
                        }
                       else if(selected_user_type_SlectUserType==2)
                        {
                            selected_current_user_from_select_profile="O-"+model.get(listView.currentIndex).text
                        }
                         popup_select_user_type.close()
                    base_stackview.push(login_qml)

                    }
                }

                model:ListModel {
                    id:model
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



        }



    }




}
