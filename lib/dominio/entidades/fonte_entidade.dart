import 'package:equatable/equatable.dart';

class FonteEntidade extends Equatable {
  final String? id;
  final String? nome;

  const FonteEntidade({this.id, this.nome});

  @override
  List<Object?> get props => [id, nome];
  @override
  bool get stringify => true;
}
