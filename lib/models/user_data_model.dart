class UserData{
  
  String nombre = "";
  String apellido = ""; 
  String token = "";

  static final UserData _userData = UserData._internal();

  factory UserData (){
    return _userData;
  }

  UserData._internal();
}

// factory UserData.fromJson(Map<String, dynamic> json) {
  //   return UserData(
  //     nombre: json['nombre'],
  //     apellido: json['apellido'],
  //     token: json['token'],
  //   );
  // }
// MenuL menuL = MenuL();
    // //menuL.username(nombre);
    // print(nombre);