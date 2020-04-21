import 'dart:async';
import 'dart:math';
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/metaData/bloc/meta_data_event.dart';
import 'package:absapp/screens/questionaire/metaData/bloc/meta_data_state.dart';
import 'package:bloc/bloc.dart';

import '../meta_data_model.dart';

class MetaDataBloc extends Bloc<MetaDataEvent, MetaDataState> {
  InterviewDao _metaDataDao = InterviewDao();

  @override
  MetaDataState get initialState => MetaDataState.empty();

 @override
  Stream<MetaDataState> mapEventToState(MetaDataEvent event) async* {
    if (event is SubmitButtonPressed) {
      yield MetaDataState.loading();
    }
  }
}

class RandomInterviewGenerator {
  static final _interviews = [
    InterviewMetaDataModel(interview_id: '122313', houshold_id: 'werrtert')
  ];

  static InterviewMetaDataModel getRandomInterview() {
    return _interviews[Random().nextInt(_interviews.length)];
  }
}