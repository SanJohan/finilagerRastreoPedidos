import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/models/local_storage.dart';
import 'package:rastreo_de_entregas/pages/contenido_seguimiento.dart';
import 'package:rastreo_de_entregas/utils/espacios.dart';
import 'package:rastreo_de_entregas/utils/responsive_layout.dart';
import 'package:rastreo_de_entregas/widgets/barra_de_navegacion.dart';


class PaginaDeSeguimiento extends StatefulWidget {
   const PaginaDeSeguimiento({super.key});
  
  @override
  State<PaginaDeSeguimiento> createState() => _PaginaDeSeguimientoState();
}

class _PaginaDeSeguimientoState extends State<PaginaDeSeguimiento> {
  String numeroEntrega = '';

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments;
     if(username != null){
        numeroEntrega = username as String;
        LocalStorageHelper.guardarValor('numeroDeEntrega', numeroEntrega);
     }
  
    
    return LayoutBuilder(
      builder: (context, constraints) {
      if(constraints.maxWidth >1200 && constraints.maxHeight > 650){
        return SingleChildScrollView(
          child: Column(
            children: [
              const BarraDeNavegacion(),
              Stack(
              alignment: Alignment.topCenter,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Image.network("assets/heroSeguimiento.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: ResponsiveLayout.isLargeScreen(context) ? 250 : 200,
                    alignment: Alignment.center ,
                    fit: BoxFit.fitWidth,
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  //color: Colors.blue,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: ResponsiveLayout.isSmallScreen(context) ? const EdgeInsets.only( top: 40, bottom: 10, left: 20, right: 20) 
                               : ResponsiveLayout.isMediumScreen(context) ? const EdgeInsets.only( top: 20, bottom: 10, left: 95, right: 95) 
                                    :   EdgeInsets.only( top: 20, bottom: 10,  left:MediaQuery.of(context).size.width/15 , right: MediaQuery.of(context).size.width/15) ,
                    child: ContenidoPaginaDeSeguimiento(numeroDeEntrega: LocalStorageHelper.getValor('numeroDeEntrega'),)),
                ), 
                ],
              ),
            ],
          )
        );
      }else if (constraints.maxWidth > 800) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const BarraDeNavegacion(),
              Stack(
              alignment: Alignment.topCenter,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Image.network("assets/heroSeguimiento.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: ResponsiveLayout.isLargeScreen(context) ? 550 : 200,
                    alignment: Alignment.center ,
                    fit: BoxFit.fitWidth,
                    ),
                ),
                Container(
                  margin:  EdgeInsets.only(top: ResponsiveLayout.isSmallScreen(context) ? 10 : 100),
                  

                  child: Container(
                    
                    width: MediaQuery.of(context).size.width,
                    padding: ResponsiveLayout.isSmallScreen(context) ? const EdgeInsets.only( top: 40, bottom: 10, left: 20, right: 20) 
                               : ResponsiveLayout.isMediumScreen(context) ? const EdgeInsets.only( top: 20, bottom: 10, left: 95, right: 95) 
                                    :   EdgeInsets.only( top: 20, bottom: 10, left:MediaQuery.of(context).size.width/15 , right: MediaQuery.of(context).size.width/15 ) ,
                    child: ContenidoPaginaDeSeguimiento(numeroDeEntrega: LocalStorageHelper.getValor('numeroDeEntrega'),)),
                ), 
                ],
              ),
            ],
          ),
        );       
        }else {
            return SingleChildScrollView(
          child: Column(
            children: [
             const BarraDeNavegacion(),
             Stack(
              alignment: Alignment.topCenter,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Image.network("assets/heroSeguimiento.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: ResponsiveLayout.isLargeScreen(context) ? 450 : 200,
                    alignment: Alignment.center ,
                    fit: BoxFit.fitWidth,
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  //color: Colors.yellow,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: ResponsiveLayout.isSmallScreen(context) ? const EdgeInsets.only( top: 40, bottom: 10, left: 20, right: 20) 
                               : ResponsiveLayout.isMediumScreen(context) ? const EdgeInsets.only( top: 20, bottom: 10, left: 95, right: 95) 
                                    :  const EdgeInsets.only( top: 20, bottom: 10, left: 180, right: 180) ,
                    child: ContenidoPaginaDeSeguimiento(numeroDeEntrega: LocalStorageHelper.getValor('numeroDeEntrega'),)),
                ), 
                ],
              ),
            ],
          )
        );
        }
      },
    );
  }
  
}