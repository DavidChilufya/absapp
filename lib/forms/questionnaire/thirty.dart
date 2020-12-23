import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Thirty extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Thirty(this.interview_id, this.interview);

  @override
  _ThirtyState createState() => _ThirtyState(interview_id, interview);
}

class _ThirtyState extends State<Thirty> {
  _ThirtyState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3;//Questions
  List<bool> _1isChckList;
  List _1options,_2options,_3options;
  int _2_index,_3_index ;
  String _1answer='Select',_2answer,_3answer;

  final String interview_id;

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _1isChckList = [false, false, false, false, false];
    if(interview['sections']['sec_30'] != null ){
      
      dataExist = true;
        _1answer = interview['sections']['sec_30']['_1'];
        _2answer = interview['sections']['sec_30']['_2'][0];
        _2_index = interview['sections']['sec_30']['_2'][1];

        _3answer = interview['sections']['sec_30']['_3'][0];
        _3_index = interview['sections']['sec_30']['_3'][1];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[29];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    _1options = questions['_1'][2];
    _2options = questions['_2'][2];
    _3options = questions['_3'][2];
    
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
        '_2': [_2answer, _2_index],
        '_3': [_3answer, _3_index],
      };

      states['sections']['sec_30'] = data;
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
    _interviewDao.closeHive();
    super.dispose();
  }
}
