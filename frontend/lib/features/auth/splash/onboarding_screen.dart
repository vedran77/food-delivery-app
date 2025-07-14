import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text("Abc"),
      ElevatedButton(
          onPressed: () {
            context.go("/splash");
          },
          child: Text("Hello"))
    ]));
  }
}
