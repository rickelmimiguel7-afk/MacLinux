import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    signal finished()
    property int step: 0

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "Instalar MacLinux"
                color: "white"
                font.pixelSize: 25
                font.weight: Font.Medium
            }
            Item { Layout.fillWidth: true }
            Label { text: (step + 1) + " de 5"; color: "#c6d5ea" }
        }

        ProgressBar {
            Layout.fillWidth: true
            from: 0; to: 4; value: step
        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: step

            ColumnLayout {
                Label { text: "Idioma e região"; color: "white"; font.pixelSize: 21 }
                Label { text: "Escolha o idioma usado durante a instalação."; color: "#d2dced" }
                ComboBox { model: ["Português (Brasil)", "English", "Español"]; Layout.preferredWidth: 260 }
                Item { Layout.fillHeight: true }
            }
            ColumnLayout {
                Label { text: "Teclado"; color: "white"; font.pixelSize: 21 }
                Label { text: "Selecione o layout do teclado."; color: "#d2dced" }
                ComboBox { model: ["Português (Brasil ABNT2)", "US", "Português"]; Layout.preferredWidth: 300 }
                Item { Layout.fillHeight: true }
            }
            ColumnLayout {
                Label { text: "Conexão"; color: "white"; font.pixelSize: 21 }
                Label { text: "A conexão Wi-Fi será configurada pelo serviço de rede do sistema."; color: "#d2dced"; wrapMode: Text.WordWrap }
                Label { text: "Nesta prévia, nenhuma alteração de rede é realizada."; color: "#9fb1cc" }
                Item { Layout.fillHeight: true }
            }
            ColumnLayout {
                Label { text: "Disco de instalação"; color: "white"; font.pixelSize: 21 }
                Label {
                    text: "A seleção e o particionamento de discos ainda não estão conectados. Esta prévia NÃO apaga nem modifica discos."
                    color: "#ffd99a"
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                Item { Layout.fillHeight: true }
            }
            ColumnLayout {
                Label { text: "Pronto para continuar"; color: "white"; font.pixelSize: 21 }
                Label {
                    text: "O assistente visual está funcionando como protótipo. A instalação real será habilitada após integração com o sistema live e validação de segurança."
                    color: "#d2dced"
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                Item { Layout.fillHeight: true }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Button {
                text: "Voltar"
                enabled: step > 0
                onClicked: step--
            }
            Item { Layout.fillWidth: true }
            Button {
                text: step === 4 ? "Concluir prévia" : "Continuar"
                onClicked: {
                    if (step < 4) step++
                    else finished()
                }
            }
        }
    }
}
