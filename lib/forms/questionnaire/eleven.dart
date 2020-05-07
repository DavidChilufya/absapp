import 'package:absapp/screens/interview/interview_dao.dart';
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

  final String interview_id;

  TextEditingController _1OtherController = TextEditingController();
  TextEditingController _2OtherController = TextEditingController();
  TextEditingController _3OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _listDemoPlots = [false, false, false, false, false];
    _otherVisible = [false, false, false, false, false];
    _fundedVisible = [false, false, false, false];
    _listFunded = [_1FundedBy, _2FundedBy, _3FundedBy];

    _listOther = [_1OtherController, _2OtherController, _3OtherController];
    if (interview['sections']['sec_11'] != null) {
      dataExist = true;
      _1answer = interview['sections']['sec_11']['_1'][0];
      _1_index = interview['sections']['sec_11']['_1'][1];
      _demoVisible = _1answer == 'Yes'?true:false;
      _listDemoPlots = [
        interview['sections']['sec_11']['_2'][0]['_demo_plots'],
        interview['sections']['sec_11']['_2'][1]['_demo_plots'],
        interview['sections']['sec_11']['_2'][2]['_demo_plots'],
      ];
      _fundedVisible = [
        interview['sections']['sec_11']['_2'][0]['_demo_plots'],
        interview['sections']['sec_11']['_2'][1]['_demo_plots'],
        interview['sections']['sec_11']['_2'][2]['_demo_plots'],
      ];
      _otherVisible = [
        interview['sections']['sec_11']['_2'][0]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][1]['_funded_by'][0]['_funded_by'][3],
        interview['sections']['sec_11']['_2'][2]['_funded_by'][0]['_funded_by'][3],
      ];
      _listFunded = [
        interview['sections']['sec_11']['_2'][0]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][1]['_funded_by'][0]['_funded_by'],
        interview['sections']['sec_11']['_2'][2]['_funded_by'][0]['_funded_by'],
        ];
      _1OtherController..text = interview['sections']['sec_11']['_2'][0]['_funded_by'][1]['other'];
      _2OtherController..text = interview['sections']['sec_11']['_2'][1]['_funded_by'][1]['other'];
      _3OtherController..text = interview['sections']['sec_11']['_2'][2]['_funded_by'][1]['other'];
          
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
            {'_demo_plots':_listDemoPlots[2],'_funded_by': [{'_funded_by':_listFunded[2]},{'other': _listOther[2].text} ]}
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
    _3OtherController.dispose();
    super.dispose();
  }
}
