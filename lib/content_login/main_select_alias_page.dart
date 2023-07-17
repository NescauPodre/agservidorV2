// ignore_for_file: unused_field

import 'package:dontknowname/content_login/login_page.dart';
import 'package:dontknowname/content_login/main_select_vinculo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:dontknowname/services/alias/alias_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAliasPage extends StatefulWidget {
  const MainAliasPage({super.key});

  @override
  State<MainAliasPage> createState() => _MainAliasPageState();
}

List<Map> _jsonAlias = [
  {"id": '.agape', "name": "Agape"},
  {"id": '087896', "name": "gbarbosa"}
];

class _MainAliasPageState extends State<MainAliasPage> {
  final _primaryColor = const Color.fromRGBO(71, 66, 131, 0.2);
  final _errorColor = Colors.red;
  String? _selectedAlias;
  late Future<List<Alias>> _futureA;

  @override
  void initState() {
    super.initState();
    _futureA = _getAlias() as Future<List<Alias>>;
  }

  //------------
  Future<Alias> _getAlias() async {
    final resposta = await http.get(Uri.parse('uri'));
    Map<String, dynamic> json = jsonDecode(resposta.body);
    final Aliasresponse = Alias.fromJson(json);
    return Aliasresponse;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: null,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              scale: 1, fit: BoxFit.cover, image: AssetImage("assets/bg4.jpg")),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selecione o ",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  Text(
                    "Municipio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Theme(
                data: Theme.of(context).copyWith(canvasColor: _primaryColor),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _primaryColor),
                    child: Form(
                      child: DropdownButton(
                        style: const TextStyle(color: Colors.white),
                        alignment: Alignment.center,
                        dropdownColor: _primaryColor,
                        value: _selectedAlias,
                        items: _jsonAlias.map((Map map) {
                          return DropdownMenuItem<String>(
                            value: map["id"].toString(),
                            child: Text(
                              map["name"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedAlias = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                child: Container(
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.1, 0.1),
                      colors: <Color>[
                        Color.fromARGB(255, 8, 67, 157),
                        Color.fromARGB(255, 69, 143, 255),
                      ],
                    ),
                  ),
                  child: TextButton(
                    child: const Text("Prosseguir",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_selectedAlias != null && _selectedAlias != '') {
                        bool Ok = await dologin();
                        if (Ok == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const SelecionarVinculoPage())));
                        } else {
                          const snack = SnackBar(
                            content: Text('Login ou Cliente Invalidos'),
                            duration: Duration(milliseconds: 3000),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                      } else {
                        const snack = SnackBar(
                          content:
                              Text('Erro no Cliente, Favor Selecionar Valido'),
                          duration: Duration(milliseconds: 3000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    },
                  ),
                ),
              ),
              // LoginPageNew.atualAlias = _selectedAlias;
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Container(
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.1, 0.1),
                      colors: <Color>[
                        Color.fromARGB(255, 8, 67, 157),
                        Color.fromARGB(255, 69, 143, 255),
                      ],
                    ),
                  ),
                  child: TextButton(
                      child: const Text("Voltar",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginPage())));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> dologin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obj = LoginPage.cpfcontroller.text;
    obj =
        obj.replaceAll('-', '').replaceAll('.', '') + _selectedAlias.toString();

    var body = jsonEncode({
      "usu_login": obj,
      "usu_pwd": md5
          .convert(utf8.encode(LoginPage.senhacontroller.text))
          .toString()
          .toUpperCase()
    });
    var url =
        Uri.parse('https://agportal.agapesistemas.com.br/AgPortalApi/login');
    var resposta = await http.post(
      url,
      headers: {'Accept': 'text/plain', 'content-type': 'application/json'},
      body: body,
    );
    if (resposta.statusCode == 200) {
      await sharedPreferences.setString('token', resposta.body);
      return true;
    } else {
      return false;
    }
  }
}
