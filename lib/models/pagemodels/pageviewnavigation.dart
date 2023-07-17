// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:dontknowname/boasVindas_page.dart';
import 'package:dontknowname/models//button_models/buttonmodels.dart';
import 'package:dontknowname/models/pagemodels/ajuda_page.dart';
import 'package:dontknowname/models/pagemodels/financeiro_page.dart';
import 'package:dontknowname/models/pagemodels/solicitacao_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../useless]/trashApicall.dart';

PageController pageviewcontroller = PageController(initialPage: 1);

class customnavigation extends StatefulWidget {
  const customnavigation({Key? key}) : super(key: key);

  static late Function Pressed;

  @override
  State<customnavigation> createState() => _customnavigationState();
}

class _customnavigationState extends State<customnavigation> {
  @override
  Future<void> getCompetenciaCall() async {
    String Url = "https://my-json-server.typicode.com/typicode/demo/comments";

    var resultado = await http.get(Uri.parse(Url));
    CompetenciaList = jsonDecode(resultado.body)
        .map((item) => Competencia.fromJson(item))
        .toList()
        .cast<Competencia>();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompetenciaCall();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: null,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: ExactAssetImage('assets/bg5.jpg'),
              )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: size.width * 0.54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.width * 0.06,
                              size.height * 0.07, 0, size.height * 0.15),
                          child: Image.asset(
                            'assets/logo.png',
                            width: size.width * 0.40,
                          ),
                        ),
                        menubutton(
                            iconM: Icons.key,
                            textM: 'Alterar Senha',
                            onpressedM: () {}),
                        menubutton(
                          iconM: Icons.upcoming,
                          textM: 'Solicitação',
                          onpressedM: () {
                            setState(() {
                              pageviewnavigator.showdrawer = 0;
                              pageviewcontroller.animateToPage(1,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.easeInOut);
                            });
                          },
                        ),
                        menubutton(
                          iconM: Icons.wallet,
                          textM: 'Financeiro',
                          onpressedM: () {
                            setState(() {
                              pageviewnavigator.showdrawer = 0;
                              pageviewcontroller.animateToPage(0,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.easeInOut);
                            });
                          },
                        ),
                        menubutton(
                          iconM: Icons.help_rounded,
                          textM: 'Ajuda',
                          onpressedM: () {
                            setState(() {
                              pageviewnavigator.showdrawer = 0;
                              pageviewcontroller.animateToPage(2,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.easeInOut);
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.22),
                          child: SizedBox(
                              child: InkWell(
                            onTap: () => setState(() {
                              pageviewnavigator.showdrawer = 0;
                            }),
                            child: InkWell(
                              onTap: (() async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const boasvindas())));

                                prefs.setString('token', 'none');
                              }),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.025,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 206, 86, 84),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  const Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const pageviewnavigator(),
          ],
        ));
  }
}

class menudraw extends StatelessWidget {
  const menudraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.10,
      height: size.height * 0.06,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(-2, 2.5), color: Color.fromARGB(127, 72, 141, 245))
        ],
        color: Color(0xff6392C0),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(0), right: Radius.circular(17)),
      ),
      child: const Icon(
        Icons.drag_indicator,
        color: Colors.white,
      ),
    );
  }
}

class pageviewnavigator extends StatefulWidget {
  static int showdrawer = 0;
  static var pressed = () {};

  const pageviewnavigator({Key? key}) : super(key: key);

  @override
  State<pageviewnavigator> createState() => _pageviewnavigatorState();
}

class _pageviewnavigatorState extends State<pageviewnavigator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageviewnavigator.pressed = () {
      pageviewnavigator.showdrawer = 1;
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TweenAnimationBuilder(
        tween: Tween<double>(
            begin: 0, end: pageviewnavigator.showdrawer == 1 ? 1 : 0),
        duration: const Duration(milliseconds: 200),
        builder: ((_, double value, __) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..setEntry(0, 3, 200 * value)
              ..rotateY((pi / 6) * value),
            child: ClipRRect(
                borderRadius: pageviewnavigator.showdrawer == 1
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      //fundo
                      width: double.infinity,
                      height: double.infinity,
                      color: const Color.fromARGB(255, 246, 246, 246),
                    ),
                    Align(
                        //pageview
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: size.height * 0.90,
                          width: double.infinity,
                          child: PageView(
                            controller: pageviewcontroller,
                            onPageChanged: (index) {},
                            children: const [
                              FinanceiroPage(),
                              solicitacao_pagina(),
                              AjudaPage()
                            ],
                          ),
                        )),
                    Align(
                      //CustomPaintBottomNavigator
                      alignment: Alignment.bottomCenter,
                      child: CustomPaint(
                        size: Size(double.infinity, size.height * 0.15),
                        painter: mamasmamas(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.85),
                      child: Row(
                        //row buttons para page.controller
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.10), //botão financeiro
                              child: const finButton()),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.192), //botão solicitacao
                            child: const soliButton(),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.20), //botão ajuda
                              child: const helpbutto()),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (v) {
                        if (v.delta.dx > 0) {
                          setState(() {
                            pageviewnavigator.showdrawer = 1;
                          });
                        } else {
                          setState(() {
                            pageviewnavigator.showdrawer = 0;
                          });
                        }
                      },
                    )
                  ],
                )),
          );
        }));
  }
}

class mamasmamas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff264D74)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0003623, size.height * 1.0001000);
    path0.lineTo(0, size.height * 0.3403000);
    path0.lineTo(size.width * 0.0672705, size.height * 0.3452000);
    path0.quadraticBezierTo(size.width * 0.0681401, size.height * 0.7300000,
        size.width * 0.0830676, size.height * 0.7811000);
    path0.cubicTo(
        size.width * 0.0965217,
        size.height * 0.8526000,
        size.width * 0.2436473,
        size.height * 0.8472000,
        size.width * 0.2559179,
        size.height * 0.7850000);
    path0.quadraticBezierTo(size.width * 0.2722947, size.height * 0.7336000,
        size.width * 0.2758937, size.height * 0.3591000);
    path0.lineTo(size.width * 0.3919565, size.height * 0.3584000);
    path0.quadraticBezierTo(size.width * 0.3965459, size.height * 0.7429000,
        size.width * 0.4150483, size.height * 0.7871000);
    path0.cubicTo(
        size.width * 0.4321256,
        size.height * 0.8456000,
        size.width * 0.5781401,
        size.height * 0.8532000,
        size.width * 0.5948551,
        size.height * 0.7811000);
    path0.quadraticBezierTo(size.width * 0.6097585, size.height * 0.7240000,
        size.width * 0.6140580, size.height * 0.3623000);
    path0.lineTo(size.width * 0.7347826, size.height * 0.3630000);
    path0.quadraticBezierTo(size.width * 0.7364734, size.height * 0.7116000,
        size.width * 0.7499034, size.height * 0.7682000);
    path0.cubicTo(
        size.width * 0.7649034,
        size.height * 0.8445000,
        size.width * 0.8978502,
        size.height * 0.8565000,
        size.width * 0.9307246,
        size.height * 0.7725000);
    path0.quadraticBezierTo(size.width * 0.9479710, size.height * 0.7312000,
        size.width * 0.9479469, size.height * 0.3587000);
    path0.lineTo(size.width * 0.9995169, size.height * 0.3580000);
    path0.lineTo(size.width * 0.9995169, size.height * 1.0001000);
    path0.lineTo(size.width * -0.0003623, size.height * 1.0001000);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
