import 'dart:async';
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:bloc/bloc.dart';
import 'package:absapp/screens/interview/bloc/interview_event.dart';
import 'package:absapp/screens/interview/bloc/interview_state.dart';

class InterviewBloc extends Bloc<InterviewEvent, InterviewState> {
  
  Map interviewModel;
  InterviewDao _interviewDao = InterviewDao();
  @override
  InterviewState get initialState => InitialState(interviewModel);

  @override
  Stream<InterviewState> mapEventToState(
    InterviewEvent event,
  ) async* {
    if(event is LoadInterviewEvent){
      yield* loadInterview(event.interview_id);
    }
  }

   Stream<InterviewState> loadInterview(String interview_id) async* {
    var interviews = await _interviewDao.readHive(interview_id);
    yield InterviewLoadedState(interviews);
  }

}
