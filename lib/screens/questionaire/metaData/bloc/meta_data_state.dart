import 'package:absapp/screens/questionaire/metaData/model/meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MetaDataState extends Equatable {
  MetaDataState([List props = const []]) : super(props);
}

class InterviewsLoading extends MetaDataState {}

class InterviewsLoaded extends MetaDataState {
  final List<InterviewMetaDataModel> interviews;

  InterviewsLoaded(this.interviews) : super([interviews]);
}