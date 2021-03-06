import 'package:absapp/models/interview.dart';
import 'package:absapp/services/interview_dao.dart';
import 'package:flutter/material.dart';

class InterviewModel extends ChangeNotifier {
  final InterviewDao _interviewDao = InterviewDao();
  bool interviewsLoaded;
  int key;
  Interview interview;

  Future<void> createInterview(Map data, int interview_key) async {
    this.key = interview_key;
    this.interviewsLoaded = true;
    await this._interviewDao.writeToHive(data, data['interview_id']);
    this.interview = Interview.fromJson(data);
    this.interviewsLoaded = false;
    notifyListeners();
  }

  Interview getInterview() {
    return this.interview;
  }

  Future<void> setInterviewByID(String interview_id, int interview_key) async {
    this.interviewsLoaded = true;

    var data = await this._interviewDao.readHive(interview_id);
    //print("Interview SINGLE: $data");
    this.interview = Interview.fromJson(data);
    this.key = interview_key;
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
