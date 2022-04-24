class ResumenModel{
  
  List<dynamic> cuentas = [];
  List<dynamic> prestamos = [];

  static final ResumenModel _resumen = ResumenModel._internal();

  factory ResumenModel (){
    return _resumen;
  }

  ResumenModel._internal();
  
}