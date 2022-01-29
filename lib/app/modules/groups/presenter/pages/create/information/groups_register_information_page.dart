import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/create/information/groups_register_information_controller.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderDefault(
                title: "Definir\nInformações",
                subtitle:
                    "Para finalizar a criação do grupo do amigo secreto, precisamos definir alguns dados sobre o grupo.",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.controllerName,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Nome",
                        labelText: "Nome",
                      ),
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
                    TextFormField(
                      controller: controller.controllerDescrible,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Descrição",
                        labelText: "Descrição",
                      ),
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
                          child: TextFormField(
                            controller: controller.controllerPriceMin,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Min",
                              labelText: "Min",
                              prefixText: "R\$ ",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            controller: controller.controllerPriceMax,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Max",
                              labelText: "Max",
                              prefixText: "R\$ ",
                            ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.register(),
        label: const Text("Registrar"),
        icon: const Icon(Icons.save),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
