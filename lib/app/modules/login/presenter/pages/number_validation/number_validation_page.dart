import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_validation/number_validation_controller.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';

class NumberValidationPage extends StatefulWidget {
  final String? verificadId;

  const NumberValidationPage({Key? key, required this.verificadId}) : super(key: key);
  @override
  NumberValidationPageState createState() => NumberValidationPageState();
}

class NumberValidationPageState extends ModularState<NumberValidationPage, NumberValidationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderDefault(
                title: "Validando\nTelefone",
                subtitle: "Um código foi enviado para o telefone\nregistrado para validar seu número",
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[0],
                        focusNode: controller.focus[0],
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[1]),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[1],
                        focusNode: controller.focus[1],
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[2]),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[2],
                        focusNode: controller.focus[2],
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[3]),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[3],
                        focusNode: controller.focus[3],
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[4]),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[4],
                        focusNode: controller.focus[4],
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[5]),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[5],
                        focusNode: controller.focus[5],
                        onChanged: (value) => FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton.extended(
          enableFeedback: false,
          onPressed: () => controller.validation(),
          label: const Text("Registrar"),
        );
      }),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
