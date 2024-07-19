import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/services/mensaje_error.dart';
import 'package:rastreo_de_entregas/services/validacion_api.dart';
import 'package:flutter/services.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';


// class BarraDeBusqueda extends StatefulWidget {
//    String? textoEstado;
//    BarraDeBusqueda({super.key, this.textoEstado});

//   @override
//   State<BarraDeBusqueda> createState() => _BarraDeBusquedaState();
// }

// class _BarraDeBusquedaState extends State<BarraDeBusqueda> {

//   final  _formKey = GlobalKey<FormState>();
//   String? textoEstado;
//   final numeroDeEntrega = TextEditingController();

//   Future<void> envio() async {
//     final valor = _formKey.currentState?.validate();
//     if (valor != null && valor) {
//           await validador(numeroDeEntrega.text.toString());
//     }
//   }

//   Future<void> validador(String numeroValidacion) async {
//     if (numeroValidacion.isEmpty) {
//       return;
//     }
//     final respuesta = await validacionDeApi(numeroValidacion,1);
//     final respuestaValida = respuesta[0];
//     final codigoRespuesta = respuesta[1];
//     if (respuestaValida) {
//       textoEstado=null;
//       funcionNavegadora();
//     } else {
//       codigoRespuesta == 400 ?  textoEstado = await mensajeDeError(numeroValidacion,1) : 
//       textoEstado = 'Lo sentimos, ha ocurrido un error interno en el servidor${codigoRespuesta}';
//     }
//     setState(() {});
//   }

//   funcionNavegadora(){
//     Navigator.pushNamed(context,'/paginaDeSeguimiento', arguments: numeroDeEntrega.text); 
//   }
  
//  @override
//   void initState() {
//     super.initState();  
//   }

 
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                     child: Column(
//                       children: [
//                         Card(
//                           elevation: 0,
//                           color: Colors.transparent,
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   controller: numeroDeEntrega,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Ingrese un número de pedido";
//                                     }
//                                     return null;
//                                   },
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo números
//                                   ],
//                                   maxLength: 10, // Limita a 10 caracteres
//                                   onFieldSubmitted: (value) {
//                                     envio();
//                                   },
//                                   decoration: InputDecoration(
//                                     errorText: textoEstado,
//                                     errorStyle: TextStyle(color: Colors.red),
//                                     filled: true,          
//                                     fillColor: Colors.white,
//                                     hintText: 'Número de pedido (Ej: 5193726502)',
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color:  Color.fromARGB(255, 2, 0, 96)),
//                                       borderRadius: BorderRadius.circular(15)
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color.fromARGB(255, 2, 0, 96) ),
//                                       borderRadius: BorderRadius.circular(15)
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color.fromARGB(255, 2, 0, 96) ),
//                                       borderRadius: BorderRadius.circular(15)
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color.fromARGB(255, 2, 0, 96) ),
//                                       borderRadius: BorderRadius.circular(15)
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(15),
//                                       borderSide: BorderSide( color: Color.fromARGB(255, 2, 0, 96)),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(15),
//                                       //borderSide: BorderSide.none,
//                                       borderSide: BorderSide( color: Color.fromARGB(255, 2, 0, 96))                                      
//                                     ), 
                                    
//                                     suffixIcon: Container(
//                                       margin: EdgeInsets.only(right: 10),
//                                       decoration: BoxDecoration(
//                                         color: ColoresAplicacion.colorPrimario,
//                                         borderRadius: BorderRadius.circular(50)
//                                       ),
//                                       child: IconButton(
//                                             onPressed: (){                                          
//                                               envio();
//                                             }, 
//                                             icon: Icon(
//                                               Icons.send,
//                                               color: Colors.white,
//                                             ),    
                                            
//                                           ),
//                                     )
//                                   ),
//                                 ),              
//                               ],
//                             ),
//                           ),
//                         ),       
//                       ],
//                     ),
//                   );
//   }

  

// }



class BarraDeBusqueda extends StatefulWidget {
  String? textoEstado;
  BarraDeBusqueda({Key? key, this.textoEstado}) : super(key: key);

  @override
  State<BarraDeBusqueda> createState() => _BarraDeBusquedaState();
}

class _BarraDeBusquedaState extends State<BarraDeBusqueda> {
  final _formKey = GlobalKey<FormState>();
  String? textoEstado;
  final numeroDeEntrega = TextEditingController();
  bool isEnvioEnabled = true; // Estado para habilitar/deshabilitar la función de envío

  Future<void> envio() async {
    if (!isEnvioEnabled) return; // Salir si la función de envío no está habilitada

    final valor = _formKey.currentState?.validate();
    if (valor != null && valor) {
      setState(() {
        isEnvioEnabled = false; // Deshabilitar la función de envío después de la primera llamada
      });
      await validador(numeroDeEntrega.text.toString());
    }
  }

  Future<void> validador(String numeroValidacion) async {
    if (numeroValidacion.isEmpty) {
      return;
    }
    final respuesta = await validacionDeApi(numeroValidacion, 1);
    final respuestaValida = respuesta[0];
    final codigoRespuesta = respuesta[1];
    if (respuestaValida) {
      textoEstado = null;
      funcionNavegadora();
    } else {
      codigoRespuesta == 400
          ? textoEstado = await mensajeDeError(numeroValidacion, 1)
          : textoEstado =
              'Lo sentimos, ha ocurrido un error interno en el servidor ${codigoRespuesta}';
    }
    setState(() {
      isEnvioEnabled = true; // Habilitar la función de envío después de procesar la respuesta
    });
  }

  funcionNavegadora() {
    Navigator.pushNamed(context, '/paginaDeSeguimiento',
        arguments: numeroDeEntrega.text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: numeroDeEntrega,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingrese un número de pedido";
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    maxLength: 10,
                    onFieldSubmitted: (value) {
                      envio();
                    },
                    decoration: InputDecoration(
                      errorText: textoEstado,
                      errorStyle: TextStyle(color: Colors.red),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Número de pedido (Ej: 5193726502)',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 0, 96)),
                          borderRadius: BorderRadius.circular(15)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 0, 96)),
                          borderRadius: BorderRadius.circular(15)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 0, 96)),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 0, 96)),
                          borderRadius: BorderRadius.circular(15)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 2, 0, 96)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 2, 0, 96))),
                      suffixIcon: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: ColoresAplicacion.colorPrimario,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          onPressed: isEnvioEnabled ? envio : null,
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
