import 'package:absapp/providers/interview.dart';
import 'package:absapp/widgets/interview/interview_header.dart';
import 'package:absapp/widgets/interview/listview_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Interview extends StatelessWidget {
  static const String id = "interview";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: Consumer<InterviewModel>(
          builder: (context, state, child) {
            return Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  InterviewHeader(
                    interview: state.interview,
                  ),
                  SizedBox(height: 12),
                  Flexible(child: ListViewSections(interview: state.interview))
                ],
              );
          },
        ));
  }
  
}
