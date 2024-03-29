//import 'package:agservidor/models/Matricula/drawmatricula.dart';
import 'package:dontknowname/models/button_models/formulariosmodels.dart';
import 'package:dontknowname/models/pagemodels/pageviewnavigation.dart';
import 'package:flutter/material.dart';

import '../../services/pdfmat_generator.dart';

class solicitacao_pagina extends StatefulWidget {
  const solicitacao_pagina({Key? key}) : super(key: key);

  @override
  State<solicitacao_pagina> createState() => _solicitacao_paginaState();
}

class _solicitacao_paginaState extends State<solicitacao_pagina> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        appBar: null,
        body: SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08, vertical: size.height * 0.06),
              child: Column(
                children: [
                  SizedBox(
                    // Cabeçalho completo
                    width: size.width * 0.80,
                    height: size.height * 0.097,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: size.height * 0.10,
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.02),
                                width: size.width * 0.45,
                                height: size.height * 0.03,
                                child: Text(
                                  'username',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000)),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.02),
                                width: size.width * 0.40,
                                height: size.height * 0.03,
                                child: Text(
                                  'company',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(150, 0, 0, 0)),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.02),
                                width: size.width * 0.40,
                                height: size.height * 0.03,
                                child: Text(
                                  'matricula',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(150, 0, 0, 0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.01),
                          child: Container(
                            height: size.height * 0.09,
                            decoration: BoxDecoration(boxShadow: const [
                              BoxShadow(
                                  offset: Offset(-3, 3),
                                  blurRadius: 5,
                                  color: Color(0xffCBCBCB))
                            ], borderRadius: BorderRadius.circular(10)),

                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    Image.asset("assets/exampleprofile.png")),
                            //Imagem de perfil do usuario
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.001,
                        vertical: size.height * 0.023),
                    child: SizedBox(
                      //corpo completo
                      width: size.width * 1,
                      height: size.height * 0.674,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.90,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff5185B7),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(-3, 3),
                                      blurRadius: 1,
                                      color: Color.fromARGB(110, 72, 141, 245)),
                                ]),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: const Color(0xff5185B7),
                                    context: context,
                                    builder: (context) =>
                                        const bottomsheetrequisicao());
                              },
                              child: const Center(
                                  child: Text(
                                'Escrever uma Requisição',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.008),
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.27,
                                  height: size.height * 0.0475,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(-3, -2),
                                            blurRadius: 1,
                                            color: Color.fromARGB(
                                                104, 91, 153, 212)),
                                        BoxShadow(
                                            offset: Offset(1, 0),
                                            blurRadius: 1,
                                            color: Color.fromARGB(
                                                104, 91, 153, 212))
                                      ]),
                                  child: const InkWell(
                                    child: Center(
                                        child: Text(
                                      'Listagem',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.559,
                                  height: size.height * 0.0475,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff5185B7),
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(-2, -2),
                                            color: Color.fromARGB(
                                                106, 72, 141, 245))
                                      ]),
                                  child: InkWell(
                                    onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            const Color(0xff5185B7),
                                        context: context,
                                        builder: (context) =>
                                            const novasolicitacao()),
                                    child: const Center(
                                        child: Text(
                                      'Nova Solicitação',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.55,
                            width: size.width * 0.88,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(-7, 7),
                                      blurRadius: 3,
                                      color: Color.fromARGB(111, 91, 153, 212)),
                                  BoxShadow(
                                      offset: Offset(1, 0),
                                      blurRadius: 2,
                                      color: Color.fromARGB(111, 91, 153, 212))
                                ]),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // DrawMatricula(context),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size.height * 0.015),
                                    child: InkWell(
                                      child: Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.51,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xff5185B7),
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(-3, 3),
                                                    blurRadius: 1,
                                                    color: Color.fromARGB(
                                                        110, 72, 141, 245)),
                                              ]),
                                          child: const Center(
                                            child: Text(
                                              'Imprimir',
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                      onTap: () async {
                                        pdfCreater();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(size.width * 0, size.height * 0.05, 0, 0),
              child: const menudraw(),
            )
          ]),
        ));
  }
}
