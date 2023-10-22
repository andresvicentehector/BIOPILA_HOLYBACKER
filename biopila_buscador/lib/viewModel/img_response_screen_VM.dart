import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:universal_html/html.dart' as html;

class ImgResponseScreenVM with ChangeNotifier {
  late DateTime currentDate;
  late String formattedDate;
  String country = '';

  Future<void> fetchCountry() async {
    var url = Uri.parse('http://ip-api.com/json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      country = data['country'];
      notifyListeners();
    } else {
      country = 'spain';
      notifyListeners();
    }
  }

  Future<void> downloadImage(String url, String name) async {
    try {
      var response = await http.get(Uri.parse(url));
      var bytes = response.bodyBytes;

      // Obtén el directorio de almacenamiento externo
      var directory = await getExternalStorageDirectory();
      var path = '${directory!.path}';

      // Crea el archivo en el directorio de almacenamiento
      var file = File('$path/$name.png');

      // Escribe los bytes de la imagen en el archivo
      await file.writeAsBytes(bytes);

      print('Imagen descargada y guardada en: ${file.path}');
    } catch (e) {
      print('Error al descargar la imagen: $e');
    }
  }

  void downloadImage2(String url) {
    final anchor = html.AnchorElement(href: url);
    anchor.download = 'image.jpg';
    anchor.click();
  }

  /*Future<void> downloadImage2(String url) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final externalDir = await getExternalStorageDirectory();
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: externalDir!.path,
        fileName: 'image.jpg',
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      throw 'Permiso de almacenamiento denegado';
    }
  }*/
}
