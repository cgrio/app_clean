import 'package:equatable/equatable.dart';

import 'fonte_entidade.dart';

class ArtigoEntidade extends Equatable {
  final int? id;
  final FonteEntidade? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArtigoEntidade(
      {this.id,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object?> get props {
    return [
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }

  @override
  bool get stringify => true;
}
