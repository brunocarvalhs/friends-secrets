import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/create/information/groups_register_information_controller.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/shared/widgets/text_field_default.dart';

class GroupsRegisterInformationPage extends StatefulWidget {
  const GroupsRegisterInformationPage({Key? key}) : super(key: key);
  @override
  GroupsRegisterInformationPageState createState() => GroupsRegisterInformationPageState();
}

class GroupsRegisterInformationPageState
    extends ModularState<GroupsRegisterInformationPage, GroupsRegisterInformationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            const AppBarDefault(
              expandedHeight: 280,
              title: "Definir\nInformações",
              subtitle:
                  "Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.",
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
                        hintText: "Nome",
                        labelText: "Nome",
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
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    hintText: "Data",
                                    labelText: "Data",
                                  ),
                                  child: Text(
                                    "${controller.getDay} / ${controller.getMonth} / ${controller.getYear}",
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
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    hintText: "Horário",
                                    labelText: "Horário",
                                  ),
                                  child: Text(
                                    "${controller.getHour} : ${controller.getMinute}",
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
                              hintText: "Min",
                              labelText: "Min",
                              prefixText: "R\$ ",
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFieldDefault(
                              controller: controller.controllerPriceMax,
                              keyboardType: TextInputType.number,
                              filled: true,
                              hintText: "Max",
                              labelText: "Max",
                              prefixText: "R\$ ",
                            ),
                          ),
                        ],
                      ),
                      Observer(
                        builder: (context) => RangeSlider(
                          values: controller.rangeSliderDiscreteValues,
                          min: 0,
                          max: 100,
                          onChanged: (price) => controller.setPrice(price),
                        ),
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
                        hintText: "Descrição",
                        labelText: "Descrição",
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
        onPressed: () => controller.register(context),
        label: const Text("Registrar"),
        icon: const Icon(Icons.save),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
