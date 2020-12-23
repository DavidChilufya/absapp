import 'package:absapp/models/interview.dart';
import 'package:absapp/services/interview_dao.dart';
import 'package:flutter/material.dart';

class InterviewModel extends ChangeNotifier {
  final InterviewDao _interviewDao = InterviewDao();
  bool interviewsLoaded;

  Interview interview;

  Future<void> createInterview(Map data) async {
    this.interview = Interview(
        data['interview_id'],
        data['household_id'],
        data['year_'],
        data['user_email'],
        data['user_id'],
        data['test'],
        data['question_number'],
        data['completed'],
        data['uploaded'],
        data['meta_data'],
        data['sections']);

    await this._interviewDao.writeToHive(data, data['interview_id']);
    notifyListeners();
    
  }

  Interview getInterview() {
    return this.interview;
  }

  Future<void> getInterviewByID(String interview_id) async {
    this.interviewsLoaded = true;

    Map data = await this._interviewDao.readHive(interview_id);
    print("Interview SINGLE: $data");
      this.interview = Interview(
          data['interview_id'],
          data['household_id'],
          data['year_'],
          data['user_email'],
          data['user_id'],
          data['test'],
          data['question_number'],
          data['completed'],
          data['uploaded'],
          data['meta_data'],
          data['sections']);
      this.interviewsLoaded = false;

    notifyListeners();
  }

  Future<void> addSection(Interview interview) async {
    this.interview = interview;
    await _interviewDao.updateHive(interview.toJson(), interview.interview_id);
    notifyListeners();

  }

  void updateHeader() {}

  void currentInterview() {}

  void changeYear() {}
}
