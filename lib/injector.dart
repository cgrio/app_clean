import 'package:app_clean/apresentacao/blocs/artigos_remoto/artigos_remoto_bloc.dart';
import 'package:app_clean/dados/fontes_dados/remotos/news_api_servico.dart';
import 'package:app_clean/dados/repositorios/artigo_repositorio_execucao_servico.dart';
import 'package:app_clean/dominio/casos_usos/get_artigos_casouso.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> initializeDependences() async {
  //Dio Client
  injector.registerSingleton<Dio>(Dio());

//Dependencias
  injector.registerSingleton<NewsApiServico>(NewsApiServico(injector()));
  injector.registerSingleton<ArtigoRepositorioExecucaoServico>(
      ArtigoRepositorioExecucaoServico(injector()));

//Casos de Uso
  injector.registerSingleton<GetArtigosCasoUso>(GetArtigosCasoUso(injector()));

//Casos de Uso
  injector.registerSingleton<ArtigosRemotoBloc>(ArtigosRemotoBloc(injector()));
}
