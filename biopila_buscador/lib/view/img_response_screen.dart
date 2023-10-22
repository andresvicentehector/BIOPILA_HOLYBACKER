import 'package:flutter/material.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:holyBacter/view/about_screen.dart';
import 'package:holyBacter/view/buscador_screen.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../viewModel/img_response_screen_VM.dart';

class ImgResponseScreen extends StatefulWidget {
  final String response;
  final double ph;
  final double voltage;
  final double tds;
  final String prompt;
  const ImgResponseScreen(
      {super.key,
      required this.prompt,
      required this.response,
      required this.ph,
      required this.voltage,
      required this.tds});

  @override
  State<ImgResponseScreen> createState() => _ImgResponseScreenState();
}

class _ImgResponseScreenState extends State<ImgResponseScreen> {
  ImgResponseScreenVM viewModel = ImgResponseScreenVM();
  @override
  void initState() {
    super.initState();
    viewModel.fetchCountry();
    viewModel.currentDate = DateTime.now();
    viewModel.formattedDate =
        DateFormat('yyyy.MM.dd HH:mm').format(viewModel.currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImgResponseScreenVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<ImgResponseScreenVM>(builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Center(
                  child: Column(children: [
                    Text(
                      "${viewModel.country}, ${viewModel.formattedDate}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cirka',
                          fontSize: 12),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 0, 0),
                            width: 2.0,
                          ),
                        ),
                        child: Image.network(widget.response,
                            fit: BoxFit.contain)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_downward,
                          size: 10,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.downloadImage2(widget.response);
                          },
                          child: const Text(
                            ' download image ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Cirka",
                                fontSize: 12),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          size: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Color.fromARGB(255, 255, 0, 0), // Color del borde
                          width: 1.5, // Ancho del borde
                        ),
                      ),
                      child: Text(
                          "VRESETB/VRESET VSS-0.3～VIN+0.3≦ ${widget.voltage.toString()} Output Voltage",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontFamily: "IBMPlexMono",

                            fontSize: 13,
                            // decoration: TextDecoration.combine(te)
                          )),
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchWidget(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          ' home',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Cirka",
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AboutScreen(voltage: widget.voltage),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'learn more ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Cirka",
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
