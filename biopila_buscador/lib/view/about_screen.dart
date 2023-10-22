import 'package:flutter/material.dart';

import 'buscador_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final double voltage;
  const AboutScreen({super.key, required this.voltage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(58.0),
            child: Column(children: [
              Center(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 10.0),
                    child: Text(
                      "Holy Bacter ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cirka',
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: MediaQuery.of(context).size.width >= 451
                        ? EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 1 / 5,
                            10,
                            MediaQuery.of(context).size.width * 1 / 5,
                            10.0)
                        : const EdgeInsets.fromLTRB(2, 10, 2, 10.0),
                    child: const Text(
                      "Holy Bacter es un colectivo interdisciplinar auto-concebido como DAO (Organización Autónoma Descentralizada) que se fundamenta en las prácticas rituales, la biología sintética y las tecnologías descentralizadas como pilares para la imaginación de futuros interespecie. Su primer prototipo investiga las Celdas de Combustible Microbianas (CCMS) en el tratamiento sostenible de aguas residuales y la generación de bioenergía en un contexto de escasez del agua. A través de una serie de ejercicios de diseño especulativo, presentan una mitología sobre las bacterias electroactivas que trasciende su categorización como artefactos de biorremediación, fomentando una reflexión más amplia sobre su rol en la llamada bioeconomía del futuro",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cirka',
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 20),
                ]),
              ),
              Container(
                //alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // Color del borde
                    width: 1.5, // Ancho del borde
                  ),
                ),
                child: Text(
                    "VRESETB/VRESET VSS-0.3～VIN+0.3≦ ${voltage.toString()} Output Voltage",
                    style: const TextStyle(
                      color: Colors.red,
                      fontFamily: "IBMPlexMono",

                      fontSize: 13,
                      // decoration: TextDecoration.combine(te)
                    )),
              ),
              const SizedBox(height: 20),
            ])),
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
                launchUrl(Uri.parse('https://discord.gg/PrrkYr74'));
              },
              child: const Row(
                children: [
                  Text(
                    'connect to discord ',
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
  }
}
