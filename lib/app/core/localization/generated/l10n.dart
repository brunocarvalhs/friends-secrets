// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(_current != null,
        'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(instance != null,
        'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `Organize seus\namigos secretos\nem um lugar`
  String get login_loginPage_headerDefault_title {
    return Intl.message(
      'Organize seus\namigos secretos\nem um lugar',
      name: 'login_loginPage_headerDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Crie grupos para realizar seu amigo\nsecreto com seus amigos`
  String get login_loginPage_headerDefault_subtitle {
    return Intl.message(
      'Crie grupos para realizar seu amigo\nsecreto com seus amigos',
      name: 'login_loginPage_headerDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Entrar com Google`
  String get login_loginPage_socialLoginButton_label {
    return Intl.message(
      'Entrar com Google',
      name: 'login_loginPage_socialLoginButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Registro de \nTelefone`
  String get login_numberRegisterPage_headerDefault_title {
    return Intl.message(
      'Registro de \nTelefone',
      name: 'login_numberRegisterPage_headerDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.`
  String get login_numberRegisterPage_headerDefault_subtitle {
    return Intl.message(
      'Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.',
      name: 'login_numberRegisterPage_headerDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Celular`
  String get login_numberRegisterPage_textFieldDefault_labelText {
    return Intl.message(
      'Celular',
      name: 'login_numberRegisterPage_textFieldDefault_labelText',
      desc: '',
      args: [],
    );
  }

  /// `(00) 0 0000-0000`
  String get login_numberRegisterPage_textFieldDefault_hintText {
    return Intl.message(
      '(00) 0 0000-0000',
      name: 'login_numberRegisterPage_textFieldDefault_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get login_numberRegisterPage_floatingActionButton_label {
    return Intl.message(
      'Registrar',
      name: 'login_numberRegisterPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Validando\nTelefone`
  String get login_numberValidationPage_headerDefault_title {
    return Intl.message(
      'Validando\nTelefone',
      name: 'login_numberValidationPage_headerDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Um código foi enviado para o telefone\nregistrado para validar seu número`
  String get login_numberValidationPage_headerDefault_subtitle {
    return Intl.message(
      'Um código foi enviado para o telefone\nregistrado para validar seu número',
      name: 'login_numberValidationPage_headerDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get login_numberValidationPage_floatingActionButton_label {
    return Intl.message(
      'Registrar',
      name: 'login_numberValidationPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Criação de\ngostos`
  String get profile_likersPage_appBarDefault_title {
    return Intl.message(
      'Criação de\ngostos',
      name: 'profile_likersPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Para que seu amigo secreto saiba seus\ngostos, nos disponibilizamos uma lista\nde coisas que gosta.`
  String get profile_likersPage_appBarDefault_subtitle {
    return Intl.message(
      'Para que seu amigo secreto saiba seus\ngostos, nos disponibilizamos uma lista\nde coisas que gosta.',
      name: 'profile_likersPage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Salvar`
  String get profile_likersPage_floatingActionButton_label {
    return Intl.message(
      'Salvar',
      name: 'profile_likersPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Notificação`
  String get notification_notificationPage_appBarDefault_title {
    return Intl.message(
      'Notificação',
      name: 'notification_notificationPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Membros`
  String get groups_groupsReadPage_text_labelMembers {
    return Intl.message(
      'Membros',
      name: 'groups_groupsReadPage_text_labelMembers',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get groups_groupsReadPage_text_descriptionMembers {
    return Intl.message(
      'Total',
      name: 'groups_groupsReadPage_text_descriptionMembers',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar novos membros`
  String get groups_groupsReadPage_text_addMembersTitle {
    return Intl.message(
      'Adicionar novos membros',
      name: 'groups_groupsReadPage_text_addMembersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ver amigo secreto`
  String get groups_groupsReadPage_text_showDrawnMembersLabel {
    return Intl.message(
      'Ver amigo secreto',
      name: 'groups_groupsReadPage_text_showDrawnMembersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Realização do sorteio`
  String get groups_groupsReadPage_alertDialog_title {
    return Intl.message(
      'Realização do sorteio',
      name: 'groups_groupsReadPage_alertDialog_title',
      desc: '',
      args: [],
    );
  }

  /// `O sorteio e realizado uma unica vez por grupo, esse processo não pode ser desfeito, deseja continuar o sorteio?`
  String get groups_groupsReadPage_alertDialog_content {
    return Intl.message(
      'O sorteio e realizado uma unica vez por grupo, esse processo não pode ser desfeito, deseja continuar o sorteio?',
      name: 'groups_groupsReadPage_alertDialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get groups_groupsReadPage_alertDialog_textButton_cancel {
    return Intl.message(
      'Cancelar',
      name: 'groups_groupsReadPage_alertDialog_textButton_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get groups_groupsReadPage_alertDialog_textButton_next {
    return Intl.message(
      'Continuar',
      name: 'groups_groupsReadPage_alertDialog_textButton_next',
      desc: '',
      args: [],
    );
  }

  /// `Sortear`
  String get groups_groupsReadPage_floatingActionButton_label {
    return Intl.message(
      'Sortear',
      name: 'groups_groupsReadPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Selecione\nos membros`
  String get groups_groupsAddMembersPage_appBarDefault_title {
    return Intl.message(
      'Selecione\nos membros',
      name: 'groups_groupsAddMembersPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto.`
  String get groups_groupsAddMembersPage_appBarDefault_subtitle {
    return Intl.message(
      'Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto.',
      name: 'groups_groupsAddMembersPage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar`
  String get groups_groupsAddMembersPage_floatingActionButton_label {
    return Intl.message(
      'Adicionar',
      name: 'groups_groupsAddMembersPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Criar Grupo`
  String get groups_groupsListPage_floatingActionButton_label {
    return Intl.message(
      'Criar Grupo',
      name: 'groups_groupsListPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Selecione\nos membros`
  String get groups_groupsRegisterMembersPage_appBarDefault_title {
    return Intl.message(
      'Selecione\nos membros',
      name: 'groups_groupsRegisterMembersPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto.`
  String get groups_groupsRegisterMembersPage_appBarDefault_subtitle {
    return Intl.message(
      'Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto.',
      name: 'groups_groupsRegisterMembersPage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get groups_groupsRegisterMembersPage_floatingActionButton_label {
    return Intl.message(
      'Continuar',
      name: 'groups_groupsRegisterMembersPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Definir\nInformações`
  String get groups_groupsRegisterInformationPage_appBarDefault_title {
    return Intl.message(
      'Definir\nInformações',
      name: 'groups_groupsRegisterInformationPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.`
  String get groups_groupsRegisterInformationPage_appBarDefault_subtitle {
    return Intl.message(
      'Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.',
      name: 'groups_groupsRegisterInformationPage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_name_labelText {
    return Intl.message(
      'Nome',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_name_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: Grupo do Trabalho`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_name_hintText {
    return Intl.message(
      'Ex.: Grupo do Trabalho',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_name_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String
      get groups_groupsRegisterInformationPage_inputDecoration_date_hintText {
    return Intl.message(
      'Data',
      name:
          'groups_groupsRegisterInformationPage_inputDecoration_date_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String
      get groups_groupsRegisterInformationPage_inputDecoration_date_labelText {
    return Intl.message(
      'Data',
      name:
          'groups_groupsRegisterInformationPage_inputDecoration_date_labelText',
      desc: '',
      args: [],
    );
  }

  /// `{day}/{month}/{year}`
  String groups_groupsRegisterInformationPage_textFieldDefault_date_child(
      String day, String month, String year) {
    return Intl.message(
      '$day/$month/$year',
      name: 'groups_groupsRegisterInformationPage_textFieldDefault_date_child',
      desc: '',
      args: [day, month, year],
    );
  }

  /// `Horário`
  String
      get groups_groupsRegisterInformationPage_inputDecoration_hour_hintText {
    return Intl.message(
      'Horário',
      name:
          'groups_groupsRegisterInformationPage_inputDecoration_hour_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Horário`
  String
      get groups_groupsRegisterInformationPage_inputDecoration_hour_labelText {
    return Intl.message(
      'Horário',
      name:
          'groups_groupsRegisterInformationPage_inputDecoration_hour_labelText',
      desc: '',
      args: [],
    );
  }

  /// `{hour}:{minute}`
  String groups_groupsRegisterInformationPage_textFieldDefault_hour_child(
      String hour, String minute) {
    return Intl.message(
      '$hour:$minute',
      name: 'groups_groupsRegisterInformationPage_textFieldDefault_hour_child',
      desc: '',
      args: [hour, minute],
    );
  }

  /// `Preço Minímo`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMin_labelText {
    return Intl.message(
      'Preço Minímo',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMin_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: 2.00`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMin_hintText {
    return Intl.message(
      'Ex.: 2.00',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMin_hintText',
      desc: '',
      args: [],
    );
  }

  /// `R$ `
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMin_prefixText {
    return Intl.message(
      'R\$ ',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMin_prefixText',
      desc: '',
      args: [],
    );
  }

  /// `Preço Máximo`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMax_labelText {
    return Intl.message(
      'Preço Máximo',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMax_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: 200.00`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMax_hintText {
    return Intl.message(
      'Ex.: 200.00',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMax_hintText',
      desc: '',
      args: [],
    );
  }

  /// `R$ `
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_priceMax_prefixText {
    return Intl.message(
      'R\$ ',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_priceMax_prefixText',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String
      get groups_groupsRegisterInformationPage_textFieldDefault_description_labelText {
    return Intl.message(
      'Descrição',
      name:
          'groups_groupsRegisterInformationPage_textFieldDefault_description_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get groups_groupsRegisterInformationPage_floatingActionButton_label {
    return Intl.message(
      'Registrar',
      name: 'groups_groupsRegisterInformationPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Selecione\na categoria`
  String get groups_groupsRegisterTypePage_appBarDefault_title {
    return Intl.message(
      'Selecione\na categoria',
      name: 'groups_groupsRegisterTypePage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Definimos tipos de amigos secretos que nossa plataforma disponibiliza para nossos usuários poderem se divertir de diversas maneiras diferentes.`
  String get groups_groupsRegisterTypePage_appBarDefault_subtitle {
    return Intl.message(
      'Definimos tipos de amigos secretos que nossa plataforma disponibiliza para nossos usuários poderem se divertir de diversas maneiras diferentes.',
      name: 'groups_groupsRegisterTypePage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get groups_groupsRegisterTypePage_floatingActionButton_label {
    return Intl.message(
      'Continuar',
      name: 'groups_groupsRegisterTypePage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }

  /// `Definir\nInformações`
  String get groups_groupsUpdateInformationPage_appBarDefault_title {
    return Intl.message(
      'Definir\nInformações',
      name: 'groups_groupsUpdateInformationPage_appBarDefault_title',
      desc: '',
      args: [],
    );
  }

  /// `Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.`
  String get groups_groupsUpdateInformationPage_appBarDefault_subtitle {
    return Intl.message(
      'Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.',
      name: 'groups_groupsUpdateInformationPage_appBarDefault_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_name_labelText {
    return Intl.message(
      'Nome',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_name_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: Grupo do Trabalho`
  String get groups_groupsUpdateInformationPage_textFieldDefault_name_hintText {
    return Intl.message(
      'Ex.: Grupo do Trabalho',
      name: 'groups_groupsUpdateInformationPage_textFieldDefault_name_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get groups_groupsUpdateInformationPage_inputDecoration_date_hintText {
    return Intl.message(
      'Data',
      name: 'groups_groupsUpdateInformationPage_inputDecoration_date_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get groups_groupsUpdateInformationPage_inputDecoration_date_labelText {
    return Intl.message(
      'Data',
      name: 'groups_groupsUpdateInformationPage_inputDecoration_date_labelText',
      desc: '',
      args: [],
    );
  }

  /// `{day}/{month}/{year}`
  String groups_groupsUpdateInformationPage_textFieldDefault_date_child(
      String day, String month, String year) {
    return Intl.message(
      '$day/$month/$year',
      name: 'groups_groupsUpdateInformationPage_textFieldDefault_date_child',
      desc: '',
      args: [day, month, year],
    );
  }

  /// `Horário`
  String get groups_groupsUpdateInformationPage_inputDecoration_hour_hintText {
    return Intl.message(
      'Horário',
      name: 'groups_groupsUpdateInformationPage_inputDecoration_hour_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Horário`
  String get groups_groupsUpdateInformationPage_inputDecoration_hour_labelText {
    return Intl.message(
      'Horário',
      name: 'groups_groupsUpdateInformationPage_inputDecoration_hour_labelText',
      desc: '',
      args: [],
    );
  }

  /// `{hour}:{minute}`
  String groups_groupsUpdateInformationPage_textFieldDefault_hour_child(
      String hour, String minute) {
    return Intl.message(
      '$hour:$minute',
      name: 'groups_groupsUpdateInformationPage_textFieldDefault_hour_child',
      desc: '',
      args: [hour, minute],
    );
  }

  /// `Preço Minímo`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMin_labelText {
    return Intl.message(
      'Preço Minímo',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMin_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: 2.00`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMin_hintText {
    return Intl.message(
      'Ex.: 2.00',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMin_hintText',
      desc: '',
      args: [],
    );
  }

  /// `R$ `
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMin_prefixText {
    return Intl.message(
      'R\$ ',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMin_prefixText',
      desc: '',
      args: [],
    );
  }

  /// `Preço Máximo`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMax_labelText {
    return Intl.message(
      'Preço Máximo',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMax_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Ex.: 200.00`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMax_hintText {
    return Intl.message(
      'Ex.: 200.00',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMax_hintText',
      desc: '',
      args: [],
    );
  }

  /// `R$ `
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_priceMax_prefixText {
    return Intl.message(
      'R\$ ',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_priceMax_prefixText',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String
      get groups_groupsUpdateInformationPage_textFieldDefault_description_labelText {
    return Intl.message(
      'Descrição',
      name:
          'groups_groupsUpdateInformationPage_textFieldDefault_description_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Salvar alteração`
  String get groups_groupsUpdateInformationPage_floatingActionButton_label {
    return Intl.message(
      'Salvar alteração',
      name: 'groups_groupsUpdateInformationPage_floatingActionButton_label',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
