import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Screen 3')
          ],
        ),
      ),
    ),
  );
  }
}