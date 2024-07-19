import 'package:flutter/material.dart';

class IconoEnLineaDelTiempo extends StatelessWidget {
  final bool esPasado;
  final bool esPresente;
  const IconoEnLineaDelTiempo({super.key, required this.esPasado, required this.esPresente});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: esPresente ? 
                const Icon(
                  Icons.done,
                  size: 20,
                  color: Colors.white,
                )
          : esPasado
              ? const Icon(
                  Icons.done,
                  size: 20,
                  color: Colors.white,
                )
              : Container(
                  width: 20,
                  height: 20,
                  decoration:  BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
    );
  }
}