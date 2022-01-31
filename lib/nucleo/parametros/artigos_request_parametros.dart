import 'package:app_clean/nucleo/utilidades/constantes.dart';

class ArtigosRequestParametros {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  ArtigosRequestParametros(
      {this.apiKey = kApiKey,
      this.country = 'us',
      this.category = 'general',
      this.page = 1,
      this.pageSize = 20});
}
