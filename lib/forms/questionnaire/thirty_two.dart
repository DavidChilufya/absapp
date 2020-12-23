import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThirtyTwo extends StatefulWidget {
  final String interview_id;
  final Map interview;

  ThirtyTwo(this.interview_id, this.interview);

  @override
  _ThirtyTwoState createState() => _ThirtyTwoState(interview_id, interview);
}

class _ThirtyTwoState extends State<ThirtyTwo> {
  _ThirtyTwoState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions;
  Map interview;

  String _title; //Questions
  String q1,q2,q3,q4;
  List _1options,_2options,_3options;
  List<bool> _1isChckList,_2isChckList,_3isChckList;
  bool _1OtherShow = false;

  final String interview_id;

  TextEditingController _1OtherController = TextEditingController();
  TextEditingController _4_1Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();
  TextEditingController _4_3Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _1isChckList = [false, false, false, false, false];
    _2isChckList = [false];
    _3isChckList = [false, false, false, false];
    if (interview['sections']['sec_32'] != null) {
      dataExist = true;
      _1isChckList = interview['sections']['sec_32']['_1']['_1'];
      _1OtherController..text = interview['sections']['sec_32']['_1']['other'];
      _1OtherShow = _1isChckList[4];

      _2isChckList = interview['sections']['sec_32']['_2'];
      _3isChckList = interview['sections']['sec_32']['_3'];
      _4_1Controller..text = interview['sections']['sec_32']['_4'][0];
      _4_2Controller..text = interview['sections']['sec_32']['_4'][1];
      _4_3Controller..text = interview['sections']['sec_32']['_4'][2];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[31];
    _title = questions['title'];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];

    submitBtnTxt = dataExist ? 'Edit' : 'Submit';
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
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            )),
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
                                        children: List<Widget>.generate(
                                            _1options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _1isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _1isChckList[index] = value;
                                              _1OtherShow =
                                                  _1isChckList[4] == true
                                                      ? true
                                                      : false;
                                            });
                                          },
                                        ),
                                        Text(_1options[index]),
                                      ]);
                                    })),
                                    Visibility(
                                      visible: _1OtherShow,
                                      child: TextFormField(
                                        controller: _1OtherController,
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
                            Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                             Wrap(
                                        children: List<Widget>.generate(
                                            _2options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _2isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _2isChckList[index] = value;
                                            });
                                          },
                                        ),
                                        Text(_2options[index]),
                                      ]);
                                    })),
                            SizedBox(height: 12),
                            Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                             Wrap(
                                        children: List<Widget>.generate(
                                            _3options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _3isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _3isChckList[index] = value;
                                            });
                                          },
                                        ),
                                        Text(_3options[index]),
                                      ]);
                                    })) ,
                            SizedBox(height: 12),
                            Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),               
                              TextFormField(
                                        controller: _4_1Controller,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                       
                                      )  ,
                              SizedBox(height: 6), 
                              TextFormField(
                                        controller: _4_2Controller,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                        
                                      )  ,
                              SizedBox(height: 6), 
                              TextFormField(
                                        controller: _4_3Controller,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                        
                                      )  ,
                              SizedBox(height: 6),                    
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
                color: dataExist
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
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
        '_1': {'_1': _1isChckList, 'other': _1OtherController.text},
        '_2': _2isChckList,
        '_3': _3isChckList,
        '_4': [_4_1Controller.text,_4_2Controller.text,_4_3Controller.text],
      };

      states['sections']['sec_32'] = data;
      print(
          '22222222222222222222222${states}444444444444444444444444444444444');

      await _interviewDao.updateHive(states, interview_id).then((value) {
        dataExist ? showTopShortToast() : null;
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
    _1OtherController.dispose();
    super.dispose();
  }
}
