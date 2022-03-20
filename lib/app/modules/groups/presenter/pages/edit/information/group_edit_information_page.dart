import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/edit/information/group_edit_information_controller.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/shared/widgets/text_field_default.dart';

class GroupsUpdateInformationPage extends StatefulWidget {
  final String id;
  const GroupsUpdateInformationPage({Key? key, required this.id}) : super(key: key);
  @override
  GroupsUpdateInformationPageState createState() => GroupsUpdateInformationPageState();
}

class GroupsUpdateInformationPageState
    extends ModularState<GroupsUpdateInformationPage, GroupsUpdateInformationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            AppBarDefault(
              expandedHeight: 300,
              title: Modular.get<I10n>().groups_groupsUpdateInformationPage_appBarDefault_title,
              subtitle: Modular.get<I10n>().groups_groupsUpdateInformationPage_appBarDefault_subtitle,
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldDefault(
                        controller: controller.controllerName,
                        keyboardType: TextInputType.name,
                        filled: true,
                        hintText: Modular.get<I10n>().groups_groupsUpdateInformationPage_textFieldDefault_name_hintText,
                        labelText:
                            Modular.get<I10n>().groups_groupsUpdateInformationPage_textFieldDefault_name_labelText,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: GestureDetector(
                              onTap: () => controller.defineDate(context),
                              child: Observer(
                                builder: (context) => InputDecorator(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    filled: true,
                                    hintText: Modular.get<I10n>()
                                        .groups_groupsUpdateInformationPage_inputDecoration_date_hintText,
                                    labelText: Modular.get<I10n>()
                                        .groups_groupsUpdateInformationPage_inputDecoration_date_labelText,
                                  ),
                                  child: Text(
                                    Modular.get<I10n>().groups_groupsUpdateInformationPage_textFieldDefault_date_child(
                                      controller.getDay,
                                      controller.getMonth,
                                      controller.getYear,
                                    ),
                                    style: Theme.of(context).inputDecorationTheme.counterStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: GestureDetector(
                              onTap: () => controller.defineTime(context),
                              child: Observer(
                                builder: (context) => InputDecorator(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    filled: true,
                                    hintText: Modular.get<I10n>()
                                        .groups_groupsUpdateInformationPage_inputDecoration_hour_hintText,
                                    labelText: Modular.get<I10n>()
                                        .groups_groupsUpdateInformationPage_inputDecoration_hour_labelText,
                                  ),
                                  child: Text(
                                    Modular.get<I10n>().groups_groupsUpdateInformationPage_textFieldDefault_hour_child(
                                      controller.getHour,
                                      controller.getMinute,
                                    ),
                                    style: Theme.of(context).inputDecorationTheme.counterStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFieldDefault(
                              controller: controller.controllerPriceMin,
                              keyboardType: TextInputType.number,
                              filled: true,
                              hintText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMin_hintText,
                              labelText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMin_labelText,
                              prefixText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMin_prefixText,
                              inputFormatters: [controller.filterPriceMin],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFieldDefault(
                              controller: controller.controllerPriceMax,
                              keyboardType: TextInputType.number,
                              filled: true,
                              hintText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMax_hintText,
                              labelText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMax_labelText,
                              prefixText: Modular.get<I10n>()
                                  .groups_groupsUpdateInformationPage_textFieldDefault_priceMax_prefixText,
                              inputFormatters: [controller.filterPriceMax],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFieldDefault(
                        controller: controller.controllerDescription,
                        keyboardType: TextInputType.multiline,
                        maxLength: 120,
                        maxLines: 4,
                        filled: true,
                        labelText: Modular.get<I10n>()
                            .groups_groupsUpdateInformationPage_textFieldDefault_description_labelText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.update(context),
        label: Text(Modular.get<I10n>().groups_groupsUpdateInformationPage_floatingActionButton_label),
        icon: const Icon(Icons.save),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
