import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Eleven extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Eleven(this.interview_id, this.interview);

  @override
  _EleventState createState() => _EleventState(interview_id, interview);
}

class _EleventState extends State<Eleven> {
  _EleventState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions;
  Map interview;

  String _title, q1, q2, q3, q4, q5; //Questions
  List _1options,_optionsDemoPlots,_optionsFunded,_listFunded,_listOther;
  List<bool> _listDemoPlots, _fundedVisible,_otherVisible;
  bool _demoVisible = false;
  int _1_index;
  String _1answer;

  List<bool> _1FundedBy = [false, false, false, false];
  List<bool> _2FundedBy = [false, false, false, false];
  List<bool> _3FundedBy = [false, false, false, false];
  List<bool> _4FundedBy = [false, false, false, false];
  List<bool> _5FundedBy = [false, false, false, false];
  List<bool> _6FundedBy = [false, false, false, false];
  List<bool> _7FundedBy = [false, false, false, false];
  List<bool> _8FundedBy = [false, false, false, false];
  List<bool> _9FundedBy = [false, false, false, false];
  List<bool> _10FundedBy = [false, false, false, false];
  List<bool> _11FundedBy = [false, false, false, false];
  List<bool> _12FundedBy = [false, false, false, false];
  List<bool> _13FundedBy = [false, false, false, false];
  List<bool> _14FundedBy = [false, false, false, false];
  List<bool> _15FundedBy = [false, false, false, false];
  List<bool> _16FundedBy = [false, false, false, false];
  List<bool> _17FundedBy = [false, false, false, false];
  List<bool> _18FundedBy = [false, false, false, false];
  List<bool> _19FundedBy = [false, false, false, false];

  final String interview_id;

  TextEditingController _1OtherController = TextEditingController();
  TextEditingController _2OtherController = TextEditingController();
  TextEditingController _3OtherController = TextEditingController();
  TextEditingController _4OtherController = TextEditingController();
  TextEditingController _5OtherController = TextEditingController();
  TextEditingController _6OtherController = TextEditingController();
  TextEditingController _7OtherController = TextEditingController();
  TextEditingController _8OtherController = TextEditingController();
  TextEditingController _9OtherController = TextEditingController();
  TextEditingController _10OtherController = TextEditingController();
  TextEditingController _11OtherController = TextEditingController();
  TextEditingController _12OtherController = TextEditingController();
  TextEditingController _13OtherController = TextEditingController();
  TextEditingController _14OtherController = TextEditingController();
  TextEditingController _15OtherController = TextEditingController();
  TextEditingController _16OtherController = TextEditingController();
  TextEditingController _17OtherController = TextEditingController();
  TextEditingController _18OtherController = TextEditingController();
  TextEditingController _19OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _listDemoPlots = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
    _otherVisible = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
    _fundedVisible = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
    _listFunded = [_1FundedBy, _2FundedBy, _3FundedBy,_4FundedBy,_5FundedBy,_6FundedBy,
            _7FundedBy,_8FundedBy,_9FundedBy,_10FundedBy,_11FundedBy,_12FundedBy,_13FundedBy,
            _14FundedBy,_15FundedBy,_16FundedBy,_17FundedBy,_18FundedBy,_19FundedBy];

