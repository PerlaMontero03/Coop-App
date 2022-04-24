import 'package:flutter/material.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Screen 4')
          ],
        ),
      ),
      drawer: const MenuL(),
    );
  }
}