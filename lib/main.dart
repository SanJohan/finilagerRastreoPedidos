import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/pages/contenido.dart';
import 'package:rastreo_de_entregas/pages/pagina_seguimiento.dart';
import 'package:rastreo_de_entregas/widgets/barra_de_navegacion.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Finilager - Seguimiento de Entregas',
      debugShowCheckedModeBanner: false,
      home: Container(
          
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              //Colors.blue,
              Color.fromARGB(255, 255, 255, 255),
            ])
          ),
          child: const SingleChildScrollView(
            child:Column(
              children: [
                BarraDeNavegacion(),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 3, bottom: 1),
                  child:  Contenido()
                )
              ],
            ),
          ),
          
            ),
      routes: {
        '/paginaDeSeguimiento': (context) => const PaginaDeSeguimiento()
      },
    );
  }
}
