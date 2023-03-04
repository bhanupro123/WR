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


    Rectangle{
        anchors.centerIn: parent
        radius: 10
        width: parent.width*0.50


        border.width: 2
        height: parent.height*0.75
                ListView {
                    id: listView
                    cacheBuffer: 0
                   anchors.fill:parent
                    flickableDirection: Flickable.VerticalFlick
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true

                   currentIndex: -1


                   model:ListModel {
                       id: fruitModel

                       ListElement {
                           name: "Apple"
                           cost: 2.45
                       }
                       ListElement {
                           name: "Orange"
                           cost: 3.25
                       }
                       ListElement {
                           name: "Banana"
                           cost: 1.95
                       }
                   }
                    ScrollBar.vertical: ScrollBar {
                        id:sv
                        active: true
                      policy: ScrollBar.AlwaysOn
                   background:
                       Rectangle{
                       width:10
                       height:334
                       radius: 5
                       color: "black"
                   }
                    }




                    delegate:
                        Text {
                        width: listView.width-10
                        height: 40
                        verticalAlignment: Text.AlignVCenter
                        text:" A "+ name
                        font.bold: true
                        color: "red"
                        font.pointSize: 12

                    }

                }



    }




}








