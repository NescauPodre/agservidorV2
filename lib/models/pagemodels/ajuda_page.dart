import 'package:flutter/material.dart';

import 'pageviewnavigation.dart';

class AjudaPage extends StatefulWidget {
  const AjudaPage({Key? key}) : super(key: key);

  @override
  State<AjudaPage> createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        appBar: null,
        body: SingleChildScrollView(
          child: Stack(children: [
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.07),
              child: Container(
                height: size.height * 0.77,
                width: size.width * 0.88,
                decoration: BoxDecoration(color: const Color(0xffC4E0EE),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                                        BoxShadow(
                                      offset: Offset(-3, 3),
                                      blurRadius: 1,
                                      color: Color.fromARGB(110, 72, 141, 245)),
                                          BoxShadow(
                                      offset: Offset(1, -1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(110, 72, 141, 245)),
                ]
                ),
                child: Align(alignment: Alignment.bottomRight,child: Image.asset('assets/BackgroundHelp.png',height: size.height*0.3,color: const Color.fromARGB(83, 0, 0, 0),),)
              ),
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.00, size.height * 0.05, 0, 0),
              child: const menudraw(),
            )
          ]),
        ));
  }
}
