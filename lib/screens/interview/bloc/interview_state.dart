
abstract class InterviewState{
  Map interview;
  InterviewState(this.interview);

  Map get getInterview => interview;
  List get getInterviewList => [interview];
}

class InitialState extends InterviewState{
  InitialState(Map interview) : super(interview);
}

class InterviewID extends InterviewState {
 final String interview_id;
 InterviewID(this.interview_id) : super(null);
}

class MetaDataState extends InterviewState{
  final Map interviewModel;
  MetaDataState(this.interviewModel) : super(null);

}

class InterviewLoadedState extends InterviewState{
  var interviews;

  InterviewLoadedState(this.interviews) : super(null);
  @override
  Map get getInterview => interviews;
  @override
  List get getInterviewList => [interviews];

  @override
  String toString() => interviews.toString();
}


