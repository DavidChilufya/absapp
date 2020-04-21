import 'package:absapp/forms/questionnaire/meta_data.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  static const String id = "section";
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  int pageIndex = 1;
  PageController  _pageViewController = PageController(initialPage: 0,);
  
  @override
  void initState() {
    super.initState();
    //Contacts.checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Interview - ID")),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 60),
        child: PageView(
          controller: _pageViewController,
            children: [
              MyPage2Widget(),
              FormWidget(),
              MyPage3Widget(),
            ],
          )
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Row(
          
          children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 50), 
                child: RaisedButton(
                    child: Text(pageIndex == 0 ? "Cancel" : "Sections list"),
                    color: Colors.grey,
                    onPressed: () {
                      if (pageIndex == 0){
                        Navigator.pushNamed(context, Interview.id);
                      }else{
                        Navigator.pushNamed(context, Interview.id);
                      }
                    },
                  ),) 
            ),
            Expanded(child: RaisedButton(
                    child: Text("Next"),
                    onPressed: () async {
                      await _pageViewController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                    );
                    FocusScope.of(context).unfocus();
                    }
                  ),   
                  )   
        ],)
        
    ); 
  }



  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }
 
}

class FormWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MetaDataForm();
  }

}


class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MetaDataForm();
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkRed),
            MyBox(darkRed),
          ],
        ),
        MyBox(mediumRed, text: 'PageView 3'),
        Row(
          children: [
            MyBox(lightRed),
            MyBox(lightRed),
            MyBox(lightRed),
          ],
        ),
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
