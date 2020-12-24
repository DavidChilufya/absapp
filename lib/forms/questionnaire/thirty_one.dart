import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ThirtyOne extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  ThirtyOne(this.interview_id, this.interview);

  @override
  _ThirtyOneState createState() => _ThirtyOneState(interview_id, interview);
}

class _ThirtyOneState extends State<ThirtyOne> {
  _ThirtyOneState(this.interview_id, this.interview);

  Questionaire questionaire = Questionaire();
  Map questions;
  Interview interview;

  String _title, q1, q2, q3, q4; //Questions
  List _1options, _2options, _3options, _4options;
  List<bool> _2isChckList,_4isChckList;
  bool _2show = true;
  bool _4show = true;
  bool _2OtherShow = false;
  bool _4OtherShow = false;
  int _1_index,_3_index;
  String _1answer , _3answer;

  final String interview_id;

  TextEditingController _2OtherController = TextEditingController();
  TextEditingController _4OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _2isChckList = [false, false, false, false, false, false];
    _4isChckList = [false, false, false];
   
    if (interview.sections['sec_31'] != null) {
      dataExist = true;
      _1answer = interview.sections['sec_31']['_1'][0];
      _1_index = interview.sections['sec_31']['_1'][1];
      _3answer = interview.sections['sec_31']['_3'][0];
      _3_index = interview.sections['sec_31']['_3'][1];
      _2show = _1answer == 'Yes' ? true: false;
      _4show = _3answer == 'Yes' ? true: false;
          
      _2isChckList = interview.sections['sec_31']['_2']['_2'];
      _2OtherController..text = interview.sections['sec_31']['_2']['other'];
      _2OtherShow = _2isChckList[5];

      _4isChckList = interview.sections['sec_31']['_4']['_4'];
      _4OtherController..text = interview.sections['sec_31']['_4']['other'];
      _4OtherShow = _4isChckList[2];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[30];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];
    _4options = questions['_4'][2];
    
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
                                        _2show = _1answer=='Yes'?true:false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 12),
                            Visibility(
                                visible: _2show,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
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
                                              _2OtherShow =
                                                  _2isChckList[5];
                                            });
                                          },
                                        ),
                                        Text(_2options[index]),
                                      ]);
                                    })),
                                    Visibility(
                                      visible: _2OtherShow,
                                      child: TextFormField(
                                        controller: _2OtherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                        },
                                      ),)
                                  ],
                                )
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
                                _3options.length,
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
                                        _4show = _3answer=='Yes'?true:false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 12),
                            Visibility(
                                visible: _4show,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q4}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith()),
                                    SizedBox(height: 6),
                                    Wrap(
                                        children: List<Widget>.generate(
                                            _4options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _4isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _4isChckList[index] = value;
                                              _4OtherShow =
                                                  _4isChckList[2] == true
                                                      ? true
                                                      : false;
                                            });
                                          },
                                        ),
                                        Text(_4options[index]),
                                      ]);
                                    })),
                                    Visibility(
                                      visible: _4OtherShow,
                                      child: TextFormField(
                                        controller: _4OtherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                        },
                                      ),)
                                  ],
                                )
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
    );
  }

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.

      Map data = {
        '_1': [_1answer, _1_index],
        '_2': {'_2': _2isChckList, 'other': _2OtherController.text},
        '_3': [_3answer, _3_index],
        '_4': {'_4': _4isChckList, 'other': _4OtherController.text},
      };

      states.sections['sec_31'] = data;
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
    _4OtherController.dispose();
    super.dispose();
  }
}
