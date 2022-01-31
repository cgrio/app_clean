part of 'artigos_remoto_bloc.dart';

abstract class ArtigosRemotoState extends Equatable {
  final List<ArtigoEntidade?>? artigos;
  final bool? semMaisDados;
  final DioError? erros;
  const ArtigosRemotoState({this.artigos, this.semMaisDados, this.erros});

  @override
  List<Object?> get props => [artigos, semMaisDados, erros];
}

class ArtigosRemotoCarregando extends ArtigosRemotoState {
  const ArtigosRemotoCarregando();
}

class ArtigosRemotoDone extends ArtigosRemotoState {
  const ArtigosRemotoDone(List<ArtigoEntidade?> artigos, {bool? semMaisDados})
      : super(artigos: artigos, semMaisDados: semMaisDados);
}

class ArtigosRemotoError extends ArtigosRemotoState {
  const ArtigosRemotoError(DioError? erros) : super(erros: erros);
}
