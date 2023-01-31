import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primaryColor: ColorsApp.instance.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsApp.instance.primary,
          primary: ColorsApp.instance.primary,
          secondary: ColorsApp.instance.secondary,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Slash')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            ElevatedButton(onPressed: () {}, child: const Text('Teste'))
          ],
        ),
      ),
    );
  }
}
