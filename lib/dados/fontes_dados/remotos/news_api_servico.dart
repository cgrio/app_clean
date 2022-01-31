import 'package:app_clean/dados/modelos/breaking_news_response_modelo.dart';
import 'package:app_clean/nucleo/utilidades/constantes.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_servico.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class NewsApiServico {
  factory NewsApiServico(Dio dio, {String baseUrl}) = _NewsApiServico;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModelo>> getBreakingNewsArtigos(
      {@Query('apiKey') String? apiKey,
      @Query('country') String? country,
      @Query('category') String? category,
      @Query('page') int? page,
      @Query('pageSize') int? pageSize});
}
