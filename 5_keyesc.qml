
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5


Window {
    id:gridLayoutWindow;
    visible: true
    width: Screen.width
    height: Screen.height + 1
    flags: Qt.FramelessWindowHint
    property int clickNum: 0
    property string keydown: "once"
    Timer{
        id: clickTimer
        //超过300ms还没有触发第二次点击证明时单击（并不一定非要用300ms延时，不过300ms是经典延时时间）
        interval: 300;
        onTriggered: {
            clickNum = 0
            clickTimer.stop()
            console.log("clicked, clicked, clicked")
        }
    }

    GridLayout{
           id: gridLayout1
           columns: 2;
           rows:2;
           anchors.fill: parent;
           anchors.margins: 0;
           columnSpacing: 0;
           rowSpacing: 0;
           focus: true
           Keys.enabled: true;
           Keys.onPressed: {

                     switch(event.key)
                     {
                     case Qt.Key_Escape:
                          //msgDialog.openMsg("esc");
                         if(((gridLayoutWindow.width==Screen.width)&&(gridLayoutWindow.height=Screen.height+1)))
                         {
                             gridLayoutWindow.width=Screen.width/2
                             gridLayoutWindow.height=Screen.height/3
                             gridLayoutWindow.x = (Screen.width - gridLayoutWindow.width) * 0.5
                                     gridLayoutWindow.y = (Screen.height - gridLayoutWindow.height) * 0.5
                         }
                         break;
                     }
           }

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

    MsgDialog {
        id: msgDialog

    }


    MouseArea {
        anchors.fill: parent
        property int mx: 0
        property int my: 0
        onPressed: {
            console.log("onPressed")
            mx=mouseX
            my=mouseY

            clickNum ++
           if(clickNum == 1)
           {
               keydown="once";
               clickTimer.start()
           }
           if(clickNum == 2)
           {
                keydown="double";
               clickNum = 0
               clickTimer.stop()
               if(((gridLayoutWindow.width==Screen.width)&&(gridLayoutWindow.height=Screen.height+1)))
                {

                    gridLayoutWindow.width=Screen.width/2
                    gridLayoutWindow.height=Screen.height/3
                   gridLayoutWindow.x = (Screen.width - gridLayoutWindow.width) * 0.5
                    gridLayoutWindow.y = (Screen.height - gridLayoutWindow.height) * 0.5
                }
                else
                {

                    gridLayoutWindow.width=Screen.width
                    gridLayoutWindow.height=Screen.height+1
                   gridLayoutWindow.x = 0
                    gridLayoutWindow.y = 0
                }
              // msgDialog.openMsg("double");
              // console.log("doubleClicked, doubleClicked,doubleClicked")
           }

        }

        onPositionChanged: {

        //    if(!((gridLayoutWindow.x == (Screen.width - gridLayoutWindow.width) * 0.5)&&
         //           ( gridLayoutWindow.y = (Screen.height - gridLayoutWindow.height) * 0.5)))

            if(keydown!="double")
            {
                if((gridLayoutWindow.width == Screen.width)&&(gridLayoutWindow.height == Screen.height+1))
                {
                    gridLayoutWindow.x=0
                    gridLayoutWindow.y=0
                }
                else
                {
                    gridLayoutWindow.x+=mouseX-mx
                    gridLayoutWindow.y+=mouseY-my
                }


            }
            /*
            if(Screen.width!=gridLayoutWindow.width)
            {
                gridLayoutWindow.x+=mouseX-mx
                gridLayoutWindow.y+=mouseY-my
            }*/

        }
    }
}

