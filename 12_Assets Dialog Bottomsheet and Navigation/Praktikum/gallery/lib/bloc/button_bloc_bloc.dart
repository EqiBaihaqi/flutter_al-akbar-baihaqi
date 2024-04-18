import 'package:assets_dialogbottomsheet_navgator/model/list_contact_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'button_bloc_event.dart';
part 'button_bloc_state.dart';

class ButtonBlocBloc extends Bloc<ButtonBlocEvent, ButtonBlocState> {
  List<ContactModel> _listContactModel = [];
  ButtonBlocBloc() : super(ButtonBlocInitial()) {
    on<ButtonBlocEvent>((event, emit) {});
    on<DeleteContactEvent>((event, emit) {
      _listContactModel.removeAt(event.index);
    });
  }
}
