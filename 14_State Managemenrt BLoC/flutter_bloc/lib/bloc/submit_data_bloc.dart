import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'submit_data_event.dart';
part 'submit_data_state.dart';

class SubmitDataBloc extends Bloc<SubmitDataEvent, SubmitDataState> {
  SubmitDataBloc() : super(SubmitDataInitial()) {
    on<SubmitDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
