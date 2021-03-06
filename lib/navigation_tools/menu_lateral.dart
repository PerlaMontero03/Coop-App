import 'package:flutter/material.dart';
import 'package:proyecto_final/screens/cuentas.dart';
import 'package:proyecto_final/screens/descuentos.dart';
import 'package:proyecto_final/screens/home.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'package:proyecto_final/screens/lista_noticias.dart';
import 'package:proyecto_final/screens/login.dart';
import 'package:proyecto_final/screens/lista_solicitudes.dart';
import 'package:proyecto_final/screens/prestamos.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuL extends StatefulWidget {
  const MenuL({Key? key}) : super(key: key);

  @override
  State<MenuL> createState() => _MenuLState();
}

class _MenuLState extends State<MenuL> {

  UserData userData = UserData();

  //Función para abrir un chat en WhatsApp con la institución
  //Usada para la sección de ayuda y sugerencias
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
              child: Text('')
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text('Hola ', 
                    style: TextStyle(
                      color: Colors.blue, 
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  Text(userData.nombre, 
                    style: const TextStyle(
                      color:Color.fromARGB(255, 43, 134, 46),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              title: const Text('Inicio', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.home_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),

            ListTile(
              title: const Text('Cuentas', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.savings_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Cuentas()),
                );
              },
            ),

            ListTile(
              title: const Text('Préstamos', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.monetization_on_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Prestamos()),
                )
              },
            ),

            ListTile(
              title: const Text('Inversiones', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.attach_money_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ExpansionTile(
              title: const Text("Solicitudes", style: TextStyle(fontSize: 18)),
              backgroundColor: const Color.fromARGB(255, 238, 232, 232), 
              textColor: const Color.fromARGB(255, 43, 134, 46),
              iconColor: const Color.fromARGB(255, 43, 134, 46),
              leading: const Icon(Icons.receipt_long_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              children: <Widget>[
                ListTile(
                  title: const Text('Ver Solicitudes', style: TextStyle(fontSize: 18)),
                  leading: const Icon(Icons.view_list_outlined, color: Color.fromARGB(255, 43, 134, 46),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ListaSolicitudes()),
                    );
                  },
                ),

                // ListTile(
                //   title: const Text('Solicitud de Préstamos', style: TextStyle(fontSize: 18)),
                //   leading: const Icon(Icons.feed_outlined, color: Color.fromARGB(255, 43, 134, 46),),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),

                // ListTile(
                //   title: const Text('Solicitud de Cuentas', style: TextStyle(fontSize: 18)),
                //   leading: const Icon(Icons.feed_outlined, color: Color.fromARGB(255, 43, 134, 46),),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
              ],
            ),

            ListTile(
              title: const Text('Descuentos', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.calculate_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Descuentos()),
                );
              },
            ),

            ListTile(
              title: const Text('Noticias', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.newspaper_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ListaNoticias()),
                    );

              },
            ),

            ListTile(
              title: const Text('Sugerencias', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.topic_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                _launchWhatsApp('8494510798','Hola');
              },
            ),

            ListTile(
              title: const Text('Ayuda', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.contact_support_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                _launchWhatsApp('8494510798','Hola');
              },
            ),

            ListTile(
              title: const Text('Tasas', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.currency_exchange_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Configuración', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.settings_outlined, color: Color.fromARGB(255, 43, 134, 46),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 40, 60, 10),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      label: const Text('Salir', style: TextStyle(color: Color.fromARGB(255, 43, 134, 46), fontSize: 20),),
                      icon: const Icon(Icons.power_settings_new_outlined, color: Colors.black,),
                      backgroundColor: Colors.white,
      
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(80, 10, 80, 40),
                    child: Row(
                      children: const [
                        Text('COOPDGII ', 
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 134, 46),
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),),
                        Text('Móvil ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                        Text('v1.0',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }

  
}