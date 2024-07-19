import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/models/conversiones.dart';
import 'package:rastreo_de_entregas/models/entrega.dart';
import 'package:rastreo_de_entregas/models/evidencias.dart';
import 'package:rastreo_de_entregas/models/traza_clientes.dart';
import 'package:rastreo_de_entregas/services/entregas_api.dart';
import 'package:rastreo_de_entregas/services/evidencias_api.dart';
import 'package:rastreo_de_entregas/services/mensaje_error.dart';
import 'package:rastreo_de_entregas/services/traza_clientes_api.dart';
import 'package:rastreo_de_entregas/services/validacion_api.dart';
import 'package:rastreo_de_entregas/utils/colores.dart';
import 'package:rastreo_de_entregas/utils/espacios.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';
import 'package:rastreo_de_entregas/utils/responsive_layout.dart';
import 'package:rastreo_de_entregas/widgets/datos_texto_expansible.dart';
import 'package:rastreo_de_entregas/widgets/detalle_rastreo.dart';
import 'package:rastreo_de_entregas/widgets/linea_de_tiempo.dart';
import 'package:rastreo_de_entregas/widgets/tabla_de_informacion.dart';
import 'package:rastreo_de_entregas/widgets/texto_expansible.dart';

class ContenidoPaginaDeSeguimiento extends StatefulWidget {
  String? numeroDeEntrega;
  ContenidoPaginaDeSeguimiento({super.key, this.numeroDeEntrega});

  @override
  State<ContenidoPaginaDeSeguimiento> createState() =>
      _ContenidoPaginaDeSeguimientoState();
}

