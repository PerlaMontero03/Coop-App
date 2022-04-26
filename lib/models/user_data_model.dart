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