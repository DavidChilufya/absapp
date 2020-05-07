import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tweenty extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Tweenty(this.interview_id, this.interview);

  @override
  _TweentyState createState() => _TweentyState(interview_id, interview);
}

class _TweentyState extends State<Tweenty> {
  _TweentyState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2;//Questions

  final String interview_id;
  
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    if(interview['sections']['sec_20'] != null ){
      
      dataExist = true;
        _1Controller..text = interview['sections']['sec_20']['_1'];
        _2Controller..text = interview['sections']['sec_20']['_2'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[19];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    
    submitBtnTxt = dataExist?'Edit':'Submit';
   
      return Stack(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 12),
                      Text('${_title}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor,)),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 12),
                              Text('${q1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                              TextFormField(
                                controller: _1Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: "Number of bales",
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                  },
                              ), ),
                              
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _2Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: "Number of bales",
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                             
                              
                            ],
                          )),
                          SizedBox(height: 14),
                    ],
                  ))),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 500,
                child: RaisedButton(
                  child: Text('${submitBtnTxt}'),
                  color: dataExist?Theme.of(context).accentColor:Theme.of(context).primaryColor,
                  onPressed: () => _submitForm(interview),
                ),
              ))
        ],
      );
  }

  void _submitForm(var states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        '_1': _1Controller.text,
        '_2': _2Controller.text,
      };

      states['sections']['sec_20'] = data;
      print('22222222222222222222222${states}444444444444444444444444444444444');
          
      await _interviewDao.updateHive(states, interview_id)
      .then((value){
        dataExist?showTopShortToast():null;
        setState(() {
          dataExist = true; 
        });
        
        //Navigator.pushNamed(context, Interview.id, arguments: interview)
       });
    }
  }

  void showTopShortToast() {
    Fluttertoast.showToast(
        msg: "Edited",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
  }
  
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    Fluttertoast.cancel();
    _1Controller.dispose();
    _2Controller.dispose();
    super.dispose();
  }
}
