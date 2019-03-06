
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1


Window {
    id:gridLayoutWindow;
    visible: true
    width: Screen.width
    height: Screen.height + 1
    flags: Qt.FramelessWindowHint

    GridLayout{
           id: gridLayout1
           columns: 2;
           rows:2;
           anchors.fill: parent;
           anchors.margins: 0;
           columnSpacing: 0;
           rowSpacing: 0;

           Rectangle{
               id:rect00;
               color: "red";
               Layout.fillWidth: true;
               Layout.fillHeight: true;

           }

           Rectangle{
               id:rect01;
               color: "blue";
               Layout.fillWidth: true;
               Layout.fillHeight: true;
           }

           Rectangle{
               id:rect10;
               color: "green";
               Layout.fillWidth: true;
               Layout.fillHeight: true;
               Layout.row:1;
               Layout.column: 1;
           }

       }



    MouseArea {
        anchors.fill: parent
        property int mx: 0
        property int my: 0
        onPressed: {
            console.log("点击事件")
            mx=mouseX
            my=mouseY
        }
        onDoubleClicked: {
          console.log("doubleClicked , doubleClicked , doubleClicked ！");
               }
        onPositionChanged: {
            if(Screen.width!=gridLayoutWindow.width)
            {
                gridLayoutWindow.x+=mouseX-mx
                gridLayoutWindow.y+=mouseY-my
            }

        }
    }
}

