class Evidencias {
  final String vbeln;
  final String tipo;
  final int pos;
  final String dato;

  Evidencias({
    required this.vbeln,
    required this.tipo,
    required this.pos,
    required this.dato,
  });

  factory Evidencias.fromMap(Map<String, dynamic>? e) {
    // Convertir pos a entero asegurándose de que no sea null y manejando posibles errores
    int pos = 0;
    if (e?['Pos'] != null) {
      pos = int.tryParse(e!['Pos'].toString()) ?? 0;
    }
    
    return Evidencias(
      vbeln: e?['Vbeln'] ?? '',
      tipo: e?['Tipo'] ?? '',
      pos: pos,
      dato: e?['Dato'] ?? '',
    );
  }
}
