# MacLinux

Sistema Linux baseado em Ubuntu LTS, com shell próprio em Qt 6/QML e identidade visual Liquid Glass.

## Estado deste repositório

Este é o **primeiro scaffold executável do projeto**:
- protótipo visual do shell e do assistente de instalação em Qt Quick;
- perfis gráficos Lite, Balanced e Full Glass;
- workflow GitHub Actions para validar o projeto e publicar o código como artefato.

**Ainda não é uma ISO instalável.** A criação de uma ISO universal exige integrar kernel, initramfs, bootloader, instalador, pacotes e testes em BIOS Legacy/UEFI. O workflow atual prepara e valida a base; a geração da ISO será adicionada depois que a base do instalador estiver implementada.

## Requisitos de desenvolvimento

- Ubuntu LTS (ambiente Linux para compilar e testar)
- Qt 6 / Qt Quick / QML
- CMake
- Qt Declarative e Qt Quick Controls

No Windows, edite os arquivos normalmente. A compilação Linux será executada pelo GitHub Actions.

## Protótipo local

Em Ubuntu com Qt 6 instalado:

```bash
sudo apt update
sudo apt install -y cmake g++ qt6-base-dev qt6-declarative-dev qml6-module-qtquick qml6-module-qtquick-controls qml6-module-qtquick-layouts
cmake -S . -B build
cmake --build build
./build/maclinux-shell
```

## Próximos marcos

1. Executar e testar o shell QML.
2. Implementar navegação real do instalador e backend seguro de particionamento.
3. Integrar o instalador ao sistema live do Ubuntu.
4. Construir ISO híbrida x86-64 com boot UEFI e BIOS Legacy.
5. Testar em máquinas virtuais e hardware físico.
