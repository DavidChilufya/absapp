import 'package:absapp/screens/questionaire/metaData/model/meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MetaDataEvent extends Equatable {
  MetaDataEvent([List props = const []]) : super(props);
}

class LoadInterviews extends MetaDataEvent {}

class AddRandomInterview extends MetaDataEvent {}

class UpdateWithRandomInterview extends MetaDataEvent {
  final InterviewMetaDataModel updatedInterview;

  UpdateWithRandomInterview(this.updatedInterview) : super([updatedInterview]);
}

class DeleteInterview extends MetaDataEvent {
  final InterviewMetaDataModel interview;

  DeleteInterview(this.interview) : super([interview]);
}