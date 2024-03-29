// ignore_for_file: must_be_immutable

import 'package:dontknowname/models/pagemodels/financeiro_page.dart';
import 'package:dontknowname/models/pagemodels/pageviewnavigation.dart';
import 'package:flutter/material.dart';

class finButton extends StatefulWidget {
  //botao financeiro
  const finButton({Key? key}) : super(key: key);

  @override
  State<finButton> createState() => _finButtonState();
}

double padfinanceiro = 0;
bool animatfincheck = false;
late AnimationController financontrol;

late DecorationTween finanshadow;

class _finButtonState extends State<finButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finanshadow = DecorationTween(
        begin: BoxDecoration(
            color: const Color(0xff264D74),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: const Color.fromARGB(255, 86, 127, 168),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));
    financontrol = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));

    financontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animatfincheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animatfincheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void animatefinan() {
      if (padfinanceiro == 0) {
        padhelp = 0;
        padfinanceiro = 0.08;
        padsolicitacao = 0;
      } else {
        padfinanceiro = 0;
      }
      pageviewcontroller.animateToPage(0,
          duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);

      if (animatfincheck == false) {
        financontrol.forward();
      }

      solicicontrol.reverse();
      helpcontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: size.height * padfinanceiro),
      duration: const Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: finanshadow.animate(financontrol),
          child: SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.14,
            child: InkWell(
              child: Image.asset(
                'assets/financeiro.png',
                scale: size.height * 0.02,
                color: Colors.white,
              ),
              onTap: () {
                animatefinan();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------

class soliButton extends StatefulWidget {
  //botao solicitacao
  const soliButton({Key? key}) : super(key: key);

  @override
  State<soliButton> createState() => _soliButtonState();
}

double padsolicitacao = 0.08;
bool animatsolicheck = true;
late AnimationController solicicontrol;

late DecorationTween solicishadow;

class _soliButtonState extends State<soliButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    solicicontrol = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));
    solicishadow = DecorationTween(
        begin: BoxDecoration(
            color: const Color(0xff264D74),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: const Color.fromARGB(255, 86, 127, 168),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));

    solicicontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animatsolicheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animatsolicheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void animatesoli() {
      if (padsolicitacao == 0) {
        padfinanceiro = 0;
        padsolicitacao = 0.08;
        padhelp = 0;
      } else {
        padsolicitacao = 0;
      }
      pageviewcontroller.animateToPage(1,
          duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);

      if (animatsolicheck == false) {
        solicicontrol.forward();
      }
      financontrol.reverse();
      helpcontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: size.height * padsolicitacao),
      duration: const Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: solicishadow.animate(solicicontrol),
          child: SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.14,
            child: InkWell(
              child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.017),
                  child: Image.asset(
                    'assets/solicitacao.png',
                    scale: size.height * 0.025,
                    color: Colors.grey[50],
                  )),
              onTap: () {
                animatesoli();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------

class helpbutto extends StatefulWidget {
  const helpbutto({Key? key}) : super(key: key);

  @override
  State<helpbutto> createState() => _helpbuttoState();
}

double padhelp = 0;
bool animathelpcheck = false;
late AnimationController helpcontrol;

late DecorationTween helpshadow;

class _helpbuttoState extends State<helpbutto>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helpshadow = DecorationTween(
        begin: BoxDecoration(
            color: const Color(0xff264D74),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: const Color.fromARGB(255, 86, 127, 168),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));
    helpcontrol = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));

    helpcontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animathelpcheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animathelpcheck = false;
        });
      }
    });
    solicicontrol.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void animatehelp() {
      if (padhelp == 0) {
        padfinanceiro = 0;
        padhelp = 0.08;
        padsolicitacao = 0;
      } else {
        padhelp = 0;
      }
      pageviewcontroller.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (animathelpcheck == false) {
        helpcontrol.forward();
      }
      financontrol.reverse();
      solicicontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: size.height * padhelp),
      duration: const Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: helpshadow.animate(helpcontrol),
          child: SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.14,
            child: InkWell(
              child: Icon(
                Icons.help_outline,
                size: size.height * 0.05,
                color: Colors.grey[50],
              ),
              onTap: () {
                animatehelp();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------------

class menubutton extends StatelessWidget {
  menubutton(
      {super.key,
      required this.iconM,
      required this.textM,
      required this.onpressedM});
  IconData iconM;
  String textM;
  final onpressedM;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.013),
      child: Container(
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onpressedM,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height * 0.0142,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  iconM,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: size.height * 0.01,
              ),
              SizedBox(
                width: size.width * 0.37,
                height: size.height * 0.1,
                child: Center(
                  child: Text(
                    textM,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-------------------------------------------------------------------------------------

class EditableTextformField extends StatefulWidget {
  EditableTextformField(
      {Key? key,
      required this.valorinicial,
      required this.readonly,
      required this.controller,
      required this.validator,
      required this.texthint,
      required this.textlabel})
      : super(key: key);
  TextEditingController? controller;
  String? Function(String?)? validator;
  String texthint;
  String textlabel;
  bool readonly;
  String? valorinicial;
  static bool enabled = false;

  @override
  State<EditableTextformField> createState() => _EditableTextformFieldState();
}

class _EditableTextformFieldState extends State<EditableTextformField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.readonly == false) {
        EditableTextformField.enabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        child: widget.readonly
            ? FocusScope(
                node: FocusScopeNode(),
                child: TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style:
                      const TextStyle(color: Color.fromARGB(190, 42, 42, 42)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2.5, color: Color.fromARGB(135, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(13)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2.5, color: Color.fromARGB(139, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(13)),
                      prefixIcon: null,
                      hintText: widget.texthint,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(175, 161, 161, 161)),
                      labelText: widget.textlabel,
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(138, 0, 0, 0),
                      ),
                      focusColor: const Color.fromARGB(126, 0, 0, 0),
                      contentPadding: EdgeInsets.all(size.width * 0.012),
                      alignLabelWithHint: false,
                      counterText: '',
                      counterStyle:
                          const TextStyle(height: double.minPositive)),
                  readOnly: widget.readonly,
                  initialValue: widget.valorinicial,
                ),
              )
            : TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                onChanged: (value) {
                  setState(() {});
                },
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.5, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(13)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.5, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(13)),
                    prefixIcon: null,
                    hintText: widget.texthint,
                    hintStyle: const TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 135, 135, 135)),
                    labelText: widget.textlabel,
                    labelStyle: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    focusColor: const Color.fromARGB(255, 0, 0, 0),
                    contentPadding: EdgeInsets.all(size.width * 0.012),
                    alignLabelWithHint: false,
                    counterText: '',
                    counterStyle: const TextStyle(height: double.minPositive)),
                readOnly: widget.readonly,
                initialValue: widget.valorinicial,
              ));
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class CompRendButton extends StatefulWidget {
  const CompRendButton({Key? key}) : super(key: key);

  @override
  State<CompRendButton> createState() => _CompRendButtonState();
}

