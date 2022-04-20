import 'package:flutter/material.dart';
import 'package:proyecto_final/screens/screen1.dart';
import 'package:proyecto_final/screens/screen2.dart';
import 'package:proyecto_final/screens/screen3.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  
  int myindex = 0;
  List <Widget> widgetList = const[
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myindex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 43, 134, 46),
        currentIndex: myindex,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'Solicitud',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.phone_in_talk_outlined),
          label: 'Contacto',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.whatsapp_outlined),
          label: 'WhatsApp',
        )
      ]) ,
    );
  }
}