    _listOther = [_1OtherController, _2OtherController, _3OtherController,_4OtherController,_5OtherController,_6OtherController,
                _7OtherController,_8OtherController,_9OtherController,_10OtherController,_11OtherController,_12OtherController,
                _13OtherController,_14OtherController,_15OtherController,_16OtherController,_17OtherController,_18OtherController,_19OtherController];
    if (interview['sections']['sec_11'] != null) {
      dataExist = true;
      _1answer = interview['sections']['sec_11']['_1'][0];
      _1_index = interview['sections']['sec_11']['_1'][1];
      _demoVisible = _1answer == 'Yes'?true:false;
      _listDemoPlots = [
        interview['sections']['sec_11']['_2'][0]['_demo_plots'],
        interview['sections']['sec_11']['_2'][1]['_demo_plots'],
        interview['sections']['sec_11']['_2'][2]['_demo_plots'],
        interview['sections']['sec_11']['_2'][3]['_demo_plots'],
        interview['sections']['sec_11']['_2'][4]['_demo_plots'],
        interview['sections']['sec_11']['_2'][5]['_demo_plots'],
        interview['sections']['sec_11']['_2'][6]['_demo_plots'],
        interview['sections']['sec_11']['_2'][7]['_demo_plots'],
        interview['sections']['sec_11']['_2'][8]['_demo_plots'],
        interview['sections']['sec_11']['_2'][9]['_demo_plots'],
        interview['sections']['sec_11']['_2'][10]['_demo_plots'],
        interview['sections']['sec_11']['_2'][11]['_demo_plots'],
        interview['sections']['sec_11']['_2'][12]['_demo_plots'],
        interview['sections']['sec_11']['_2'][13]['_demo_plots'],
        interview['sections']['sec_11']['_2'][14]['_demo_plots'],
        interview['sections']['sec_11']['_2'][15]['_demo_plots'],
        interview['sections']['sec_11']['_2'][16]['_demo_plots'],
        interview['sections']['sec_11']['_2'][17]['_demo_plots'],
        interview['sections']['sec_11']['_2'][18]['_demo_plots'],
      ];
      _fundedVisible = [
        interview['sections']['sec_11']['_2'][0]['_demo_plots'],
        interview['sections']['sec_11']['_2'][1]['_demo_plots'],
        interview['sections']['sec_11']['_2'][2]['_demo_plots'],
        interview['sections']['sec_11']['_2'][3]['_demo_plots'],
        interview['sections']['sec_11']['_2'][4]['_demo_plots'],
        interview['sections']['sec_11']['_2'][5]['_demo_plots'],
        interview['sections']['sec_11']['_2'][6]['_demo_plots'],
        interview['sections']['sec_11']['_2'][7]['_demo_plots'],
        interview['sections']['sec_11']['_2'][8]['_demo_plots'],
        interview['sections']['sec_11']['_2'][9]['_demo_plots'],
        interview['sections']['sec_11']['_2'][10]['_demo_plots'],
        interview['sections']['sec_11']['_2'][11]['_demo_plots'],
        interview['sections']['sec_11']['_2'][12]['_demo_plots'],
        interview['sections']['sec_11']['_2'][13]['_demo_plots'],
        interview['sections']['sec_11']['_2'][14]['_demo_plots'],
        interview['sections']['sec_11']['_2'][15]['_demo_plots'],
        interview['sections']['sec_11']['_2'][16]['_demo_plots'],
        interview['sections']['sec_11']['_2'][17]['_demo_plots'],
        interview['sections']['sec_11']['_2'][18]['_demo_plots'],

      ];
      _otherVisible = [
        interview['sections']['sec_11']['_2'][0]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][1]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][2]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][3]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][4]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][5]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][6]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][7]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][8]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][9]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][10]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][11]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][12]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][13]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][14]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][15]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][16]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][17]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][18]['_funded_by'][0]['_funded_by'][3],
      ];
      _listFunded = [
        interview['sections']['sec_11']['_2'][0]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][1]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][2]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][3]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][4]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][5]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][6]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][7]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][8]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][9]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][10]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][11]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][12]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][13]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][14]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][15]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][16]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][17]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][18]['_funded_by'][0]['_funded_by'],
        ];
      _1OtherController..text = interview['sections']['sec_11']['_2'][0]['_funded_by'][1]['other'];
      _2OtherController..text = interview['sections']['sec_11']['_2'][1]['_funded_by'][1]['other'];
      _3OtherController..text = interview['sections']['sec_11']['_2'][2]['_funded_by'][1]['other'];
      _4OtherController..text = interview['sections']['sec_11']['_2'][3]['_funded_by'][1]['other'];
      _5OtherController..text = interview['sections']['sec_11']['_2'][4]['_funded_by'][1]['other'];
      _6OtherController..text = interview['sections']['sec_11']['_2'][5]['_funded_by'][1]['other'];
      _7OtherController..text = interview['sections']['sec_11']['_2'][6]['_funded_by'][1]['other'];
      _8OtherController..text = interview['sections']['sec_11']['_2'][7]['_funded_by'][1]['other'];
      _9OtherController..text = interview['sections']['sec_11']['_2'][8]['_funded_by'][1]['other'];
      _10OtherController..text = interview['sections']['sec_11']['_2'][9]['_funded_by'][1]['other'];
      _11OtherController..text = interview['sections']['sec_11']['_2'][10]['_funded_by'][1]['other'];
      _12OtherController..text = interview['sections']['sec_11']['_2'][11]['_funded_by'][1]['other'];
      _13OtherController..text = interview['sections']['sec_11']['_2'][12]['_funded_by'][1]['other'];
      _14OtherController..text = interview['sections']['sec_11']['_2'][13]['_funded_by'][1]['other'];
      _15OtherController..text = interview['sections']['sec_11']['_2'][14]['_funded_by'][1]['other'];
      _16OtherController..text = interview['sections']['sec_11']['_2'][15]['_funded_by'][1]['other'];
      _17OtherController..text = interview['sections']['sec_11']['_2'][16]['_funded_by'][1]['other'];
      _18OtherController..text = interview['sections']['sec_11']['_2'][17]['_funded_by'][1]['other'];
      _19OtherController..text = interview['sections']['sec_11']['_2'][18]['_funded_by'][1]['other'];


          
      //_3isChckList = interview['sections']['sec_8']['_3']['_3'];
      //_3OtherShow = _3isChckList[4] ? true : false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[10];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    _1options = questions['_1'][2];
    _optionsDemoPlots = questions['_2'][2];
    _optionsFunded = questions['_3'][2];

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
                                        _1_index = selected?index:null;
                                        _demoVisible =  _1answer == 'Yes'? true: false;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            Visibility(
                                visible: _demoVisible,
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
                                            _optionsDemoPlots.length, (int index) {
                                      return Column(
                                        children: <Widget>[
                                          Row(children:<Widget>[
                                            Checkbox(
                                              value: _listDemoPlots[index],
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _listDemoPlots[index] = value;
                                                  _fundedVisible[index] =  _listDemoPlots[index]? true: false;
                                                });
                                              },
                                            ),
                                            Text(_optionsDemoPlots[index],style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .copyWith()),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.only(left:32.0),
                                            child: Visibility(
                                              visible: _fundedVisible[index],
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: List<Widget>.generate(
                                                        _optionsFunded.length, (int index2) {
                                                          print('${_listFunded} ${index}');
                                                          return Row(children: <Widget>[
                                                            Checkbox(
                                                              value: _listFunded[index][index2],
                                                              onChanged: (bool value) {
                                                                setState(() {
                                                                  _listFunded[index][index2] = value;
                                                                  _otherVisible[index] = _listFunded[index][3]? true: false;
                                                                });
                                                              },
                                                            ),
                                                            Text(_optionsFunded[index2]),
                                                            
                                                          ]);
                                                        }
                                                    )
                                                  ),
                                                  Visibility(
                                                    visible: _otherVisible[index],
                                                    child: TextFormField(
                                                      controller: _listOther[index],
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
                                              ],) 
                                            ) ,
                                          )
                                         
                                      ]);
                                    })),
                                   
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

  void _submitForm(var states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.

      Map data = {
        //'_answers': [{'_planted':_cropChckList[0], 'area_planted':_1APController.text,'_use': [{'_use':list1},{'other': _1OtherController.text}]}],
        '_1': [_1answer,_1_index] ,
        '_2': [
            {'_demo_plots':_listDemoPlots[0],'_funded_by': [{'_funded_by':_listFunded[0]},{'other': _listOther[0].text} ]},
            {'_demo_plots':_listDemoPlots[1],'_funded_by': [{'_funded_by':_listFunded[1]},{'other': _listOther[1].text} ]},
            {'_demo_plots':_listDemoPlots[2],'_funded_by': [{'_funded_by':_listFunded[2]},{'other': _listOther[2].text} ]},
            {'_demo_plots':_listDemoPlots[3],'_funded_by': [{'_funded_by':_listFunded[3]},{'other': _listOther[3].text} ]},
            {'_demo_plots':_listDemoPlots[4],'_funded_by': [{'_funded_by':_listFunded[4]},{'other': _listOther[4].text} ]},
            {'_demo_plots':_listDemoPlots[5],'_funded_by': [{'_funded_by':_listFunded[5]},{'other': _listOther[5].text} ]},
            {'_demo_plots':_listDemoPlots[6],'_funded_by': [{'_funded_by':_listFunded[6]},{'other': _listOther[6].text} ]},
            {'_demo_plots':_listDemoPlots[7],'_funded_by': [{'_funded_by':_listFunded[7]},{'other': _listOther[7].text} ]},
            {'_demo_plots':_listDemoPlots[8],'_funded_by': [{'_funded_by':_listFunded[8]},{'other': _listOther[8].text} ]},
            {'_demo_plots':_listDemoPlots[9],'_funded_by': [{'_funded_by':_listFunded[9]},{'other': _listOther[9].text} ]},
            {'_demo_plots':_listDemoPlots[10],'_funded_by': [{'_funded_by':_listFunded[10]},{'other': _listOther[10].text} ]},
            {'_demo_plots':_listDemoPlots[11],'_funded_by': [{'_funded_by':_listFunded[11]},{'other': _listOther[11].text} ]},
            {'_demo_plots':_listDemoPlots[12],'_funded_by': [{'_funded_by':_listFunded[12]},{'other': _listOther[12].text} ]},
            {'_demo_plots':_listDemoPlots[13],'_funded_by': [{'_funded_by':_listFunded[13]},{'other': _listOther[13].text} ]},
            {'_demo_plots':_listDemoPlots[14],'_funded_by': [{'_funded_by':_listFunded[14]},{'other': _listOther[14].text} ]},
            {'_demo_plots':_listDemoPlots[15],'_funded_by': [{'_funded_by':_listFunded[15]},{'other': _listOther[15].text} ]},
            {'_demo_plots':_listDemoPlots[16],'_funded_by': [{'_funded_by':_listFunded[16]},{'other': _listOther[16].text} ]},
            {'_demo_plots':_listDemoPlots[17],'_funded_by': [{'_funded_by':_listFunded[17]},{'other': _listOther[17].text} ]},
            {'_demo_plots':_listDemoPlots[18],'_funded_by': [{'_funded_by':_listFunded[18]},{'other': _listOther[18].text} ]},

          ],
      };

      states['sections']['sec_11'] = data;
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
    _3OtherController.dispose();
    super.dispose();
  }
}
