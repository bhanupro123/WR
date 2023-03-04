import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3
//import QtQuick.VirtualKeyboard 2.2
import QtQuick 2.10
import QtQuick 2.0
import QtMultimedia 5.0
Rectangle{
    visible: true
    width: 800
    height: 360
color: "#87bed3"
enabled: false
SoundEffect{
id:sound
source: "qrc:/archer-theme-song.wav"
}
Timer{
    interval: 10
    running: true
    repeat: false
    onTriggered: {
        lib1.who_i_am("lp")
    }
}
Button{
    width:100
    height:40
    enabled: false
    text:"click me"
    onClicked:{
        sound.play()
    }
}


}
