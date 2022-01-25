<p align="center"><a href="https://github.com/brunocarvalhs/friends-secrets" target="_blank"><img src="https://github.com/brunocarvalhs/friends-secrets/blob/develop/docs/images/logo.png" width="150"></a></p>

<p align="center">
    <a href="https://github.com/brunocarvalhs/friends-secrets/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/brunocarvalhs/friends-secrets" alt="License">
    </a>
    <a href="https://github.com/brunocarvalhs/friends-secrets/issues">
        <img src="https://img.shields.io/github/issues/brunocarvalhs/friends-secrets" alt="Issues">
    </a>
</p>

<p align="center">
    <a href="https://github.com/brunocarvalhs/friends-secrets/actions/workflows/build_release.yml">
        <img src="https://github.com/brunocarvalhs/friends-secrets/actions/workflows/build_release.yml/badge.svg" alt="Build Release">
    </a>
    <a href="https://github.com/brunocarvalhs/friends-secrets/actions/workflows/build_develop.yml">
        <img src="https://github.com/brunocarvalhs/friends-secrets/actions/workflows/build_develop.yml/badge.svg" alt="Build Develop">
    </a>
</p>

Inglês | [Português](docs/README_ptbr.md)

> A partir de agora, este projeto é projetado para produzir apenas compilações para Android e iOS. Mesmo assim, dado o atual
> _estabilidade_ do Flutter SDK para desktop (Windows, Linux e macOS) e web, há uma grande probabilidade de que isso
> o projeto eventualmente suportará compilações para todas as plataformas.

Este README tem como objetivo orientar como este projeto está estruturado e deve servir como um guia para ajudar a dimensionar o projeto com
requisitos atuais e futuros. Pense nisso como um mapa e regras flexíveis que orientam as decisões de design. Enquanto
eles podem (e provavelmente irão) mudar ao longo do tempo, as discussões devem ser levantadas para desencadear tais mudanças: isso significa que
vamos pensar / nos questionar antes de tomar uma ação que quebra qualquer decisão racional feita aqui.

## Sobre

A demanda do Friends Secrets é por grupos de pessoas que precisam de uma ferramenta para organização grupos de amigos secretos, com a maior facilidade e patricidade, a partir do caso de uso quando quase estragaram um amigo secreto por questionar qual presente o outro queria, pois sem saber os gostos de seu amigo secreto fica dificil, assim como diferencial do aplicativo e disponibilizar um perfil com os gostos que o seu sorteado gosta.

- [Layout Figma](https://www.figma.com/file/bddo9g6PIXsmkIMxVICwUS/Friends-Secrets?node-id=0%3A1)

## Configurar

Se você não tem ideia de como instalar o Flutter e executá-lo localmente, marque este
[_Iniciar_](https://flutter.dev/docs/get-started/install).

Se você tiver o Flutter configurado localmente, na pasta raiz do projeto, instale as dependências do pubspec executando
`flutter pub get`.

## Arquitetura

Como este aplicativo funciona de dentro e como ele interage com dependências externas - escrito em detalhes em
[ARQUITETURA](ARCHITECTURE_ptbr.md).

## Contribuindo

Veja [CONTRIBUINDO](CONTRIBUTING_ptbr.md) para detalhes sobre como contribuir para o projeto.

## Licença

Friends Secrets is published under [BSD 3-Clause](LICENSE).
