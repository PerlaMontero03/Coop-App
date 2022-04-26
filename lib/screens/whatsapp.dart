import 'package:flutter/material.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {

  //Función para abrir un chat en WhatsApp con la institución
  void _launchWhatsApp (String number, message) async {
    String url = "whatsapp://send?phone=$number&text=$message";

    await canLaunch(url) ? launch(url) : showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error al Enviar Mensaje'),
        content: const Text('No es posible abrir Whatsapp. Intente descargar la aplicación en su tienda de aplicaciones.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
          child: ListView(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/logo.png'),
                ) 
              ),

              const SizedBox(height: 60),

              Column(
                children: [
                  const Text('Contacténos vía WhatsApp', 
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 43, 134, 46),
                    ),
                  ),

              const SizedBox(height: 20),

              const Text('Para su comodidad, estamos disponibles también en Whatsapp. Si presenta algún problema, por favor escribirnos.',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,

              ),
              ),

              const SizedBox(height: 40),

              Center(
              // ignore: avoid_unnecessary_containers
              child: Container(
                // padding: const EdgeInsets.only(right: 320),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.whatsapp,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _launchWhatsApp('8494510798','Hola');
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    primary: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 43, 134, 46),),
                  label: const Text('Escribir al WhatsApp', style: TextStyle(fontSize: 20),)
                ),
              ),
              ),
                ],
              )
            ],
          ),
       ),

       drawer: const MenuL(),
      ),
    );
  }  
}