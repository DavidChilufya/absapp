import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class One extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  One(this.interview_id, this.interview);

  @override
  _OneState createState() => _OneState(interview_id, interview);
}

class _OneState extends State<One> {
  //bool loading = true;
  _OneState(this.interview_id, this.interview);
  //InterviewDao _interviewDao = InterviewDao();
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions;

  String _title, q1, q2, q3, q4, q5; //Questions
  List _4options;
  int _4_index;
  String _4answer;

  final String interview_id;

  TextEditingController _1Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();
  TextEditingController _5Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    if (interview.sections['sec_1'] != null) {
      dataExist = true;
      // print('${interview.sections['sec_1']['_1']}88888888888888888888888888888888882');
      _1Controller..text = interview.sections['sec_1']['_1'];
      _3Controller..text = interview.sections['sec_1']['_3'];
      _5Controller..text = interview.sections['sec_1']['_5'];
      _4answer = interview.sections['sec_1']['_4'][0];
      _4_index = interview.sections['sec_1']['_4'][1];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[0];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    _4options = questions['_4'][2];

    submitBtnTxt = dataExist ? 'Edit' : 'Submit';

    return Scaffold(
        body: Stack(
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
                            TextFormField(
                              controller: _1Controller,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field cannot be blank';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 12),
                            Text('${q3}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            TextFormField(
                              controller: _3Controller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field cannot be blank';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 12),
                            Text('${q4}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            Wrap(
                              spacing: 8,
                              children: List<Widget>.generate(
                                _4options.length,
                                (int index) {
                                  return ChoiceChip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    label: Text(_4options[index]),
                                    selected: _4_index == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _4answer = _4options[index];
                                        _4_index = selected ? index : null;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 12),
                            Text('${q5}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            TextFormField(
                              controller: _5Controller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field cannot be blank';
                                } else {
                                  return null;
                                }
                              },
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
                color: dataExist
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
                onPressed: () => _submitForm(interview),
              ),
            ))
      ],
    ));
  }

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.

      Map data = {
        '_1': _1Controller.text,
        '_2': '',
        '_3': _3Controller.text,
        '_4': [_4answer, _4_index],
        '_5': _5Controller.text,
      };

      states.sections['sec_1'] = data;
      print(
          '22222222222222222222222${states.toJson()}444444444444444444444444444444444');
      //inter
      Provider.of<InterviewModel>(context, listen: false).addSection(states);
      dataExist ? showTopShortToast() : null;
        setState(() {
          dataExist = true;
        });
     

        //Navigator.pushNamed(context, Interview.id, arguments: interview)
      
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
    //_interviewDao.closeHive();
    _1Controller.dispose();
    _3Controller.dispose();
    _5Controller.dispose();
    super.dispose();
  }
}
