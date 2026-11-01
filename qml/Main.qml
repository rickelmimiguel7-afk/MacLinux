import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    width: 1100
    height: 720
    minimumWidth: 820
    minimumHeight: 560
    visible: true
    title: "MacLinux"
    color: "#10131d"

    property string page: "welcome"
    property string glassMode: "Full Glass"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#263b60" }
            GradientStop { position: 0.52; color: "#171d31" }
            GradientStop { position: 1.0; color: "#080b13" }
        }
    }

    // Camadas decorativas leves; blur real será implementado no Glass Engine
    // com fallback automático para GPUs antigas.
    Rectangle {
        width: 430; height: 430; radius: 215
        x: parent.width * 0.62; y: -130
        color: "#397acb"; opacity: 0.16
    }
    Rectangle {
        width: 360; height: 360; radius: 180
        x: -110; y: parent.height * 0.58
        color: "#9a6ad7"; opacity: 0.13
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 34
        spacing: 20

        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "◈  MacLinux"
                color: "white"
                font.pixelSize: 22
                font.weight: Font.DemiBold
            }
            Item { Layout.fillWidth: true }
            Label {
                text: "LIQUID GLASS  ·  PREVIEW"
                color: "#b9c8e3"
                font.pixelSize: 11
                font.letterSpacing: 2
            }
        }

        Item { Layout.fillHeight: true }

        GlassPanel {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: Math.min(window.width - 80, 680)
            Layout.preferredHeight: 410

            StackLayout {
                anchors.fill: parent
                currentIndex: window.page === "welcome" ? 0 : 1

                ColumnLayout {
                    spacing: 18
                    Label {
                        text: "Bem-vindo ao MacLinux"
                        color: "white"
                        font.pixelSize: 34
                        font.weight: Font.Medium
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Label {
                        text: "Uma nova experiência Linux, com uma interface fluida e elegante."
                        color: "#d3dced"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }
                    Item { Layout.fillHeight: true }
                    Label {
                        text: "Prévia do ambiente e do assistente de instalação"
                        color: "#aebbd1"
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Button {
                        text: "Começar"
                        Layout.alignment: Qt.AlignHCenter
                        onClicked: window.page = "installer"
                    }
                }

                Installer {
                    onFinished: window.page = "welcome"
                }
            }
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.fillWidth: true
            Label { text: "MacLinux 0.1 · Projeto em desenvolvimento"; color: "#9eabc2"; font.pixelSize: 11 }
            Item { Layout.fillWidth: true }
            Label { text: "Perfil visual: " + window.glassMode; color: "#c9d7ed"; font.pixelSize: 11 }
        }
    }
}
