import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Templates as T
Button{
    //只显示图标
    display: Button.IconOnly
    property int iconSize: 20
    property string iconName
    property bool disabled: false
    property int radius: 4
    property color hoverColor: "#efefef"
    property color pressedColor: "#dfdfde"
    property color normalColor:  Qt.rgba(0,0,0,0)
    property color disableColor: Qt.rgba(0,0,0,0)
    property Component iconDelegate: com_icon
    property color color:{
        if(!enabled){
            return disableColor
        }
        if(pressed){
            return pressedColor
        }
        return hovered ? hoverColor : normalColor
    }
    property color iconColor: {
        if(!enabled){
            return Qt.rgba(130/255,130/255,130/255,1)
        }
        return Qt.rgba(0,0,0,1)
    }
    property color textColor: Qt.rgba(7,7,7,255)
    id: control
    padding: 0
    verticalPadding: 8
    horizontalPadding: 8
    enabled: !disabled
    font.family: "Courier New"
    font.pixelSize: 12
    background: Rectangle{
        implicitWidth: 30
        implicitHeight: 30
        radius: control.radius
        color: control.color
    }
    Component{
        id: com_icon
        J_Icon{
            id: text_icon
            font.pixelSize: iconSize
            iconSize: control.iconSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            iconColor: control.iconColor
            iconName: control.iconName
        }
    }
    Component{
        id: com_row
        RowLayout{
            Loader{
                sourceComponent: iconDelegate
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.TextOnly
            }
            Text{
                text:control.text
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.IconOnly
                color: control.textColor
                font: control.font
            }
        }
    }
    Component{
        id: com_column
        ColumnLayout{
            Loader{
                sourceComponent: iconDelegate
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.TextOnly
            }
            Text{
                text:control.text
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.IconOnly
                color: control.textColor
                font: control.font
            }
        }
    }
    contentItem: Loader{
        sourceComponent: {
            if(display === Button.TextUnderIcon){
                return com_column
            }
            return com_row
        }
    }
    T.ToolTip{
        id: tool_tip
        visible: {
            if(control.text === ""){
                return false
            }
            if(control.display !== Button.IconOnly){
                return false
            }
            return hovered
        }
        text: control.text
        delay: 1000
        font.family: "Andale Mono"
        margins: 6
        padding: 6
        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
            contentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
            contentHeight + topPadding + bottomPadding)
        closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent
        contentItem: Text {
            text: control.text
            font: control.font
            wrapMode: Text.Wrap
        }
        background: Rectangle {
            color: Qt.rgba(1,1,1,1)
            radius: 3
            J_Shadow{
                radius: 3
            }
        }
    }
}