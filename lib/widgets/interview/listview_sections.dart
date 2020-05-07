import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/screens/interview/bloc/interview_event.dart';
import 'package:absapp/screens/interview/bloc/interview_state.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:absapp/screens/questionaire/sections/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewSections extends StatelessWidget {
  final Map interview;

  const ListViewSections({this.interview});

  @override
  Widget build(BuildContext context) {
    final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    interviewBloc.add(LoadInterviewEvent(interview['interview_id']));
    var color = Theme.of(context).accentColor.withAlpha(30);
    return BlocBuilder<InterviewBloc, InterviewState>(
        builder: (context, state) {
      print(
          'rrrrrrrrrrrrrrrrrrrrrrr${state}tttttttttttttttttttttttttttttttttt');
      return Flexible(child: _myListView(context));
    });
  }

  Widget _myListView(BuildContext context) {
    //List<Sections> myList = [this.section1, this.section2];
    Questionaire questionnaire = Questionaire();

    questionnaire.setSections();
    List myList = questionnaire.getSections();

    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: myList.length,
      itemBuilder: (context, index) {
        //String qNumber = index.toString()=='0'?'':index.toString()+'.';
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SectionContainer.id,
                arguments: [interview, myList[index]]);
          },
          child: Container(
            child: Card(
                //                           <-- Card widget
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                title: Text(
                    '${myList[index]['title']}',
                    style: Theme.of(context).textTheme.subtitle2.copyWith()),
                subtitle: Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 15.5, right: 4),
                      child: Text(
                          ((myList[index].length) - 2).toString() +
                              ' questions',
                          style: TextStyle(color: Colors.blue))),
                  Icon(Icons.keyboard_arrow_right),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text('5 Answers',
                        style: TextStyle(color: Colors.greenAccent)),
                  ),
                ]),
              ),
            ])),
          ),
        );
      },
    );
  }
}
