import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text('Mobile app'),
            SharedWidget(),
          ],
        ),
      ),
    );
  }
}
