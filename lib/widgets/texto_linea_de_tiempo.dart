import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';
import 'package:rastreo_de_entregas/utils/responsive_layout.dart';


class TextoEnLineaDeTiempo extends StatelessWidget {
  final bool esPasado;
  final String texto;
  final String fecha;
  final bool esFuturo;
  final bool esPresente;
  const TextoEnLineaDeTiempo({super.key, required this.esPasado, required this.texto, required this.fecha, required this.esFuturo, required this.esPresente});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ResponsiveLayout.isMediumScreen(context) ? const EdgeInsets.all(2)  : const EdgeInsets.all(5),
      decoration: const BoxDecoration(
         //color: Colors.green
        
      ),
      child: Column(
        mainAxisAlignment: ResponsiveLayout.isSmallScreen(context) ? MainAxisAlignment.center : ResponsiveLayout.isTabletScreen(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(fecha,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: esPresente? FontWeight.w800 : FontWeight.normal,
              color: esFuturo ? Colors.black26 : Colors.black,
              fontSize: 12,
              fontFamily: Fuentes.fuentePaginaSeguimiento,
              decoration: TextDecoration.none          
          
            ),
          ),
          Container(
            //alignment: Alignment.bottomCenter,
            //color: Colors.blue,
            child: Text(texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: esPresente? FontWeight.w800 : FontWeight.normal,
                color: esFuturo ? Colors.black26 : Colors.black,
                
                fontSize: 15,
                decoration: TextDecoration.none,          
                fontFamily: Fuentes.fuentePaginaSeguimiento
              ),
            ),
          ),
        ],
      ),
    );
  }
}