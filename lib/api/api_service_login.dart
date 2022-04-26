import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proyecto_final/api/api_service_descuentos.dart';
import 'package:proyecto_final/api/api_service_noticias.dart';
import 'package:proyecto_final/api/api_service_resumen.dart';
import 'package:proyecto_final/api/api_service_solicitudes.dart';
import 'package:proyecto_final/screens/home.dart';
import 'dart:convert';

import 'package:proyecto_final/models/user_data_model.dart';

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

        // print(userData.nombre + userData.token);
        ApiServiceResumen resumen = ApiServiceResumen();
        resumen.resumen();

        ApiServiceSolicitudes solicitudes = ApiServiceSolicitudes();
        solicitudes.lista_solicitudes();

        ApiServiceNoticias apinoticias = ApiServiceNoticias();
        apinoticias.noticias();

        ApiServiceDescuentos descuentos = ApiServiceDescuentos();
        descuentos.descuentos();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home())
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