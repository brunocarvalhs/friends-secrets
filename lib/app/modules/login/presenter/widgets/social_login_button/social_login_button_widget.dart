import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Color fontColor;
  final Color background;
  final Color borderColor;
  final VoidCallback? onTap;
  final TextStyle? styleLabel;

  const SocialLoginButtonWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.fontColor,
    required this.background,
    required this.borderColor,
    this.styleLabel,
    this.onTap,
  }) : super(key: key);

  factory SocialLoginButtonWidget.google({
    VoidCallback? onTap,
    required String label,
    TextStyle? styleLabel,
  }) =>
      SocialLoginButtonWidget(
        icon: google,
        label: label,
        fontColor: const Color(0xFF5A5A5A),
        background: const Color(0xFFE4E4E4),
        borderColor: const Color(0xFF5A5A5A),
        onTap: onTap,
        styleLabel: styleLabel,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            BorderSide(
              color: background,
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
                    style: styleLabel,
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
