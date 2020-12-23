import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Thirteen extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  Thirteen(this.interview_id, this.interview);

  @override
  _ThirteenState createState() => _ThirteenState(interview_id, interview);
}

class _ThirteenState extends State<Thirteen> {
  _ThirteenState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5,q6,q7,q8,q9;//Questions
  List _inputOptions;
  String _input_answer;
  int _input_index = 0 ;
  final String interview_id;
  
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();
  TextEditingController _4Controller = TextEditingController();
  TextEditingController _5Controller = TextEditingController();
  TextEditingController _6Controller = TextEditingController();
  TextEditingController _7Controller = TextEditingController();
  TextEditingController _8Controller = TextEditingController();
  //TextEditingController _9Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  double _total;
  //Initial values

  @override
  void initState() {
    questions = questionaire.getSections()[12];
    _input_answer = questions['_input'][2][0];
    _title = questions['title'];
    _inputOptions = questions['_input'][2];
    
    _8Controller..text = '0.0';
    _total = 0.0;

    if(interview.sections['sec_13'] != null ){
      
      dataExist = true;
        _input_answer = interview.sections['sec_13']['_input'][0];
        _input_index = interview.sections['sec_13']['_input'][1];
        _1Controller..text = interview.sections['sec_13']['_1'];
        _2Controller..text = interview.sections['sec_13']['_2'];
        _3Controller..text = interview.sections['sec_13']['_3'];
        _4Controller..text = interview.sections['sec_13']['_4'];
        _5Controller..text = interview.sections['sec_13']['_5'];
        _6Controller..text = interview.sections['sec_13']['_6'];
        _7Controller..text = interview.sections['sec_13']['_7'];
        _8Controller..text = interview.sections['sec_13']['_8'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    q6 = questions['_6'][0];
    q7 = questions['_7'][0];
    q8 = questions['_8'][0];
    q9 = questions['_9'][0];
    
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
                              Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  _inputOptions.length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(_inputOptions[index]),
                                      selected: _input_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _input_answer = _inputOptions[index];
                                          _input_index = selected ? index : null;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),  
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
                                          labelText: _input_answer,
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
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _3Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _4Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q5}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _5Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q6}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _6Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q7}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _7Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q8}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _8Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: _input_answer,
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q9}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                    Text('ZMW ${_total.toString()} / ${_input_answer}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith()),
                                            SizedBox(width: 6.0),
                                    RaisedButton(

                                        child: Text('Total',style: TextStyle(color: Colors.white)),
                                        onPressed: () => _totalInput(),
                                      ),        
                                      ],
                                    ),
                              
                              
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

  _totalInput() {
    double foo  = double.parse(_1Controller.text) + double.parse(_2Controller.text)+double.parse(_3Controller.text) + double.parse(_4Controller.text)+
          double.parse(_5Controller.text) + double.parse(_6Controller.text)+double.parse(_7Controller.text) + double.parse(_8Controller.text);
          //+ double.parse(_9Controller.text);

          setState(() {
            _total = foo;
          });
  }
  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        '_input': [_input_answer, _input_index],
        '_1': _1Controller.text,
        '_2': _2Controller.text,
        '_3': _3Controller.text,
        '_4': _4Controller.text,
        '_5': _5Controller.text,
        '_6': _6Controller.text,
        '_7': _7Controller.text,
        '_8': _8Controller.text,
        //'_9': _9Controller.text,
      };

      states.sections['sec_13'] = data;
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
    _1Controller.dispose();
    _2Controller.dispose();
    _5Controller.dispose();
    super.dispose();
  }
}
