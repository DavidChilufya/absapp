import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:absapp/screens/questionaire/sections/section_container.dart';
import 'package:flutter/material.dart';

class ListViewSections extends StatelessWidget {
  final Map interview;

  const ListViewSections({this.interview});

  @override
  Widget build(BuildContext context) {
    //final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    //interviewBloc.add(LoadInterviewEvent(interview['interview_id']));
    return Flexible(
        
        child: _myListView(context, this.interview));
  }

  Widget _myListView(BuildContext context, Map state ) {
    //List<Sections> myList = [this.section1, this.section2];
    Questionaire questionnaire = Questionaire();
    Color sectionColor ;

    questionnaire.setSections();
    List myList = questionnaire.getSections();

    return ListView.builder(
      padding: EdgeInsets.only(top: 1),
      itemCount: myList.length,
      itemBuilder: (context, index) {
        //String qNumber = index.toString()=='0'?'':index.toString()+'.';
        if(this.interview['sections'][myList[index]['sec']] != null){
            sectionColor = Colors.greenAccent;
        }else{
          sectionColor = Theme.of(context).cardColor;
        }
          
          return Container(
            child: Card(
                color: sectionColor,
                //elevation: 5.5,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)
                      ),
                child:
                  InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, SectionContainer.id,
                          arguments: [interview, myList[index]]);
                    },
                    child: Column(
                        mainAxisSize: MainAxisSize.min, children: <Widget>[
                        ListTile(
                          title: Text(
                              '${myList[index]['title']}',
                              style: Theme.of(context).textTheme.subtitle2.copyWith()),
                            subtitle: Row(children: <Widget>[
                            /* 
                            Padding(
                              padding: EdgeInsets.only(left: 15.5, right: 4),
                              child: Text(((myList[index].length) - 2).toString() +' questions',style: TextStyle(color: Colors.blue))),
                            Icon(Icons.keyboard_arrow_right),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text('5 Answers',style: TextStyle(color: Colors.greenAccent)),
                              ),*/
                          ]),
                        ),
                    ])
                  ),
                    
            ),
          );
      },
    );
  }
}
