import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick 2.5
import QtQuick.Window 2.2

import QtQuick 2.10
import QtQuick.Controls 2.0

Rectangle{
    id: rectangle3
       color: "#455dda"
width: 800
height: 360
Timer{
    interval: 10
    running: true
    repeat: false
    onTriggered: {
        lib1.who_i_am("sm")
    }
}
    Connections{
        target: lib1
        onTexttoqml:{
            date_qml.text=date+"\n"+time

        }
    }


    Connections{
        target: bhanu
        onSolveuser:{
            if(usertype_predict=="A")
            {

           userid.text="User : Admin"
                timeout_value=180
                timer.restart()
        ma.enabled=false
            }
            if(usertype_predict=="S")
            {
              userid.text="User : Supervisor"
                timer.stop()
                timeout_value=180
                ma.enabled=false
            }
            if(usertype_predict=="O")
            {
              userid.text="User : Operator"
                timer.stop()
                timeout_value=180
            }
            if(usertype_predict=="E")
            {
              userid.text="User : Engineer"
                timer.stop()
                timeout_value=180
                ma.enabled=false
            }
            if(usertype_predict=="")
            {
              userid.text="Login"

                timer.stop()
                timeout_value=180
                ma.enabled=true
            }


        }
    }


    Timer{
        id:timer
     running: true
     repeat: false
     interval: 1000
     onTriggered: {
         timeout_value=timeout_value-1
         timer.restart()
         if(timeout_value==0)
         {
             timer.stop()
         }



     }

    }
    property int timeout_value:180


Rectangle{
  y:60
  x:0
    id: rectangle2

    width:800
    height: 360
color: "#202830"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    border.width: 0

    Canvas {
        id: canvas3
        width: 200
        height: 200
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

            enabled: false

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)

                ctx.strokeStyle = "#F5F5F5"


            ctx.lineWidth = 5
            ctx.beginPath()
            var startAngle = 40
            var endAngle =41.684679060487525
            ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
            ctx.stroke()
            console.log(startAngle,endAngle)
        }
    }
    Canvas {
        id: canvas


        width:200
        height: width

        anchors.centerIn: parent
        enabled: false

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)

                ctx.strokeStyle = "#F5F5F5"


            ctx.lineWidth = 5
            ctx.beginPath()
            var startAngle = 43.1
            var endAngle =44.85
            ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
            ctx.stroke()
            console.log(startAngle,endAngle)
        }
    }

    Rectangle {
        id: rectangle
        anchors.centerIn: parent
        width: 146
        height: 140
        radius: width/2
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        //color: Material.color(Material.primary)
        Rectangle {
            id: rectangle1
            anchors.centerIn: parent
            width: 120
            height: width

            radius: 60
            //color: Material.color(Material.accent)

            Image{
                id: image2


                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                source: "qrc:/icons/Settings_icons/chat.svg"
                MouseArea{
                    anchors.fill: parent

                }
            }
        }
    }

    Rectangle {
       id:content1
        x: 67
        y: 66
        width: 189
        height: 45
        radius: 17


        Text {
            id: element4
            x: 8
            y: 20
            width: 149
            height: 17
                         font.family: "Piboto Condensed"
            color: "#5978c5"
            text: qsTr("ADD    EDIT    DELETE")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true

            font.pixelSize: 12
        }
    }
    Rectangle {
        id: title1
        x: 179
        y: -10
        width: 18
        height: 150

        radius: 9
        rotation: 90
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#fb9304"
            }

            GradientStop {
                position: 1
                color: "#fee734"
            }
        }

        Text {
            id: element1
            x: -3
            y: 40
            color: "#ffffff"
            text: qsTr("User")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            rotation: 270
    font.family: "Piboto Condensed"
            font.bold: true
            font.pixelSize: 14
        }
    }
    Rectangle {
        id: button1_out
        x: 232
        y: 49
        width: 80
        height: width
        radius: width/2
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            id: button1_in
            width: 60
            height: width
            radius: width/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent


            Image{
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.width: 30
                       sourceSize.height: 30
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/Settings_icons/user.svg"
                MouseArea{
                    anchors.fill: parent
 //stack_A.pop()
                }
            }
        }

    }

    //2

