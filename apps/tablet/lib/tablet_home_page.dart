import 'package:flutter/material.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tablet app',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
