import 'dart:io';
import 'package:app_clean/dados/fontes_dados/remotos/news_api_servico.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';
import 'package:app_clean/dominio/repositorios/artigos_repositorio.dart';
import 'package:app_clean/nucleo/parametros/artigos_request_parametros.dart';
import 'package:app_clean/nucleo/recursos/dados_estados.dart';
import 'package:dio/dio.dart';

class ArtigoRepositorioExecucaoServico implements ArtigosRepositorio {
  final NewsApiServico _newsApiServico;

  const ArtigoRepositorioExecucaoServico(this._newsApiServico);

  @override
  Future<DadosEstado<List<ArtigoEntidade?>>> getBreakingNewsArticles(
      ArtigosRequestParametros parametros) async {
    try {
      final httpResponse = await _newsApiServico.getBreakingNewsArtigos(
          apiKey: parametros.apiKey,
          country: parametros.country,
          category: parametros.category,
          page: parametros.page,
          pageSize: parametros.pageSize);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // ignore: always_specify_types
        return DadosSucesso(httpResponse.data.artigos!);
      }
    } on DioError catch (e) {
      return DadosFalha(e);
    }
    throw Exception(
        'Erro de no ArtigoRepositorioExecucaoServico retornando nulo');
  }
}
