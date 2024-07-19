import 'package:flutter/material.dart';

class TextoExpansible extends StatelessWidget {
  final String titulo;
  final List<Widget> datos;
  const TextoExpansible({super.key, required this.titulo, required this.datos});


  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300)
        ),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: Border.all(color: Colors.black),
        title:  Text(
          titulo,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children:  [
          ...datos         
        ],
       
      ),
    );
  }
}