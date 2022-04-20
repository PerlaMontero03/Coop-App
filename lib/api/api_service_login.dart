import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:proyecto_final/models/user_data_model.dart';
import 'package:proyecto_final/principal_screen.dart';

class ApiServiceLogin{

  String cedula;
  String contrasena;
  BuildContext context;

  Future<void> login () async{
    var response = await http.post(Uri.parse('https://coopdgii.com/coopvirtual/App/login'),
        body: ({
          'usuario': cedula,
          'clave': contrasena
        })
      );

      Map<String, dynamic> respuesta = json.decode(response.body);

      if(respuesta['success'] == true){
        // UserData(
        //   nombre: respuesta['data']['nombre'], 
        //   apellido: respuesta['data']['apellido'], 
        //   token: respuesta['data']['token']);

        UserData userData = UserData();
        userData.nombre = respuesta['data']['nombre'];
        userData.apellido = respuesta['data']['apellido'];
        userData.token = respuesta['data']['token'];

        print(userData.nombre + userData.token);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PrincipalScreen())
        );
      }
      else if (respuesta['success'] == false){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
          title: const Text('Error al Ingresar'),
          content: Text(respuesta['mensaje']),
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

  ApiServiceLogin(this.cedula,this.contrasena, this.context){
    login();
  }
}