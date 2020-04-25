import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:absapp/widgets/interview/interview_header.dart';
import 'package:absapp/widgets/interview/listview_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/interview_bloc.dart';

class Interview extends StatefulWidget{
  static const String id = "interview";
  _InterviewState createState() => _InterviewState();
  
}

class _InterviewState extends State<Interview> {
  InterviewDao interviewDao = InterviewDao();
  InterviewModel  _interview;
  InterviewHeaderModel _headerModel;

   @override
  void initState() {
    super.initState();
  
    
    interviewDao.getAllSortedByTImeStamp().then((value) => {
      for(var item in value){
        //print('${item.id} ${item.meta_data} ')
      }
    });
  }

 

  @override
  Widget build(BuildContext context) {
    this._interview = ModalRoute.of(context).settings.arguments;
    this._headerModel  = InterviewHeaderModel(year_: _interview.meta_data['year'], previous_interviews: _interview.meta_data['first_interview'],
                                                       household_id: _interview.household_id, interview_id: _interview.interview_id,
                                                       coop_union: _interview.meta_data['coop_union'], prime_coop:  _interview.meta_data['prime_coop'], status: null);
    //print(_interview);
    return BlocProvider(
      create: (BuildContext context) => InterviewBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            InterviewHeader(headerModel:_headerModel),
            ListViewSections(interview:_interview)
          ],
        ),
      ),
    );
  }
  
}

