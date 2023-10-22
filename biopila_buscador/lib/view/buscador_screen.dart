import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../viewModel/buscador_screen_VM.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  searchWidget_VM viewModel = searchWidget_VM();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.getVoltage();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.searchController.dispose();
    super.dispose();
  }

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Type something';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String data;
    if (MediaQuery.of(context).size.width >= 451) {
      data =
          'VDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) ④ Watchdog Timeout Period 6 1.6s (TYP.) ⑤⑥ Detect Voltage 16 ~ 50 Detect voltage ex.) 4.5V: ⑤⇒4, ⑥⇒5 MR SOT-25 (3,000/Reel) Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100 mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O C Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100Typer mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O CVDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.20 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) 5ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TY)VDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) ④ Watchdog Timeout Period 6 1.6s (TYP.) ⑤⑥ Detect Voltage 16 ~ 50 Detect voltage ex.) 4.5V: ⑤⇒4, ⑥⇒5 MR SOT-25 (3,000/Reel) Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100 mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O C Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100Typer mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O CVDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.20 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) 5ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TY) VDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) ④ Watchdog Timeout Period 6 1.6s (TYP.) ⑤⑥ Detect Voltage 16 ~ 50 Detect voltage ex.) 4.5V: ⑤⇒4, ⑥⇒5 MR SOT-25 (3,000/Reel) Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Diswsipation USP-6C Pd 100 mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O C Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100Typer mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O CVDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.20 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms  ';
    } else {
      data =
          'VDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) ④ Watchdog Timeout Period 6 1.6s (TYP.) ⑤⑥ Detect Voltage 16 ~ 50 Detect voltage ex.) 4.5V: ⑤⇒4, ⑥⇒5 MR SOT-25 (3,000/Reel) Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100 mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O C Input Voltage VMRB VSS-0.3～VIN+0.3≦7.0 V VWD VSS -0.3 ~ 7.0 V Output Current IRBOUT/IROUT 20 mA CMOS Output VRESETB/VRESET VSS-0.3～VIN+0.3≦7.0 Output Voltage N-ch Open Drain Output VRESETB VSS -0.3 ~ 7.0 V SOT-25 250 Power Dissipation USP-6C Pd 100Typer mW Operating Ambient Temperature Topr -40 ~ +85 O C Storage Temperature Tstg -40 ~ +125 O CVDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual functions, and reset output type as per Selection Guide in the above chart A 3.13ms (TYP.) B 25ms (TYP.) C 50ms (TYP.) D 100ms (TYP.) E 200ms (TYP.) F 400ms (TYP.) ③ Release Delay Time * H 1.6s (TYP.) 0 No WD timeout period for XC6116, XC6117 Series 1 6.20 No WD timeout period for XC6116, XC6117 Series 1 6.25ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TYP.) 5ms (TYP.) 2 50ms (TYP.) 3 100ms (TYP.) 4 200ms (TYP.) 5 400ms (TY)VDF x 5% (TYP.) with hysteresis ① Hysteresis Width 1 VDF x 0.1% (TYP.) without hysteresis ② Functions and Type of Reset Output 1 ~ 7 Watchdog and manual function  ';
    }
    return ChangeNotifierProvider<searchWidget_VM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<searchWidget_VM>(builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 38.0, 30, 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontFamily: "IBMPlexMono",
                              fontSize: 12),
                          child: AnimatedTextKit(
                            onFinished: () {
                              viewModel.showVoltage();
                            },
                            pause: const Duration(milliseconds: 1),
                            repeatForever: false,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TypewriterAnimatedText(data,
                                  speed: const Duration(milliseconds: 2))
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width >=
                                          451
                                      ? MediaQuery.of(context).size.width *
                                          1.5 /
                                          3
                                      : MediaQuery.of(context).size.width / 1.2,
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Cirka",
                                      ),
                                      validator: fieldValidator,
                                      onFieldSubmitted: (String val) {
                                        if (_formKey.currentState!.validate()) {
                                          viewModel.search(context);
                                        }
                                      },
                                      cursorColor: Colors.white,
                                      controller: viewModel.searchController,
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        labelText:
                                            '   Type your query to the interbacterial Oracle',
                                        labelStyle: const TextStyle(
                                          fontFamily: "Cirka",
                                          fontSize: 17,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        floatingLabelStyle: const TextStyle(
                                            fontFamily: "Cirka",
                                            color: Colors.white),
                                        filled: true,
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .white, // Color de resaltado cuando se escribe
                                            width: 2.0,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        suffixIcon: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border(
                                              left: BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                viewModel.search(context);
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      38, 5.0, 48.0, 8.0),
                                              child: (viewModel.isLoading
                                                  ? const CircularProgressIndicator(
                                                      color: Color.fromARGB(
                                                          255, 255, 0, 0),
                                                    )
                                                  : const Text('enter',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Cirka",
                                                        fontSize: 17,
                                                      ))),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    viewModel.finalVoltage,
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
