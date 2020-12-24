import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Sixteen extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  Sixteen(this.interview_id, this.interview);

  @override
  _SixteenState createState() => _SixteenState(interview_id, interview);
}

class _SixteenState extends State<Sixteen> {
  _SixteenState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q2;//Questions
  List q1_1,q1_2,q1_3,q1_4;
  String _1input_answer,_2input_answer,_3input_answer,_4input_answer;
  int _1input_index,_2input_index ,_3input_index ,_4input_index  ;
  List _questionnaireList,_numberInputControllersList,_commentInputControllersList;
  List<int> _conditionIndexList;   
  List<String> _conditionAnswerList;
  List _conditionOptions;
  int _1_index,_2_index,_3_index,_4_index,_5_index,_6_index,_7_index,_8_index,_9_index,_10_index,_11_index,_12_index,_13_index,_14_index,_15_index,_16_index ;
  String _1Answer,_2Answer,_3Answer,_4Answer,_5Answer,_6Answer,_7Answer,_8Answer,_9Answer,_10Answer,_11Answer,_12Answer,_13Answer,_14Answer,_15Answer,_16Answer;
  bool _2show = false;

  final String interview_id;
  
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _1_2Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _2_2Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();
  TextEditingController _3_2Controller = TextEditingController();
  TextEditingController _4Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();

  TextEditingController _5Controller = TextEditingController();
  TextEditingController _5_2Controller = TextEditingController();

  TextEditingController _6Controller = TextEditingController();
  TextEditingController _6_2Controller = TextEditingController();

  TextEditingController _7Controller = TextEditingController();
  TextEditingController _7_2Controller = TextEditingController();

  TextEditingController _8Controller = TextEditingController();
  TextEditingController _8_2Controller = TextEditingController();

  TextEditingController _9Controller = TextEditingController();
  TextEditingController _9_2Controller = TextEditingController();

  TextEditingController _10Controller = TextEditingController();
  TextEditingController _10_2Controller = TextEditingController();

  TextEditingController _11Controller = TextEditingController();
  TextEditingController _11_2Controller = TextEditingController();

  TextEditingController _12Controller = TextEditingController();
  TextEditingController _12_2Controller = TextEditingController();

  TextEditingController _13Controller = TextEditingController();
  TextEditingController _13_2Controller = TextEditingController();

  TextEditingController _14Controller = TextEditingController();
  TextEditingController _14_2Controller = TextEditingController();

  TextEditingController _15Controller = TextEditingController();
  TextEditingController _15_2Controller = TextEditingController();

  TextEditingController _16Controller = TextEditingController();
  TextEditingController _16_2Controller = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
     questions = questionaire.getSections()[15];

    _title = questions['title'];

