import 'package:absapp/models/interview.dart';
import 'package:absapp/models/questionnaire.dart';
import 'package:absapp/screens/questionaire/sections/section_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListViewSections extends StatelessWidget {
  final Interview interview;
  final FirebaseUser user;

  ListViewSections({this.interview, this.user});

  @override
  Widget build(BuildContext context) {
    //final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    //interviewBloc.add(LoadInterviewEvent(interview['interview_id']));
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    //List<Sections> myList = [this.section1, this.section2];
    Questionaire questionnaire = Questionaire();
    Color sectionColor;

    questionnaire.setSections();
    List myList = questionnaire.getSections();

    return ListView.builder(
      padding: EdgeInsets.only(top: 1),
      itemCount: myList.length,
      itemBuilder: (context, index) {
        //String qNumber = index.toString()=='0'?'':index.toString()+'.';
        if (interview.sections[myList[index]['sec']] != null) {
          sectionColor = Colors.greenAccent;
        } else {
          sectionColor = Theme.of(context).cardColor;
        }

        return Container(
          child: Card(
            color: sectionColor,
            //elevation: 5.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.pushNamed(context, SectionContainer.id,
                      arguments: [myList[index], this.user]);
                },
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    title: Text('${myList[index]['title']}',
                        style:
                            Theme.of(context).textTheme.subtitle2.copyWith()),
                    subtitle: Row(children: <Widget>[]),
                  ),
                ])),
          ),
        );
      },
    );
  }
}
