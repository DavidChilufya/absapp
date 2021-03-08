class Interview {
  String year_ ;
  String interview_id;
  String household_id;
  String user_email, user_id;
  bool test;
  String question_number;
  bool completed;
  bool uploaded;
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

  Interview.fromJson(var data):
       interview_id= data['interview_id'],
       household_id = data ['household_id'],
       user_email = data['user_email'],
       user_id = data['user_id'],
       question_number = data['question_number'],
       year_ = data['year_'],
       completed = data['completed'],
       uploaded = data['uploaded'],
       test = data['test'],
       meta_data = data['meta_data'],
       sections = data['sections']
    ;      

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
