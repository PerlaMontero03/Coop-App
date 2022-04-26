class ListaSolicitudesModel{
  
  List<dynamic> solicitudes = [];
  List<dynamic> datos = [];

  static final ListaSolicitudesModel _listaSolicitudes = ListaSolicitudesModel._internal();

  factory ListaSolicitudesModel (){
    return _listaSolicitudes;
  }

  ListaSolicitudesModel._internal();
  
}