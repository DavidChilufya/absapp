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
  List uploaded_interviews = [];

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
    List uploaded_interviews = [];

    for (var i = 0; i < list.length; i++) {
      if (!list[i]['completed'] && !list[i]['test']) {
        drafts.add({'key': i, 'item': list[i]});
      }

      if (list[i]['completed'] &&
          !list[i]['test'] &&
          !list[i]['uploaded']) {
        pending.add({'key': i, 'item': list[i]});
        ;
      }

      if (list[i]['completed'] && !list[i]['test'] && list[i]['uploaded']) {
        uploaded_interviews.add({'key': i, 'item': list[i]});
        ;
      }

      if (list[i]['test']) {
        tests.add({'key': i, 'item': list[i]});
        ;
      }
    }

    this.drafts = drafts;
    this.pending_upload = pending;
    this.tests = tests;
    this.uploaded_interviews = uploaded_interviews;

    this.interviewLists = InterviewLists(
        all_interviews: this.all_interviews,
        drafts: this.drafts,
        pending_upload: this.pending_upload,
        uploaded_interviews: this.uploaded_interviews,
        test: this.tests);

    this.data_loading = false;

    notifyListeners();
  }

  Future<void> deleteInterview({int key}) async {
    await this._interviewDao.deleteInterview(key: key);
    await this.setAllInterviews();
  }

  void updateInterviewslist() {}
}
