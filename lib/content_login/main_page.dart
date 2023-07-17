import 'dart:ui';
import 'package:dontknowname/content_login/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            scale: 1, fit: BoxFit.cover, image: AssetImage("assets/bg5.jpg")),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.7, sigmaY: 6.7),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                    child: Image.asset("assets/logo-servidor.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: Text(
                      "Contra-Cheque",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 8),
                    child: Text(
                      "Emissão de contra-cheque do servidor",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: Text(
                      "Realizar Requerimentos",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 8),
                    child: Text(
                      "Servidor possa requerer ao RH qualquer coisa de seu interesse",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Text(
                      "Atualizar dados cadastrais",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Text(
                      "Acesso ao seu cadastro e realizar alterações",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.09),
                    child: Container(
                      width: size.width * 0.78,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment(0.1, 0.1),
                          colors: <Color>[
                            Color.fromARGB(255, 6, 55, 128),
                            Color.fromARGB(255, 69, 143, 255),
                          ],
                        ),
                      ),
                      child: InkWell(
                          onTap: () {
                            pc.animateToPage(1,
                                duration: const Duration(milliseconds: 450),
                                curve: Curves.easeIn);
                          },
                          child: const Center(
                            child: Text('Prosseguir',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset("assets/logo-agape.png"),
            )
          ],
        ),
      ),
    );
  }
}
