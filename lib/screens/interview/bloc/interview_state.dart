
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:equatable/equatable.dart';

abstract class InterviewState extends Equatable {
  final InterviewModel interview;
  const InterviewState(this.interview);

  @override
  List<InterviewModel> get props => [interview];
}

class InitialState extends InterviewState{
  InitialState(InterviewModel interview) : super(interview);
}

class InterviewID extends InterviewState {
 final String interview_id;
 InterviewID(this.interview_id) : super(null);
}

class MetaDataState extends InterviewState{
  final InterviewModel interviewModel;
  MetaDataState(this.interviewModel) : super(null);

}

class InterviewLoadedState extends InterviewState{
  final InterviewModel interviews;

  InterviewLoadedState(this.interviews) : super(null);
  InterviewModel getInterview() => interviews;
  @override
  List<InterviewModel> get props => [interviews];

  @override
  String toString() => interviews.toString();
}

class InitialSectionState extends InterviewState{
  final InterviewModel interview;
  InitialSectionState(this.interview):super(null);

}

