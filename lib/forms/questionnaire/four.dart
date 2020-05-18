import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Four extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Four(this.interview_id, this.interview);

  @override
  _FourState createState() => _FourState(interview_id, interview);
}

class _FourState extends State<Four> {
  _FourState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5;//Questions
  List _3options, _4options;
  int _4_index ;
  String _3answer = 'Select',_4answer;
  bool _3show = false;
  bool _5show = true ;

  final String interview_id;
  
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _3OtherController = TextEditingController();
  TextEditingController _5Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    if(interview['sections']['sec_4'] != null ){
      
      dataExist = true;
        _1Controller..text = interview['sections']['sec_4']['_1'];
        _2Controller..text = interview['sections']['sec_4']['_2'];
        _5Controller..text = interview['sections']['sec_4']['_5'];
        _3answer = interview['sections']['sec_4']['_3']['_3'];
        _3OtherController..text = interview['sections']['sec_4']['_3']['_other'];
        _4answer = interview['sections']['sec_4']['_4'][0];
        _4_index = interview['sections']['sec_4']['_4'][1];
        _5show = (interview['sections']['sec_4']['_4'][0]) == 'No'? true:false;
        _3show = (interview['sections']['sec_4']['_3']['_3']) == 'Other'? true:false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[3];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
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
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                              TextFormField(
                                controller: _1Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(  
                                          labelText: "yrs",
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                  },
                              ), ),
                              
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4, child: 
                              TextFormField(
                                controller: _2Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                          labelText: "Yrs",
                                        ),
                                validator: (value) {
                                  if (value.isEmpty){return 'Field cannot be blank';}
                                  else{ return null; }
                                },
                              ),),
                              SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              
                              DropdownButton(
                                value: _3answer,
                                items: _3options
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _3answer = newValue;
                                    _3show = newValue == 'Other'? true:false;
                                  });
                                },
                                underline: SizedBox(),
                                //isExpanded: true,
                              ), 
                              Visibility(
                                visible:_3show,
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
                              )),   
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
                                          _5show = _4answer=='No'?true:false;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),        
                              SizedBox(height: 12),
                              Visibility(
                                visible:_5show,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q5}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith()),
                                    SizedBox(height: 6),
                                    TextFormField(
                                      controller: _5Controller,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field fcannot be blank';}
                                        else{ return null; }
                                      },
                                    ),
                              ],)
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
        '_1': _1Controller.text,
        '_2': _2Controller.text,
        '_3': {'_3':_3answer,'_other':_3OtherController.text},
        '_4': [_4answer, _4_index],
        '_5': _5Controller.text,
      };

      states['sections']['sec_4'] = data;
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
    _1Controller.dispose();
    _2Controller.dispose();
    _5Controller.dispose();
    super.dispose();
  }
}
