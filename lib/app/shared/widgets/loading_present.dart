import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';
import 'package:lottie/lottie.dart';

class LoadingPresent extends StatelessWidget {
  const LoadingPresent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Lottie.asset(loadingAnimated),
      ),
    );
  }
}
