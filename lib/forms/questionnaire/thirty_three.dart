import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ThirtyThree extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  ThirtyThree(this.interview_id, this.interview);

  @override
  _ThirtyThreeState createState() => _ThirtyThreeState(interview_id, interview);
}

class _ThirtyThreeState extends State<ThirtyThree> {
  _ThirtyThreeState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q1_1,q1_2,q1_3,q1_4,q1_5,q1_6,q2;//Questions
  List _1options,_2options;
  List<bool> _1isChckList,_2isChckList;
  
  bool _1_1Show = false,_1_2Show = false,_1_3Show = false,_1_4Show = false,_1_5Show = false,_1_6Show = false,_2OtherShow = false;
  bool _1_1OtherShow = false,_1_2OtherShow = false,_1_3OtherShow = false,_1_4OtherShow = false,_1_5OtherShow = false,_1_6OtherShow = false;
  
  String _1_1answer='Training Provided By',_1_2answer='Training Provided By',_1_3answer='Training Provided By',_1_4answer='Training Provided By',
  _1_5answer='Training Provided By',_1_6answer='Training Provided By';

  final String interview_id;
  
  TextEditingController _1_1OtherController = TextEditingController();
  TextEditingController _1_2OtherController = TextEditingController();
  TextEditingController _1_3OtherController = TextEditingController();
  TextEditingController _1_4OtherController = TextEditingController();
  TextEditingController _1_5OtherController = TextEditingController();
  TextEditingController _1_6OtherController = TextEditingController();
  TextEditingController _1OtherController = TextEditingController();