late AnimationController compredcontroller;
late DecorationTween compredtween;

bool compredtweencheck = false;

class _CompRendButtonState extends State<CompRendButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    compredcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));

    compredtween = DecorationTween(
      begin: BoxDecoration(
          color: const Color.fromARGB(228, 140, 183, 226),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(0, 72, 141, 245)),
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(0, 0, 0, 0))
          ]),
      end: BoxDecoration(
          color: const Color(0xff5185B7),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(81, 0, 0, 0)),
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(133, 72, 141, 245)),
          ]),
    );
    compredcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          compredtweencheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          compredtweencheck = false;
        });
      }
    });
  }

  void animatecompred() {
    if (compredtweencheck == false) {
      compredcontroller.forward();
    }
    contcheqcontroller.reverse();
    fichfincontroller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (() {
              animatecompred();
              finanpageviewcontroller.animateToPage(1,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
            }),
            child: DecoratedBoxTransition(
              decoration: compredtween.animate(compredcontroller),
              child: SizedBox(
                width: size.width * 0.93,
                height: size.height * 0.05,
                child: const Center(
                    child: Text(
                  'Comprovante de Rendimentos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.005),
            child: DecoratedBoxTransition(
                decoration: compredtween.animate(compredcontroller),
                child: Container(
                  height: size.height * 0.015,
                  width: size.width * 0.03,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                )),
          )
        ],
      ),
    );
  }
}

class ContraChequeButton extends StatefulWidget {
  const ContraChequeButton({Key? key}) : super(key: key);

  @override
  State<ContraChequeButton> createState() => _ContraChequeButtonState();
}

late AnimationController contcheqcontroller;
late DecorationTween contcheqtween;

bool contcheqtweencheck = false;

