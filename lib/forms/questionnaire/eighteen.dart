import 'package:absapp/services/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Eighteen extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Eighteen(this.interview_id, this.interview);

  @override
  _EighteenState createState() => _EighteenState(interview_id, interview);
}

class _EighteenState extends State<Eighteen> {
  _EighteenState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();
  Map interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5,q6;//Questions

  final String interview_id;
  
  TextEditingController _1_1Controller = TextEditingController();
  TextEditingController _1_2Controller = TextEditingController();
  TextEditingController _1_3Controller = TextEditingController();
  TextEditingController _1_4Controller = TextEditingController();
  TextEditingController _1_5Controller = TextEditingController();

  TextEditingController _2_1Controller = TextEditingController();
  TextEditingController _2_2Controller = TextEditingController();
  TextEditingController _2_3Controller = TextEditingController();
  TextEditingController _2_4Controller = TextEditingController();
  TextEditingController _2_5Controller = TextEditingController();

  TextEditingController _3_1Controller = TextEditingController();
  TextEditingController _3_2Controller = TextEditingController();
  TextEditingController _3_3Controller = TextEditingController();
  TextEditingController _3_4Controller = TextEditingController();
  TextEditingController _3_5Controller = TextEditingController();

  TextEditingController _4_1Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();
  TextEditingController _4_3Controller = TextEditingController();
  TextEditingController _4_4Controller = TextEditingController();
  TextEditingController _4_5Controller = TextEditingController();

  TextEditingController _5_1Controller = TextEditingController();
  TextEditingController _5_2Controller = TextEditingController();
  TextEditingController _5_3Controller = TextEditingController();
  TextEditingController _5_4Controller = TextEditingController();
  TextEditingController _5_5Controller = TextEditingController();

  TextEditingController _6_1Controller = TextEditingController();
  TextEditingController _6_2Controller = TextEditingController();
  TextEditingController _6_3Controller = TextEditingController();
  TextEditingController _6_4Controller = TextEditingController();
  TextEditingController _6_5Controller = TextEditingController();

  
  

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
     if(interview['sections']['sec_18'] != null){
        dataExist = true;
        _1_1Controller..text = interview['sections']['sec_18']['_1'][0];
        _1_2Controller..text = interview['sections']['sec_18']['_1'][1];
        _1_3Controller..text = interview['sections']['sec_18']['_1'][2];
        _1_4Controller..text = interview['sections']['sec_18']['_1'][3];
        _1_5Controller..text = interview['sections']['sec_18']['_1'][4];

        _2_1Controller..text = interview['sections']['sec_18']['_2'][0];
        _2_2Controller..text = interview['sections']['sec_18']['_2'][1];
        _2_3Controller..text = interview['sections']['sec_18']['_2'][2];
        _2_4Controller..text = interview['sections']['sec_18']['_2'][3];
        _2_5Controller..text = interview['sections']['sec_18']['_2'][4];

        _3_1Controller..text = interview['sections']['sec_18']['_3'][0];
        _3_2Controller..text = interview['sections']['sec_18']['_3'][1];
        _3_3Controller..text = interview['sections']['sec_18']['_3'][2];
        _3_4Controller..text = interview['sections']['sec_18']['_3'][3];
        _3_5Controller..text = interview['sections']['sec_18']['_3'][4];

        _4_1Controller..text = interview['sections']['sec_18']['_4'][0];
        _4_2Controller..text = interview['sections']['sec_18']['_4'][1];
        _4_3Controller..text = interview['sections']['sec_18']['_4'][2];
        _4_4Controller..text = interview['sections']['sec_18']['_4'][3];
        _4_5Controller..text = interview['sections']['sec_18']['_4'][4];

        _5_1Controller..text = interview['sections']['sec_18']['_5'][0];
        _5_2Controller..text = interview['sections']['sec_18']['_5'][1];
        _5_3Controller..text = interview['sections']['sec_18']['_5'][2];
        _5_4Controller..text = interview['sections']['sec_18']['_5'][3];
        _5_5Controller..text = interview['sections']['sec_18']['_5'][4];

        _6_1Controller..text = interview['sections']['sec_18']['_6'][0];
        _6_2Controller..text = interview['sections']['sec_18']['_6'][1];
        _6_3Controller..text = interview['sections']['sec_18']['_6'][2];
        _6_4Controller..text = interview['sections']['sec_18']['_6'][3];
        _6_5Controller..text = interview['sections']['sec_18']['_6'][4];
       
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[17];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    q3 = questions['_3'][0];
    q4 = questions['_4'][0];
    q5 = questions['_5'][0];
    q6 = questions['_6'][0];
    
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
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _1_5Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                      ),
                                    ),]),
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _2_5Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                      ),
                                    ),]),
                                
                              SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _3_5Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                      ),
                                    ),]),
                                
                              SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _4_5Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                      ),
                                    ),]),
                                
                              SizedBox(height: 12),
                              Text('${q5}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _5_5Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                      ),
                                    ),]),
                                
                              SizedBox(height: 12),
                              Text('${q6}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _6_1Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Jersey",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _6_2Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Pure Friesian/ Holstein",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _6_3Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Local Breed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: _6_4Controller,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "X bred improved, e.g Jersey X Friesian",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _6_5Controller,
                                        keyboardType: TextInputType.number,
                                        
                                        validator: (value) {
                                          if (value.isEmpty) return 'Field cannot be blank';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Crossbred Dairy X Local",
                                        ),
                                        
                                      ),
                                    ),]),
                                
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
        '_1': [_1_1Controller.text,_1_2Controller.text,_1_3Controller.text,_1_4Controller.text,_1_5Controller.text],
        '_2': [_2_1Controller.text,_2_2Controller.text,_2_3Controller.text,_2_4Controller.text,_2_5Controller.text],
        '_3': [_3_1Controller.text,_3_2Controller.text,_3_3Controller.text,_3_4Controller.text,_3_5Controller.text],
        '_4': [_4_1Controller.text,_4_2Controller.text,_4_3Controller.text,_4_4Controller.text,_4_5Controller.text],
        '_5': [_5_1Controller.text,_5_2Controller.text,_5_3Controller.text,_5_4Controller.text,_5_5Controller.text],
        '_6': [_6_1Controller.text,_6_2Controller.text,_6_3Controller.text,_6_4Controller.text,_6_5Controller.text],
      };

      states['sections']['sec_18'] = data;
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
    //_1aController.dispose();
    super.dispose();
  }
}
