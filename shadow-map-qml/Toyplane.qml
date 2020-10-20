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

import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0

import QtQml 2.13 //timer


Entity {
    id: root

    Timer {
    id: roottimer

           interval: 100; running: true; repeat: true
           onTriggered: permantntmove() ;
                  }

    property Material material

    Mesh {
        id: toyplaneMesh
        source: "assets/obj/toyplane.obj"
    }

    Transform {
        id: toyplaneTransform
        property real speedup: 1
        property real rollAngle: 0
        property real pitchAngle: 15
        property double altitude: -4
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
        property real permanty: 0
         property real permantz: 0
         property real check: 0
        property real damount: 0

        //property real divfs: 0
onAltitudeChanged: altitudemeter.value=altitude




        QQ2.Behavior on rollAngle { QQ2.SpringAnimation { spring: 2; damping: 0.2} }
         QQ2.Behavior on transporentAngle { QQ2.SpringAnimation { spring: 2; damping: 0.2} }
         QQ2.Behavior on altitude {QQ2.SpringAnimation { spring: 2; damping: 0.2}}


         signal altitudestopsignal();
         onAltitudestopsignal: {
             toyplaneTransform.daltitude=0;
             toyplaneTransform.permanty=0
//roll_Animation_to_null.start()
         }

         signal altitude_risesignal();
       onAltitude_risesignal: {
           if (toyplaneTransform.altitude==-4 & toyplaneTransform.dstrate==0 & toyplaneTransform.drigth==0){
              toyplaneTransform.dstrate = toyplaneTransform.dstrate - (toyplaneTransform.damount);
               toyplaneTransform.permantx =toyplaneTransform.dstrate;
               if (toyplaneTransform.damount < 0.15) {toyplaneTransform.daltitude=0}
       }
           else if (toyplaneTransform.damount < 0.15) {toyplaneTransform.daltitude=0}

else {
           toyplaneTransform.daltitude = 0.5 * toyplaneTransform.damount;
           toyplaneTransform.altitude=toyplaneTransform.altitude + toyplaneTransform.daltitude;
           toyplaneTransform.permanty =toyplaneTransform.daltitude;

           //roll_transporent_Animation.start();
           //roll_Animation_to_rollAngle.start();
           }
    }

       signal altitude_downsignal();
     onAltitude_downsignal: {
         toyplaneTransform.daltitude = -0.5 * toyplaneTransform.damount;
         toyplaneTransform.altitude=toyplaneTransform.altitude + toyplaneTransform.daltitude;
         toyplaneTransform.permanty =toyplaneTransform.daltitude;
     }

      
         signal rigthmovesignal();
         onRigthmovesignal: {
                    toyplaneTransform.rollAngle = 20;
                    toyplaneTransform.check = 0;
                    toyplaneTransform.transporentAngle -=90;


                    if (toyplaneTransform.permantz>=0 && toyplaneTransform.permantx<=0)
                    {toyplaneTransform.drigth = -0.8 * damount; toyplaneTransform.dstrate = -0.2 * damount;}

                    if (toyplaneTransform.permantz<0 && toyplaneTransform.permantx <0)
                    {toyplaneTransform.drigth = -0.5 * damount; toyplaneTransform.dstrate = 0.8 *damount;}

                    if (toyplaneTransform.permantz <0 && toyplaneTransform.permantx >0)
                    {toyplaneTransform.drigth = 0.8 *damount; toyplaneTransform.dstrate = 0.5* damount;}

                    if (toyplaneTransform.permantz >0 && toyplaneTransform.permantx > 0)
                    {toyplaneTransform.drigth = 0.5 *damount; toyplaneTransform.dstrate = -0.8 *damount;}

                    else{}//toyplaneTransform.drigth = damount;}
                    toyplaneTransform.permantx =toyplaneTransform.dstrate;
                     toyplaneTransform.permantz =toyplaneTransform.drigth;





                    roll_transporent_Animation.start()

                    roll_Animation_to_rollAngle.start()

                        }


                signal leftmovesignal();
                        onLeftmovesignal: {

                            toyplaneTransform.rollAngle = -15;

                            toyplaneTransform.transporentAngle +=90;


                            if (toyplaneTransform.permantz>=0 && toyplaneTransform.permantx<=0)
                            {toyplaneTransform.drigth = 0.8 * damount; toyplaneTransform.dstrate = 0.5 * damount;}

                            if (toyplaneTransform.permantz<0 && toyplaneTransform.permantx <0)
                            {toyplaneTransform.drigth = 0.5 * damount; toyplaneTransform.dstrate = -0.8 *damount;}

                            if (toyplaneTransform.permantz <0 && toyplaneTransform.permantx >0)
                            {toyplaneTransform.drigth = -0.8 *damount; toyplaneTransform.dstrate = -0.5* damount;}

                            if (toyplaneTransform.permantz >0 && toyplaneTransform.permantx > 0)
                            {toyplaneTransform.drigth = -0.5 *damount; toyplaneTransform.dstrate = 0.8 *damount;}

                            else{}//toyplaneTransform.drigth = damount;}
                            toyplaneTransform.permantx =toyplaneTransform.dstrate;
                             toyplaneTransform.permantz =toyplaneTransform.drigth;

                                }



signal permantsignal();

                onPermantsignal: {
if (toyplaneTransform.damount < 0.1) {
                    toyplaneTransform.permantx =dstrate;
                     toyplaneTransform.permantz =drigth;
                    toyplaneTransform.permanty =daltitude;
                   toyplaneTransform.drigth = 0;
                   toyplaneTransform.dstrate = 0;
                   toyplaneTransform.daltitude = 0;
    if (altitude > -0.3) {toyplaneTransform.daltitude = -0.2}
}
    else {}

                    }


                signal permantmovesignal();

                 onPermantmovesignal: {
                     toyplaneTransform.permantx =dstrate;
                      toyplaneTransform.permantz =drigth;
                     toyplaneTransform.permanty =daltitude;
   toyplaneTransform.rigth = toyplaneTransform.rigth + toyplaneTransform.drigth + (toyplaneTransform.permantz * toyplaneTransform.speedup);//drigth;
   toyplaneTransform.strate = toyplaneTransform.strate + toyplaneTransform.dstrate + (toyplaneTransform.permantx * toyplaneTransform.speedup)
   toyplaneTransform.altitude = toyplaneTransform.altitude + toyplaneTransform.daltitude + (toyplaneTransform.permanty  * toyplaneTransform.speedup);
   roll_Animation_to_rollAngle.start()
                                                    }

           signal speedchangesignal();
           onSpeedchangesignal: {
           var old_damount = toyplaneTransform.damount;
               toyplaneTransform.damount = speedslider.value;
              if (old_damount  === 0) {old_damount  = 0.05}
              else {toyplaneTransform.speedup = toyplaneTransform.damount / old_damount};
           }

        signal click();
        onClick: {

              }


signal transporent_roll_rigthsignal();
        onTransporent_roll_rigthsignal: {toyplaneTransform.transporentAngle -= 15
        }

 signal transporent_roll_leftsignal();
                onTransporent_roll_leftsignal: {toyplaneTransform.transporentAngle += 15
                }



        matrix: {

             var m = Qt.matrix4x4();



var vec1 = Qt.vector3d(Math.sin(angle * Math.PI / 180) * scaleFactor + compenx + strate + dstrate + permantx,
                       altitude +permanty,
                      Math.cos(angle * Math.PI / 180) * scaleFactor + compenz + rigth + drigth + permantz);
            var vec2 = Qt.vector3d(0,1,0);



            m.translate( Qt.vector3d(Math.sin(angle * Math.PI / 180) * scaleFactor + compenx + strate + dstrate + permantx,
                                          altitude,
                                         Math.cos(angle * Math.PI / 180) * scaleFactor + compenz + rigth + drigth + permantz));


            m.rotate(angle, Qt.vector3d(0, 1, 0));
            m.rotate(pitchAngle, Qt.vector3d(0, 0, 1));
            m.rotate(rollAngle, Qt.vector3d(1, 0, 0));
            m.rotate(transporentAngle, Qt.vector3d(0, 1, 0));
            m.scale(1.0 / toyplaneTransform.scaleFactor);





            var l = vec1.length();

          //  if (l > 16) toyplaneTransform.rigthmovefunc(); //roottimer.start();


///////////////////////
   //          bottomsphere.setParent(toyplane);



//             calc.input_X_TPlayne =m.m14;
//             var difx = calc.result_XX;
//             if (difx) toyplaneTransform.btcsignal();
//             console.log("difx:" + difx.toString());
//             console.log("calc.input_X_TPlayne =" + calc.input_X_TPlayne.toString());
//             console.log("calc.input_X_BSph =" + calc.input_X_BSph.toString());

            return m
            }
    }





       function transporentAngle() {
        transporent_Animation.loops = 1;
        transporent_Animation.start();
        toyplaneTransform.key_up();
    }


     function altitudestop(){
toyplaneTransform.altitudestopsignal();
     }

    function altitude_rise(){


 toyplaneTransform.altitude_risesignal();
    }

    function  altitude_down(){


 toyplaneTransform.altitude_downsignal();
    }



    function rigthmovefunc(){


                   toyplaneTransform.rigthmovesignal();   //}
            }





        function leftmovefunc(){

                       toyplaneTransform.leftmovesignal();
            }



    function permantntmove(){
    toyplaneTransform.permantmovesignal();
    }


    function permantset(){
            toyplaneTransform.permantsignal();
       }


function speedchange(){
toyplaneTransform.speedchangesignal();
    }

function transporent_roll_rigth() {
    toyplaneTransform.transporent_roll_rigthsignal();
}
function transporent_roll_left() {
    toyplaneTransform.transporent_roll_leftsignal();
}

function roll_to_null() {
    toyplaneTransform.roll_to_nulltsignal();
}




    //-------------------------------------------------------------------------------



             QQ2.NumberAnimation {
     id:  roll_Animation_to_rollAngle
             target: toyplaneTransform; property: "rollAngle";
        to: toyplaneTransform.rollAngle;
        duration: 300; easing.type: QQ2.Easing.InOutQuad }

             QQ2.NumberAnimation {
             id:  roll_Animation_to_null
             target: toyplaneTransform; property: "rollAngle";  to: 0;
             duration: 1000; easing.type: QQ2.Easing.InOutQuad }


       QQ2.NumberAnimation {
       id:  transporent_Animation
      target: toyplaneTransform; property: "transporentAngle";
      to: toyplaneTransform.transporentAngle; duration: 2000; easing.type: QQ2.Easing.OutQuart }



    components: [
        toyplaneMesh,
        toyplaneTransform,
        material,
        toyplanePicker
            ]




}
