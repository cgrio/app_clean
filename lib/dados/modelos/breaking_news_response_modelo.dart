import 'package:app_clean/dados/modelos/artigo_modelo.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';

class BreakingNewsResponseModelo {
  final String? status;
  final int? totalResults;
  final List<ArtigoEntidade>? artigos;

  BreakingNewsResponseModelo({this.status, this.totalResults, this.artigos});

  factory BreakingNewsResponseModelo.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModelo(
        status: json["status"] as String,
        totalResults: json['totalResults'] as int,
        artigos: List<ArtigoModelo>.from((json['articles'] as List<dynamic>)
            .map((e) => ArtigoModelo.fromJson(e as Map<String, dynamic>))));
  }
}
