import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';
import 'package:rastreo_de_entregas/utils/responsive_layout.dart';
import 'package:rastreo_de_entregas/widgets/icono_linea_de_tiempo.dart';
import 'package:rastreo_de_entregas/widgets/texto_linea_de_tiempo.dart';

import 'package:timeline_tile/timeline_tile.dart';


class LineaDeTiempo extends StatefulWidget {
  final bool? esPrimero;
  final bool? esUltimo;
  final bool? esPasado;
  final bool? esFuturo;
  final bool? esPresente;

  final String text;
  final String fecha;
  const LineaDeTiempo({super.key, this.esPrimero = false, this.esUltimo = false, 
  this.esPasado = false, required this.text, required this.fecha, this.esFuturo = false, this.esPresente = false,});

  @override
  State<LineaDeTiempo> createState() => _LineaDeTiempoState();
}

class _LineaDeTiempoState extends State<LineaDeTiempo> {

  @override
  void initState() {    
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  ResponsiveLayout.isSmallScreen(context) ? 90 :  ResponsiveLayout.isTabletScreen(context) ? 90 : ResponsiveLayout.isMediumScreen(context) ? 120 : 100, //100,
      width: ResponsiveLayout.isSmallScreen(context) ? 160 : ResponsiveLayout.isTabletScreen(context) ? 160 : ResponsiveLayout.isMediumScreen(context) ? 110 : 140,//140,
      child: TimelineTile(
          axis:  ResponsiveLayout.isSmallScreen(context) ? TimelineAxis.vertical : ResponsiveLayout.isTabletScreen(context) ? TimelineAxis.vertical :TimelineAxis.horizontal,
          isFirst: widget.esPrimero!,
          isLast: widget.esUltimo!,
          //decorating the lines
          beforeLineStyle: LineStyle(
            color: widget.esPasado! ? ColoresAplicacion.colorPrimario: widget.esPresente! ? ColoresAplicacion.colorPrimario : Colors.grey.shade400, thickness: 4.0,),
          //decorating icon
          indicatorStyle: IndicatorStyle(
            color: widget.esPasado!  ? Colors.blueGrey : Colors.grey.shade400,//Colors.deepPurple : Colors.deepPurple.shade100,
            height:  30,
            width:  30,
            drawGap: true,
           
            indicator: Container(
              width: 25,
              height: 25,
              
                decoration:  BoxDecoration(
                  color: widget.esFuturo! ? Colors.grey.shade400 : ColoresAplicacion.colorPrimario,
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  
                  child:  IconoEnLineaDelTiempo(esPasado: widget.esPasado!, esPresente: widget.esPresente!),
                ),
              ),
            ),
          endChild: TextoEnLineaDeTiempo(
            esPasado: widget.esPasado!, 
            texto: widget.text,
            fecha: widget.fecha,
            esFuturo: widget.esFuturo!,
            esPresente: widget.esPresente!,
            ),
      ),
    );
  }
}