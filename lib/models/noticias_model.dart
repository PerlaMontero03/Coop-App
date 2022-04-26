class NoticiasModel{
  
  List<dynamic> noticias = [];

  static final NoticiasModel _noticias = NoticiasModel._internal();

  factory NoticiasModel (){
    return _noticias;
  }

  NoticiasModel._internal();
  
}