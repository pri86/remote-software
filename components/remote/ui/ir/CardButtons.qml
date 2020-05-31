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

Item {
    width: parent.width - 60
    anchors.horizontalCenter: parent.horizontalCenter

    Grid {

       columns: 3
       columnSpacing: 2
       rowSpacing: 2

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
           visible: obj.isSupported(Remote.F_APP)
           title: qsTr("Mode") + translateHandler.emptyString
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
           visible: obj.isSupported(Remote.F_PREVIOUS)
           title: qsTr("Prev") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.previous();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_PLAY)
           title: qsTr("Play") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.play();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_NEXT)
           title: qsTr("Next") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.next();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_BACKWARD)
           title: qsTr("Bwrd") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.backward();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_STOP)
           title: qsTr("Stop") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.stop();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_FORWARD)
           title: qsTr("Fwrd") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.forward();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_INFO)
           title: qsTr("Info") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.info();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_HOME)
           title: qsTr("Shield") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.home();
           }
       }

       Button {
           visible: obj.isSupported(Remote.F_GUIDE)
           title: qsTr("Guide") + translateHandler.emptyString
           mouseArea.onClicked: {
               obj.guide();
           }
       }
    }

}
