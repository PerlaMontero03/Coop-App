import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/resumen_model.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'dart:convert';


class ApiServiceResumen{

  UserData userData = UserData();

  Future <void> resumen () async {
    var response = await http.post(Uri.parse('https://coopdgii.com/coopvirtual/App/resumen'),
      body: ({
        'token': userData.token,
      })
    );
    
    Map<String, dynamic> respuesta = json.decode(response.body);

    if(respuesta['success'] == true){

      ResumenModel resumen = ResumenModel();
      resumen.cuentas = respuesta['data']['cuentas'];
      resumen.prestamos = respuesta['data']['prestamos'];
      resumen.ultimaConexion = respuesta['data']['ultimo_acceso'];

      // print(resumen.cuentas);
      // print(resumen.prestamos);
    }
      // else if (respuesta['success'] == false){
      //   showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //     title: const Text('Error al Ingresar'),
      //     content: Text(respuesta['mensaje']),
      //     actions: <Widget>[
      //       TextButton(
      //         onPressed: () => Navigator.pop(context, 'OK'),
      //         child: const Text('OK'),
      //       ),
      //     ],
      //   ),
      //   );
      // }
  }
  
}