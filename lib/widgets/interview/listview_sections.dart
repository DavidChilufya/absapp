
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:absapp/screens/questionaire/sections/section_container.dart';
import 'package:flutter/material.dart';



class ListViewSections extends StatelessWidget {
  final InterviewModel interview;

  const ListViewSections({this.interview});
  
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).accentColor.withAlpha(30);
    return Flexible(
      child: _myListView(context)
      );
  }

  Widget _myListView(BuildContext context) {
      //List<Sections> myList = [this.section1, this.section2];
      List myList = Questionaire.questionnaire;

      return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          //String qNumber = index.toString()=='0'?'':index.toString()+'.';
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context, 
                SectionContainer.id,
                arguments: [interview, myList[index]]);
            },
            child: Container(
              child: Card( //                           <-- Card widget
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    ListTile(
                      title: Text('${myList[index]['no']} ''${myList[index]['title']}', style: Theme.of(context).textTheme.subtitle2.copyWith()),
                      subtitle: Row(
                        children: <Widget> [
                          Padding(padding: EdgeInsets.only(left: 15.5,right: 4), 
                                    child:Text(((myList[index].length)-2).toString() +' questions', style: TextStyle(color: Colors.blue)) 
                                  ),
                          Icon(Icons.keyboard_arrow_right),
                          Padding(padding: EdgeInsets.only(left: 4), child:Text('5 Answers', style: TextStyle(color: Colors.greenAccent)) ,),
                        ]
                      ) ,
                    ),
                  ]
                ) 
            ),
          ),
          ); 
        },
      );
    }
}

