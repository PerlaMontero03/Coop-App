import 'package:flutter/material.dart';
import 'package:proyecto_final/api/api_service_login.dart';

class Login extends StatefulWidget {
  const Login ({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController cedula = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.transparent,
          body: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0),
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/logo.png'),
                      ) 
                    ),
                  ),
                  
                   //TextField para CEDULA
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 65, 50, 0),
                    child: TextField(
                      controller: cedula,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ), 
                        labelText: 'Cédula',
                        prefixIcon: const Icon(Icons.person_outlined)
                      ),
                    ),
                  ),
                  
                  //TextField para CONTRASEÑA
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,20,50,0),
                    child: TextField(
                      controller: contrasena,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(Icons.vpn_key_outlined)
                      ),
                    ),
                  ),
                  
                  //Boton INICIAR SESION
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,50,50,20),
                    child: SizedBox(
                      height: 50,
                      width: 440,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const PrincipalScreen())
                          // );
                        }, 
                        child: const Text (
                          'INICIAR SESIÓN',
                          style: TextStyle(fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 43, 134, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        )
                      ),
                    ),
                  ),
          
                  //TextButton para PROBLEMAS/AYUDA INICIO DE SESION
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text(
                        '¿Tiene problemas para Iniciar Sesión?',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {},
                    )
                  ),
              
                ],
              ),
            ),
          ),
    );
  }

  Future <void> login() async {
    if (cedula.text.isNotEmpty && contrasena.text.isNotEmpty){
      
      ApiServiceLogin(cedula.text, contrasena.text, context);

    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error al Ingresar'),
          content: const Text('Por favor llenar todos los campos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
        );
    }
  }
}

// Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/fondoLogin.png'), 
//             fit: BoxFit.cover
//           )
//         ),