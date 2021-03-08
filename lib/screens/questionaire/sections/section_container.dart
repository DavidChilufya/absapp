import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/screens/questionaire/sections/section_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SectionContainer extends StatelessWidget {
  static const String id = "section_container";

  @override
  Widget build(BuildContext context) {
    List routeData = ModalRoute.of(context).settings.arguments;
    // Map interview = routeData[0];
    var section = routeData[0];
    User user = routeData[1];
    Interview interview =
        Provider.of<InterviewModel>(context, listen: false).getInterview();
    //print(' ###INTERVIEW### ${routeData}');

    String sectionNo = section['no'];
    String interviewId = interview.interview_id;
    String year_ = interview.year_;
    return Scaffold(
        appBar: AppBar(title: Text('${interviewId} | ${year_}  ')),
        body: Section(interviewId, int.parse(sectionNo), user));
  }
}
