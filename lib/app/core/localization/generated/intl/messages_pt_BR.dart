// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static String m0(day, month, year) => "${day}/${month}/${year}";

  static String m1(hour, minute) => "${hour}:${minute}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "groups_groupsAddMembersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto."),
        "groups_groupsAddMembersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Selecione\nos membros"),
        "groups_groupsAddMembersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Adicionar"),
        "groups_groupsListPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Criar Grupo"),
        "groups_groupsReadPage_alertDialog_content":
            MessageLookupByLibrary.simpleMessage(
                "O sorteio e realizado uma unica vez por grupo, esse processo não pode ser desfeito, deseja continuar o sorteio?"),
        "groups_groupsReadPage_alertDialog_textButton_cancel":
            MessageLookupByLibrary.simpleMessage("Cancelar"),
        "groups_groupsReadPage_alertDialog_textButton_next":
            MessageLookupByLibrary.simpleMessage("Continuar"),
        "groups_groupsReadPage_alertDialog_title":
            MessageLookupByLibrary.simpleMessage("Realização do sorteio"),
        "groups_groupsReadPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Sortear"),
        "groups_groupsReadPage_text_addMembersTitle":
            MessageLookupByLibrary.simpleMessage("Adicionar novos membros"),
        "groups_groupsReadPage_text_descriptionMembers":
            MessageLookupByLibrary.simpleMessage("Total"),
        "groups_groupsReadPage_text_labelMembers":
            MessageLookupByLibrary.simpleMessage("Membros"),
        "groups_groupsReadPage_text_showDrawnMembersLabel":
            MessageLookupByLibrary.simpleMessage("Ver amigo secreto"),
        "groups_groupsRegisterInformationPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo."),
        "groups_groupsRegisterInformationPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Definir\nInformações"),
        "groups_groupsRegisterInformationPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Registrar"),
        "groups_groupsRegisterInformationPage_inputDecoration_date_hintText":
            MessageLookupByLibrary.simpleMessage("Data"),
        "groups_groupsRegisterInformationPage_inputDecoration_date_labelText":
            MessageLookupByLibrary.simpleMessage("Data"),
        "groups_groupsRegisterInformationPage_inputDecoration_hour_hintText":
            MessageLookupByLibrary.simpleMessage("Horário"),
        "groups_groupsRegisterInformationPage_inputDecoration_hour_labelText":
            MessageLookupByLibrary.simpleMessage("Horário"),
        "groups_groupsRegisterInformationPage_textFieldDefault_date_child": m0,
        "groups_groupsRegisterInformationPage_textFieldDefault_description_labelText":
            MessageLookupByLibrary.simpleMessage("Descrição"),
        "groups_groupsRegisterInformationPage_textFieldDefault_hour_child": m1,
        "groups_groupsRegisterInformationPage_textFieldDefault_name_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: Grupo do Trabalho"),
        "groups_groupsRegisterInformationPage_textFieldDefault_name_labelText":
            MessageLookupByLibrary.simpleMessage("Nome"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 200.00"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_labelText":
            MessageLookupByLibrary.simpleMessage("Preço Máximo"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 2.00"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_labelText":
            MessageLookupByLibrary.simpleMessage("Preço Minímo"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "groups_groupsRegisterMembersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto."),
        "groups_groupsRegisterMembersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Selecione\nos membros"),
        "groups_groupsRegisterMembersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Continuar"),
        "groups_groupsRegisterTypePage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Definimos tipos de amigos secretos que nossa plataforma disponibiliza para nossos usuários poderem se divertir de diversas maneiras diferentes."),
        "groups_groupsRegisterTypePage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Selecione\na categoria"),
        "groups_groupsRegisterTypePage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Continuar"),
        "login_loginPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Crie grupos para realizar seu amigo\nsecreto com seus amigos"),
        "login_loginPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage(
                "Organize seus\namigos secretos\nem um lugar"),
        "login_loginPage_socialLoginButton_label":
            MessageLookupByLibrary.simpleMessage("Entrar com Google"),
        "login_numberRegisterPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Registrar"),
        "login_numberRegisterPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto."),
        "login_numberRegisterPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage("Registro de \nTelefone"),
        "login_numberRegisterPage_textFieldDefault_hintText":
            MessageLookupByLibrary.simpleMessage("(00) 0 0000-0000"),
        "login_numberRegisterPage_textFieldDefault_labelText":
            MessageLookupByLibrary.simpleMessage("Celular"),
        "login_numberValidationPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Registrar"),
        "login_numberValidationPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Um código foi enviado para o telefone\nregistrado para validar seu número"),
        "login_numberValidationPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage("Validando\nTelefone"),
        "notification_notificationPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Notificação"),
        "profile_likersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Para que seu amigo secreto saiba seus\ngostos, nos disponibilizamos uma lista\nde coisas que gosta."),
        "profile_likersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Criação de\ngostos"),
        "profile_likersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Salvar")
      };
}
