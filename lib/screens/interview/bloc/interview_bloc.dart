import 'dart:async';
import 'dart:math';
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:bloc/bloc.dart';
import 'package:absapp/screens/interview/bloc/interview_event.dart';
import 'package:absapp/screens/interview/bloc/interview_state.dart';

class InterviewBloc extends Bloc<InterviewEvent, InterviewState> {
  
  InterviewModel interviewModel;
  InterviewDao _interviewDao = InterviewDao();
  @override
  InterviewState get initialState => InitialState(interviewModel);

  @override
  Stream<InterviewState> mapEventToState(
    InterviewEvent event,
  ) async* {
    if(event is LoadInterviewEvent){
     // final interviews = await _interviewDao.getAllSortedByTImeStamp();
      yield* _reloadInterviews(event.interview_id);
    }
  }


  Future<List> getInterview() async{
    List<InterviewModel> interviewList = await _interviewDao.getAllSortedByName();
    return interviewList;
  }

   Stream<InterviewState> _reloadInterviews(String interview_id) async* {
    
    final interviews = await _interviewDao.getInterviewById(interview_id);
    yield InterviewLoadedState(interviews[0]);
  }
  //Generate Interview Id
  static String randomString(int strlen) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}
