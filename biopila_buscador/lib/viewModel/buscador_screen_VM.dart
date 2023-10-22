import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../view/img_response_screen.dart';

// ignore: camel_case_types
class searchWidget_VM with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String _searchText = '';
  String? fontFamily = "IBMPlexMono";
  bool isPressed = false;
  late double voltage = 0;
  late double ph = 0;
  late double tds = 0;
  String finalString = "";
  String urlSt = "";
  bool isLoading = false;
  String voltagePrompt =
      "dysfunctional, non-existent, hostile environment, anaerobic bacteria";
  String phPrompt = "";
  String tdsPrompt = "20dpi";
  Widget finalVoltage = const SizedBox.shrink();

  void search(BuildContext context) {
    if (0 <= voltage && voltage <= 0.099) {
      voltagePrompt =
          "dysfunctional, non-existent, hostile environment, anaerobic bacteria";
    }
    if (0.099 < voltage && voltage <= 0.199) {
      voltagePrompt =
          "low activity, pure water, few anaerobic bacteria, synthetic biology";
    }
    if (0.199 < voltage && voltage <= 0.299) {
      voltagePrompt =
          "continuous anaerobic bacterial flow, growing life, in process";
    }
    if (0.299 < voltage && voltage <= 0.399) {
      voltagePrompt =
          "high activity, blooming, active anaerobic bacterial metabolism";
    }
    if (0.399 < voltage && voltage <= 0.50) {
      voltagePrompt =
          "maximum yield, anaerobic bacterial hypercolonisation, foul water";
    }

    if (5.50 <= ph && ph <= 6.0) {
      phPrompt = 'color: black and white contrast:high';
    }
    if (6.00 < tds && tds <= 6.20) {
      phPrompt = "color: greyscale contrast: medium";
    }

    if (6.20 < tds && tds <= 6.70) {
      phPrompt = "color: greyscale contrast:low";
    }

    if (0 <= tds && tds <= 0.099) {
      tdsPrompt = "resolution: 10dpi";
    }
    if (0.099 < tds && tds <= 0.199) {
      tdsPrompt = "resolution: 20dpi";
    }
    if (0.199 < tds && tds <= 0.299) {
      tdsPrompt = "resolution: 40dpi";
    }
    if (0.299 < tds && tds <= 0.399) {
      tdsPrompt = "resolution: 50dpi";
    }
    if (0.399 < tds && tds <= 0.50) {
      tdsPrompt = "resolution: 72dpi";
    }

    _searchText =
        "${searchController.text} $voltagePrompt $phPrompt $tdsPrompt";

    // Aquí puedes realizar la petición HTTP con el contenido del buscador en el body
    _makeHttpRequest(_searchText, context);
    isPressed = true;
    notifyListeners();
  }

  Future<void> _makeHttpRequest(String searchText, BuildContext context) async {
    //var url = Uri.parse('https://stablediffusionapi.com/api/v3/text2img');
    //String key = "oRohmu5T59LwALmfkXVxKojZ4nC9jygJRPQnyEKS0kJDlsmWwLl7ZBsVNgxo";

    var url =
        Uri(scheme: 'http', host: '15.188.50.88', path: 'stable', port: 3000);
    String prompt = searchText;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "prompt": prompt,
    };
    isLoading = true;
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      // Procesar la respuesta exitosa aquí
      print('Respuesta exitosa: ${response.body}');
      Map<String, dynamic> data = jsonDecode(response.body);
      List<String> output = List<String>.from(data['data']["output"]);
      urlSt = output[0];
      print('String $urlSt');
      isLoading = false;
      notifyListeners();
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImgResponseScreen(
            response: urlSt,
            voltage: voltage,
            ph: ph,
            tds: tds,
            prompt: searchController.text,
          ),
        ),
      );
    } else {
      // Manejar el error de la petición aquí
      print('Error entición: ${response.statusCode}');
      isLoading = false;
      notifyListeners();
    }

    /* Map<String, dynamic> body = {
      "key": key,
      "prompt": prompt,
      "negative_prompt": "(out of frame)",
      "width": "512",
      "height": "512",
      "samples": "1",
      "num_inference_steps": "20",
      "safety_checker": "no",
      "enhance_prompt": "yes",
      "seed": null,
      "multi_lingual": "yes",
      "guidance_scale": 7.5,
      "webhook": null,
      "track_id": null
    };*/

    //print(jsonEncode(body));

    /*  var response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      // Procesar la respuesta exitosa aquí
      print('Respuesta exitosa: ${response.body}');
      var data = jsonDecode(response.body);
      urlSt = data['output'];
      isLoading = false;
      notifyListeners();
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImgResponseScreen(
              response: urlSt, voltage: voltage, ph: ph, tds: tds),
        ),
      );
    } else {
      // Manejar el error de la petición aquí
      print('Error entición: ${response.statusCode}');
      isLoading = false;
      notifyListeners();
    } */

//TODO: BORRAR
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImgResponseScreen(
          response: urlSt,
          voltage: voltage,
          ph: ph,
          tds: tds,
          prompt: searchController.text,
        ),
      ),
    );
  }

  Future<String> getVoltage() async {
    var url =
        Uri(scheme: 'http', host: '15.188.50.88', path: 'data', port: 3000);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Procesar la respuesta exitosa aquí
      print('Respuesta exitosa: ${response.body}');
      Map<String, dynamic> data2 = json.decode(response.body);
      voltage = (data2['stack_data']['volValue']).toDouble();
      ph = data2['stack_data']['ph_act'];
      tds = data2['stack_data']['tds_Value'].toDouble();
      print(voltage);
      //finalString = ph + tds + voltage;
      notifyListeners();
      return response.body;
    } else {
      // Manejar el error de la petición aquí
      print('Error en la petición: ${response.statusCode}');
      var data2 = "pila out of range";
      notifyListeners();
      return data2;
    }
  }

  void showVoltage() {
    finalVoltage = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 255, 0, 0), // Color del borde
            width: 1.5, // Ancho del borde
          ),
        ),
        child: Text(
            "VRESETB/VRESET VSS-0.3～VIN+0.3≦ ${voltage.toString()} Output Voltage,",
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontFamily: "IBMPlexMono",
              fontWeight: FontWeight.bold,
              fontSize: 13,
              // decoration: TextDecoration.combine(te)
            )));
    notifyListeners();
  }
}
