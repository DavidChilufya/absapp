import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TweentyThree extends StatefulWidget {
  final String interview_id;
  final Map interview;

  TweentyThree(this.interview_id, this.interview);

  @override
  _TweentyThreeState createState() => _TweentyThreeState(interview_id, interview);
}

class _TweentyThreeState extends State<TweentyThree> {
  _TweentyThreeState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions;
  Map interview;

  String _title, q1, q2, q3, q4, q5; //Questions
  List _1options, _2options, _3options, _4options;
  List<bool> _3isChckList;
  bool _3OtherShow = false;
  int _1_index,_2_index,_4_index;
  String _1answer , _2answer, _4answer;

  final String interview_id;

  TextEditingController _3OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _3isChckList = [false, false, false, false, false];
    if (interview['sections']['sec_23'] != null) {
      dataExist = true;
      _1answer = interview['sections']['sec_23']['_1'][0];
      _1_index = interview['sections']['sec_23']['_1'][1];
      _2answer = interview['sections']['sec_23']['_2'][0];
      _2_index = interview['sections']['sec_23']['_2'][1];
      _4answer = interview['sections']['sec_23']['_4'][0];
      _4_index = interview['sections']['sec_23']['_4'][1];
          
      _3isChckList = interview['sections']['sec_23']['_3']['_3'];
      _3OtherController..text = interview['sections']['sec_23']['_3']['other'];
      _3OtherShow = _3isChckList[4] ? true : false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[22];
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
                                _2options.length,
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
                                        children: List<Widget>.generate(
                                            _3options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _3isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _3isChckList[index] = value;
                                              _3OtherShow =
                                                  _3isChckList[4] == true
                                                      ? true
                                                      : false;
                                            });
                                          },
                                        ),
                                        Text(_3options[index]),
                                      ]);
                                    })),
                                    Visibility(
                                      visible: _3OtherShow,
                                      child: TextFormField(
                                        controller: _3OtherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: "Other",
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
        '_1': [_1answer, _1_index],
        '_2': [_2answer, _2_index],
        '_3': {'_3': _3isChckList, 'other': _3OtherController.text},
        '_4': [_4answer, _4_index],
      };

      states['sections']['sec_23'] = data;
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
    _3OtherController.dispose();
    super.dispose();
  }
}