MouseArea{
    x: 233
    y: 239
    width: 80
    height: width
    onClicked: {
        stack_B.push(his)
    }



}
MouseArea{
    x: 488
    y: 49
    width: 80
    height: width
    onClicked: {
        if(usertype_predict=="A"||usertype_predict=="E")
        {
        stack_B.push(ss)
        }
        else{
            lib1.notify_to_qml_from_qml("You are not a ADMIN"+usertype_predict,true)
        }

        }

}
    Rectangle {
        x: 19
        y: 159
        width: 189
        height: 45
        radius: 17
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#dedede"
            }
        }
    }
    Rectangle {
        x: 124
        y: 88
        width: 18
        height: 150

        radius: 9
        rotation: 90
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#fd4d01"
            }


            GradientStop {
                position: 1
                color: "#fe8200"
            }

        }
    }
    Rectangle {
        x: 190
        y: 142
        width: 80
        height: width
        radius: width/2
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            width: 60
            height: width
            radius: height/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent
            Image {
                width: 30
                sourceSize.width: 30
                       sourceSize.height: 30
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "qrc:/icons/Settings_icons/book.svg"

            }
        }

    }



    //3

    Rectangle {
        x: 67
        y: 263
        width: 189
        height: 45
        radius: 17
        border.width: 0
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#dedede"
            }
        }

        Text {
            id: element10
            x: 8
            y: 20
            width: 155
                         font.family: "Piboto Condensed"
            height: 17
            color: "#5978c5"
            text: qsTr("ADD     EDIT     DELETE")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 12
        }
    }
    Rectangle {
        x: 172
        y: 191
        width: 18
        height: 150

        radius: 9
        border.width: 0
        rotation: 90
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#0171fd"
            }

            GradientStop {
                position: 1
                color: "#0079fe"
            }
        }
    }
    Rectangle {
        x: 232
        y: 239
        width: 80
        height: width
        radius: width/2
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            width: 60
            height: width
            radius: width/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent
            Image{
                width: 30
                sourceSize.width: 30
                       sourceSize.height: 30
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "qrc:/icons/Settings_icons/history.svg"
            }
        }

    }

    //4



    Rectangle {
        x: 544
        y: 257
        width: 195
        height: 45
        radius: 17
        border.width: 0
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#dedede"
            }
        }

        Text {
            id: element11
            x: 36
            y: 14
            width: 134
            height: 17
            color: "#5978c5"

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
              font.family: "Piboto Condensed"
            text: qsTr("LOAD PRODUCT & MORE")
            font.bold: true
    font.pixelSize: 12
        }
    }
    Rectangle {
        x: 610
        y: 181
        width: 18
        height: 150

        radius: 9
        rotation: 90
        gradient: Gradient {
            GradientStop {
                id: gradientStop
                position: 0
                color: "#5710af"
            }

            GradientStop {
                id: gradientStop1
                position: 1
                color: "#6c02a2"
            }
        }
    }
    Rectangle {
        x: 488
        y: 239
        width: 80
        height: width
        radius: width/2
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            width: 60
            height: width
            radius: width/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent
            Image{
                id: image1
                width: 30
                sourceSize.width: 30
                       sourceSize.height: 30
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "qrc:/icons/Settings_icons/more.svg"
            }
        }

    }

    //5

    Rectangle {
        x: 590
        y: 160
        width: 189
        height: 45
        radius: 17
        border.width: 0
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#dedede"
            }
        }

        Text {
            id: element12
            x: 22
            y: 20
            width: 145
            height: 17
              font.family: "Piboto Condensed"
            color: "#5978c5"
            text: qsTr("DEFAULT SETTINGS")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
          font.pixelSize: 12
        }
    }

    Rectangle {
        x: 659
        y: 86
        width: 18
        height: 155

        radius: 9
        border.width: 0
        rotation: 90
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#1d829e"
            }

            GradientStop {
                position: 1
                color: "#1ab3ef"
            }
        }

    }

    Rectangle {
        x: 532
        y: 143
        width: 80
        height: width
        radius: width/2
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            width: 60
            height: width
            radius: width/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent
            Image{
                id: image
                width: 30
                sourceSize.width: 30
                       sourceSize.height: 30
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "qrc:/icons/Settings_icons/restore.svg"
            }
        }

    }

    //6



    Rectangle {
        x: 544
        y: 67
        width: 189
        height: 45
        radius: 17
        border.width: 0
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#dedede"
            }
        }

        Text {
            id: element13
            x: 30
            y: 20
            width: 159
              font.family: "Piboto Condensed"
            height: 17
            color: "#5978c5"
            text: qsTr("BRIGHTNESS  & MORE")
            font.bold: true
                font.pixelSize: 12
        }
    }

    Rectangle {
        x: 610
        y: -9
        width: 18
        height: 150

        radius: 9
        border.width: 0
        rotation: 90
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#956aec"
            }

            GradientStop {
                position: 1
                color: "#956aec"
            }
        }

    }

    Rectangle {
        x: 488
        y: 49
        width: 80
        height: width
        radius: width/2
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#FCFCFC"
            }

            GradientStop {
                position: 1
                color: "#DDDDDE"
            }
        }
        Rectangle{
            width: 60
            height: width
            radius: width/2
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#dedede"
                }

                GradientStop {
                    position: 1
                    color: "#fcfcfc"
                }
            }
            border.width: 0
            anchors.centerIn: parent
            Image{
                width: 30
                sourceSize.width: 30
                       sourceSize.height: 30
                height: width
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "qrc:/icons/Settings_icons/settings.svg"
            }
        }

    }









    //canvas







    //dots
