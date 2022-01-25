<p align="center"><a href="https://github.com/brunocarvalhs/friends-secrets" target="_blank"><img src="https://github.com/brunocarvalhs/friends-secrets/blob/master/docs/logo.png" width="250"></a></p>

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

Inglês | [Português](/README_ptbr.md)

> As of now, this project is designed to only output builds for Android and iOS. Even though, given the current
> _stability_ of Flutter SDK for desktop (Windows, Linux and macOS) and web, there is a high probability that this
> project will eventually support builds for all platforms.

This README is intended to guide how this project is structured and should serve as a guide to help scale the project with
current and future requirements. Think of it as a map and flexible rules that guide design decisions. While
they can (and probably will) change over time, discussions must be raised to trigger such changes: this means that
let's think/question ourselves before taking an action that breaks any rational decision made here.

## Sobre

The Friends Secrets demand is for groups of people who need to present a tool for organizations of secret friends, with greater ease and patricity, from the use case when they almost ruin a secret by asking what the other friend wanted, because without knowing the likes of your secret friend is difficult, as well as the differential of the application and providing a profile with the likes that your lucky one likes.

- [Layout Figma](https://www.figma.com/file/bddo9g6PIXsmkIMxVICwUS/Friends-Secrets?node-id=0%3A1)

## Configurar

If you have no idea how to install Flutter and run it locally, check this
[_Get started_](https://flutter.dev/docs/get-started/install).

If you have Flutter setup locally, on the project's root folder, install pubspec dependencies by running
`flutter pub get`.

## Arquitetura

How this application works from inside and how it interacts with external dependencies - written in details in
[ARCHITECTURE.md](ARCHITECTURE.md).

## Contribuindo

See [CONTRIBUTING](CONTRIBUTING.md) for details about how to contribute to the project.

## Licença

Friends Secrets is published under [BSD 3-Clause](LICENSE).
