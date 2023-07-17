// ignore_for_file: unused_import

import 'package:dontknowname/models/pagemodels/solicitacao_page.dart';
import 'package:flutter/material.dart';

class esquecisenhapage extends StatelessWidget {
  const esquecisenhapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color.fromARGB(192, 255, 255, 255),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Olá username, uma nova senha foi enviada para seu email')
                ],
              ))
        ],
      ),
    );
  }
}
