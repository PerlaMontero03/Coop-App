import 'package:flutter/material.dart';
import 'package:proyecto_final/screens/resumen.dart';
import 'package:proyecto_final/screens/screen1.dart';
import 'package:proyecto_final/screens/contactos.dart';
import 'package:proyecto_final/screens/whatsapp.dart';

class BotttomNavBar extends StatefulWidget {
  const BotttomNavBar({Key? key}) : super(key: key);

  @override
  State<BotttomNavBar> createState() => _BotttomNavBarState();
}

class _BotttomNavBarState extends State<BotttomNavBar> {
  
  int myindex = 0;
  List <Widget> widgetList = const[
    Resumen(),
    Contactos(),
    WhatsApp(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
            child: widgetList[myindex],
          ),
      
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: const Color.fromARGB(255, 43, 134, 46),
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
            currentIndex: myindex,
            items: const [
              BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              label: 'Inicio', 
              tooltip: 'Inicio',
            ),
      
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_in_talk_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              label: 'Contacto',
              tooltip: 'Contacto',
            ),
      
            BottomNavigationBarItem(
              icon: Icon(Icons.whatsapp_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              label: 'WhatsApp',
              tooltip: 'WhatsApp',
            )
          ]
        ) ,
      ),
    );
  }
}