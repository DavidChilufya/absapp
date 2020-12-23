import 'package:absapp/models/interview.dart';
import 'package:absapp/services/interview_dao.dart';
import 'package:flutter/material.dart';

class InterviewModel extends ChangeNotifier {
  final InterviewDao _interviewDao = InterviewDao();
  bool interviewsLoaded;

  List interviewList = [];
  List interviewsDrafts = [];
  List interviewsTests = [];
  List interviewsPendingUpload = [];
  Interview interview;

  InterviewModel() {
    this.setAllInterviews();
  }

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

    await this.setAllInterviews();
  }

  Interview getInterview() {
    return this.interview;
  }

  Future<void> getInterviewByID(String interview_id) async {
    this.interviewsLoaded = true;

    await this._interviewDao.readHive(interview_id).then((data) {
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
    });

    notifyListeners();
  }

  Future<void> setAllInterviews() async {
    //print("Hello world");
    this.interviewsLoaded = true;
    List all_interviews = await this._interviewDao.getAllInterviews();

    this.interviewList = all_interviews;
    List drafts = [];
    List tests = [];
    List pending = [];

    for (var i = 0; i < this.interviewList.length; i++) {
        if (!this.interviewList[i]['completed'] &&
            !this.interviewList[i]['test']) {
          drafts.add(this.interviewList[i]);
        }

        if (this.interviewList[i]['completed'] &&
            !this.interviewList[i]['test']) {
          print("Hello world");
          pending.add(this.interviewList[i]);
        }

        if (this.interviewList[i]['test']) {
          tests.add(this.interviewList[i]);
        }
    }
    
    this.interviewsDrafts = drafts;
    this.interviewsPendingUpload = pending;
    this.interviewsTests = tests;
    
    this.interviewsLoaded = false;
    notifyListeners();
  }

  Future<void> addSection(Interview interview) async {
    this.interview = interview;
    await _interviewDao.updateHive(interview.toJson(), interview.interview_id);
    notifyListeners();

  }

  void updateInterviewslist() {}

  void updateHeader() {}

  void currentInterview() {}

  void changeYear() {}
}
