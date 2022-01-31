import 'package:app_clean/dominio/casos_usos/get_artigos_casouso.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';
import 'package:app_clean/nucleo/bloc/bloc_with_state.dart';
import 'package:app_clean/nucleo/parametros/artigos_request_parametros.dart';
import 'package:app_clean/nucleo/recursos/dados_estados.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'artigos_remoto_event.dart';
part 'artigos_remoto_state.dart';

class ArtigosRemotoBloc
    extends BlocWithState<ArtigosRemotoEvent, ArtigosRemotoState> {
  final GetArtigosCasoUso _getArtigosCasoUso;
  final List<ArtigoEntidade?> _artigos = [];
  int _page = 1;
  static const int _pageSize = 20;

  ArtigosRemotoBloc(this._getArtigosCasoUso)
      : super(const ArtigosRemotoCarregando());

  Stream<ArtigosRemotoState> _getBreakingNewsArticles(
      ArtigosRemotoEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getArtigosCasoUso(
          parametros: ArtigosRequestParametros(page: _page));

      if (dataState is DadosSucesso && dataState.dados!.isNotEmpty) {
        final artigos = dataState.dados;
        final noMoreData = artigos!.length < _pageSize;
        _artigos.addAll(artigos);
        _page++;
        yield ArtigosRemotoDone(_artigos, semMaisDados: noMoreData);
      }
      if (dataState is DadosFalha) {
        yield ArtigosRemotoError(dataState.erros);
      }
    });
  }

  @override
  Stream<ArtigosRemotoState> mapEventoParaState(
      ArtigosRemotoEvent event) async* {
    if (event is GetArtigos) yield* _getBreakingNewsArticles(event);
  }
}
