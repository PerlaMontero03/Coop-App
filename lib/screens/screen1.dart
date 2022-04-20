import 'package:flutter/material.dart';
import 'package:proyecto_final/menu_lateral.dart';
import 'package:proyecto_final/models/user_data_model.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Screen 1')
          ],
        ),
      ),

      drawer: MenuL(),



    ),
  );
  } 

}

// Scaffold(
//       appBar: AppBar(
//         title: const Text('Screen1'),
//       ),
//       body: Center(
//         child: Column(
//           children: const [
//             Text('Screen 1')
//           ],
//         ),
//       ),
//     )