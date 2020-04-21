import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'section_event.dart';
part 'section_state.dart';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  @override
  SectionState get initialState => SectionInitial();

  @override
  Stream<SectionState> mapEventToState(
    SectionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
