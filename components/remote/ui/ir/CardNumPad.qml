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

       Button {
           visible: obj.isSupported(Remote.F_APP)
           title: qsTr("Shield") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.app();
           }
       }

       Button {
           visible: false
           title: "dummy"
           mouseArea.onClicked: {
               obj.app();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_SOURCE)
           title: qsTr("Source") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.source();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_1)
           title: "1"
           mouseArea.onClicked: {
               obj.channel(1);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_2)
           title: "2"
           mouseArea.onClicked: {
               obj.channel(2);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_3)
           title: "3"
           mouseArea.onClicked: {
               obj.channel(3);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_4)
           title: "4"
           mouseArea.onClicked: {
               obj.channel(4);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_5)
           title: "5"
           mouseArea.onClicked: {
               obj.channel(5);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_6)
           title: "6"
           mouseArea.onClicked: {
               obj.channel(6);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_7)
           title: "7"
           mouseArea.onClicked: {
               obj.channel(7);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_8)
           title: "8"
           mouseArea.onClicked: {
               obj.channel(8);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_9)
           title: "9"
           mouseArea.onClicked: {
               obj.channel(9);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_FORMAT_AUTO)
           title: Style.icon.mysettings
           mouseArea.onClicked: {
               obj.tv_menu();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_0)
           title: "0"
           mouseArea.onClicked: {
               obj.channel(0);
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_DIGIT_10)
           title: Style.icon.myreturn
           mouseArea.onClicked: {
               obj.tv_prev_ch();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_PLAYTOGGLE)
           title: Style.icon.myinfo
           mouseArea.onClicked: {
               obj.avr_info();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_CHANNEL_SEARCH)
           title: Style.icon.mysubtitle
           mouseArea.onClicked: {
               obj.subtitle();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_FORMAT_4_3)
           title: Style.icon.myaudio
           mouseArea.onClicked: {
               obj.audio();
           }
       }
    }

    Grid {

       columns: 4
       spacing: 50

       anchors.bottom: parent.bottom
       anchors.horizontalCenter: parent.horizontalCenter

       Rectangle {
           visible: obj.isSupported(Remote.F_DIGIT12)
           width: 60
           height: 60
           radius: height/2
           color: "#d13530"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.tv_red();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_DIGIT11)
           width: 60
           height: 60
           radius: height/2
           color: "#41b812"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.tv_green();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_DIGIT_ENTER)
           width: 60
           height: 60
           radius: height/2
           color: "#e9ed09"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.tv_yellow();
               }
           }
       }

       Rectangle {
           visible: obj.isSupported(Remote.F_DIGIT_SEPARATOR)
           width: 60
           height: 60
           radius: height/2
           color: "#3347cc"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   Haptic.playEffect(Haptic.Click);
                   obj.tv_blue();
               }
           }
       }

    }
}
