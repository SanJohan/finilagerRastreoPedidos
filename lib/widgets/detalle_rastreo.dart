import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';

class DetallesRastreo extends StatelessWidget {
  final String titulo;
  final String detalle;
  final TextAlign alineacionTitulo;
  final TextAlign alineacionDetalle;
  final double dimencionFuenteTitulo;
  final double dimencionFuenteDetalle;
  const DetallesRastreo({super.key, required this.titulo, required this.detalle, required this.alineacionTitulo, required this.alineacionDetalle, required this.dimencionFuenteTitulo, required this.dimencionFuenteDetalle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(titulo, 
            textAlign: alineacionTitulo,
            style: TextStyle(
                    fontSize:  dimencionFuenteTitulo, 
                    decoration: TextDecoration.none, 
                    color: ColoresAplicacion.colorTextoDetallesRastreo,
                    fontWeight: FontWeight.w100,
                    fontFamily: Fuentes.fuentePaginaSeguimiento
                ),
            ),                                        
            Text( detalle,
            textAlign: alineacionDetalle, 
            style:  TextStyle(
                        fontSize: dimencionFuenteDetalle, 
                        decoration: TextDecoration.none, 
                        color: ColoresAplicacion.colorTextoDetallesRastreo, 
                        fontWeight: FontWeight.w600,
                        fontFamily: Fuentes.fuentePaginaSeguimiento
            ),
          )
      ],
    );
  }
}