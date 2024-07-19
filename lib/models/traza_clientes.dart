class TrazaClientes {
  final String vgbel;
  final String vbeln;
  final String estatus;
  final String erdat;
  final String erzet;
  final String stat;
  
  
  

  TrazaClientes({
    required this.vgbel,
    required this.vbeln,
    required this.estatus,
    required this.erdat,
    required this.erzet,
    required this.stat,
 
  });

  factory TrazaClientes.fromMap(Map<String, dynamic>? e) {
    // Check for null values and provide default values or handle it as needed.
    return TrazaClientes(
      vgbel: e?['Vgbel'] ?? '',
      vbeln: e?['Vbeln'] ?? '',
      estatus: e?['Estatus']?? '',
      erdat: e?['Erdat']?? '',
      erzet: e?['Erzet']?? '',
      stat: e?['Stat']?? '',
      
    );
  }
}