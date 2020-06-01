/******************************************************************************
 *
 * Copyright (C) 2018-2019 Marton Borzak <hello@martonborzak.com>
 *
 * This file is part of the YIO-Remote software project.
 *
 * YIO-Remote software is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * YIO-Remote software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with YIO-Remote software. If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *****************************************************************************/
import QtQuick 2.11
import Style 1.0
import Haptic 1.0

import Entity.Remote 1.0

import "qrc:/basic_ui" as BasicUI

Item {
    width: parent.width - 60
    anchors.horizontalCenter: parent.horizontalCenter

    Grid {

       columns: 3
       spacing: 30

       anchors.top: parent.top
       anchors.horizontalCenter: parent.horizontalCenter

       Rectangle {
           id: bg
           visible: obj.isSupported(Remote.F_POWER_TOGGLE) || (obj.isSupported(Remote.F_POWER_ON) && obj.isSupported(Remote.F_POWER_OFF))
           width: 110
           height: 60
           radius: height/2
           color: Style.color.red

           Text {
               color: Style.color.line
               text: Style.icon.power_on
               renderType: Text.NativeRendering
               width: 70
               height: 70
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignHCenter
               font {family: "icons"; pixelSize: 60 }
               anchors.centerIn: parent
           }

           MouseArea {
               id: mouseArea
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   if (obj.isSupported(Remote.F_POWER_TOGGLE)) {
                       obj.powerToggle();
                   } else if (obj.isSupported(Remote.F_POWER_ON) && obj.isSupported(Remote.F_POWER_OFF)) {
                       if (obj.isOn)
                           obj.powerOff();
                       else
                           obj.powerOn();
                   }
               }
           }
       } // Rectangle end

       Button {
           visible: obj.isSupported(Remote.F_HOME)
           title: Style.icon.myhome
           mouseArea.onClicked: {
               obj.shield_home();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_RECORD)
           title: Style.icon.myrecord
           mouseArea.onClicked: {
               obj.record();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_PREVIOUS)
           title: Style.icon.myprev
           mouseArea.onClicked: {
               obj.previous();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_PLAY)
           title: Style.icon.myplay
           mouseArea.onClicked: {
               obj.play();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_NEXT)
           title: Style.icon.mynext
           mouseArea.onClicked: {
               obj.next();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_BACKWARD)
           title: Style.icon.mybackward
           mouseArea.onClicked: {
               obj.backward();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_STOP)
           title: Style.icon.mystop
           mouseArea.onClicked: {
               obj.stop();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_FORWARD)
           title: Style.icon.myforward
           mouseArea.onClicked: {
               obj.forward();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_INFO)
           title: Style.icon.myinfo
           mouseArea.onClicked: {
               obj.info();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_GUIDE)
           title: Style.icon.myepg
           mouseArea.onClicked: {
               obj.guide();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_LIVE)
           title: Style.icon.mymenu
           mouseArea.onClicked: {
               obj.kodi_menu();
           }
       }
    }

    Grid {

       columns: 4
       spacing: 50

       anchors.bottom: parent.bottom
       anchors.horizontalCenter: parent.horizontalCenter

       Rectangle {
           visible: obj.isSupported(Remote.F_FUNCTION_GREEN)
           width: 60
           height: 60
           radius: height/2
           color: "#41b812"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.av_green();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_FUNCTION_RED)
           width: 60
           height: 60
           radius: height/2
           color: "#d13530"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.av_red();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_FUNCTION_BLUE)
           width: 60
           height: 60
           radius: height/2
           color: "#3347cc"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.av_blue();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_FUNCTION_YELLOW)
           width: 60
           height: 60
           radius: height/2
           color: "#e9ed09"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.av_yellow();
               }
           }
       }

    }

}
