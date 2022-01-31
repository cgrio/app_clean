import 'package:app_clean/dominio/entidades/fonte_entidade.dart';

class FonteModelo extends FonteEntidade {
  const FonteModelo({
    required String id,
    required String nome,
  }) : super(id: id, nome: nome);

  factory FonteModelo.fromJson(Map<String, dynamic> json) {
    return FonteModelo(
      id: json['id'] as String,
      nome: json['nome'] as String,
    );
  }
}
