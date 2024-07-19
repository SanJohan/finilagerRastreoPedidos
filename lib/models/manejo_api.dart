import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class ApiConfig {
  String apiDominio;
  String numero;
  String usuario;
  String clave;
  

  ApiConfig({required this.apiDominio, required this.numero ,required this.usuario, required this.clave});

  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      apiDominio: json['api_dominio'],
      numero: json['numero'],
      usuario: json['usuario'],
      clave: json['clave'],
    );
  }

  static Future<ApiConfig> load() async {
    final String jsonString = await rootBundle.loadString('assets/api_config.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ApiConfig.fromJson(jsonMap);
  }
}
