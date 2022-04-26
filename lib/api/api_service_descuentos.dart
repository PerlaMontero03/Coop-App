import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/descuentos_model.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'dart:convert';


class ApiServiceDescuentos{

  UserData userData = UserData();

  Future <void> descuentos () async {
    var response = await http.post(Uri.parse('https://coopdgii.com/coopvirtual/App/descuentos'),
      body: ({
        'token': userData.token,
      })
    );
    
    Map<String, dynamic> respuesta = json.decode(response.body);

    if(respuesta['success'] == true){

      DescuentosModel descuentos = DescuentosModel();
      descuentos.descuentos = respuesta['data'];

      // print(descuentos.datosDescuentos);
    }
  }
  
}