    if(interview.sections['sec_16'] != null ){
     
      dataExist = true;
      _1input_answer = interview.sections['sec_16']['_1_1'][0];
      _1input_index = interview.sections['sec_16']['_1_1'][1];
      _2input_answer = interview.sections['sec_16']['_1_2'][0];
      _2input_index = interview.sections['sec_16']['_1_2'][1];
      _3input_answer = interview.sections['sec_16']['_1_3'][0];
      _3input_index = interview.sections['sec_16']['_1_3'][1];
      _4input_answer = interview.sections['sec_16']['_1_4'][0];
      _4input_index = interview.sections['sec_16']['_1_4'][1];


      _1Controller..text = interview.sections['sec_16']['_1']['_number'];
      _1_2Controller..text = interview.sections['sec_16']['_1']['_comment'];
      _1Answer = interview.sections['sec_16']['_1']['_condition'][0];
      _1_index = interview.sections['sec_16']['_1']['_condition'][1];

      _2Controller..text = interview.sections['sec_16']['_2']['_number'];
      _2_2Controller..text = interview.sections['sec_16']['_2']['_comment'];
      _2Answer = interview.sections['sec_16']['_2']['_condition'][0];
      _2_index = interview.sections['sec_16']['_2']['_condition'][1];

      _3Controller..text = interview.sections['sec_16']['_3']['_number'];
      _3_2Controller..text = interview.sections['sec_16']['_3']['_comment'];
      _3Answer = interview.sections['sec_16']['_3']['_condition'][0];
      _3_index = interview.sections['sec_16']['_3']['_condition'][1];

      _4Controller..text = interview.sections['sec_16']['_4']['_number'];
      _4_2Controller..text = interview.sections['sec_16']['_4']['_comment'];
      _4Answer = interview.sections['sec_16']['_4']['_condition'][0];
      _4_index = interview.sections['sec_16']['_4']['_condition'][1];

            _5Controller..text = interview.sections['sec_16']['_5']['_number'];
      _5_2Controller..text = interview.sections['sec_16']['_5']['_comment'];
      _5Answer = interview.sections['sec_16']['_5']['_condition'][0];
      _5_index = interview.sections['sec_16']['_5']['_condition'][1];

      _6Controller..text = interview.sections['sec_16']['_6']['_number'];
      _6_2Controller..text = interview.sections['sec_16']['_6']['_comment'];
      _6Answer = interview.sections['sec_16']['_6']['_condition'][0];
      _6_index = interview.sections['sec_16']['_6']['_condition'][1];

      _7Controller..text = interview.sections['sec_16']['_7']['_number'];
      _7_2Controller..text = interview.sections['sec_16']['_7']['_comment'];
      _7Answer = interview.sections['sec_16']['_7']['_condition'][0];
      _7_index = interview.sections['sec_16']['_7']['_condition'][1];

      _8Controller..text = interview.sections['sec_16']['_8']['_number'];
      _8_2Controller..text = interview.sections['sec_16']['_8']['_comment'];
      _8Answer = interview.sections['sec_16']['_8']['_condition'][0];
      _8_index = interview.sections['sec_16']['_8']['_condition'][1];

      _9Controller..text = interview.sections['sec_16']['_9']['_number'];
      _9_2Controller..text = interview.sections['sec_16']['_9']['_comment'];
      _9Answer = interview.sections['sec_16']['_9']['_condition'][0];
      _9_index = interview.sections['sec_16']['_9']['_condition'][1];

      _10Controller..text = interview.sections['sec_16']['_10']['_number'];
      _10_2Controller..text = interview.sections['sec_16']['_10']['_comment'];
      _10Answer = interview.sections['sec_16']['_10']['_condition'][0];
      _10_index = interview.sections['sec_16']['_10']['_condition'][1];

      _11Controller..text = interview.sections['sec_16']['_11']['_number'];
      _11_2Controller..text = interview.sections['sec_16']['_11']['_comment'];
      _11Answer = interview.sections['sec_16']['_11']['_condition'][0];
      _11_index = interview.sections['sec_16']['_11']['_condition'][1];

      _12Controller..text = interview.sections['sec_16']['_12']['_number'];
      _12_2Controller..text = interview.sections['sec_16']['_12']['_comment'];
      _12Answer = interview.sections['sec_16']['_12']['_condition'][0];
      _12_index = interview.sections['sec_16']['_12']['_condition'][1];

      _13Controller..text = interview.sections['sec_16']['_13']['_number'];
      _13_2Controller..text = interview.sections['sec_16']['_13']['_comment'];
      _13Answer = interview.sections['sec_16']['_13']['_condition'][0];
      _13_index = interview.sections['sec_16']['_13']['_condition'][1];

      _14Controller..text = interview.sections['sec_16']['_14']['_number'];
      _14_2Controller..text = interview.sections['sec_16']['_14']['_comment'];
      _14Answer = interview.sections['sec_16']['_14']['_condition'][0];
      _14_index = interview.sections['sec_16']['_14']['_condition'][1];

      _15Controller..text = interview.sections['sec_16']['_15']['_number'];
      _15_2Controller..text = interview.sections['sec_16']['_15']['_comment'];
      _15Answer = interview.sections['sec_16']['_15']['_condition'][0];
      _15_index = interview.sections['sec_16']['_15']['_condition'][1];

      _16Controller..text = interview.sections['sec_16']['_16']['_number'];
      _16_2Controller..text = interview.sections['sec_16']['_16']['_comment'];
      _16Answer = interview.sections['sec_16']['_16']['_condition'][0];
      _16_index = interview.sections['sec_16']['_6']['_condition'][1];


   

       // _1_index = interview.sections['sec_7']['_1'][1];
        //_2Controller..text = interview.sections['sec_7']['_2'];
    }
    _questionnaireList = questions['_questions'];
    _numberInputControllersList = [_1Controller,_2Controller,_3Controller,_4Controller,_5Controller,_6Controller,
                      _7Controller,_8Controller,_9Controller,_10Controller,_11Controller,_12Controller,_13Controller,_14Controller,_15Controller,_16Controller];
    _commentInputControllersList = [_1_2Controller,_2_2Controller,_3_2Controller,_4_2Controller,_5_2Controller,_6_2Controller,_7_2Controller,_8_2Controller,
                            _9_2Controller,_10_2Controller,_11_2Controller,_12_2Controller,_13_2Controller,_14_2Controller,_15_2Controller,_16_2Controller];
    _conditionAnswerList = [_1Answer,_2Answer,_3Answer,_4Answer,_5Answer,_6Answer,_7Answer,_8Answer,_9Answer,_10Answer,_11Answer,_12Answer,_13Answer,_14Answer,_15Answer,_16Answer];
    _conditionIndexList = [_1_index,_2_index,_3_index,_4_index,_5_index,_6_index,_7_index,_8_index,_9_index,_10_index,_11_index,_12_index,_13_index,_14_index,_15_index,_16_index];
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      q1_1 = questions['_1'];
      q1_2 = questions['_2'];
      q1_3 = questions['_3'];
      q1_4 = questions['_4'];
    //q1 = questions['_1'][0];
    //q2 = questions['_2'][0];
    //questionaire = questions['_questions']['_1'][2];
    
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
                              Text('${q1_1[0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                             Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  q1_1[2].length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(q1_1[2][index]),
                                      selected: _1input_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _1input_answer = q1_1[2][index];
                                          _1input_index = selected ? index : null;
                                          //_2show = _1Answer=='Yes'?true:false;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),
                              Visibility(
                                visible: _1input_index == 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Text('${q1_2[0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                    Wrap(
                                        spacing: 8,
                                        children: List<Widget>.generate(
                                          q1_2[2].length,
                                          (int index) {
                                            return ChoiceChip(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              label: Text(q1_1[2][index]),
                                              selected: _2input_index == index,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _2input_answer = q1_2[2][index];
                                                  _2input_index = selected ? index : null;
                                                  //_2show = _1Answer=='Yes'?true:false;
                                                });
                                              },
                                            );
                                          },
                                        ).toList(),
                                      ),

                                  ],

                                )),
                                Text('${q1_3[0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                Wrap(
                                    spacing: 8,
                                    children: List<Widget>.generate(
                                      q1_3[2].length,
                                      (int index) {
                                        return ChoiceChip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          label: Text(q1_3[2][index]),
                                          selected: _3input_index == index,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _3input_answer = q1_3[2][index];
                                              _3input_index = selected ? index : null;
                                              //_2show = _1Answer=='Yes'?true:false;
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
                                  Visibility(
                                    visible: _3input_index == 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                          Text('${q1_4[0]}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith()),
                                        Wrap(
                                            spacing: 8,
                                            children: List<Widget>.generate(
                                              q1_4[2].length,
                                              (int index) {
                                                return ChoiceChip(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                  ),
                                                  label: Text(q1_4[2][index]),
                                                  selected: _4input_index == index,
                                                  onSelected: (bool selected) {
                                                    setState(() {
                                                      _4input_answer = q1_4[2][index];
                                                      _4input_index = selected ? index : null;
                                                      //_2show = _1Answer=='Yes'?true:false;
                                                    });
                                                  },
                                                );
                                              },
                                            ).toList(),
                                          ),

                                      ],

                                    )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(_questionnaireList.length, (int index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:<Widget>[
                                          Text('${_questionnaireList[index][0]}',style: Theme.of(context).textTheme.headline5.copyWith()),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.25, 
                                            child: TextFormField(
                                                controller: _numberInputControllersList[index],
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                          labelText: 'Number',
                                                        ),
                                                        validator: (value) {
                                                          if (value.isEmpty){return 'Field cannot be blank';}
                                                          else{ return null; }
                                                          },
                                              ),
                                          ),
                                        ]),
                                          Wrap(
                                            spacing: 5,
                                            children: List<Widget>.generate(
                                              _questionnaireList[index][2].length,
                                              (int index2) {
                                                return ChoiceChip(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                  ),
                                                  label: Text(_questionnaireList[index][2][index2]),
                                                  selected: _conditionIndexList[index] == index2,
                                                  onSelected: (bool selected) {
                                                    setState(() {

                                                      _conditionAnswerList[index] = _questionnaireList[index][2][index2];
                                                      _conditionIndexList[index] = selected? index2:null;
                                                     // _3answer = _3options[index];
                                                      //_3_index = selected ? index : null;
                                                    });
                                                  },
                                                );
                                              },
                                            ).toList(),
                                          ), 
                                         TextFormField(
                                              controller: _commentInputControllersList[index],
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                        labelText: 'Comment',
                                                      ),
                                            ),  
                                        SizedBox(height: 6),

                                    ],
                                  );
                                }),
                              ), 
                              
                              SizedBox(height: 12),
                               
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

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        //'_answers': [{'_planted':_cropChckList[0], 'area_planted':_1APController.text,'_use': [{'_use':list1},{'other': _1OtherController.text}]}],
        '_1_1': [_1input_answer, _1input_index],
        '_1_2': [_2input_answer, _2input_index],
        '_1_3': [_3input_answer, _3input_index],
        '_1_4': [_4input_answer, _4input_index],
        '_1': {'_number':_1Controller.text, '_condition':[_conditionAnswerList[0], _conditionIndexList[0]],'_comment': _1_2Controller.text},
        '_2': {'_number':_2Controller.text, '_condition':[_conditionAnswerList[1], _conditionIndexList[1]],'_comment': _2_2Controller.text},
        '_3': {'_number':_3Controller.text, '_condition':[_conditionAnswerList[2], _conditionIndexList[2]],'_comment': _3_2Controller.text},
        '_4': {'_number':_4Controller.text, '_condition':[_conditionAnswerList[3], _conditionIndexList[3]],'_comment': _4_2Controller.text},
        '_5': {'_number':_5Controller.text, '_condition':[_conditionAnswerList[4], _conditionIndexList[4]],'_comment': _5_2Controller.text},
        '_6': {'_number':_6Controller.text, '_condition':[_conditionAnswerList[5], _conditionIndexList[5]],'_comment': _6_2Controller.text},
        '_7': {'_number':_7Controller.text, '_condition':[_conditionAnswerList[6], _conditionIndexList[6]],'_comment': _7_2Controller.text},
        '_8': {'_number':_8Controller.text, '_condition':[_conditionAnswerList[7], _conditionIndexList[7]],'_comment': _8_2Controller.text},
        '_9': {'_number':_9Controller.text, '_condition':[_conditionAnswerList[8], _conditionIndexList[8]],'_comment': _9_2Controller.text},
        '_10': {'_number':_10Controller.text, '_condition':[_conditionAnswerList[9], _conditionIndexList[9]],'_comment': _10_2Controller.text},
        '_11': {'_number':_11Controller.text, '_condition':[_conditionAnswerList[10], _conditionIndexList[10]],'_comment': _11_2Controller.text},
        '_12': {'_number':_12Controller.text, '_condition':[_conditionAnswerList[11], _conditionIndexList[11]],'_comment': _12_2Controller.text},
        '_13': {'_number':_1Controller.text, '_condition':[_conditionAnswerList[12], _conditionIndexList[12]],'_comment': _13_2Controller.text},
        '_14': {'_number':_14Controller.text, '_condition':[_conditionAnswerList[13], _conditionIndexList[13]],'_comment': _14_2Controller.text},
        '_15': {'_number':_15Controller.text, '_condition':[_conditionAnswerList[14], _conditionIndexList[14]],'_comment': _15_2Controller.text},
        '_16': {'_number':_16Controller.text, '_condition':[_conditionAnswerList[15], _conditionIndexList[15]],'_comment': _16_2Controller.text},
        
      };

      states.sections['sec_16'] = data;
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
   // _2Controller.dispose();
    super.dispose();
  }
}
