import 'package:app_clean/dominio/entidades/artigo_entidade.dart';
import 'package:app_clean/dominio/repositorios/artigos_repositorio.dart';
import 'package:app_clean/nucleo/caso_uso/caso_uso.dart';
import 'package:app_clean/nucleo/parametros/artigos_request_parametros.dart';
import 'package:app_clean/nucleo/recursos/dados_estados.dart';

class GetArtigosCasoUso
    implements
        CasoUso<DadosEstado<List<ArtigoEntidade?>>, ArtigosRequestParametros> {
  final ArtigosRepositorio _artigosRepositorio;
  GetArtigosCasoUso(this._artigosRepositorio);

  @override
  Future<DadosEstado<List<ArtigoEntidade?>>> call(
      {ArtigosRequestParametros? parametros}) {
    return _artigosRepositorio.getBreakingNewsArticles(parametros!);
  }
}
