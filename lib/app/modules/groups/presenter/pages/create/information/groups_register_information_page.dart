import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/create/information/groups_register_information_controller.dart';

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
                      "Registro de \nTelefone",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
