import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TweentyNine extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  TweentyNine(this.interview_id, this.interview);

  @override
  _TweentyNineState createState() => _TweentyNineState(interview_id, interview);
}

class _TweentyNineState extends State<TweentyNine> {
  _TweentyNineState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions;

  String _title, q1, q2, q3, q4, q5, q6; //Questions
  List _1options, _2options, _3options;
  int _1_index, _2_index, _3_index;
  String _1answer, _2answer, _3answer;

  bool _show = false;

  final String interview_id;

  TextEditingController _4Controller = TextEditingController();
  TextEditingController _5Controller = TextEditingController();
  TextEditingController _6Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _6Controller..text = '0';
    if (interview.sections['sec_29'] != null) {
      dataExist = true;
      _1answer = interview.sections['sec_29']['_1'][0];
      _1_index = interview.sections['sec_29']['_1'][1];

      _2answer = interview.sections['sec_29']['_2'][0];
      _2_index = interview.sections['sec_29']['_2'][1];

      _3answer = interview.sections['sec_29']['_3'][0];
      _3_index = interview.sections['sec_29']['_3'][1];

      _show = _3answer == 'Yes' ? true : false;
      _4Controller..text = interview.sections['sec_29']['_4'];
      _5Controller..text = interview.sections['sec_29']['_5'];
      _6Controller..text = interview.sections['sec_29']['_6'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[28];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    q6 = questions['_6'][0];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];

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
                            Text('${q2}',
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
                                    label: Text(_2options[index]),
                                    selected: _2_index == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _2answer = _2options[index];
                                        _2_index = selected ? index : null;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 12),
                            Text('${q3}',
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
                                    label: Text(_3options[index]),
                                    selected: _3_index == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _3answer = _3options[index];
                                        _3_index = selected ? index : null;
                                        _show =
                                            _3answer == 'Yes' ? true : false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 12),
                            Visibility(
                              visible: _show,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q4}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        controller: _4Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "No",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Field cannot be blank';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    Text('${q5}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        controller: _5Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "No",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Field cannot be blank';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                            Text('${q6}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextFormField(
                                controller: _6Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "No",
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field cannot be blank';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            )
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

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.

      Map data = {
        '_1': [_1answer, _1_index],
        '_2': [_2answer, _2_index],
        '_3': [_3answer, _3_index],
        '_4': _4Controller.text,
        '_5': _5Controller.text,
        '_6': _6Controller.text,
      };

      states.sections['sec_29'] = data;
      await Provider.of<InterviewModel>(context, listen: false)
          .addSection(states);
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
    super.dispose();
  }
}
