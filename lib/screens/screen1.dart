import 'package:flutter/material.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {
                
              }),
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Screen 1')
          ],
        ),
      ),
  
      drawer: const MenuL(),
  
  
  
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