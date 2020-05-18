import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Five extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Five(this.interview_id, this.interview);

  @override
  _FiveState createState() => _FiveState(interview_id,interview);
}

class _FiveState extends State<Five> {
  _FiveState(this.interview_id,this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;
  Map interview;

  String _title,q1,q2,q3,q4,q5;//Questions
  List _1options,_2options,_3options,_4options;
  List<bool> _4isChckList;
  bool _3show = false,_4OtherShow = false;
  int _3_index ;
  String _1answer='Select',_2answer='Select',_3answer;
  

  final String interview_id;
  
  TextEditingController _4OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _4isChckList = [false, false, false, false, false, false, false];
    if(interview['sections']['sec_5'] != null ){
    dataExist = true;
        _1answer = interview['sections']['sec_5']['_1'];
        _2answer = interview['sections']['sec_5']['_2'];
        _3answer = interview['sections']['sec_5']['_3'][0];
        _3_index = interview['sections']['sec_5']['_3'][1];
        _3show = _2answer=='Previously provided milk,but not within the last 2 years(inactive)'?true:false;
        _4isChckList = interview['sections']['sec_5']['_4']['_4'];
        _4OtherController..text = interview['sections']['sec_5']['_4']['other'];
        _4OtherShow = _4isChckList[6]?true:false;

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[4];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];
    _4options = questions['_4'][2];
    
    
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
                              Text('${q1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                               DropdownButton(
                                value: _1answer,
                                items: _1options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _1answer = newValue;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              DropdownButton(
                                isExpanded: true,
                                value: _2answer,
                                items: _2options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _2answer = newValue;
                                    _3show = newValue=='Previously provided milk,but not within the last 2 years(inactive)'?true:false;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ),
                              SizedBox(height: 12),
                              Visibility(
                                visible: _3show,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
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
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ), 
                                ],)),
                                     
                              SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Wrap(
                                  children: List<Widget>.generate(_4options.length, (int index) {
                                    return Row(children: <Widget>[
                                      
                                      Checkbox(
                                          value: _4isChckList[index],
                                          onChanged: (bool value) {
                                              setState(() {
                                                  _4isChckList[index] = value;
                                                  _4OtherShow = _4isChckList[6] == true?true:false;

                                              });
                                          },
                                      ),
                                      Text(_4options[index]),
                                  ]);
                                  })
                              ),
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
                              ))
                              
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
        '_1': _1answer,
        '_2': _2answer,
        '_3': [_3answer, _3_index],
        '_4':  {'_4':_4isChckList,'other':_4OtherController.text},
      };

      states['sections']['sec_5'] = data;
     // print('22222222222222222222222${states}444444444444444444444444444444444');
      if(_3answer == 'No'){
        states['question_number'] = '5';
        states['completed'] = true;
        await _interviewDao.updateHive(states, interview_id)
        .then((value){
          finishInterviewToast();
          print('22222222222222222222222${states}444444444444444444444444444444444');
          setState(() {
            dataExist = true; 
          });
        });
      }else{  
        await _interviewDao.updateHive(states, interview_id)
        .then((value){
          dataExist?showTopShortToast():null;
          setState(() {
            dataExist = true; 
          });
        });
      }
    }
  }

  void finishInterviewToast() {
    Fluttertoast.showToast(
        msg: "If doesnt wish to provide milk in the future, Thank them for their time and Stop Interview",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
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
    _4OtherController.dispose();
    super.dispose();
  }
}
