/****************************************************************************
**
** Copyright (C) 2014 Klaralvdalens Datakonsult AB (KDAB).
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.8 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQuick.Scene3D 2.0
import mike.Calculation 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls 2.2
import QtQuick.Window 2.12
//import QtQuick 2.15


QQ2.Rectangle {
    id: root_rectangle
  color:  "black"
   width: 1600
   height: 900


 Calculation {
     id: calc    }


QQ2.Rectangle {
   id:manegment_board
   color:  "black"
anchors.bottom: root_rectangle.bottom
width: root_rectangle.width
height: root_rectangle.height* 0.15




QQ2.Row {
   anchors.top: manegment_board.top
   spacing: 2






Gauge {
    id: altitudemeter
    value: -4 //toyplane.altitude;

    anchors.verticalCenter: parent.verticalCenter
   minimumValue: -5
    maximumValue: 20

    width: parent.height
    height: parent.height

 //   style: DashboardGaugeStyle {}
}



Slider {
    id: speedslider
    value: 0.0 //toyplane.altitude;

    anchors.verticalCenter: parent.verticalCenter
   from: 0.0
    to: 0.3
    stepSize: 0.05
orientation: Qt.Vertical
    width: 0.5 * parent.height
    height: parent.height
onValueChanged: toyplane.speedchange();

 //   style: DashboardGaugeStyle {}
}



QQ2.Rectangle {
    id: grid_rectangle
    width: 150
    height: 142


QQ2.Grid {
    rows: 3
    columns: 3
    anchors.centerIn: grid_rectangle
    spacing: 2

    QQ2.Rectangle {
        id: topleft
        width: 40
        height: 40
        color: "lightgreen"

        QQ2.MouseArea {
            id: mouseArea_topleft
                   anchors.fill: topleft
                   hoverEnabled: true
                   onEntered: {
                       topcenter.color = "red";
                       centerleft.color = "red";

                   }
                   onExited: {
                       topcenter.color = "green";
                       centerleft.color = "green";
                         }

                   onClicked: {
                       manegment_board.color = "black"
                       toyplane.transporent_roll_left();
                                }

    }
    }

    QQ2.Rectangle {
        id: topcenter
        width: 40
        height: 40
        color: "green"

        QQ2.MouseArea {
            id: mouseArea_topcentre
                   anchors.fill: topcenter
                   hoverEnabled: true
                   onEntered: {
                       topcenter.color = "red";
                       toyplane.altitude_rise();
                   }
                   onExited: {
                       topcenter.color = "green";
                       toyplane.altitudestop();
                   }

    }
    }

    QQ2.Rectangle {
     id: topright
     width: 40
     height: 40
     color: "lightgreen"
     QQ2.MouseArea {
         id: mouseArea_topright
                anchors.fill: topright
                hoverEnabled: true
                onEntered: {
                    topcenter.color = "red";
                    centerright.color = "red";

                }
                onExited: {
                    topcenter.color = "green";
                    centerright.color = "green";
                }

                onClicked: {
                    //manegment_board.color = "black"
                    toyplane.transporent_roll_rigth();
                      }

 }
 }


    QQ2.Rectangle {
        id: centerleft
        width: 40
        height: 40
        color: "green"
        QQ2.MouseArea {
            id: mouseArea_centerleft
                   anchors.fill: centerleft
                   hoverEnabled: true
                   onEntered: {
                       if (speedslider.value>0) {
                       centerleft.color = "red";
                       toyplane.leftmovefunc();
                       }
                   }
                   onExited: {

                       centerleft.color = "green";
                       toyplane.permantset()
                   }
    }
    }

        QQ2.Rectangle {
        id: centercenter
        width: 40
        height: 40
        color: "green"
        QQ2.MouseArea {
            id: mouseArea_centercenter
                   anchors.fill: centercenter
                   hoverEnabled: true
                   onEntered: {
                       centercenter.color = "red";

                   }
                   onExited: {

                       centercenter.color = "green";
                                          }
    }
        }

    QQ2.Rectangle {
        id: centerright
        width: 40
        height: 40
        color: "green"
        QQ2.MouseArea {
            id: mouseArea_centerright
                   anchors.fill: centerright
                   hoverEnabled: true
                   onEntered: {
                       if (speedslider.value>0) {
                       centerright.color = "red";

                       toyplane.rigthmovefunc();
                       }

                   }
                   onExited: {

                       centerright.color = "green";
                       //toyplane.altitudestop();
                       //bottomsphere.permantset();
                                                                 }
    }
    }

    QQ2.Rectangle {
        id: bottomleft
        width: 40
        height: 40
        color: "lightgreen"
        QQ2.MouseArea {
            id: mouseArea_bottomleft
                   anchors.fill: bottomleft
                   hoverEnabled: true
                   onEntered: {
                       centerleft.color = "red";
                       bottomcenter.color = "red";

                   }
                   onExited: {

                       centerleft.color = "green";
                       bottomcenter.color = "green";

                   }
    }
    }

    QQ2.Rectangle {
        id: bottomcenter
        width: 40
        height: 40
        color: "green"
        QQ2.MouseArea {
            id: mouseArea_bottomcenter
                   anchors.fill: bottomcenter
                   hoverEnabled: true
                   onEntered: {
                       bottomcenter.color = "red";
                       toyplane.altitude_down();
                   }
                   onExited: {

                       bottomcenter.color = "green";
                       toyplane.altitudestop();
                   }
    }
    }

    QQ2.Rectangle {
        id: bottomright
        width: 40
        height: 40
        color: "lightgreen"
        QQ2.MouseArea {
            id: mouseArea_bottomright
                   anchors.fill: bottomright
                   hoverEnabled: true
                   onEntered: {
                       centerright.color = "red";
                       bottomcenter.color = "red";

                   }
                   onExited: {

                       centerright.color = "green";
                       bottomcenter.color = "green";

                   }
    }
    }

}
}

}






}


QQ2.Rectangle {
   id:scene_3d_Board
   color:  "black"
anchors.top: root_rectangle.top
width: root_rectangle.width
height: root_rectangle.height * 0.85



Scene3D {

id: fullScene
anchors.fill: parent
focus: true
aspects: ["input", "logic"]
 cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
       //entity : Entity

multisample: true





   Entity {
    id: sceneRoot


    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: root_rectangle.width / root_rectangle.height
        nearPlane: 0.1
        farPlane: 1000.0
        position: Qt.vector3d(0.0, 10.0, 30.0)
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
    }

    FirstPersonCameraController { camera: camera }





    KeyboardDevice { id: keyboard1 }

               KeyboardHandler {
                   id: keyboardinput
                   sourceDevice: keyboard1
                   focus: true

                   onTabPressed: {
                       toyplane.roll();
                       console.log("Tab");

                   }

                   onUpPressed: {console.log("onUp");}

                   //onZPressed: {console.log("onUp");}

                   onSpacePressed: {
                       console.log("Test");
                   }





               }



               MouseDevice { id: mous1 }
               MouseHandler {
                   id: mouseinput
 //                      acceptedButtons: Qt.RightButton
//                       onTapped: console.log("right clicked")
                   onDoubleClicked:{
                       console.log("Click");
                   }
                   }


    ShadowMapLight {
        id: light
    }

    components: [
        ShadowMapFrameGraph {
            id: framegraph
            viewCamera: camera
            lightCamera: light.lightCamera
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }

      //  PickingSettings {}
      //  pickMethod: TrianglePicking
      //    faceOrientationPickingMode: FrontAndBackFace }
    ]


    AdsEffect {
        id: shadowMapEffect

        shadowTexture: framegraph.shadowTexture
        light: light
    }


    // Trefoil knot entity
    Trefoil {
        id: trefoil
        enabled: true//false
            material: AdsMaterial {
            effect: shadowMapEffect
            specularColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
        }
    }

    // Toyplane entity
    Toyplane {
        id: toyplane


        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.9, 0.5, 0.3, 1.0)
            shininess: 75


        }
    }



    ObjectPicker{
      id: toyplanePicker
    onContainsMouseChanged: {scale: 0.1;
    console.log("containsMouse: " + pick.worldIntersection)}
      onPressed:{
              console.log("Pressed at: " + pick.worldIntersection)
              //If using triangle picking, you can also see index of the pressed triangle
              console.log("Triangle index: " + pick.triangleIndex)
           scale: toyplanePicker.pressed || toyplanePicker.containsMouse ? 0.1 : 1
                      }


    }




    // Plane entity
    GroundPlane {
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.2, 0.5, 0.3, 1.0)
            specularColor: Qt.rgba(0, 0, 0, 1.0)
        }
    }

// Bottomsphere entity
    Bottomsphere {
        id: bottomsphere

        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.9, 0.5, 0.3, 1.0)
            shininess: 75
        }
    }


   }
//Column {
//    id: buttonLayout
//    anchors.bottom: parent.bottom
//    anchors.left: parent.left
//    spacing: 0
//Rectangle  {
//    width: parent.width
//    height: width * 0.2
//     color: "lightgreen"
//     anchors.bottom: parent.bottom
// }
//}
}







}
}


