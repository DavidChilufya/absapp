import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TweentyTwo extends StatefulWidget {
  final String interview_id;
  final Map interview;

  TweentyTwo(this.interview_id, this.interview);

  @override
  _TweentyTwoState createState() => _TweentyTwoState(interview_id, interview);
}

class _TweentyTwoState extends State<TweentyTwo> {
  _TweentyTwoState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5,q6;//Questions
  List _1options,_2options,_3options,_4options,_5options;
  
  String _1answer='Select',_2answer='Select',_3answer='Select',_4answer='Select';

  List<bool> _1isChckList;
  bool _otherShow = false;

  final String interview_id;
  
  TextEditingController _otherController = TextEditingController();
  TextEditingController _6Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _1isChckList = [false, false, false, false, false];
   
    if(interview['sections']['sec_22'] != null ){
      
      dataExist = true;
      _1answer = interview['sections']['sec_22']['_1'];
      _2answer = interview['sections']['sec_22']['_2'];
      _3answer = interview['sections']['sec_22']['_3'];
      _4answer = interview['sections']['sec_22']['_4'];
      _1isChckList = interview['sections']['sec_22']['_5']['_5'];
      _otherController..text = interview['sections']['sec_22']['_5']['other'];
      _6Controller..text = interview['sections']['sec_22']['_6'];

      _otherShow = _1isChckList[4]?true:false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[21];
    _title = questions['title'];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];
    _4options = questions['_4'][2];
    _5options = questions['_5'][2];

    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    q6 = questions['_6'][0];
    
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
                              DropdownButton(
                                value: _1answer,
                                items: _1options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _1answer = newValue;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              DropdownButton(
                                value: _2answer,
                                items: _2options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _2answer = newValue;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              DropdownButton(
                                value: _3answer,
                                items: _3options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _3answer = newValue;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              DropdownButton(
                                value: _4answer,
                                items: _4options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _4answer = newValue;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              SizedBox(height: 12),
                              Text('${q5}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                             Wrap(
                                        children: List<Widget>.generate(
                                            _5options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _1isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _1isChckList[index] = value;
                                              _otherShow =
                                                  _1isChckList[4] == true
                                                      ? true
                                                      : false;
                                            });
                                          },
                                        ),
                                        Text(_5options[index]),
                                      ]);
                                    })),
                                    Visibility(
                                      visible: _otherShow,
                                      child: TextFormField(
                                        controller: _otherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                        },
                                      )
                                      ),
                              SizedBox(height: 12),
                              Text('${q6}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()), 
                              SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.25, 
                                            child: TextFormField(
                                                controller: _6Controller,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                          labelText: 'Kms',
                                                        ),
                                              ),
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

  void _submitForm(var states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        '_1': _1answer,
        '_2': _2answer,
        '_3': _3answer,
        '_4': _4answer,
        '_5': {'_5': _1isChckList, 'other': _otherController.text},
        '_6': _6Controller.text,
      };

      states['sections']['sec_22'] = data;
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
    //_1Controller.dispose();
    super.dispose();
  }
}
