import 'package:app_clean/configuracao/tema/tema.dart';
import 'package:app_clean/nucleo/utilidades/constantes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitulo,
      theme: Tema.temaClaro,
    );
  }
}
