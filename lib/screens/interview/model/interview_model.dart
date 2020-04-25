import 'package:meta/meta.dart';

class InterviewModel{
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Interview.
  int id;
  final String interview_id;
  final String household_id;
  final String user_id;
  final String user_email;
  final String question_number;
  final String year_;
  final bool completed;
  final bool test;
  final Map meta_data;
  final List sections;

  
  InterviewModel({
    @required this.interview_id,
    @required this.household_id,
    @required this.user_id,
    @required this.user_email,
    @required this.question_number,
    @required this.year_,
    @required this.completed,
    @required this.test,
    @required this.meta_data,
    @required this.sections,
  });

  Map<String, dynamic> toMap() {
    return {
      'interview_id': interview_id,
      'household_id':household_id,
      'user_id':user_id,
      'user_email':user_email,
      'question_number':question_number,
      'year_':year_,
      'completed':completed,
      'test':test,
      'meta_data': meta_data,
      'sections': sections
    };
  }

  static InterviewModel fromMap(Map<String, dynamic> map) {
    return InterviewModel(
      interview_id: map['interview_id'], household_id: map['household_id'], user_id: map['user_id'],
       user_email: map['user_email'], question_number: map['question_number'],year_: map['year_'], completed: map['completed'],
        test: map['test'],meta_data: map['meta_data'], sections: map['sections']
    );
  }
  
}