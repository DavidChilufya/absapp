import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/widgets/interview/interview_header.dart';
import 'package:absapp/widgets/interview/listview_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Interview extends StatefulWidget {
  static const String id = "interview";
  _InterviewState createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  Map _interview;
  Map _headerModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._interview = ModalRoute.of(context).settings.arguments;
    this._headerModel = {
      'year_': _interview['meta_data']['year'],
      'previous_interviews': _interview['meta_data']['first_interview'],
      'household_id': _interview['household_id'],
      'interview_id': _interview['interview_id'],
      'coop_union': _interview['meta_data']['coop_union'],
      'prime_coop': _interview['meta_data']['prime_coop'],
      'status': null
    };
    //print(_interview);
    return BlocProvider(
      //create: (BuildContext context) => InterviewBloc(),
      create: (BuildContext context) => InterviewBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _interview == null
          ? Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).accentColor,
                size: 50.0,
                ),
            )
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                InterviewHeader(headerModel: _headerModel),
                ListViewSections(interview: _interview)
              ],
            ),
      ),
    );
  }
}
