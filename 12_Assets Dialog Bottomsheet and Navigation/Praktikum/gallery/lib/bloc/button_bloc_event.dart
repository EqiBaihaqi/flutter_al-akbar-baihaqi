part of 'button_bloc_bloc.dart';

abstract class ButtonBlocEvent extends Equatable {
  const ButtonBlocEvent();

  @override
  List<Object> get props => [];
}

class DeleteContactEvent extends ButtonBlocEvent {
  final int index;

  const DeleteContactEvent(this.index);

  @override
  List<Object> get props => [index];
}
