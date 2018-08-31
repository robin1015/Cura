// Copyright (c) 2018 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import UM 1.2 as UM
import Cura 1.0 as Cura

Item {
    id: root;
    
    property var base_height: parent.height;
    property var base_width: parent.width;
    property var expand_height: true
    property var expand_width: true
    property var expanded: false;
    property var overlap_x: false;
    property var overlap_y: false;

    property alias button_delegate: expand_button.children;
    property alias pane_delegate: content.children;

    height: expanded ? childrenRect.height : base_height;
    width: base_width;

    // The open button
    Rectangle {
        id: expand_button_background;
        height: base_height;
        width: base_width;
        color: {
            if (expand_button.pressed || expanded) {
                return UM.Theme.getColor("sidebar_header_active");
            } else if (expand_button.containsMouse) {
                return UM.Theme.getColor("sidebar_header_hover");
            } else {
                return UM.Theme.getColor("sidebar_header_bar");
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: 50;
            }
        }
        z: 9998;
    }
    MouseArea {
        id: expand_button;
        anchors.fill: expand_button_background;
        hoverEnabled: true;
        onClicked: {
            expanded = !expanded;
        }
        z: 9999;
    }

    // The fold-out area
    Rectangle {
        id: content_background;
        color: "white";
        visible: expanded;
        anchors.fill: content;
        z: 9996;
        radius: 4;
    }
    Rectangle {
        id: content;
        visible: expanded;
        anchors.top: !overlap_y ? expand_button.bottom : parent.top;
        anchors.left: !overlap_x ? expand_button.right : parent.left;
        width: {
            if (!expand_width) {
                return base_width;
            }
            return expanded ? childrenRect.width : base_width;
        }
        height: {
            if (!expand_height) {
                return base_height;
            }
            return expanded ? childrenRect.height : base_height;
        }
        Behavior on height {
            NumberAnimation {
                duration: 50;
            }
        }
        clip: true;
        z: 9997;
        radius: 4;
    }
}