import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => const UnknownPage());

  @override
  Widget build(BuildContext context) {
    return const Text('Unknown page');
  }
}