class _ContraChequeButtonState extends State<ContraChequeButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contcheqcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));
    contcheqtween = DecorationTween(
      begin: BoxDecoration(
          color: const Color.fromARGB(228, 140, 183, 226),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(0, 72, 141, 245)),
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(0, 0, 0, 0))
          ]),
      end: BoxDecoration(
          color: const Color(0xff5185B7),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(81, 0, 0, 0)),
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(133, 72, 141, 245)),
          ]),
    );
    contcheqcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          contcheqtweencheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          contcheqtweencheck = false;
        });
      }
    });
  }

  void animatecontcheq() {
    if (contcheqtweencheck == false) {
      contcheqcontroller.forward();
    }
    compredcontroller.reverse();
    fichfincontroller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (() {
              finanpageviewcontroller.animateToPage(0,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
              animatecontcheq();
            }),
            child: DecoratedBoxTransition(
              decoration: contcheqtween.animate(contcheqcontroller),
              child: SizedBox(
                width: size.width * 0.93,
                height: size.height * 0.05,
                child: const Center(
                    child: Text(
                  'Contra-Cheque',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.005),
            child: DecoratedBoxTransition(
                decoration: contcheqtween.animate(contcheqcontroller),
                child: Container(
                  height: size.height * 0.015,
                  width: size.width * 0.03,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                )),
          )
        ],
      ),
    );
  }
}

class FichaFinanceiraButton extends StatefulWidget {
  const FichaFinanceiraButton({Key? key}) : super(key: key);

  @override
  State<FichaFinanceiraButton> createState() => _FichaFinanceiraButtonState();
}

late AnimationController fichfincontroller;
late DecorationTween fichfintween;

bool fichfintweencheck = true;

class _FichaFinanceiraButtonState extends State<FichaFinanceiraButton>
    with SingleTickerProviderStateMixin {
  void animatefichfin() {
    if (fichfintweencheck == false) {
      fichfincontroller.forward();
    }
    contcheqcontroller.reverse();
    compredcontroller.reverse();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fichfincontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));
    fichfintween = DecorationTween(
      begin: BoxDecoration(
          color: const Color.fromARGB(228, 140, 183, 226),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(0, 72, 141, 245)),
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(0, 0, 0, 0))
          ]),
      end: BoxDecoration(
          color: const Color(0xff5185B7),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, -1),
                blurRadius: 5,
                color: Color.fromARGB(81, 0, 0, 0)),
            BoxShadow(
                offset: Offset(-2, 2.5),
                blurRadius: 1,
                color: Color.fromARGB(133, 72, 141, 245)),
          ]),
    );
    fichfincontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          fichfintweencheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          fichfintweencheck = false;
        });
      }
    });
    fichfincontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (() {
              finanpageviewcontroller.animateToPage(2,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
              animatefichfin();
            }),
            child: DecoratedBoxTransition(
                decoration: fichfintween.animate(fichfincontroller),
                child: SizedBox(
                  width: size.width * 0.93,
                  height: size.height * 0.05,
                  child: const Center(
                    child: Text(
                      'Ficha Financeira',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.004),
            child: DecoratedBoxTransition(
                decoration: fichfintween.animate(fichfincontroller),
                child: Container(
                  height: size.height * 0.015,
                  width: size.width * 0.03,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                )),
          )
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------

class DropDownMenuBelowMine extends StatelessWidget {
  DropDownMenuBelowMine(
      {super.key,
      required this.categoria,
      required this.controlador,
      required this.aoclicar,
      required this.PutlistviewHere});
  final String categoria;
  TextEditingController? controlador;
  final Function() aoclicar;
  final Widget PutlistviewHere;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.055,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.29,
                  child: Center(
                    child: Text(
                      categoria,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.013,
                  ),
                  child: Container(
                    width: size.width * 0.34,
                    decoration: BoxDecoration(
                        color: const Color(0xffC4E0EE),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(-2, 2),
                              blurRadius: 1,
                              color: Color.fromARGB(100, 27, 120, 166))
                        ]),
                    child: Center(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: null,
                          focusColor: null,
                        ),
                        controller: controlador,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.112,
                  height: size.height * 0.08,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-2, 2.5),
                            color: Color.fromARGB(127, 72, 141, 245))
                      ],
                      color: Color(0xff5185B7),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: GestureDetector(
                    onTap: aoclicar,
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: 0,
                      child: Image.asset(
                        'assets/arrow.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //listview
          ListView.builder(itemBuilder: (((context, index) {
            return PutlistviewHere;
          })))
        ],
      ),
    );
  }
}
