import 'package:meta/meta.dart';

class InterviewMetaDataModel{
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Interview.
  
  final String interview_id;
  final String houshold_id;
  final String coop_union;
  final String prime_coop;
  final bool first_interview;
  final String latitude;
  final String longitude;
  final String date_;
  final String time_;
  final String year;
  final bool test;


  InterviewMetaDataModel({
    @required this.interview_id,
    @required this.houshold_id,
    @required this.coop_union,
    @required this.prime_coop,
    @required this.first_interview,
    @required this.latitude,
    @required this.longitude,
    @required this.date_,
    @required this.time_,
    @required this.year,
    @required this.test,
  });

}