import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/widgets/loading_present.dart';

class LoadingDefault extends StatelessWidget {
  const LoadingDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [LoadingPresent()],
      ),
    );
  }
}
