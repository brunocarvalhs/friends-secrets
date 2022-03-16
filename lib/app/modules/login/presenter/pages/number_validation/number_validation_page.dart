import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_validation/number_validation_controller.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              HeaderDefault(
                title: Modular.get<I10n>().login_numberValidationPage_headerDefault_title,
                subtitle: Modular.get<I10n>().login_numberValidationPage_headerDefault_subtitle,
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
                        maxLength: 1,
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[1]),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
                        maxLength: 1,
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[2]),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
                        maxLength: 1,
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[3]),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
                        maxLength: 1,
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[4]),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
                        maxLength: 1,
                        onChanged: (value) => FocusScope.of(context).requestFocus(controller.focus[5]),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
                        maxLength: 1,
                        onChanged: (value) => FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
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
          label: Text(Modular.get<I10n>().login_numberValidationPage_floatingActionButton_label),
        );
      }),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
