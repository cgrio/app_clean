import 'package:app_clean/apresentacao/blocs/artigos_remoto/artigos_remoto_bloc.dart';
import 'package:app_clean/configuracao/rotas/app_rotas.dart';
import 'package:app_clean/configuracao/tema/tema.dart';
import 'package:app_clean/injector.dart';
import 'package:app_clean/nucleo/utilidades/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependences();
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArtigosRemotoBloc>(
      create: (_) => injector()..add(const GetArtigos()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitulo,
        theme: Tema.temaClaro,
        onGenerateRoute: AppRotas.onGenerateRoutes,
      ),
    );
  }
}
