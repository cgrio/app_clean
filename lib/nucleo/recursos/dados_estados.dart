import 'package:dio/dio.dart';

abstract class DadosEstado<T> {
  final T? dados;
  final DioError? erros;

  const DadosEstado({this.dados, this.erros});
}

class DadosSucesso<T> extends DadosEstado<T> {
  const DadosSucesso(T dados) : super(dados: dados);
}

class DadosFalha<T> extends DadosEstado<T> {
  const DadosFalha(DioError erros) : super(erros: erros);
}
