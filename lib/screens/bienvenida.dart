import 'package:flutter/material.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserData user = UserData();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 247, 187),
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu_outlined,
                      color: Color.fromARGB(255, 43, 134, 46),
                      size: 40
                    ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),

            actions: [
              IconButton(
                color: const Color.fromARGB(255, 43, 134, 46),
                icon: const Icon(Icons.notifications_outlined,
                  size: 35,
                ),
                onPressed: () {}),
              ],

              expandedHeight: 400.0,
              floating: true,
              pinned: true,
              snap: true,
              flexibleSpace: 

              FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.asset(
                          'assets/foto2.png',
                          fit: BoxFit.cover,
                    )),
                  ],
                ),
              ),
            ),
            
            
          ];
        },
        body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Card(
            elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Hola ', 
                        style: TextStyle(
                          color: Colors.blue, 
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                        ), 
                      ),
                      Text(user.nombre, 
                        style: const TextStyle(
                          color:Color.fromARGB(255, 43, 134, 46),
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        ),
      ),
        
      ),
    ),
        
        drawer: const MenuL(),
      ),
    );

  }
}