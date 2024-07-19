import 'package:universal_html/html.dart';

class LocalStorageHelper{

  static Storage almacenamientoLocal = window.localStorage;

  /// para guardar datos en el local sotrage
  /// 
  static void guardarValor(String llave, String valor){
    almacenamientoLocal[llave] = valor;
  }

  static String? getValor(String llave){
    return almacenamientoLocal[llave];
  }

  //eliminar datos
  static void removeValue(String llave){
    almacenamientoLocal.remove(llave);
  }

  //limpiar todo
  static void limpiarTodo(){
    almacenamientoLocal.clear();
  }

}