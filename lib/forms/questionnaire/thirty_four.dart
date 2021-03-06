import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/providers/interviewListModel.dart';
import 'package:absapp/screens/interview/interview_screen.dart'
    as interview_screen;
import 'package:absapp/models/questionnaire.dart';
import 'package:absapp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ThirtyFour extends StatefulWidget {
  final String interview_id;
  final Interview interview;
  final User user;

  ThirtyFour(this.interview_id, this.interview, this.user);

  @override
  _ThirtyFourState createState() =>
      _ThirtyFourState(interview_id, interview, user);
}

class _ThirtyFourState extends State<ThirtyFour> {
  _ThirtyFourState(this.interview_id, this.interview, this.user);
  Interview interview;
  final User user;

  Questionaire questionaire = Questionaire();
  Map questions;

  String _title, q1; //Questions
  List q2, q3, q3b, q4, q5;
  List _1options;
  int _1_index, _3_index;
  List<bool> _2_1chckListState,_2_2chckListState,_2_3chckListState,_2_4chckListState,_2_5chckListState,_2_6chckListState,_2_7chckListState,_2_8chckListState;
  List<bool> _3_1chckListState,_3_2chckListState,_3_3chckListState,_3_4chckListState,_3_5chckListState,_3_6chckListState,_3_7chckListState,_3_8chckListState;
  String _1answer, _3answer;

  bool _2show = false;
  bool _3bshow = false;

  List<bool> _5isChckList;
      

  bool _2_1otherOgranisationShow = false;
  bool _2_2otherOgranisationShow = false;
  bool _2_3otherOgranisationShow = false;
  bool _2_4otherOgranisationShow = false;
  bool _2_5otherOgranisationShow = false;
  bool _2_6otherOgranisationShow = false;
  bool _2_7otherOgranisationShow = false;
  bool _2_8otherOgranisationShow = false;

  bool _3b_1otherOgranisationShow = false;
  bool _3b_2otherOgranisationShow = false;
  bool _3b_3otherOgranisationShow = false;
  bool _3b_4otherOgranisationShow = false;
  bool _3b_5otherOgranisationShow = false;
  bool _3b_6otherOgranisationShow = false;
  bool _3b_7otherOgranisationShow = false;
  bool _3b_8otherOgranisationShow = false;

  final String interview_id;

  TextEditingController _2_1Controller = TextEditingController();
  TextEditingController _2_2Controller = TextEditingController();
  TextEditingController _2_3Controller = TextEditingController();
  TextEditingController _2_4Controller = TextEditingController();
  TextEditingController _2_5Controller = TextEditingController();
  TextEditingController _2_6Controller = TextEditingController();
  TextEditingController _2_7Controller = TextEditingController();
  TextEditingController _2_8Controller = TextEditingController();
  TextEditingController _2_1otherController = TextEditingController();
  TextEditingController _2_2otherController = TextEditingController();
  TextEditingController _2_3otherController = TextEditingController();
  TextEditingController _2_4otherController = TextEditingController();
  TextEditingController _2_5otherController = TextEditingController();
  TextEditingController _2_6otherController = TextEditingController();
  TextEditingController _2_7otherController = TextEditingController();
  TextEditingController _2_8otherController = TextEditingController();

  TextEditingController _3b_1Controller = TextEditingController();
  TextEditingController _3b_2Controller = TextEditingController();
  TextEditingController _3b_3Controller = TextEditingController();
  TextEditingController _3b_4Controller = TextEditingController();
  TextEditingController _3b_5Controller = TextEditingController();
  TextEditingController _3b_6Controller = TextEditingController();
  TextEditingController _3b_7Controller = TextEditingController();
  TextEditingController _3b_8Controller = TextEditingController();
  TextEditingController _3bComment_1Controller = TextEditingController();
  TextEditingController _3bComment_2Controller = TextEditingController();
  TextEditingController _3bComment_3Controller = TextEditingController();
  TextEditingController _3bComment_4Controller = TextEditingController();
  TextEditingController _3bComment_5Controller = TextEditingController();
  TextEditingController _3bComment_6Controller = TextEditingController();
  TextEditingController _3bComment_7Controller = TextEditingController();
  TextEditingController _3bComment_8Controller = TextEditingController();
  TextEditingController _3b_1otherController = TextEditingController();
  TextEditingController _3b_2otherController = TextEditingController();
  TextEditingController _3b_3otherController = TextEditingController();
  TextEditingController _3b_4otherController = TextEditingController();
  TextEditingController _3b_5otherController = TextEditingController();
  TextEditingController _3b_6otherController = TextEditingController();
  TextEditingController _3b_7otherController = TextEditingController();
  TextEditingController _3b_8otherController = TextEditingController();

