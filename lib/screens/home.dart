import 'package:flutter/material.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:proyecto_final/navigation_tools/bottom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
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
                onPressed: () {}),
          ],
        ),
        body: Center(
          child: Column(
            children: const [
              Text('Home')
            ],
          ),
        ),
  
        drawer: const MenuL(),
        bottomNavigationBar: const BotttomNavBar(),
      ),
  );
  } 

}