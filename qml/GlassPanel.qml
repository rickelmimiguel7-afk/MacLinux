import QtQuick

Rectangle {
    default property alias content: body.data
    radius: 28
    color: "#28ffffff"
    border.color: "#55ffffff"
    border.width: 1

    // A transparência funciona como fallback inicial.
    // Blur/backdrop sampling será acrescentado no compositor/Glass Engine.
    Rectangle {
        anchors.fill: parent
        anchors.margins: 1
        radius: parent.radius - 1
        color: "#12dceaff"
        opacity: 0.22
    }

    Item {
        id: body
        anchors.fill: parent
        anchors.margins: 30
    }
}
