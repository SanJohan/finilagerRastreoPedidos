import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/responsive_layout.dart';


class BarraDeNavegacion extends StatelessWidget {
  final double? altura;
  const BarraDeNavegacion({super.key, this.altura = 90});

  @override
  Widget build(BuildContext context) {
    return  Container(   
      height:  ResponsiveLayout.isLargeScreen(context) ? 110 : 90,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
        //color: Colors.green
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: ResponsiveLayout.isLargeScreen(context) ? 105 : 100,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                //decoration: BoxDecoration(color: Colors.black),
                child: Image.network('assets/logo_finilager_header.png', fit: BoxFit.cover,),
                ),
            ],
          ),
        ]
      ),
    );
  }
}

class BarraDeNavegacionMovil extends StatelessWidget {
  const BarraDeNavegacionMovil({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(   
      height: ResponsiveLayout.isLargeScreen(context) ? 140 : 100,
      decoration: const BoxDecoration(
        color: Colors.green
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: const BoxDecoration(color: Colors.black),
                child: Image.network('assets/logo_finilager_header.png',),
                ),
            ],
          ),
        ]
      ),
    );
  }
}