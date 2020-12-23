import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TweentyOne extends StatefulWidget {
  final String interview_id;
  final Map interview;

  TweentyOne(this.interview_id, this.interview);

  @override
  _TweentyOneState createState() => _TweentyOneState(interview_id, interview);
}

class _TweentyOneState extends State<TweentyOne> {
  _TweentyOneState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q2_1,q2_2,q2_3,q2_4;//Questions
  List _1options;
  int _1_index;
  String _1answer;

  final String interview_id;
  
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();
  TextEditingController _4Controller = TextEditingController();
  TextEditingController _5_1Controller = TextEditingController();
  TextEditingController _5_2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    if(interview['sections']['sec_21'] != null ){
      
      dataExist = true;
      _1answer = interview['sections']['sec_21']['_1'][0];
      _1_index = interview['sections']['sec_21']['_1'][1];
      _1Controller..text = interview['sections']['sec_21']['_2'][0];
      _2Controller..text = interview['sections']['sec_21']['_2'][1];
      _3Controller..text = interview['sections']['sec_21']['_2'][2];
      _4Controller..text = interview['sections']['sec_21']['_2'][3];
      _5_1Controller..text = interview['sections']['sec_21']['_2'][4][0];
      _5_2Controller..text = interview['sections']['sec_21']['_2'][4][1];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[20];
    _title = questions['title'];
    _1options = questions['_1'][2];
    q1 = questions['_1'][0];
    q2_1 = questions['_2'][0];
    q2_2 = questions['_2'][1];
    q2_3 = questions['_2'][2];
    q2_4 = questions['_2'][3];
    
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
                               Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  _1options.length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(_1options[index]),
                                      selected: _1_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _1answer = _1options[index];
                                          _1_index = selected ? index : null;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ), 
                              
                              SizedBox(height: 12),
                              Text('No. 50kg bags concetrates bought during the previous 12 mths',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${q2_1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: 
                                  TextFormField(
                                    controller: _1Controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                              labelText: "Number",
                                            ),
                                    validator: (value) {
                                      if (value.isEmpty){return 'Field cannot be blank';}
                                      else{ return null; }
                                    },
                                  ),)
                              ],),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${q2_2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: 
                                  TextFormField(
                                    controller: _2Controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                              labelText: "Number",
                                            ),
                                    validator: (value) {
                                      if (value.isEmpty){return 'Field cannot be blank';}
                                      else{ return null; }
                                    },
                                  ),)
                              ],),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${q2_3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: 
                                  TextFormField(
                                    controller: _3Controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                              labelText: "Number",
                                            ),
                                    validator: (value) {
                                      if (value.isEmpty){return 'Field cannot be blank';}
                                      else{ return null; }
                                    },
                                  ),)
                              ],),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${q2_4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: 
                                  TextFormField(
                                    controller: _4Controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                              labelText: "Number",
                                            ),
                                    validator: (value) {
                                      if (value.isEmpty){return 'Field cannot be blank';}
                                      else{ return null; }
                                    },
                                  ),)
                              ],),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.5, child: 
                                   TextFormField(
                                    controller: _5_1Controller,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                              labelText: "Other",
                                            ),
                                   
                                  ),),
                                 
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: 
                                  TextFormField(
                                    controller: _5_2Controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                              labelText: "Number",
                                            ),
                                  ),)
                              ],)
                             
                              
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
        '_1': [_1answer,_1_index],
        '_2': [_1Controller.text,_2Controller.text,_3Controller.text,_4Controller.text,[_5_1Controller.text,_5_2Controller.text,]],
      };

      states['sections']['sec_21'] = data;
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
    _interviewDao.closeHive();
    _1Controller.dispose();
    _2Controller.dispose();
    super.dispose();
  }
}