Rectangle{
    x: 327
    y: 100
    width: 15
    height: width
 radius: width/2
 color: "#F5F5F5"

}
Rectangle{
    x: 327
    y: 247
    width: 15
 height: width
 radius: width/2
color: "#F5F5F5"

}
Rectangle{
    x: 297
    y: 173
    width: 15
 height: width
 radius: width/2
 color: "#F5F5F5"

}

//dots2
Rectangle{
    x: 456
    y: 100
    width: 15
    height: width
 radius: width/2
 color: "#F5F5F5"

}
Rectangle{
    x: 456
    y: 247
    width: 15
    height: width
 radius: width/2
color: "#F5F5F5"

}
Rectangle{
    x: 488
    y: 174
    width: 15
    height: width
    radius: width/2
    color: "#F5F5F5"

}

Text {
    id: element2
    x: 76
    y: 154
    width: 106
    height: 19
    color: "#fbfbfb"
  font.family: "Piboto Condensed"
    text: qsTr("Product Library")
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.bold: true
    font.pixelSize: 12
}

Text {
    id: element3
    x: 106
    y: 257
      font.family: "Piboto Condensed"
    width: 132
    height: 19
    color: "#fbfbfb"
    text: qsTr("Audit Trail Data")
    horizontalAlignment: Text.AlignHCenter
    font.bold: true
    font.pixelSize: 12
}

Text {
    id: element5
    x: 26
    y: 178
    width: 168
    height: 17
                font.family: "Piboto Condensed"
    color: "#5978c5"
    text: qsTr("ADD     EDIT     DELETE")
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.bold: true
     font.pixelSize: 12
}

Text {
    id: element6
    x: 567
    y: 57
    width: 127
    height: 19
    color: "#fbfbfb"
      font.family: "Piboto Condensed"
    text: qsTr("System Settings")
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.bold: true
    font.pixelSize: 12
}

Text {
    id: element7
    x: 590
    y: 246
    width: 34
    height: 19
    color: "#fbfbfb"
    text: qsTr("More")
      font.family: "Piboto Condensed"
    font.bold: true
      font.pixelSize: 12
}

Text {
    id: element8
    x: 618
    y: 154
    width: 115
    height: 19
    font.family: "Piboto Condensed"
    color: "#fbfbfb"
    text: qsTr("Factory Settings")
    font.bold: true
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
       font.pixelSize: 12
}

MouseArea {
    id: mouseArea
    x: 232
    y: 49
    width: 80
    height: 80
    onClicked: {
        stack_B.push(ulogin)

    }
}
MouseArea {

    x: 190
    y: 142
    width: 80
    height: width
    onClicked: {
        stack_B.push(lib)
    }
}

MouseArea {
    x: 488
    y: 239
    width: 80
    height: width
    onClicked: {
        stack_B.push(lp)
    }
}

MouseArea {
    x: 532
    y: 143
    width: 80
    height: width
    onClicked: {

        if(usertype_predict=="E")
        {
        stack_B.push(fs)
        }
        else{

            lib1.notify_to_qml_from_qml("You are not Engineer "+usertype_predict,true)
        }
    }
}

    //end

}
}
