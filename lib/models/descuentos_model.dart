class DescuentosModel{
  
  List<dynamic> descuentos = [];

  static final DescuentosModel _descuentosModel = DescuentosModel._internal();

  factory DescuentosModel (){
    return _descuentosModel;
  }

  DescuentosModel._internal();
  
}