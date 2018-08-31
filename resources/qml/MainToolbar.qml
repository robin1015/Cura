// Copyright (c) 2018 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

import UM 1.2 as UM
import Cura 1.0 as Cura

import ".."

Item
{
    height: UM.Theme.getSize("sidebar_header").height
    Rectangle
    {
        color: UM.Theme.getColor("sidebar_header_bar")
        anchors.fill: parent
    }
    Row
    {
        height: parent.height
        spacing: 16
        FoldOutPanel {
            id: printer_selection
            base_width: 250
            expand_width: false
            overlap_x: true
            button_delegate: Row
            {
                anchors.verticalCenter: parent.verticalCenter
                Label {
                    text: "This is an icon"
                    color: "white"
                }
                Label {
                    text: "Fold me out"
                    color: "white"
                }
            }
            pane_delegate: Column
            {
                spacing: 8
                Rectangle
                {
                    width: 32
                    height: 32
                    color: "yellow"
                }
                Rectangle
                {
                    width: 32
                    height: 32
                    color: "yellow"
                }
            }
            
        }
        FoldOutPanel {
            id: extruder_configuration
            base_width: 500
            button_delegate: Rectangle
            {
                color: "grey"
                Label {
                    text: "Extruders"
                }
            }
            pane_delegate: Column
            {
                spacing: 8
                Rectangle
                {
                    width: 32
                    height: 32
                    color: "yellow"
                }
                Rectangle
                {
                    width: 32
                    height: 32
                    color: "yellow"
                }
            }
            
        }

        Rectangle
        {
            height: parent.height
            width: 200
            color: "red"
        }
    }
}
