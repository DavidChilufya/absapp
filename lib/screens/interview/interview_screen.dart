import 'package:absapp/providers/interview.dart';
import 'package:absapp/widgets/interview/interview_header.dart';
import 'package:absapp/widgets/interview/listview_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Interview extends StatelessWidget {
  static const String id = "interview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: Consumer<InterviewModel>(
        builder: (context, state, child) {
          return state.interviewsLoaded
              ? Center(
                  child: SpinKitDoubleBounce(
                    color: Theme.of(context).primaryColor,
                    size: 50.0,
                  ),
                )
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    InterviewHeader(
                        interview: state.interview,
                        item_key: state.key,
                        user: ModalRoute.of(context).settings.arguments),
                    SizedBox(height: 12),
                    Flexible(
                        child: ListViewSections(
                            interview: state.interview,
                            user: ModalRoute.of(context).settings.arguments))
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Interview.id);
          print(Interview.id);
        },
        child: Icon(Icons.home),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
