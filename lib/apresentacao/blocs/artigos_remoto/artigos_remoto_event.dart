part of 'artigos_remoto_bloc.dart';

abstract class ArtigosRemotoEvent extends Equatable {
  const ArtigosRemotoEvent();

  @override
  List<Object> get props => [];
}

class GetArtigos extends ArtigosRemotoEvent {
  const GetArtigos();
}
