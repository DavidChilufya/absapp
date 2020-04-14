import 'package:meta/meta.dart';

class InterviewMetaDataModel{
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Interview.
  int id;
  final String interview_id;
  final String houshold_id;


  InterviewMetaDataModel({
    @required this.interview_id,
    @required this.houshold_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'interview_id': interview_id,
      'houshold_id': houshold_id,
    };
  }

  static InterviewMetaDataModel fromMap(Map<String, dynamic> map) {
    return InterviewMetaDataModel(
      interview_id: map['interview_id'],
      houshold_id: map['houshold_id'],
    );
  }
}