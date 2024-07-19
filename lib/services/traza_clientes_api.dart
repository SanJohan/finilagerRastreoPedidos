import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rastreo_de_entregas/models/manejo_api.dart';
import 'package:rastreo_de_entregas/models/traza_clientes.dart';



class TrazaClientesApi {

  static Future<List<TrazaClientes>> fetchTrazaClientes(String numeroPedido) async{
    try{
      final config = await ApiConfig.load();
      final ip = config.apiDominio;
      final numero = config.numero;
      final usuario = config.usuario;
      final clave = config.clave;

      print('FetchtTrazas');
      final url = '$ip/sap/opu/odata/sap/ZWS_TRANSPORTES_SRV/Traza_clientesSet?\$filter=Vgbel eq \'$numeroPedido\'&\$format=json&sap-client=$numero&sap-language=ES';

      final uri = Uri.parse(url);
      print(url);

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
        print(contenidoRespuesta);
        try{
          final json = jsonDecode(contenidoRespuesta);
          final resultados = json['d']['results'] as List<dynamic>;
          final transformado = resultados.map((e){
            return TrazaClientes.fromMap(e);
          }).toList();
          print('Fetch TrazaClientes completada');
          return transformado;
        }catch(error){
          print('Error decodificando el JSON: $error');
        }
      }else{
        print('Peticion HTTP fallida  en traza clientes con estatus: ${respuesta.statusCode}');
      }
    }catch(error){
      print('Erro fetching Entregas: $error');
    }

    return[];
  }

}