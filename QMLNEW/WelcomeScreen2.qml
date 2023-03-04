import QtQuick 2.0

Rectangle {
    id:welcome2_base_child
    width: base_stackview.width
    height: base_stackview.height

Image {
    anchors.fill:  parent
    source: "qrc:/SVG/Screen2/background_screen_2.png"
}
Image {
    id:wrsllp
    anchors.centerIn:  parent
    fillMode: Image.PreserveAspectFit

    source: "qrc:/SVG/Screen2/WR_system_llp.svg"
}
Image {
    anchors.top:wrsllp.bottom
    anchors.topMargin: 30
    fillMode: Image.PreserveAspectFit
    anchors.horizontalCenter:  parent.horizontalCenter
    source: "qrc:/SVG/Screen2/pmd.svg"
}
Image {
    anchors.bottom: parent.bottom
 anchors.right: parent.right
 fillMode: Image.PreserveAspectFit
 anchors.margins: 25
    source: "qrc:/SVG/Screen2/sort-O-met.svg"
}
Timer{
    id:welcome_timer
    running: true
    repeat: false
    interval: 2000
    onTriggered: {
        base_stackview.push(dashboard)
        header_height=40
    }
}




}
