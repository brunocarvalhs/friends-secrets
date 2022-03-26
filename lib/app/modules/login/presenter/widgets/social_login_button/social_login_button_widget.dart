import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;

  const SocialLoginButtonWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  factory SocialLoginButtonWidget.google({
    VoidCallback? onTap,
    required String label,
  }) =>
      SocialLoginButtonWidget(
        icon: google,
        label: label,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme?.background,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            BorderSide(
              color: Theme.of(context).buttonTheme.colorScheme?.background ??
                  Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(icon),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
