
class CreateInterviewModel {
  String interview_id;
  String household_id;
  String q1;

  CreateInterviewModel({this.interview_id,this.household_id,this.q1});

  factory CreateInterviewModel.fromJson(Map<String, dynamic> json) => CreateInterviewModel(
    interview_id: json['interview_id'],
    household_id: json['household_id'],
    q1: json['q1']
  );

  Map<String, dynamic> toJson() => {
    'interview_id': interview_id,
    'household_id': household_id,
    'q1': q1
  };

  @override

  String toString() {

    // TODO: implement toString

    return '''
      interview_id: $interview_id,
      household_id: $household_id,
      q1: $q1,
      ----------------------------------

      ''';
  }
}