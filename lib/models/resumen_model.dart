class ResumenModel{
  
  List<dynamic> cuentas = [];
  List<dynamic> prestamos = [];
  String ultimaConexion = "";

  static final ResumenModel _resumen = ResumenModel._internal();

  factory ResumenModel (){
    return _resumen;
  }

  ResumenModel._internal();
  
}