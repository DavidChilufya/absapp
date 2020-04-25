import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:absapp/screens/questionaire/sections/section_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionContainer extends StatelessWidget{
  static const String id = "section_container";

  @override
  Widget build(BuildContext context) {
    List routeData = ModalRoute.of(context).settings.arguments;
    InterviewModel interview = routeData[0];
    var section = routeData[1];

    String sectionNo = section['no'];
    String interviewId = interview.interview_id;
    String year_ = interview.year_;
    return BlocProvider(
      create: (BuildContext context) => InterviewBloc(),
      child: Scaffold(
        appBar: AppBar(
          title : Text('${interviewId} | ${year_}  ')),
        body:Section(interviewId)
      ) ,
      );
  }

}