import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Nine extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Nine(this.interview_id, this.interview);

  @override
  _NineState createState() => _NineState(interview_id, interview);
}

class _NineState extends State<Nine> {
  _NineState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions;
  Map interview;

  String _title; //Questions
  List _1options;
  List<bool> _1isChckList;
  bool _1OtherShow = false;

  final String interview_id;

  TextEditingController _1OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _1isChckList = [false, false, false, false, false, false, false];
    if (interview['sections']['sec_9'] != null) {
      dataExist = true;
      _1isChckList = interview['sections']['sec_9']['_1']['_1'];
      _1OtherController..text = interview['sections']['sec_9']['_1']['other'];
      _1OtherShow = _1isChckList[6] ? true : false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[8];
    _title = questions['title'];
    _1options = questions['_1'][2];

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
                                                  _1isChckList[6] == true
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

  void _submitForm(var states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.

      Map data = {
        '_1': {'_1': _1isChckList, 'other': _1OtherController.text},
      };

      states['sections']['sec_9'] = data;
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
