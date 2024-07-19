import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rastreo_de_entregas/models/manejo_api.dart';


Future<String> mensajeDeError(String filtro, int tipo) async {
      final config = await ApiConfig.load();    
      final ip = config.apiDominio;
      final numero = config.numero;
      final usuario = config.usuario;
      final clave = config.clave;
      
      String url = '';
      if(tipo==1){
         print('FetchtValidacionTrazas');
        url = '$ip/sap/opu/odata/sap/ZWS_TRANSPORTES_SRV/Traza_clientesSet?\$filter=Vgbel eq \'$filtro\'&\$format=json&sap-client=$numero&sap-language=ES';
      }else if(tipo ==2){
        print('FetchValidacionEntregas');
         url = '$ip/sap/opu/odata/SAP/ZWS_ENTREGA_SRV/HeaderSet?\$filter=Entrega eq \'$filtro\'&sap-client=$numero&sap-language=ES&\$format=json';
      }else{
        print('FetchValidacionEvidencias');
       url = '$ip/sap/opu/odata/SAP/ZWS_TRANSPORTES_SRV/EvidenciasSet?\$filter=Vbeln eq \'$filtro\'&sap-client=$numero&sap-language=ES&\$format=json';
      }
      
      
      
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

      final contenidoRespuesta = respuesta.body;
      print('tipo: ${tipo}, statusCode ${respuesta.statusCode}');
      final json = jsonDecode(contenidoRespuesta);
      final prueba = json['error']['message']['value'];      
      return prueba.toString();
}

