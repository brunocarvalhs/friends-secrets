import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
