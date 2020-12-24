import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';

import 'package:absapp/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Two extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  Two(this.interview_id, this.interview);

  @override
  _TwoState createState() => _TwoState(interview_id, interview);
}

class _TwoState extends State<Two> {
  _TwoState(this.interview_id, this.interview);

  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5;//Questions

  final String interview_id;
  
  TextEditingController _1aController = TextEditingController();
  TextEditingController _1bController = TextEditingController();
  TextEditingController _2aController = TextEditingController();
  TextEditingController _2bController = TextEditingController();
  TextEditingController _3aController = TextEditingController();
  TextEditingController _3bController = TextEditingController();
  TextEditingController _4aController = TextEditingController();
  TextEditingController _4bController = TextEditingController();
  TextEditingController _5aController = TextEditingController();
  TextEditingController _5bController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
     if(interview.sections['sec_2'] != null){
        dataExist = true;
        _1aController..text = interview.sections['sec_2']['_1'][0]['_1a'];
        _1bController..text = interview.sections['sec_2']['_1'][1]['_1b'];
        _2aController..text = interview.sections['sec_2']['_2'][0]['_2a'];
        _2bController..text = interview.sections['sec_2']['_2'][1]['_2b'];
        _3aController..text = interview.sections['sec_2']['_3'][0]['_3a'];
        _3bController..text = interview.sections['sec_2']['_3'][1]['_3b'];
        _4aController..text = interview.sections['sec_2']['_4'][0]['_4a'];
        _4bController..text = interview.sections['sec_2']['_4'][1]['_4b'];
        _5aController..text = interview.sections['sec_2']['_5'][0]['_5a'];
        _5bController..text = interview.sections['sec_2']['_5'][1]['_5b'];
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[1];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    
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
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1aController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Male(i)",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1bController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Female(ii)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2aController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Male(i)",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2bController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Female(ii)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                               SizedBox(height: 6),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3aController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Male(i)",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3bController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Female(ii)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                               SizedBox(height: 6),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4aController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Male(i)",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4bController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Female(ii)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 12),
                              Text('${q5}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                               SizedBox(height: 6),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5aController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Male(i)",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5bController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Female(ii)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 12),
                              
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

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        '_1': [{'_1a':_1aController.text},{'_1b':_1bController.text}],
        '_2': [{'_2a':_2aController.text},{'_2b':_2bController.text}],
        '_3': [{'_3a':_3aController.text},{'_3b':_3bController.text}],
        '_4': [{'_4a':_4aController.text},{'_4b':_4bController.text}],
        '_5': [{'_5a':_5aController.text},{'_5b':_5bController.text}],
      };

      states.sections['sec_2'] = data;
      await Provider.of<InterviewModel>(context, listen: false).addSection(states);
      dataExist ? showTopShortToast() : null;
        setState(() {
          dataExist = true;
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
    
    _1aController.dispose();
    _1bController.dispose();
    _2aController.dispose();
    _2bController.dispose();
    _3aController.dispose();
    _3bController.dispose();
    _4aController.dispose();
    _4bController.dispose();
    _5aController.dispose();
    _5bController.dispose();
    super.dispose();
  }
}
