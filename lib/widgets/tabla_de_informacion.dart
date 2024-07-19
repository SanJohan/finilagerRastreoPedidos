import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';


class TablaDeInformacion extends StatelessWidget {
  final String titulo;
  final String informacion;
  const TablaDeInformacion({super.key,required this.titulo, required this.informacion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
              children: [
                Expanded(
                  child: Container(
                  height: 1,
                  width: 10,
                  color: Colors.grey.shade300,
                        ),
                ),
              ],
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: ColoresAplicacion.colorPrimario ,
                  fontFamily: Fuentes.fuentePaginaSeguimiento
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                informacion,
                style: const TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: Fuentes.fuentePaginaSeguimiento
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
}