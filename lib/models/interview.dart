class Interview {
  String year_ ;
  String interview_id;
  String household_id;
  String user_email, user_id;
  bool test;
  String question_number;
  bool completed;
  String uploaded;
  Map meta_data;
  Map sections;

  Interview(
      this.interview_id,
      this.household_id,
      this.year_,
      this.user_email,
      this.user_id,
      this.test,
      this.question_number,
      this.completed,
      this.uploaded,
      this.meta_data,
      this.sections);

  Map<String, dynamic> toJson() =>
    {
      'interview_id': interview_id,
      'household_id': household_id,
      'user_email': user_email,
      'user_id': user_id,
      'question_number': question_number,
      'year_': year_,
      'completed': completed,
      'uploaded': uploaded,
      'test': test,
      'meta_data': meta_data,
      'sections': sections
    };    

}
