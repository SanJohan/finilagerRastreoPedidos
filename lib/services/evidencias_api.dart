import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rastreo_de_entregas/models/evidencias.dart';
import 'package:rastreo_de_entregas/models/manejo_api.dart';



class EvidenciasApi {

  static Future<List<Evidencias>> fetchEvidencias(String numeroEntrega) async{
    try{
      final config = await ApiConfig.load();

      final ip = config.apiDominio;
      final numero = config.numero;
      final usuario = config.usuario;
      final clave = config.clave;
      
      print('FetchEvidencias');
      final url = '$ip/sap/opu/odata/SAP/ZWS_TRANSPORTES_SRV/EvidenciasSet?\$filter=Vbeln eq \'$numeroEntrega\'&sap-client=$numero&sap-language=ES&\$format=json';
      final uri = Uri.parse(url);

      // Agrego las credenciales de autenticación aquí
      final autorizacion = 'Basic ' + base64Encode(utf8.encode('$usuario:$clave'));

       final respuesta = await http.get(
        uri,
        headers: {
        'Authorization': autorizacion,
      
        },
      );

      if(respuesta.statusCode == 200){
        final contenidoRespuesta = respuesta.body;
        try{
          final json = jsonDecode(contenidoRespuesta);
          final resultados = json['d']['results'] as List<dynamic>;
          final transformado = resultados.map((e){
            return Evidencias.fromMap(e);
          }).toList();
          print('Fetch Envidencia completada');
          return transformado;
        }catch(error){
          print('Error decodificando el JSON: $error');
          print(contenidoRespuesta);
        }
      }else{
        print('Peticion HTTP fallida con estatus: ${respuesta.statusCode}');

      }
    }catch(error){
      print('Erro fetching Evidencias: $error');
    }

    return[];
  }

}