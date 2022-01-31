import 'package:app_clean/dados/modelos/fonte_modelo.dart';
import 'package:app_clean/dominio/entidades/artigo_entidade.dart';
import 'package:app_clean/dominio/entidades/fonte_entidade.dart';

class ArtigoModelo extends ArtigoEntidade {
  const ArtigoModelo(
      {int? id,
      FonteEntidade? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content})
      : super(
            id: id,
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);
  factory ArtigoModelo.fromJson(Map<String, dynamic> json) {
    return ArtigoModelo(
        source: FonteModelo.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content'] as String);
  }
}
