import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
Rectangle {
    id:welcome_base_child
    width: base_stackview.width
    height: base_stackview.height
    Text {
        text: "Welcome !"
        color: baseBlueColor
        anchors.centerIn: parent
        font.pointSize: 32
    }
}
