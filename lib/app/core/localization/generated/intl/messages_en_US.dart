// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(day, month, year, hour, minute) =>
      "Date: ${day}/${month}/${year} ás ${hour}:${minute}";

  static String m1(price) => "Ceiling price: R\$ ${price}";

  static String m2(price) => "Best price: R\$ ${price}";

  static String m3(type) => "Type: ${type}";

  static String m4(day, month, year) => "${day}/${month}/${year}";

  static String m5(hour, minute) => "${hour}:${minute}";

  static String m6(day, month, year) => "${day}/${month}/${year}";

  static String m7(hour, minute) => "${hour}:${minute}";

  static String m8(count) => "All ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "groups_groupsAddMembersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Based on your contact list,\nlist the users who are linked in the app, thus making it easier to select your secret buddy members."),
        "groups_groupsAddMembersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Select\nmembers"),
        "groups_groupsAddMembersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Add"),
        "groups_groupsListPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Create group"),
        "groups_groupsReadPage_alertDialog_content":
            MessageLookupByLibrary.simpleMessage(
                "The draw is carried out only once per group, this process cannot be undone, do you want to continue the draw?"),
        "groups_groupsReadPage_alertDialog_textButton_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "groups_groupsReadPage_alertDialog_textButton_next":
            MessageLookupByLibrary.simpleMessage("Next"),
        "groups_groupsReadPage_alertDialog_title":
            MessageLookupByLibrary.simpleMessage("Conducting the draw"),
        "groups_groupsReadPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Draw"),
        "groups_groupsReadPage_text_addMembersTitle":
            MessageLookupByLibrary.simpleMessage("Add new members"),
        "groups_groupsReadPage_text_dataDatails": m0,
        "groups_groupsReadPage_text_descriptionMembers":
            MessageLookupByLibrary.simpleMessage("All"),
        "groups_groupsReadPage_text_labelDatails":
            MessageLookupByLibrary.simpleMessage("Datails"),
        "groups_groupsReadPage_text_labelMembers":
            MessageLookupByLibrary.simpleMessage("Members"),
        "groups_groupsReadPage_text_priceMaxDatails": m1,
        "groups_groupsReadPage_text_priceMinDatails": m2,
        "groups_groupsReadPage_text_showDrawnMembersLabel":
            MessageLookupByLibrary.simpleMessage("See secret friend"),
        "groups_groupsReadPage_text_type": m3,
        "groups_groupsRegisterInformationPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "To finish creating the secret friend\'s group, we need to define some data about the group."),
        "groups_groupsRegisterInformationPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Set\nInformation"),
        "groups_groupsRegisterInformationPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Registrar"),
        "groups_groupsRegisterInformationPage_inputDecoration_date_hintText":
            MessageLookupByLibrary.simpleMessage("Date"),
        "groups_groupsRegisterInformationPage_inputDecoration_date_labelText":
            MessageLookupByLibrary.simpleMessage("Date"),
        "groups_groupsRegisterInformationPage_inputDecoration_hour_hintText":
            MessageLookupByLibrary.simpleMessage("Hour"),
        "groups_groupsRegisterInformationPage_inputDecoration_hour_labelText":
            MessageLookupByLibrary.simpleMessage("Hour"),
        "groups_groupsRegisterInformationPage_textFieldDefault_date_child": m4,
        "groups_groupsRegisterInformationPage_textFieldDefault_description_labelText":
            MessageLookupByLibrary.simpleMessage("Description"),
        "groups_groupsRegisterInformationPage_textFieldDefault_hour_child": m5,
        "groups_groupsRegisterInformationPage_textFieldDefault_name_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: Working Group"),
        "groups_groupsRegisterInformationPage_textFieldDefault_name_labelText":
            MessageLookupByLibrary.simpleMessage("Name"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 200.00"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_labelText":
            MessageLookupByLibrary.simpleMessage("Ceiling price"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMax_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 2.00"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_labelText":
            MessageLookupByLibrary.simpleMessage("Best price"),
        "groups_groupsRegisterInformationPage_textFieldDefault_priceMin_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "groups_groupsRegisterMembersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Based on your contact list,\nlist the users who are linked in the app, thus making it easier to select your secret buddy members."),
        "groups_groupsRegisterMembersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Select\nmembers"),
        "groups_groupsRegisterMembersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Next"),
        "groups_groupsRegisterTypePage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "We define types of secret friends that our platform makes available for our users to have fun in different ways."),
        "groups_groupsRegisterTypePage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Select\nthe category"),
        "groups_groupsRegisterTypePage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Next"),
        "groups_groupsUpdateInformationPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "To finish creating the secret friend\'s group, we need to define some data about the group."),
        "groups_groupsUpdateInformationPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Set\nInformation"),
        "groups_groupsUpdateInformationPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Save update"),
        "groups_groupsUpdateInformationPage_inputDecoration_date_hintText":
            MessageLookupByLibrary.simpleMessage("Date"),
        "groups_groupsUpdateInformationPage_inputDecoration_date_labelText":
            MessageLookupByLibrary.simpleMessage("Date"),
        "groups_groupsUpdateInformationPage_inputDecoration_hour_hintText":
            MessageLookupByLibrary.simpleMessage("Hour"),
        "groups_groupsUpdateInformationPage_inputDecoration_hour_labelText":
            MessageLookupByLibrary.simpleMessage("Hour"),
        "groups_groupsUpdateInformationPage_textFieldDefault_date_child": m6,
        "groups_groupsUpdateInformationPage_textFieldDefault_description_labelText":
            MessageLookupByLibrary.simpleMessage("Description"),
        "groups_groupsUpdateInformationPage_textFieldDefault_hour_child": m7,
        "groups_groupsUpdateInformationPage_textFieldDefault_name_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: Working Group"),
        "groups_groupsUpdateInformationPage_textFieldDefault_name_labelText":
            MessageLookupByLibrary.simpleMessage("Name"),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMax_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 200.00"),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMax_labelText":
            MessageLookupByLibrary.simpleMessage("Ceiling price"),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMax_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMin_hintText":
            MessageLookupByLibrary.simpleMessage("Ex.: 2.00"),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMin_labelText":
            MessageLookupByLibrary.simpleMessage("Best price"),
        "groups_groupsUpdateInformationPage_textFieldDefault_priceMin_prefixText":
            MessageLookupByLibrary.simpleMessage("R\$ "),
        "login_loginPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "Create groups to make your friend\nsecret with your friends"),
        "login_loginPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage(
                "Organize your\nsecret friends\nin a place"),
        "login_loginPage_socialLoginButton_label":
            MessageLookupByLibrary.simpleMessage("Login with Google"),
        "login_numberRegisterPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Register"),
        "login_numberRegisterPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "By registering your phone, the group\norganiser will be able to include you in the secret\nfriend."),
        "login_numberRegisterPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage("Phone\nregistration"),
        "login_numberRegisterPage_textFieldDefault_hintText":
            MessageLookupByLibrary.simpleMessage("(00) 0 0000-0000"),
        "login_numberRegisterPage_textFieldDefault_labelText":
            MessageLookupByLibrary.simpleMessage("Cell phone"),
        "login_numberValidationPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Register"),
        "login_numberValidationPage_headerDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "A code has been sent to the registered\nphone to validate your number"),
        "login_numberValidationPage_headerDefault_title":
            MessageLookupByLibrary.simpleMessage("Validating\nPhone"),
        "notification_notificationPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Notification"),
        "profile_likersPage_appBarDefault_subtitle":
            MessageLookupByLibrary.simpleMessage(
                "So that your secret friend knows your\nlikes, we provide a list\ndof things he/she likes."),
        "profile_likersPage_appBarDefault_title":
            MessageLookupByLibrary.simpleMessage("Creation of\nlikes"),
        "profile_likersPage_floatingActionButton_label":
            MessageLookupByLibrary.simpleMessage("Save"),
        "profile_profilePageState_text_descriptionLikes":
            MessageLookupByLibrary.simpleMessage("Likes"),
        "profile_profilePageState_text_descriptionLikesCount": m8
      };
}
