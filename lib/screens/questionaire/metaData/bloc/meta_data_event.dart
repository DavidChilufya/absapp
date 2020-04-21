import 'package:absapp/screens/questionaire/metaData/meta_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class MetaDataEvent extends Equatable {
  const MetaDataEvent();

  @override
  List<Object> get props => [];
}

class SubmitButtonPressed extends MetaDataEvent {
  final InterviewMetaDataModel data;

  const SubmitButtonPressed({@required this.data, });
    
 

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'Submitted { data: $data }';
  }
}