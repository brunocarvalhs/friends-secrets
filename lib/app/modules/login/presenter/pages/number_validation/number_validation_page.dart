import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_validation/number_validation_controller.dart';

class NumberValidationPage extends StatefulWidget {
  const NumberValidationPage({Key? key}) : super(key: key);
  @override
  NumberValidationPageState createState() => NumberValidationPageState();
}

class NumberValidationPageState extends ModularState<NumberValidationPage, NumberValidationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Validando\nTelefone",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Um código foi enviado para o telefone\nregistrado para validar seu número",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 36,
                      child: TextField(
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
                      child: TextField(
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
                      child: TextField(
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
                      child: TextField(
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
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: controller.inputs[4],
                        focusNode: controller.focus[4],
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
      floatingActionButton: FloatingActionButton.extended(
        enableFeedback: false,
        onPressed: () => controller.redirect(),
        label: const Text("Registrar"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
