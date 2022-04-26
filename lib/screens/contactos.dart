// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Contactos extends StatefulWidget {
  const Contactos({ Key? key }) : super(key: key);

  @override
  State<Contactos> createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {

  final double lat = 18.475253950255446;
  final double lng = -69.90295443068801;

  //Función para hacer llamadas
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '8092872700',
    );
    await launchUrl(launchUri);
  }

  //Función para abrir en el navegador la página web
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  //Función para abrir la app de email y enviar email a la institución
  _launchEmail()async{
    launch("mailto:info@coopdgii.com");
  }

  //Función para desplegar un bottom sheet para seleccionar una app de mapas
  // y abrir la app en la ubicación de la institución
  openMapsSheet(context) async {
    try {
      final coords = Coords(lat, lng);
      const title = "Cooperativa Nacional de Servicios Múltiples de los Empleados de la Dirección General de Impuestos Internos";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    //Variable que guarda la dirección de la página
    final Uri toLaunch =
      Uri(scheme: 'https', host:'www.coopdgii.com');

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
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: ListView(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/logo.png'),
                ) 
              ),

              const SizedBox(height: 25),

               const ListTile(
                leading: Icon(Icons.call_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
                title: Text('Contactos', 
                 style: TextStyle(
                  color: Color.fromARGB(255, 43, 134, 46),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

              const SizedBox(height: 10),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Oficina', 
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 43, 134, 46),
                  ),
              ),

              const SizedBox(height: 10),

              const Text('Teléfono: (809) 287-2700',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,

                  ),
              ),

              const SizedBox(height: 20),

              Container(
                  padding: const EdgeInsets.only(right: 250),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.call,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      _makePhoneCall('tel:8092872700');
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 43, 134, 46),),
                    label: const Text('Llamar', style: TextStyle(fontSize: 20),)
                  ),
              ),

              const SizedBox(height: 30),

              const Text('Correo: info@coopdgii.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,

                  ),
              ),

              const SizedBox(height: 20),

              Container(
                  padding: const EdgeInsets.only(right: 200),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.mail,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      _launchEmail();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 43, 134, 46),),
                    label: const Text('Enviar correo', style: TextStyle(fontSize: 20),)
                  ),
              ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('Localización', 
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 43, 134, 46),
                  ),
              ),

              const SizedBox(height: 10),

              const Text('Av. Pedro Henríquez Ureña #29 Gazcue, Santo Domingo, República Dominicana',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,

                  ),
              ),

              const SizedBox(height: 30),

              Container(
                  padding: const EdgeInsets.only(right: 160),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.location_on,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      openMapsSheet(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 43, 134, 46),),
                    label: const Text('Ver ubicación en el mapa', style: TextStyle(fontSize: 20),)
                  ),
              ),
                    ],
                  ),
                ),
              ),
              

              const SizedBox(height: 30),

              Container(
                // padding: const EdgeInsets.only(right: 225),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.language,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    _launchInBrowser(toLaunch);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    primary: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 43, 134, 46),),
                  label: const Text('Visitar página web', style: TextStyle(fontSize: 20),)
                ),
              ),
            ],
          ),
        ),

        drawer: const MenuL(),
      ),
    );
  }
}