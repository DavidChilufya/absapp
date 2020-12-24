import 'package:flutter/material.dart';
import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/models/interviewLists.dart';

class InterviewListModel extends ChangeNotifier {
  final InterviewDao _interviewDao = InterviewDao();

  bool data_loading;
  InterviewLists interviewLists; // Interview List model
  List all_interviews = [];
  List drafts = [];
  List tests = [];
  List pending_upload = [];

  InterviewListModel() {
    this.setAllInterviews();
    this.data_loading = false;
  }

  Future setAllInterviews() async {
    this.data_loading = true;
    List list = await this._interviewDao.getAllInterviews();
    this.all_interviews = list;

    List drafts = [];
    List tests = [];
    List pending = [];

    for (var i = 0; i < list.length; i++) {
      if (!list[i]['completed'] && !list[i]['test']) {
        drafts.add(list[i]);
      }

      if (list[i]['completed'] && !list[i]['test']) {
        pending.add(list[i]);
      }

      if (list[i]['test']) {
        tests.add(list[i]);
      }
    }

    this.drafts = drafts;
    this.pending_upload = pending;
    this.tests = tests;

    this.interviewLists = InterviewLists(
        all_interviews: this.all_interviews,
        drafts: this.drafts,
        pending_upload: this.pending_upload,
        test: this.tests);

    this.data_loading = false;

    notifyListeners();
  }

  void updateInterviewslist() {}
}
