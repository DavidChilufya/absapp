import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class InterviewEvent extends Equatable {
  const InterviewEvent();
  @override
  List<Object> get props => [];
}

class GetInterviewID extends InterviewEvent {
  final String interview_id;
  const GetInterviewID({
    @required this.interview_id,
  });

  @override
  List<Object> get props => [interview_id];

  @override
  String toString() =>
      'GenerateInterviewID { Interview ID: $interview_id }';
}

class InterviewMetaDatEvent extends InterviewEvent {

}

class LoadInterviewEvent extends InterviewEvent {
  final String interview_id;
  LoadInterviewEvent(this.interview_id);
}

class LoadSection extends InterviewEvent{
  final String interview_id;
  final String sectionName;
  LoadSection(this.interview_id, this.sectionName);
}