  TextEditingController _1_1WhenController = TextEditingController();
  TextEditingController _1_2WhenController = TextEditingController();
  TextEditingController _1_3WhenController = TextEditingController();
  TextEditingController _1_4WhenController = TextEditingController();
  TextEditingController _1_5WhenController = TextEditingController();
  TextEditingController _1_6WhenController = TextEditingController();
  TextEditingController _2OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    _1isChckList = [false, false, false, false, false, false];
    _2isChckList = [false, false, false, false, false, false];
    if(interview.sections['sec_33'] != null ){
      Map data = interview.sections['sec_33'];

      
      dataExist = true;
      _1isChckList = [data['_1'][0]['_1'], data['_1'][1]['_1'], data['_1'][2]['_1'], data['_1'][3]['_1'], data['_1'][4]['_1'], data['_1'][5]['_1'][1]];
      _2isChckList = data['_2'][0];
      _2OtherShow = data['_2'][0][5];
      _2OtherController..text = data['_2'][1];

      _1_1OtherController..text = data['_1'][0]['_2'][1];
      _1_2OtherController..text = data['_1'][1]['_2'][1];
      _1_3OtherController..text = data['_1'][2]['_2'][1];
      _1_4OtherController..text = data['_1'][3]['_2'][1];
      _1_5OtherController..text = data['_1'][4]['_2'][1];
      _1_6OtherController..text = data['_1'][5]['_2'][1];
      _1OtherController..text = data['_1'][5]['_1'][0];

      _1_1WhenController..text = data['_1'][0]['_3'];
      _1_2WhenController..text = data['_1'][1]['_3'];
      _1_3WhenController..text = data['_1'][2]['_3'];
      _1_4WhenController..text = data['_1'][3]['_3'];
      _1_5WhenController..text = data['_1'][4]['_3'];
      _1_6WhenController..text = data['_1'][5]['_3'];


      _1_1answer = data['_1'][0]['_2'][0];
      _1_2answer = data['_1'][1]['_2'][0];
      _1_3answer = data['_1'][2]['_2'][0];
      _1_4answer = data['_1'][3]['_2'][0];
      _1_5answer = data['_1'][4]['_2'][0];
      _1_6answer = data['_1'][5]['_2'][0];

      _1_1Show = data['_1'][0]['_1'];
      _1_2Show = data['_1'][1]['_1'];
      _1_3Show = data['_1'][2]['_1'];
      _1_4Show = data['_1'][3]['_1'] ;
      _1_5Show = data['_1'][4]['_1'];
      _1_6Show = data['_1'][5]['_1'][1];

      _1_1OtherShow = data['_1'][0]['_2'][0] == 'Other'?true:false;
      _1_2OtherShow = data['_1'][1]['_2'][0] == 'Other'?true:false;
      _1_3OtherShow = data['_1'][2]['_2'][0] == 'Other'?true:false;
      _1_4OtherShow = data['_1'][3]['_2'][0] == 'Other'?true:false;
      _1_5OtherShow = data['_1'][4]['_2'][0] == 'Other'?true:false;
      _1_6OtherShow = data['_1'][5]['_2'][0] == 'Other'?true:false;

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[32];
    _title = questions['title'];
    q1 = questions['_1'][0][0];

    q1_1 = questions['_1'][0][1][0][0];
    q1_2 = questions['_1'][0][1][1][0];
    q1_3 = questions['_1'][0][1][2][0];
    q1_4 = questions['_1'][0][1][3][0];
    q1_5 = questions['_1'][0][1][4][0];
    q1_6 = questions['_1'][0][1][5][0];

    _1options = questions['_1'][0][1][0][1];

    q2 = questions['_2'][0];
    _2options = questions['_2'][2];
    
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

                              /*

                              Text('${q1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  Text('${q1_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                  Checkbox(
                                            value: _1isChckList[0],
                                            onChanged: (bool value) {
                                              setState(() {
                                                _1isChckList[0] = value;
                                                _1_1Show = _1isChckList[0];
                                              });
                                            },
                                          ),      
                              ]),
                              Visibility(
                                visible: _1_1Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_1answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_1answer = newValue;
                                          _1_1OtherShow = _1_1answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_1WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_1OtherShow,
                                    child: TextFormField(
                                      controller: _1_1OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ),),

                                     Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  Text('${q1_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                  Checkbox(
                                            value: _1isChckList[1],
                                            onChanged: (bool value) {
                                              setState(() {
                                                _1isChckList[1] = value;
                                                _1_2Show = _1isChckList[1];
                                              });
                                            },
                                          ),      
                              ]),
                              Visibility(
                                visible: _1_2Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_2answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_2answer = newValue;
                                          _1_2OtherShow = _1_2answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_2WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_2OtherShow,
                                    child: TextFormField(
                                      controller: _1_2OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ),),
                              


                                     Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  Text('${q1_3}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                  Checkbox(
                                            value: _1isChckList[2],
                                            onChanged: (bool value) {
                                              setState(() {
                                                _1isChckList[2] = value;
                                                _1_3Show = _1isChckList[2];
                                              });
                                            },
                                          ),      
                              ]),
                              Visibility(
                                visible: _1_3Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_3answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_3answer = newValue;
                                          _1_3OtherShow = _1_3answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_3WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_3OtherShow,
                                    child: TextFormField(
                                      controller: _1_3OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ),),


                                     Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  Text('${q1_4}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                  Checkbox(
                                            value: _1isChckList[3],
                                            onChanged: (bool value) {
                                              setState(() {
                                                _1isChckList[3] = value;
                                                _1_4Show = _1isChckList[3];
                                              });
                                            },
                                          ),      
                              ]),
                              Visibility(
                                visible: _1_4Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_4answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_4answer = newValue;
                                          _1_4OtherShow = _1_4answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_4WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_4OtherShow,
                                    child: TextFormField(
                                      controller: _1_4OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ),),


                                     Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  Text('${q1_5}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                  Checkbox(
                                            value: _1isChckList[4],
                                            onChanged: (bool value) {
                                              setState(() {
                                                _1isChckList[4] = value;
                                                _1_5Show = _1isChckList[4];
                                              });
                                            },
                                          ),      
                              ]),
                              Visibility(
                                visible: _1_5Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_5answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_5answer = newValue;
                                          _1_5OtherShow = _1_5answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_5WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_5OtherShow,
                                    child: TextFormField(
                                      controller: _1_5OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ),),
                                      SizedBox(height: 6),

                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:<Widget>[
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.6, child:
                                        TextFormField(
                                            controller: _1OtherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          )),
                                        Checkbox(
                                                  value: _1isChckList[5],
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      _1isChckList[5] = value;
                                                      _1_6Show = _1isChckList[5];
                                                    });
                                                  },
                                                ),      
                                    ]),
                              Visibility(
                                visible: _1_6Show,
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:<Widget>[ 
                                    DropdownButton(
                                      value: _1_6answer,
                                      items: _1options
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _1_6answer = newValue;
                                          _1_6OtherShow = _1_6answer=='Other'?true:false;
                                        });
                                      },
                                      underline: SizedBox(),
                                      //isExpanded: true,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                    TextFormField(
                                      controller: _1_6WhenController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                                labelText: "When i.e year e.g 2016",
                                              ),
                                      validator: (value) {
                                        if (value.isEmpty){return 'Field cannot be blank';}
                                        else{ return null; }
                                        },
                                    ), )
                                  ]),),
                                  SizedBox(height: 6),
                                  Visibility(
                                    visible: _1_6OtherShow,
                                    child: TextFormField(
                                      controller: _1_6OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                    ),),
                              SizedBox(height: 12),

                              */
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              Wrap(
                                        children: List<Widget>.generate(
                                            _2options.length, (int index) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _2isChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _2isChckList[index] = value;
                                              _2OtherShow =
                                                  _2isChckList[5] == true
                                                      ? true
                                                      : false;
                                            });
                                          },
                                        ),
                                        Text(_2options[index]),
                                      ]);
                                    })),
                              Visibility(
                                    visible: _2OtherShow,
                                    child: TextFormField(
                                      controller: _2OtherController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                                labelText: "Other",
                                              ),
                                     
                                    ),),      
                             
                              
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
        '_1':[
          {'_1':_1isChckList[0],'_2':[_1_1answer,_1_1OtherController.text],'_3':_1_1WhenController.text},
          {'_1':_1isChckList[1],'_2':[_1_2answer,_1_2OtherController.text],'_3':_1_2WhenController.text},
          {'_1':_1isChckList[2],'_2':[_1_3answer,_1_3OtherController.text],'_3':_1_3WhenController.text},
          {'_1':_1isChckList[3],'_2':[_1_4answer,_1_4OtherController.text],'_3':_1_4WhenController.text},
          {'_1':_1isChckList[4],'_2':[_1_5answer,_1_5OtherController.text],'_3':_1_5WhenController.text},
          {'_1':[_1OtherController.text, _1isChckList[5]],'_2':[_1_6answer,_1_6OtherController.text],'_3':_1_6WhenController.text},
        ],
        '_2': [_2isChckList,_2OtherController.text],
      };

      states.sections['sec_33'] = data;
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
    super.dispose();
  }
}
