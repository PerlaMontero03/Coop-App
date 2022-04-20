import 'package:flutter/material.dart';
import 'package:proyecto_final/models/user_data_model.dart';

class MenuL extends StatefulWidget {
  MenuL({Key? key}) : super(key: key);

  

  @override
  State<MenuL> createState() => _MenuLState();
}

class _MenuLState extends State<MenuL> {

  UserData userData = UserData();

  @override
  void initState() {
    print(userData.nombre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/coop-dgii.png'),
                  fit: BoxFit.cover
                )
              ),
              child: Text('Hola Fulano')
            ),

            Row(
              children: [
                const Text('Hola ', style: TextStyle(color: Colors.blue)),
                Text(userData.nombre, style: const TextStyle(color:Color.fromARGB(255, 43, 134, 46)),),
              ],
            ),

            ListTile(
              title: const Text('Cuentas'),
              leading: const Icon(Icons.savings_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Cuentas'),
              leading: const Icon(Icons.savings_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Cuentas'),
              leading: const Icon(Icons.savings_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            )
            
          ],
        ),
      );
  }

  
}