class _ContenidoPaginaDeSeguimientoState
    extends State<ContenidoPaginaDeSeguimiento> {
  final List<String> titulosInformacion = [
    'Cliente',
    'Ciudad',
    'Direccion',
    'Telefono'
  ];
  final List<String> tituloLineaTiempo = [
    'Alistamiento',
    'Embalaje',
    'Salida del almacen',
    'En ruta',
    'Entregada',
    'Ingresada en sucursal'
  ];
  final List<String> estatus = ['A', 'B', 'C', 'D', 'E', 'F'];

  final List matriz = List.filled(6, '');

  List<Entrega> entregas = [];
  List<TrazaClientes> trazaClientes = [];
  List<Evidencias> datosEvidencias = [];
  List propiedadesEntrega = [];
  List<Widget> evidencias = [];
  String numeroDeEntrega = '';
  String letra = '';
  String? textoEstadoEntrega = '';
  String? textoEstadoEvidencias = '';

  late final Future future;

  @override
  void initState() {
    super.initState();
    future = fetchTrazaClientes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                border: Border(
                  right: BorderSide.none,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Detalle de Rastreo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColoresAplicacion.colorPrimario,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveLayout.isLargeScreen(context)
                            ? MediaQuery.of(context).size.width / 35
                            : 35,
                        fontFamily: Fuentes.fuentePaginaPrincipal,
                        decoration: TextDecoration.none),
                  ),
                  espaciadoVertical(20),
                  ResponsiveLayout.isSmallScreen(context)
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20.0, left: 5.0, right: 5.0),
                                alignment: Alignment.center,
                                child: DetallesRastreo(
                                  titulo: 'Numero de entrega',
                                  detalle: trazaClientes.isNotEmpty
                                      ? trazaClientes[0].vbeln
                                      : '',
                                  alineacionTitulo: TextAlign.center,
                                  alineacionDetalle: TextAlign.center,
                                  //dimencionFuenteTitulo: 12, dimencionFuenteDetalle: 15,
                                  dimencionFuenteTitulo: 15,
                                  dimencionFuenteDetalle: 18,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Container(
                                width: 150,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 7.0, bottom: 5.0, left: 5.0, right: 5.0),
                              alignment: Alignment.center,
                              child: DetallesRastreo(
                                  titulo: 'Estado de la entrega',
                                  detalle: trazaClientes.isNotEmpty
                                      ? trazaClientes[trazaClientes.length - 1]
                                          .estatus
                                      : '',
                                  alineacionTitulo: TextAlign.center,
                                  alineacionDetalle: TextAlign.center,
                                  dimencionFuenteTitulo: 15,
                                  dimencionFuenteDetalle: 18),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 5.0,
                                      left: 5.0,
                                      right: 5.0), //const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.only(right: 30.0),
                                  alignment: Alignment.centerRight,
                                  child: DetallesRastreo(
                                    titulo: 'Numero de entrega',
                                    detalle: trazaClientes.isNotEmpty
                                        ? trazaClientes[0].vbeln
                                        : '',
                                    alineacionTitulo: TextAlign.start,
                                    alineacionDetalle: TextAlign.left,
                                    dimencionFuenteTitulo: 18,
                                    dimencionFuenteDetalle: 28,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                width: 1,
                                height: ResponsiveLayout.isSmallScreen(context)
                                    ? 30
                                    : 40,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 5.0,
                                    left: 5.0,
                                    right: 5.0),
                                padding: const EdgeInsets.only(left: 30.0),
                                alignment: Alignment.centerLeft,
                                child: DetallesRastreo(
                                    titulo: 'Estado de la entrega',
                                    detalle: trazaClientes.isNotEmpty
                                        ? trazaClientes[
                                                trazaClientes.length - 1]
                                            .estatus
                                        : '',
                                    alineacionTitulo: TextAlign.start,
                                    alineacionDetalle: TextAlign.left,
                                    dimencionFuenteTitulo: 18,
                                    dimencionFuenteDetalle: 28),
                              ),
                            ),
                          ],
                        ),
                  //Espaciado vertical
                  ResponsiveLayout.isSmallScreen(context)
                      ? espaciadoVertical(20)
                      : espaciadoVertical(40),
                  //Linea de tiempo
                  ResponsiveLayout.isSmallScreen(context)
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade100,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade100),
                          child: Column(
                            children: [
                              for (int i = 0; i < 6; i++)
                                LineaDeTiempo(
                                  text: tituloLineaTiempo[i],
                                  fecha: matriz[i].toString(),
                                  esPrimero: i == 0,
                                  esUltimo: i == 5,
                                  esPasado: matriz[i].toString() != '',
                                  esPresente:
                                      i == trazaClientes.length - 1 && i == 5,
                                  esFuturo: matriz[i] == '',
                                ),
                            ],
                          ),
                        )
                      : ResponsiveLayout.isTabletScreen(context)
                          ? Container(
                              padding: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade100,
                                    style: BorderStyle.solid,
                                  ),
                                  color: Colors.grey.shade100),
                              child: Column(
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    LineaDeTiempo(
                                      text: tituloLineaTiempo[i],
                                      fecha: matriz[i].toString(),
                                      esPrimero: i == 0,
                                      esUltimo: i == 5,
                                      esPasado: matriz[i].toString() != '',
                                      esPresente: i == trazaClientes.length - 1 &&
                                          i == 5,
                                      esFuturo: matriz[i] == '',
                                    ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade100,
                                    style: BorderStyle.solid,
                                  ),
                                  color: Colors.grey.shade100),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    LineaDeTiempo(
                                      text: tituloLineaTiempo[i],
                                      fecha: matriz[i].toString(),
                                      esPrimero: i == 0,
                                      esUltimo: i == 5,
                                      esPasado: matriz[i].toString() != '',
                                      esPresente: i == trazaClientes.length - 1 &&
                                          i == 5,
                                      esFuturo: matriz[i] == '',
                                    ),
                                ],
                              ),
                            ),
                  espaciadoVertical(30),
                  //Mostrando tabla de informacion
                  for (int i = 0; i < 4; i++)
                    TablaDeInformacion(
                      titulo: '${titulosInformacion[i]}:',
                      informacion: entregas.isNotEmpty
                          ? propiedadesEntrega[i].isNotEmpty
                              ? '${propiedadesEntrega[i]}'
                              : 'no se encuentra información'
                          : textoEstadoEntrega!,
                    ),
                  espaciadoVertical(40),
                  //Seccion Mas especificaciones
                  espaciadoVertical(5),
                  //Seccion evidencias
                  TextoExpansible(
                    titulo: 'Evidencias',
                    datos: [...evidencias],
                  )
                ],
              ),
            );
          } else {
            //Circulo de progreso mientras cargan las peticiones
            return Padding(
              padding: EdgeInsets.only(
                  top: ResponsiveLayout.isSmallScreen(context) ? 150 : 150),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  fetchTrazaClientes() async {
    final respuesta = await TrazaClientesApi.fetchTrazaClientes(
        widget.numeroDeEntrega!);
    fetchEntregas(respuesta[0].vbeln);
    trazaClientes = respuesta;
    int j = 0;
    for (int i = 0; i < matriz.length; i++) {
      final estado = trazaClientes[j].stat;
      final letra = estatus[i];

      if (estado == letra) {
        matriz[i] =
            '${Conversiones().convertirFecha(trazaClientes[j].erdat)} ${Conversiones().convertirHora(trazaClientes[j].erzet)}';
        j++;
      } else {
        matriz[i] = '';
      }
    }

    setState(() {});
  }

  fetchEntregas(String vgbel) async {
    final validacion = await validacionDeApi(vgbel, 2);
    final respuestaValida = validacion[0];
    final codigoRespuesta = validacion[1];

    if (respuestaValida) {
      final respuesta = await EntregasApi.fetchEntregas(vgbel);
      fetchEvidencias('${trazaClientes[0].vbeln}');
      entregas = respuesta;
      propiedadesEntrega = entregas
          .expand((entrega) => [
                entrega.cliente,
                entrega.ciudad,
                entrega.direccion,
                entrega.telefono,
              ])
          .toList();

      setState(() {});
      return propiedadesEntrega;
    } else {
      codigoRespuesta == 400
          ? textoEstadoEntrega = await mensajeDeError(vgbel, 2)
          : textoEstadoEntrega = '';
      setState(() {});
    }
  }

  fetchEvidencias(String vgbel) async {
    final validacion = await validacionDeApi(vgbel, 3);
    final respuestaValida = validacion[0];
    final codigoRespuesta = validacion[1];

    if (respuestaValida) {
      final respuesta = await EvidenciasApi.fetchEvidencias(vgbel);
      datosEvidencias = respuesta;

      if (datosEvidencias.isNotEmpty) {
        evidencias = datosEvidencias.map((evidencia) {
          Icon icono;
          String texto;

          switch (evidencia.tipo) {
            case 'FIRM':
              icono = Icon(Icons.edit, color: Colors.black);
              texto = 'Foto firma';
              break;
            case 'FOT1':
              icono = Icon(Icons.person_2, color: Colors.black);
              texto = 'Foto cliente';
              break;
            case 'FOT2':
              icono = Icon(Icons.camera_alt, color: Colors.black);
              texto = 'Foto paquete';
              break;
            case 'UBIC':
              icono = Icon(Icons.place, color: Colors.black);
              texto = 'Ubicación entrega';
              break;
            default:
              icono = Icon(Icons.image, color: Colors.black);
              texto = 'Evidencia';
          }

          return DatosTextoExpansible(
            icono: icono,
            texto: texto,
            url: evidencia.dato,
            extension: true,
          );
        }).toList();
      } else {
        evidencias = [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No hay evidencias para este pedido',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ];
      }

      setState(() {});
      return evidencias;
    } else {
      codigoRespuesta == 400
          ? textoEstadoEvidencias = await mensajeDeError(vgbel, 3)
          : textoEstadoEvidencias = '';
      setState(() {
        evidencias = [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No hay evidencias para este pedido',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ];
      });
      return evidencias;
    }
  }
}
