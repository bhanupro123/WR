import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.0

Rectangle {
    id: rectangle
    width: 800
    height: 360

    color: "#b7bedf"
    property int a: 0
    property int bb: 0
    property int c: 0
    property int d: 0
    property int ee: 0
    property int i: 180
    property int dia:0

    //    Dialog {
    //        id: dialog
    //         x:250
    //         y:200
    //        width: 500
    //        height:150
    //        title: "Conformation Logout"
    //        visible: false
    //        standardButtons: Dialog.Ok | Dialog.Cancel
    //        Text {
    //            x:0
    //            y:0
    //            id: namee
    //            text: "if you press 'ok' the account will be Logout"
    //            color: "red"
    //            font.pointSize: 15
    //        }

    //        onAccepted:{
    //      bhanu.logout(false)
    //            dialog.visible=false
    //        }
    //    }





    Column {
        id: row
        x: 126

        width: 273
        height: 317
        anchors.verticalCenterOffset: 1
        anchors.verticalCenter: parent.verticalCenter
        spacing: 3
        Rectangle {            //1
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Last Defect Date  ")
                font.family: "Piboto Condensed"
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }

        }



        //2

        Rectangle {
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Last Defect Time  ")
                font.family: "Piboto Condensed"
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }
        }
        Rectangle {          //3
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Last Defect Phase  ")
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }

        }Rectangle {        //4
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Last Defect Amplitude  ")
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }

        }Rectangle {  //5
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Coil Output At Defect  ")
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }

        }Rectangle {
            width: 280
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "#e72929"
                text: qsTr("Reject Counts (Since power ON)  ")
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 18
            }

        }
    }

    Column {
        id: column
        x: 505
        y: 37
        width: 163
        height: 317
        anchors.verticalCenterOffset: 1
        anchors.verticalCenter: parent.verticalCenter
        spacing: 3
        Rectangle {
            width: 150
            height: 50
            color: "#cd9cf2"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            border.width: 2
            Text {
                color: "black"
                font.family: "Piboto Condensed"
                text: qsTr("00:00:0000")

                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
        Rectangle {
            width: 150
            height: 50
            color: "#ffffff"
            border.width: 2
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            Text {
                color: "black"
                text: qsTr("00:00:00")
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
        Rectangle {
            width: 150
            height: 50
            color: "#ffffff"
            radius: 15
            border.width: 2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            Text {
                color: "black"
                anchors.fill: parent
                text: defect_phase_get_value+"degree"
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
        Rectangle {
            width: 150
            height: 50
            color: "#ffffff"
            border.width: 2
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            Text {
                color: "black"
                text: defect_amplitude_get_value+"mV"
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
        Rectangle {
            width: 150
            height: 50
            color: "#ffffff"
            border.width: 2
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            Text {
                color: "black"
                text: defect_coil_output_get_value+"mV"
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
        Rectangle {
            width: 150
            height: 50
            color: "#ffffff"
            border.width: 2
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#cd9cf2"
                }

                GradientStop {
                    position: 1
                    color: "#f6f3ff"
                }
            }
            Text {
                color: "black"
                text: five_minut_reject_count
                anchors.fill: parent
                font.family: "Piboto Condensed"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }
    }
}
