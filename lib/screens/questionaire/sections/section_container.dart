import 'package:absapp/screens/questionaire/sections/section_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionContainer extends StatelessWidget{
  static const String id = "section_container";

  @override
  Widget build(BuildContext context) {
    List routeData = ModalRoute.of(context).settings.arguments;
    Map interview = routeData[0];
    var section = routeData[1];
    //print(' ###INTERVIEW### ${routeData}');

    String sectionNo = section['no'];
    String interviewId = interview['interview_id'];
    String year_ = interview['year_'];
    return Scaffold(
        appBar: AppBar(
          title : Text('${interviewId} | ${year_}  ')),
        body:Section(interviewId,int.parse(sectionNo))
      );
  }

}