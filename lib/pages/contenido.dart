import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';
import  'package:rastreo_de_entregas/utils/responsive_layout.dart';
import 'package:rastreo_de_entregas/widgets/barra_de_busqueda.dart';
import 'package:rastreo_de_entregas/widgets/barra_de_navegacion.dart';

class Contenido extends StatefulWidget {
    const Contenido({super.key});

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  
  List<Widget> contenidoPrincipal(double width, BuildContext context){
    
    return [Container(
      margin: EdgeInsets.only(top: ResponsiveLayout.isLargeScreen(context) ? 100 :  ResponsiveLayout.isMediumScreen(context) ? 90 : 40),
      width: width,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 Text('Bienvenido',
                 style:TextStyle(
                    color: ColoresAplicacion.colorPrimarioTextoPrincipal,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fuentes.fuentePaginaPrincipal,
                    fontSize: ResponsiveLayout.isSmallScreen(context) ? 45 : ResponsiveLayout.isLargeScreen(context) ? 100 : 60,
                    decoration: TextDecoration.none
                  )
                  
                  ),
          
                  RichText(
                    text:  TextSpan(
                      text: "Consulta tu ",
    
                      style: TextStyle(
                        color: ColoresAplicacion.colorPrimarioTextoPrincipal,
                        fontSize: ResponsiveLayout.isSmallScreen(context) ? 45 : ResponsiveLayout.isLargeScreen(context) ? 100 : 60, 
                        decoration: TextDecoration.none
                      ),
                      children: [
                        TextSpan(
                          text: "Pedido",
                          style: TextStyle(
                            color: ColoresAplicacion.colorPrimario,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveLayout.isSmallScreen(context) ? 45 : ResponsiveLayout.isLargeScreen(context) ? 100 : 60,
                            decoration: TextDecoration.none
                          )
                        )
                      ]
                    )
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("HAZLE UN SEGUIMIENTO A TU PEDIDO", 
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveLayout.isSmallScreen(context) ? 14  : 18, 
                      decoration: TextDecoration.none),),
                    ),
                    BarraDeBusqueda(),
            ],
          ),),
         
            
             Image.network("assets/image_05.png",
             alignment: Alignment.center ,width: width, height: ResponsiveLayout.isSmallScreen(context) ? width : ResponsiveLayout.isLargeScreen(context) ? width : width/1.2,
             fit: BoxFit.fitHeight,
             
             )
          
        ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      if(constraints.maxWidth >1200){
        return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contenidoPrincipal(constraints.biggest.width/2, context),
                  );  
        
      }else if (constraints.maxWidth > 800) {
          return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contenidoPrincipal(constraints.biggest.width/2, context),
                  );              
        }else {
          return Column(
            children: contenidoPrincipal(constraints.biggest.width, context),
          );
        }
      },
    );
  }
}