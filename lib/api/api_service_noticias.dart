import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/noticias_model.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'dart:convert';


class ApiServiceNoticias{

  UserData userData = UserData();

  Future <void> noticias () async {
    var response = await http.post(Uri.parse('https://coopdgii.com/coopvirtual/App/noticias'),
      body: ({
        'token': userData.token,
      })
    );
    
    Map<String, dynamic> respuesta = json.decode(response.body);

    if(respuesta['success'] == true){

      NoticiasModel noticiasmodel = NoticiasModel();
      noticiasmodel.noticias = respuesta['data'];

      // print(noticiasmodel.noticias);
    }
  }
  
}