import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sixteen extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Sixteen(this.interview_id, this.interview);

  @override
  _SixteenState createState() => _SixteenState(interview_id, interview);
}

class _SixteenState extends State<Sixteen> {
  _SixteenState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2;//Questions
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

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
     questions = questionaire.getSections()[15];

    _title = questions['title'];

    if(interview['sections']['sec_16'] != null ){
     
      dataExist = true;
      _1Controller..text = interview['sections']['sec_16']['_1']['_number'];
      _1_2Controller..text = interview['sections']['sec_16']['_1']['_comment'];
      _1Answer = interview['sections']['sec_16']['_1']['_condition'][0];
      _1_index = interview['sections']['sec_16']['_1']['_condition'][1];

      _2Controller..text = interview['sections']['sec_16']['_2']['_number'];
      _2_2Controller..text = interview['sections']['sec_16']['_2']['_comment'];
      _2Answer = interview['sections']['sec_16']['_2']['_condition'][0];
      _2_index = interview['sections']['sec_16']['_2']['_condition'][1];

      _3Controller..text = interview['sections']['sec_16']['_3']['_number'];
      _3_2Controller..text = interview['sections']['sec_16']['_3']['_comment'];
      _3Answer = interview['sections']['sec_16']['_3']['_condition'][0];
      _3_index = interview['sections']['sec_16']['_3']['_condition'][1];
       // _1_index = interview['sections']['sec_7']['_1'][1];
        //_2Controller..text = interview['sections']['sec_7']['_2'];
    }
    _questionnaireList = questions['_questions'];
    _numberInputControllersList = [_1Controller,_2Controller,_3Controller];
    _commentInputControllersList = [_1_2Controller,_2_2Controller,_3_2Controller];
    _conditionAnswerList = [_1Answer,_2Answer,_3Answer];
    _conditionIndexList = [_1_index,_2_index,_3_index];
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
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
                              Text('Heading question',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
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

  void _submitForm(var states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      
      Map data = {
        //'_answers': [{'_planted':_cropChckList[0], 'area_planted':_1APController.text,'_use': [{'_use':list1},{'other': _1OtherController.text}]}],
        '_1': {'_number':_1Controller.text, '_condition':[_conditionAnswerList[0], _conditionIndexList[0]],'_comment': _1_2Controller.text},
        '_2': {'_number':_2Controller.text, '_condition':[_conditionAnswerList[1], _conditionIndexList[1]],'_comment': _2_2Controller.text},
        '_3': {'_number':_3Controller.text, '_condition':[_conditionAnswerList[2], _conditionIndexList[2]],'_comment': _3_2Controller.text},
      };

      states['sections']['sec_16'] = data;
      print('22222222222222222222222${states}444444444444444444444444444444444');
          
      await _interviewDao.updateHive(states, interview_id)
      .then((value){
        dataExist?showTopShortToast():null;
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
   // _2Controller.dispose();
    super.dispose();
  }
}
