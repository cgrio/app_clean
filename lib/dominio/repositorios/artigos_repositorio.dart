import 'package:app_clean/nucleo/parametros/artigos_request_parametros.dart';
import 'package:app_clean/nucleo/recursos/dados_estados.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';

abstract class ArtigosRepositorio {
  Future<DadosEstado<List<ArtigoEntidade?>>> getBreakingNewsArticles(
    ArtigosRequestParametros parametros,
  );
}
