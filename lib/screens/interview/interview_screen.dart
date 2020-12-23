import 'package:absapp/widgets/interview/interview_header.dart';
import 'package:absapp/widgets/interview/listview_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Interview extends StatelessWidget {
  static const String id = "interview";

  @override
  Widget build(BuildContext context) {
    String _id = ModalRoute.of(context).settings.arguments;
    
    
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                InterviewHeader(interview_id: _id,),
                SizedBox(height: 12),
                ListViewSections()
              ],
            )
    );
  }
}
