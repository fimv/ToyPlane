//import Qt3D.Core 2.0
//import Qt3D.Render 2.0
import Qt3D.Extras 2.0

import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import QtQml 2.13 //timer



Entity {
    id: root


    property Material material

    SphereMesh {
        id: bottomsphereMesh

        radius: 12
            }

    Transform {
        id: bottomsphereTransform




        property real rollAngle: 0
        property real pitchAngle: 15
        property real altitude: 4
        property real transporentAngle: 0
        property real angle: 180
       property real compenx: 0
       property real compenz: 0
        property real angleBegin: 0
        property real scaleFactor: 10
        property real rigth: 0
        property real daltitude: 0
        property real strate: 0
         property real drigth: 0
         property real dstrate: 0
        property real permantx: 0
         property real permantz: 0
         property real check: 0
        property real damount: 0.3

        //property real divfs: 0





           matrix: { var btsph = Qt.matrix4x4();
           btsph.translate(Qt.vector3d(-2,4,0));
                calc.input_X_BSph = btsph.m14;


               var vec2 = Qt.vector3d(0,1,0)



               btsph.translate( Qt.vector3d(Math.sin(angle * Math.PI / 180) * scaleFactor + compenx + strate + dstrate ,
                                             altitude,
                                            Math.cos(angle * Math.PI / 180) * scaleFactor + compenz + rigth + drigth));


               btsph.rotate(angle, Qt.vector3d(0, 1, 0));
               btsph.rotate(pitchAngle, Qt.vector3d(0, 0, 1));
               btsph.rotate(rollAngle, Qt.vector3d(1, 0, 0));
               btsph.rotate(transporentAngle, Qt.vector3d(0, 1, 0));
               btsph.scale(1.0 / bottomsphereTransform.scaleFactor);




                return btsph;

                  }



           function roll(){


                          bottomsphereTransform.click();   //}
                   }

           function transporentAngle() {
               transporent_Animation.loops = 1;
               transporent_Animation.start();
               bottomsphereTransform.key_up();


           }


           function brigthmovefunc() {


                          bottomsphereTransform.brigthmovesignal();   //}
                   }





               function leftmovefunc(){

                              bottomsphereTransform.leftmovesignal();
                   }



           function permantntmove(){

               bottomsphereTransform.rigth = bottomsphereTransform.rigth + bottomsphereTransform.drigth + bottomsphereTransform.permant;//drigth;
            bottomsphereTransform.permantmovesignal();
           }


           function permantset(){
                   bottomsphereTransform.permantsignal();
              }






           //-------------------------------------------------------------------------------




            QQ2.NumberAnimation {
               id: angle_Animation //id:  smophAngle_Animation
               running:false

          target: bottomsphereTransform
          property: "angle"
          duration: 8000
          from: bottomsphereTransform.angleBegin
          to: bottomsphereTransform.angle
          }





                    QQ2.NumberAnimation {
            id:  roll_Animation_to_rollAngle
            running: true
               target: bottomsphereTransform; property: "rollAngle";  to: bottomsphereTransform.rollAngle;
               duration: 1000; easing.type: QQ2.Easing.InOutQuad }



}

    components: [
       bottomsphereMesh,
        bottomsphereTransform,
        material
    ]
}
