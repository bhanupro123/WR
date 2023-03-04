import QtQuick 2.9
import QtQuick.Window 2.2
import test 1.0
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Text {
      anchors.centerIn: parent
      color: 'red'
        text: aa.test
    }

    Rectangle {
      width: 100
      color: 'red'

      height: 60
      Text {
        id: textField
        text: qsTr("Click me.")
        anchors.centerIn: parent
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          textField.text = "Clicked...";
          aa.test = bh.text

            return;
            // Passing objects from QML to C++
                  b.doA(aa);
                  b.doC(c);

                  // Setting a property works as expected as well.

                  b.doA(aa);
                  b.doC(c);

                  // Dynamic object creation in QML
                  var newA = Qt.createQmlObject('import QtQuick 2.0; import test 1.0; A {test: bh.text}', parent);
                  b.doA(newA);

                  // Object creation in C++ and passing to QML
                  var anotherA = b.makeA();
                  console.log(anotherA.test);

                  // Use an object created in C++ in QML.
                  c.a = anotherA;
                  b.doC(c);

                  // Using QML lists
                  console.log("");
                  d.doVl();
                  console.log("");
                  b.doVl(d.vl);

                  // It is also possible to pass dynamically created lists.
                  console.log("");
                  b.doVl(["j1", 2, 3, "j4"]);

                  // See the code of b.h to see how to access the objects in the list from C++.
                  console.log("");
                  b.doAlist([aa, aaa]);

                  // Create a list of objects in C++ and use it in QML.
                  console.log("");
                  d.vl = b.makeAList();
                  console.log(d.vl[0].test);
                  console.log(d.vl[1].test);
                }
      }
      A{id: aa; test: "bar"}

    }
}
