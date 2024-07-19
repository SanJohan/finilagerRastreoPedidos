import 'package:flutter/material.dart';
import 'package:rastreo_de_entregas/utils/fuentes.dart';
import 'package:url_launcher/url_launcher.dart';

class DatosTextoExpansible extends StatelessWidget {
  final Widget icono;
  final String texto;
  final String? url;
  final bool extension;
  const DatosTextoExpansible({Key? key, required this.icono, required this.texto, this.url, this.extension = false});

  @override
  Widget build(BuildContext context) {
    return extension
        ? ListTile(
            leading: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  if (url != null) {
                    try {
                      Uri urlUri = Uri.parse('$url');
                      if (!await launchUrl(urlUri)) {
                        // Handle failed launch (optional)
                        throw 'could not launch url';
                      } else {
                        print('Link clicked!');
                      }
                    } catch (error) {
                      // Handle any exceptions that may occur (e.g., null URL, invalid format)
                      print('Error launching URL: $error');
                    }
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: icono,
                ),
              ),
            ),
            title: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  if (url != null) {
                    try {
                      Uri urlUri = Uri.parse('$url');
                      if (!await launchUrl(urlUri)) {
                        // Handle failed launch (optional)
                        throw 'could not launch url';
                      } else {
                        print('Link clicked!');
                      }
                    } catch (error) {
                      // Handle any exceptions that may occur (e.g., null URL, invalid format)
                      print('Error launching URL: $error');
                    }
                  }
                },
                child: Text(texto,
                style: TextStyle(
                  fontFamily: Fuentes.fuentePaginaSeguimiento
                ),),
              ),
            ),
          )
        : ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: icono,
            ),
            title: Text(texto, style: TextStyle(
              fontFamily: Fuentes.fuentePaginaSeguimiento
            ),),
          );
  }
}


