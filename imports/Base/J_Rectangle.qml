import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Shape{
    id: shape
    property int topLeftRadius: 0
    property int topRightRadius: 0
    property int bottomLeftRadius: 0
    property int bottomRightRadius: 0
    property color color: "#ffffff"
    property color borderColor: "transparent"
    property int borderWidth: 0

    layer.enabled: true
    layer.samples: 4
    layer.smooth: true

    ShapePath {
        startX: 0
        startY: topLeftRadius
        fillColor: shape.color
        strokeColor: shape.borderColor
        strokeWidth: shape.borderWidth
        PathQuad { x: topLeftRadius; y: 0; controlX: 0; controlY: 0 }
        PathLine { x: shape.width - topLeftRadius; y: 0 }
        PathQuad { x: shape.width; y: topRightRadius; controlX: shape.width; controlY: 0 }
        PathLine { x: shape.width; y: shape.height - bottomLeftRadius }
        PathQuad { x: shape.width - bottomLeftRadius; y: shape.height; controlX: shape.width; controlY: shape.height }
        PathLine { x: bottomRightRadius; y: shape.height }
        PathQuad { x: 0; y: shape.height - bottomRightRadius; controlX: 0; controlY: shape.height }
        PathLine { x: 0; y: topLeftRadius }
    }
}
