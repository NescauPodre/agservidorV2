import 'package:dontknowname/content_login/login_page.dart';
import 'package:dontknowname/content_login/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

PageController pc = PageController(initialPage: 0);

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        controller: pc,
        children: const [MainPage(), LoginPage()],
      ),
    );
  }
}
