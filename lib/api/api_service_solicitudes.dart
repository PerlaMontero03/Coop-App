import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/lista_solicitudes_model.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'dart:convert';


class ApiServiceSolicitudes{

  UserData userData = UserData();

  Future <void> lista_solicitudes () async {
    var response = await http.post(Uri.parse('https://coopdgii.com/coopvirtual/App/solicitudes'),
      body: ({
        'token': userData.token,
      })
    );
    
    Map<String, dynamic> respuesta = json.decode(response.body);

    if(respuesta['success'] == true){

      ListaSolicitudesModel listaSolicitudes = ListaSolicitudesModel();
      listaSolicitudes.solicitudes = respuesta['data'];

      // print(listaSolicitudes.solicitudes);
    }
  }
  
}