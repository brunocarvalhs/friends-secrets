import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_register/number_register_controller.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';

class NumberRegisterPage extends StatefulWidget {
  const NumberRegisterPage({Key? key}) : super(key: key);
  @override
  NumberRegisterPageState createState() => NumberRegisterPageState();
}

class NumberRegisterPageState extends ModularState<NumberRegisterPage, NumberRegisterController> {
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
                title: "Registro de \nTelefone",
                subtitle: "Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.",
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        prefixText: "+55 ",
                        filled: true,
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
        onPressed: () => controller.postPhone(),
        label: const Text("Registrar"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
