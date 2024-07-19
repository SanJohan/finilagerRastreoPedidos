class Entrega {
  final String entrega;
  final String cliente;
  final String ciudad;
  final String direccion;
  final String telefono;
  final String pedido1;
  final String pedido2;
  final String pedido3;
  final String mensaje;
  
  

  Entrega({
    required this.entrega,
    required this.cliente,
    required this.ciudad,
    required this.direccion,
    required this.telefono,
    required this.pedido1,
    required this.pedido2,
    required this.pedido3,
    required this.mensaje,
  });

  factory Entrega.fromMap(Map<String, dynamic>? e) {
    // Check for null values and provide default values or handle it as needed.
    return Entrega(
      entrega: e?['Entrega'] ?? '',
      cliente: e?['Cliente'] ?? '',
      ciudad: e?['Ciudad']?? '',
      direccion: e?['Direccion']?? '',
      telefono: e?['Telefono']?? '',
      pedido1: e?['Pedido1']?? '',
      pedido2: e?['Pedido2']?? '',
      pedido3: e?['Pedido3']?? '',
      mensaje: e?['Mensaje']?? '',
    );
  }
}