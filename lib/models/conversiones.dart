
class Conversiones{

  String convertirFecha(String dato){
    final registroTiempo = dato.replaceAll(RegExp(r'[^[0-9]'), '');

    final miliSegundosDesdeEpoch = int.parse(registroTiempo);

    DateTime fecha = DateTime.fromMillisecondsSinceEpoch(miliSegundosDesdeEpoch);
    String formatoFecha = "${fecha.year}/${fecha.month.toString().padLeft(2, '0')}/${fecha.day.toString().padLeft(2, '0')}";
    return formatoFecha;
  }

   String convertirHora(String dato){
    final horas = dato.substring(2,4);
    final minutos = dato.substring(5,7);

    String periodo = 'AM';

    int horasInt = int.parse(horas);
  
  if (horasInt >= 12) {
    periodo = 'PM';
    if (horasInt > 12) {
       horasInt -= 12;
    }
  }
    return '$horasInt:$minutos $periodo';
  }
}