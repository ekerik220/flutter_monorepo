import 'package:flutter/material.dart';
import 'package:shared/test_widget.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text(
              'Tablet app',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            TestWidget(),
          ],
        ),
      ),
    );
  }
}