  TextEditingController _4_1Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();
  TextEditingController _4_3Controller = TextEditingController();
  TextEditingController _4_4Controller = TextEditingController();
  TextEditingController _4_5Controller = TextEditingController();
  TextEditingController _4_6Controller = TextEditingController();
  TextEditingController _4_7Controller = TextEditingController();
  TextEditingController _4_8Controller = TextEditingController();
  TextEditingController _4_1benefitsController = TextEditingController();
  TextEditingController _4_2benefitsController = TextEditingController();
  TextEditingController _4_3benefitsController = TextEditingController();
  TextEditingController _4_4benefitsController = TextEditingController();
  TextEditingController _4_5benefitsController = TextEditingController();
  TextEditingController _4_6benefitsController = TextEditingController();
  TextEditingController _4_7benefitsController = TextEditingController();
  TextEditingController _4_8benefitsController = TextEditingController();

  TextEditingController _commenOsuggestionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _2_1chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_2chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_3chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_4chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_5chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_6chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_7chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _2_8chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_1chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_2chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_3chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_4chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_5chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_6chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_7chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _3_8chckListState = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    _5isChckList = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];


    if (interview.sections['sec_34'] != null) {
      dataExist = true;
      _1answer = interview.sections['sec_34']['_1'][0];
      _1_index = interview.sections['sec_34']['_1'][1];
      _2show = (interview.sections['sec_34']['_1'][0]) == 'Yes' ? true : false;

      _2_1Controller..text = interview.sections['sec_34']['_2']['_1']['advice'];
       _2_1chckListState = interview.sections['sec_34']['_2']['_1']['organisation'];
      _2_1otherController
        ..text =
            interview.sections['sec_34']['_2']['_1']['organisation_other'];
      _2_1otherOgranisationShow = _2_1chckListState[7] ? true : false;        

      _2_2Controller..text = interview.sections['sec_34']['_2']['_2']['advice'];
      _2_2chckListState  =
          interview.sections['sec_34']['_2']['_2']['organisation'];
      _2_2otherController
        ..text =
            interview.sections['sec_34']['_2']['_2']['organisation_other'];
      _2_2otherOgranisationShow = _2_2chckListState[7] ? true : false;

      _2_3Controller..text = interview.sections['sec_34']['_2']['_3']['advice'];

      _2_3chckListState =
          interview.sections['sec_34']['_2']['_3']['organisation'];
      _2_3otherController
        ..text =
            interview.sections['sec_34']['_2']['_3']['organisation_other'];
      _2_3otherOgranisationShow = _2_3chckListState[7] ? true : false;

      _2_4Controller..text = interview.sections['sec_34']['_2']['_4']['advice'];
      _2_4chckListState =
          interview.sections['sec_34']['_2']['_4']['organisation'];
      _2_4otherController
        ..text =
            interview.sections['sec_34']['_2']['_4']['organisation_other'];
      _2_4otherOgranisationShow =_2_4chckListState[7] ? true : false;

      _2_5Controller..text = interview.sections['sec_34']['_2']['_5']['advice'];
      _2_5chckListState =
          interview.sections['sec_34']['_2']['_5']['organisation'];
      _2_5otherController
        ..text =
            interview.sections['sec_34']['_2']['_5']['organisation_other'];
      _2_5otherOgranisationShow = _2_5chckListState[7] ? true : false;

      _2_6Controller..text = interview.sections['sec_34']['_2']['_6']['advice'];
      _2_6chckListState =
          interview.sections['sec_34']['_2']['_6']['organisation'];
      _2_6otherController
        ..text =
            interview.sections['sec_34']['_2']['_6']['organisation_other'];
      _2_6otherOgranisationShow = _2_6chckListState[7] ? true : false;

      _2_7Controller..text = interview.sections['sec_34']['_2']['_7']['advice'];
      _2_7chckListState =
          interview.sections['sec_34']['_2']['_7']['organisation'];
      _2_7otherController
        ..text =
            interview.sections['sec_34']['_2']['_7']['organisation_other'];
      _2_7otherOgranisationShow = _2_7chckListState[7] ? true : false;

      _2_8Controller..text = interview.sections['sec_34']['_2']['_8']['advice'];
      _2_8chckListState =
          interview.sections['sec_34']['_2']['_8']['organisation'];
      _2_8otherController
        ..text =
            interview.sections['sec_34']['_2']['_8']['organisation_other'];
      _2_8otherOgranisationShow = _2_8chckListState[7] ? true : false;

      _3answer = interview.sections['sec_34']['_3'][0];
      _3_index = interview.sections['sec_34']['_3'][1];
      _3bshow = (interview.sections['sec_34']['_3'][0]) == 'Yes' ? true : false;

      _3b_1Controller
        ..text = interview.sections['sec_34']['_3_1']['_1']['when'];
      _3_1chckListState =
          interview.sections['sec_34']['_3_1']['_1']['organisation'];
      _3b_1otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_1']['organisation_other'];
      _3bComment_1Controller
        ..text = interview.sections['sec_34']['_3_1']['_1']['comment'];
      _3b_1otherOgranisationShow = _3_1chckListState[7] ? true : false;

      _3b_2Controller
        ..text = interview.sections['sec_34']['_3_1']['_2']['when'];
      _3_2chckListState =
          interview.sections['sec_34']['_3_1']['_2']['organisation'];
      _3b_2otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_2']['organisation_other'];
      _3bComment_2Controller
        ..text = interview.sections['sec_34']['_3_1']['_2']['comment'];
      _3b_2otherOgranisationShow = _3_2chckListState[7] ? true : false;

      _3b_3Controller
        ..text = interview.sections['sec_34']['_3_1']['_3']['when'];
      _3_3chckListState =
          interview.sections['sec_34']['_3_1']['_3']['organisation'];
      _3b_3otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_3']['organisation_other'];
      _3bComment_3Controller
        ..text = interview.sections['sec_34']['_3_1']['_3']['comment'];
      _3b_3otherOgranisationShow = _3_3chckListState[7] ? true : false;

      _3b_4Controller
        ..text = interview.sections['sec_34']['_3_1']['_4']['when'];
      _3_4chckListState =
          interview.sections['sec_34']['_3_1']['_4']['organisation'];
      _3b_4otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_4']['organisation_other'];
      _3bComment_4Controller
        ..text = interview.sections['sec_34']['_3_1']['_4']['comment'];
      _3b_4otherOgranisationShow = _3_4chckListState[7] ? true : false;

      _3b_5Controller
        ..text = interview.sections['sec_34']['_3_1']['_5']['when'];
      _3_5chckListState =
          interview.sections['sec_34']['_3_1']['_5']['organisation'];
      _3b_5otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_5']['organisation_other'];
      _3bComment_5Controller
        ..text = interview.sections['sec_34']['_3_1']['_5']['comment'];
      _3b_5otherOgranisationShow = _3_5chckListState[7] ? true : false;

      _3b_6Controller
        ..text = interview.sections['sec_34']['_3_1']['_6']['when'];
      _3_6chckListState =
          interview.sections['sec_34']['_3_1']['_6']['organisation'];
      _3b_6otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_6']['organisation_other'];
      _3bComment_6Controller
        ..text = interview.sections['sec_34']['_3_1']['_6']['comment'];
      _3b_6otherOgranisationShow = _3_6chckListState[7] ? true : false;

      _3b_7Controller
        ..text = interview.sections['sec_34']['_3_1']['_7']['when'];
      _3_7chckListState =
          interview.sections['sec_34']['_3_1']['_7']['organisation'];
      _3b_7otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_7']['organisation_other'];
      _3bComment_7Controller
        ..text = interview.sections['sec_34']['_3_1']['_7']['comment'];
      _3b_7otherOgranisationShow = _3_7chckListState[7] ? true : false;

      _3b_8Controller
        ..text = interview.sections['sec_34']['_3_1']['_8']['when'];
      _3_8chckListState =
          interview.sections['sec_34']['_3_1']['_8']['organisation'];
      _3b_8otherController
        ..text =
            interview.sections['sec_34']['_3_1']['_8']['organisation_other'];
      _3bComment_8Controller
        ..text = interview.sections['sec_34']['_3_1']['_8']['comment'];
      _3b_8otherOgranisationShow = _3_8chckListState[7] ? true : false;

      _4_1Controller
        ..text = interview.sections['sec_34']['_4']['_1']['applying'];
      _4_1benefitsController
        ..text = interview.sections['sec_34']['_4']['_1']['benefits'];

      _4_2Controller
        ..text = interview.sections['sec_34']['_4']['_2']['applying'];
      _4_2benefitsController
        ..text = interview.sections['sec_34']['_4']['_2']['benefits'];

      _4_3Controller
        ..text = interview.sections['sec_34']['_4']['_3']['applying'];
      _4_3benefitsController
        ..text = interview.sections['sec_34']['_4']['_3']['benefits'];

      _4_4Controller
        ..text = interview.sections['sec_34']['_4']['_4']['applying'];
      _4_4benefitsController
        ..text = interview.sections['sec_34']['_4']['_4']['benefits'];

      _4_5Controller
        ..text = interview.sections['sec_34']['_4']['_5']['applying'];
      _4_5benefitsController
        ..text = interview.sections['sec_34']['_4']['_5']['benefits'];

      _4_6Controller
        ..text = interview.sections['sec_34']['_4']['_6']['applying'];
      _4_6benefitsController
        ..text = interview.sections['sec_34']['_4']['_6']['benefits'];

      _4_7Controller
        ..text = interview.sections['sec_34']['_4']['_7']['applying'];
      _4_7benefitsController
        ..text = interview.sections['sec_34']['_4']['_7']['benefits'];

      _4_8Controller
        ..text = interview.sections['sec_34']['_4']['_8']['applying'];
      _4_8benefitsController
        ..text = interview.sections['sec_34']['_4']['_8']['benefits'];

      _5isChckList = interview.sections['sec_34']['_5'];
      // _5isChckList = interview.sections['sec_34']['_5'];

      _commenOsuggestionController
        ..text = interview.sections['sec_34']['comment'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[33];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'];
    q3 = questions['_3'];
    q3b = questions['_3_1'];
    q4 = questions['_4'];
    q5 = questions['_5'];

    _1options = questions['_1'][2];

    submitBtnTxt = dataExist ? 'Edit' : 'Submit';

    return Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
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
                                        _2show =
                                            _1answer == 'Yes' ? true : false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 10),
                            Visibility(
                              visible: _2show,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q2[0]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][0]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_1Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][0]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_1chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_1chckListState[
                                                              index] = value;
                                                          _2_1otherOgranisationShow =
                                                              _2_1chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][0]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                         
                                            Visibility(
                                              visible:
                                                  _2_1otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_1otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][1]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_2Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][1]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_2chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_2chckListState[
                                                              index] = value;
                                                          _2_2otherOgranisationShow =
                                                              _2_2chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][1]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _2_2otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_2otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][2]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_3Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][2]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_3chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_3chckListState[
                                                              index] = value;
                                                          _2_3otherOgranisationShow =
                                                              _2_3chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][2]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_3otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_3otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][3]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_4Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][3]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_4chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_4chckListState[
                                                              index] = value;
                                                          _2_4otherOgranisationShow =
                                                              _2_4chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][3]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_4otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_4otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][4]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_5Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][4]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_5chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_5chckListState[
                                                              index] = value;
                                                          _2_5otherOgranisationShow =
                                                              _2_5chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][4]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_5otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_5otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][5]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_6Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][5]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_6chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_6chckListState[
                                                              index] = value;
                                                          _2_6otherOgranisationShow =
                                                              _2_6chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][5]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_6otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_6otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][6]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_7Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                            Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][6]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_7chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_7chckListState[
                                                              index] = value;
                                                          _2_7otherOgranisationShow =
                                                              _2_7chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][6]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_7otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_7otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q2[2][7]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _2_8Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Advice",
                                              ),
                                            ),
                                            Text("organisation : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q2[2][7]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _2_8chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _2_8chckListState[
                                                              index] = value;
                                                          _2_8otherOgranisationShow =
                                                              _2_8chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q2[2][7]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _2_8otherOgranisationShow,
                                              child: TextFormField(
                                                controller: _2_8otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                  ]),
                            ),
                            SizedBox(height: 12),
                            Text('${q3[0]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            Wrap(
                              spacing: 8,
                              children: List<Widget>.generate(
                                q3[2].length,
                                (int index) {
                                  return ChoiceChip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    label: Text(q3[2][index]),
                                    selected: _3_index == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _3answer = q3[2][index];
                                        _3_index = selected ? index : null;
                                        _3bshow =
                                            _3answer == 'Yes' ? true : false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 6),
                            Visibility(
                              visible: _3bshow,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][0]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_1Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_1Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),


                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][0]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_1chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_1chckListState[
                                                              index] = value;
                                                          _3b_1otherOgranisationShow =
                                                              _3_1chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][7]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            SizedBox(height: 6.0),
                                            Visibility(
                                              visible:
                                                  _3b_1otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_1otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][1]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_2Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_2Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),
                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][1]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_2chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_2chckListState[
                                                              index] = value;
                                                          _3b_2otherOgranisationShow =
                                                              _3_2chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][1]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),
                                            Visibility(
                                              visible:
                                                  _3b_2otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_2otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][2]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_3Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                          
                                              ],
                                            ),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_3Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),

                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][2]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_3chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_3chckListState[
                                                              index] = value;
                                                          _3b_3otherOgranisationShow =
                                                              _3_3chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][2]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_3otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_3otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][3]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_4Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_4Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),

                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][3]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_4chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_4chckListState[
                                                              index] = value;
                                                          _3b_4otherOgranisationShow =
                                                              _3_4chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][3]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_4otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_4otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][4]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_5Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_5Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),
                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][4]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_5chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_5chckListState[
                                                              index] = value;
                                                          _3b_5otherOgranisationShow =
                                                              _3_5chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][4]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_5otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_5otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][5]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_6Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_6Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),

                                             Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][5]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_6chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_6chckListState[
                                                              index] = value;
                                                          _3b_6otherOgranisationShow =
                                                              _3_6chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][5]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_6otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_6otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                   
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][6]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_7Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                           
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_7Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),

                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][6]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_7chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_7chckListState[
                                                              index] = value;
                                                          _3b_7otherOgranisationShow =
                                                              _3_7chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][6]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_7otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_7otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                               
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q3b[2][7]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: _3b_8Controller,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "When received",
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                            
                                            SizedBox(height: 6.0),
                                            TextFormField(
                                              controller:
                                                  _3bComment_8Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Comment",
                                              ),
                                            ),

                                            Text("Delivered By : ",style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith()),
                                             Wrap(
                                                children: List<Widget>.generate(
                                                    q3b[2][7]['organisation']
                                                        .length, (int index) {
                                              return SizedBox(
                                                  width: 180,
                                                  child: Row(children: <Widget>[
                                                    Checkbox(
                                                      value: _3_8chckListState[
                                                          index],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          _3_8chckListState[
                                                              index] = value;
                                                          _3b_8otherOgranisationShow =
                                                              _3_8chckListState[7] ==
                                                                      true
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    ),
                                                    Text(q3b[2][7]
                                                            ['organisation']
                                                        [index]),
                                                  ]));
                                            })),

                                            Visibility(
                                              visible:
                                                  _3b_8otherOgranisationShow,
                                              child: TextFormField(
                                                controller:
                                                    _3b_8otherController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: "Other",
                                                ),
                                              ),
                                            ),

                                          ]),
                                    ),
                                    SizedBox(height: 6),
                                  ]),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('${q4[0]}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith()),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${q4[2][0]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_1Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_1benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][1]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_2Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_2benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][2]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_3Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_3benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][3]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_4Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_4benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][4]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_5Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_5benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][5]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_6Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_6benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][6]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_7Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_7benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${q4[2][7]['topic']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            TextFormField(
                                              controller: _4_8Controller,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "How Applying",
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            TextFormField(
                                              controller:
                                                  _4_8benefitsController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Benefits Seen",
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ]))
                                ]),
                            Text('${q5[0]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            SizedBox(height: 6),
                            Wrap(
                                children: List<Widget>.generate(q5[2].length,
                                    (int index) {
                              return Row(children: <Widget>[
                                Checkbox(
                                  value: _5isChckList[index],
                                  onChanged: (bool value) {
                                    setState(() {
                                      _5isChckList[index] = value;
                                    });
                                  },
                                ),
                                Text(q5[2][index]),
                              ]);
                            })),
                            Text('Any other comment or suggestion',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith()),
                            TextFormField(
                              controller: _commenOsuggestionController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "",
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
        '_2': {
          '_1': {
            'advice': _2_1Controller.text,
            'organisation': _2_1chckListState,
            'organisation_other': _2_1otherController.text
          },
          '_2': {
            'advice': _2_2Controller.text,
            'organisation': _2_2chckListState,
            'organisation_other': _2_2otherController.text
          },
          '_3': {
            'advice': _2_3Controller.text,
            'organisation': _2_3chckListState,
            'organisation_other': _2_3otherController.text
          },
          '_4': {
            'advice': _2_4Controller.text,
            'organisation': _2_4chckListState,
            'organisation_other': _2_4otherController.text
          },
          '_5': {
            'advice': _2_5Controller.text,
            'organisation': _2_5chckListState,
            'organisation_other': _2_5otherController.text
          },
          '_6': {
            'advice': _2_6Controller.text,
            'organisation': _2_6chckListState,
            'organisation_other': _2_6otherController.text
          },
          '_7': {
            'advice': _2_7Controller.text,
            'organisation': _2_7chckListState,
            'organisation_other': _2_7otherController.text
          },
          '_8': {
            'advice': _2_8Controller.text,
            'organisation': _2_8chckListState,
            'organisation_other': _2_8otherController.text
          },
        },
        '_3': [_3answer, _3_index],
        '_3_1': {
          '_1':{
            'when': _3b_1Controller.text,
            'organisation': _3_1chckListState,
            'organisation_other': _3b_1otherController.text,
            'comment': _3bComment_1Controller.text
          },
          '_2':{
            'when': _3b_2Controller.text,
            'organisation': _3_2chckListState,
            'organisation_other': _3b_2otherController.text,
            'comment': _3bComment_2Controller.text
          },
          '_3':{
            'when': _3b_3Controller.text,
            'organisation': _3_3chckListState,
            'organisation_other': _3b_3otherController.text,
            'comment': _3bComment_3Controller.text
          },
          '_4':{
            'when': _3b_4Controller.text,
            'organisation': _3_4chckListState,
            'organisation_other': _3b_4otherController.text,
            'comment': _3bComment_4Controller.text
          },
          '_5':{
            'when': _3b_5Controller.text,
            'organisation': _3_5chckListState,
            'organisation_other': _3b_5otherController.text,
            'comment': _3bComment_5Controller.text
          },
          '_6':{
            'when': _3b_6Controller.text,
            'organisation': _3_6chckListState,
            'organisation_other': _3b_6otherController.text,
            'comment': _3bComment_6Controller.text,
          },
          '_7':{
            'when': _3b_7Controller.text,
            'organisation': _3_7chckListState,
            'organisation_other': _3b_7otherController.text,
            'comment': _3bComment_7Controller.text,
          },
          '_8':{
            'when': _3b_8Controller.text,
            'organisation': _3_8chckListState,
            'organisation_other': _3b_8otherController.text,
            'comment': _3bComment_8Controller.text,
          },
          '_9':{},
        },
        '_4': {
          '_1':{
            'applying': _4_1Controller.text,
            'benefits': _4_1benefitsController.text},
          '_2':{
            'applying': _4_2Controller.text,
            'benefits': _4_2benefitsController.text},
          '_3':{
            'applying': _4_3Controller.text,
            'benefits': _4_3benefitsController.text},
          '_4':{
            'applying': _4_4Controller.text,
            'benefits': _4_4benefitsController.text},
          '_5':{
            'applying': _4_5Controller.text,
            'benefits': _4_5benefitsController.text},
          '_6':{
            'applying': _4_6Controller.text,
            'benefits': _4_6benefitsController.text},
          '_7':{
            'applying': _4_7Controller.text,
            'benefits': _4_7benefitsController.text},
          '_8':{
            'applying': _4_8Controller.text,
            'benefits': _4_8benefitsController.text},
        },
        '_5': _5isChckList,
        'comment': _commenOsuggestionController.text
      };

      states.sections['sec_34'] = data;
      if (!states.completed) {
        states.question_number = '34';
        states.completed = true;
      }
      await Provider.of<InterviewModel>(context, listen: false)
          .addSection(states);
      await Provider.of<InterviewListModel>(context, listen: false)
          .setAllInterviews();

      if (!dataExist) {
        finishInterviewDialog(context);
      } else {
        showTopShortToast();
      }

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

  void finishInterviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(child: Text('Interview Complete')),
          content: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                  child: Text(
                      "Interview Complete, Thank you very much for your time"))),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Review Interview",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Theme.of(context).accentColor)),
              onPressed: () {
                Navigator.popUntil(context,
                    ModalRoute.withName(interview_screen.Interview.id));
              },
            ),
            RaisedButton(
              child: Text("Home",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black54)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home(this.user)),
                    ModalRoute.withName("/"));
                ;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    Fluttertoast.cancel();
    super.dispose();
  }
}
