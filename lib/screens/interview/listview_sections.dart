
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:absapp/screens/questionaire/sections/section_screen.dart';
import 'package:flutter/material.dart';

class ListViewSections extends StatefulWidget {
  static const String id = 'grid_sections';
  _ListViewSectionsState createState() => _ListViewSectionsState();
}

class _ListViewSectionsState extends State<ListViewSections> {
  
  void setSections(){
    

  }
  Sections section1 = Sections(
      questions: 5,
      answered: 0,
      title: "General Information");

  Sections section2 = Sections(
      questions: 5,
      answered: 0,
      title: "Household Information");
  
  
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).accentColor.withAlpha(30);
    return Flexible(
      child: _myListView(context)
      );
  }

  Widget _myListView(BuildContext context) {
      setSections();
      //List<Sections> myList = [this.section1, this.section2];
      List myList = Questionaire.questionnaire;

      return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Section.id);
            },
            child: Container(
              child: Card( //                           <-- Card widget
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    ListTile(
                      title: Text('${index}. ''${myList[index]['title']}', style: Theme.of(context).textTheme.subtitle2.copyWith()),
                      subtitle: Row(
                        children: <Widget> [
                          Padding(padding: EdgeInsets.only(left: 15.5,right: 4), child:Text(((myList[index].length)-2).toString() +' questions', style: TextStyle(color: Colors.blue)) ,),
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



class Sections {
  int questions;
  int answered;
  String title;
  Sections({this.questions, this.answered,this.title });
}
