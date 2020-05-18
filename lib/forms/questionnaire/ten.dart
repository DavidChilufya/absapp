import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Ten extends StatefulWidget {
  final String interview_id;
  final Map interview;

  Ten(this.interview_id, this.interview);

  @override
  _TenState createState() => _TenState(interview_id, interview);
}

class _TenState extends State<Ten> {
  _TenState(this.interview_id, this.interview);
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions;
  Map interview;

  String _title,q1; //Questions
  List questionsList,_cropUseList,apControllersList,otherControllersList;
  List<bool> _cropChckList,_cropChckListShow,_otherListShow;
  List<bool> list1 = [false, false,false, false];
  List<bool> list2 = [false, false,false, false];
  List<bool> list3 = [false, false,false, false];
  List<bool> list4 = [false, false,false, false];
  List<bool> list5 = [false, false,false, false];
  List<bool> list6 = [false, false,false, false];
  List<bool> list7 = [false, false,false, false];
  List<bool> list8 = [false, false,false, false];
  List<bool> list9 = [false, false,false, false];
  List<bool> list10 = [false, false,false, false];
  List<bool> list11 = [false, false,false, false];
  List<bool> list12 = [false, false,false, false];
  List<bool> list13 = [false, false,false, false];
  List<bool> list14 = [false, false,false, false];
  List<bool> list15 = [false, false,false, false];
  List<bool> list16 = [false, false,false, false];
  List<bool> list17 = [false, false,false, false];
   List<bool> list18 = [false, false,false, false];
    List<bool> list19 = [false, false,false, false];

  final String interview_id;
  
  TextEditingController _1APController = TextEditingController();
  TextEditingController _1OtherController = TextEditingController();
  TextEditingController _2APController = TextEditingController();
  TextEditingController _2OtherController = TextEditingController();
  TextEditingController _3APController = TextEditingController();
  TextEditingController _3OtherController = TextEditingController();

  TextEditingController _4APController = TextEditingController();
  TextEditingController _4OtherController = TextEditingController();

  TextEditingController _5APController = TextEditingController();
  TextEditingController _5OtherController = TextEditingController();

  TextEditingController _6APController = TextEditingController();
  TextEditingController _6OtherController = TextEditingController();

  TextEditingController _7APController = TextEditingController();
  TextEditingController _7OtherController = TextEditingController();

  TextEditingController _8APController = TextEditingController();
  TextEditingController _8OtherController = TextEditingController();

  TextEditingController _9APController = TextEditingController();
  TextEditingController _9OtherController = TextEditingController();

  TextEditingController _10APController = TextEditingController();
  TextEditingController _10OtherController = TextEditingController();

  TextEditingController _11APController = TextEditingController();
  TextEditingController _11OtherController = TextEditingController();

  TextEditingController _12APController = TextEditingController();
  TextEditingController _12OtherController = TextEditingController();

  TextEditingController _13APController = TextEditingController();
  TextEditingController _13OtherController = TextEditingController();

  TextEditingController _14APController = TextEditingController();
  TextEditingController _14OtherController = TextEditingController();

  TextEditingController _15APController = TextEditingController();
  TextEditingController _15OtherController = TextEditingController();

  TextEditingController _16APController = TextEditingController();
  TextEditingController _16OtherController = TextEditingController();

  TextEditingController _17APController = TextEditingController();
  TextEditingController _17OtherController = TextEditingController();

  TextEditingController _18APController = TextEditingController();
  TextEditingController _18OtherController = TextEditingController();

  TextEditingController _19APController = TextEditingController();
  TextEditingController _19OtherController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
   
    _cropUseList = [list1,list2,list3,list4,list5,list6,list7,list8,list9,list10,list11,list12,list13,list14,list15,list16,list17,list18,list19];
    _cropChckList = [false, false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
    _cropChckListShow = [false, false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
    _otherListShow = [false, false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
    if (interview['sections']['sec_10'] != null) {
      dataExist = true;
      Map data1 = interview['sections']['sec_10']['_1'];
      Map data2 = interview['sections']['sec_10']['_2'];
      Map data3 = interview['sections']['sec_10']['_3'];
      _cropChckList = [
          data1['_planted'],
          data2['_planted'],
          data3['_planted'],
          interview['sections']['sec_10']['_4']['_planted'],
          interview['sections']['sec_10']['_5']['_planted'],
          interview['sections']['sec_10']['_6']['_planted'],
          interview['sections']['sec_10']['_7']['_planted'],
          interview['sections']['sec_10']['_8']['_planted'],
          interview['sections']['sec_10']['_9']['_planted'],
          interview['sections']['sec_10']['_10']['_planted'],
          interview['sections']['sec_10']['_11']['_planted'],
          interview['sections']['sec_10']['_12']['_planted'],
          interview['sections']['sec_10']['_13']['_planted'],
          interview['sections']['sec_10']['_14']['_planted'],
          interview['sections']['sec_10']['_15']['_planted'],
          interview['sections']['sec_10']['_16']['_planted'],
          interview['sections']['sec_10']['_17']['_planted'],
          interview['sections']['sec_10']['_18']['_planted'],
          interview['sections']['sec_10']['_19']['_planted'],
          
          ];
      _cropChckListShow = [
        data1['_planted'],
        data2['_planted'],
        data3['_planted'],
        interview['sections']['sec_10']['_4']['_planted'],
          interview['sections']['sec_10']['_5']['_planted'],
          interview['sections']['sec_10']['_6']['_planted'],
          interview['sections']['sec_10']['_7']['_planted'],
          interview['sections']['sec_10']['_8']['_planted'],
          interview['sections']['sec_10']['_9']['_planted'],
          interview['sections']['sec_10']['_10']['_planted'],
          interview['sections']['sec_10']['_11']['_planted'],
          interview['sections']['sec_10']['_12']['_planted'],
          interview['sections']['sec_10']['_13']['_planted'],
          interview['sections']['sec_10']['_14']['_planted'],
          interview['sections']['sec_10']['_15']['_planted'],
          interview['sections']['sec_10']['_16']['_planted'],
          interview['sections']['sec_10']['_17']['_planted'],
          interview['sections']['sec_10']['_18']['_planted'],
          interview['sections']['sec_10']['_19']['_planted'],
        ];
      _cropUseList = [
        data1['_use'][0]['_use'],
        data2['_use'][0]['_use'],
        data3['_use'][0]['_use'],
        interview['sections']['sec_10']['_4']['_use'][0]['_use'],
        interview['sections']['sec_10']['_5']['_use'][0]['_use'],
        interview['sections']['sec_10']['_6']['_use'][0]['_use'],
        interview['sections']['sec_10']['_7']['_use'][0]['_use'],
        interview['sections']['sec_10']['_8']['_use'][0]['_use'],
        interview['sections']['sec_10']['_9']['_use'][0]['_use'],
        interview['sections']['sec_10']['_10']['_use'][0]['_use'],
        interview['sections']['sec_10']['_11']['_use'][0]['_use'],
        interview['sections']['sec_10']['_12']['_use'][0]['_use'],
        interview['sections']['sec_10']['_13']['_use'][0]['_use'],
        interview['sections']['sec_10']['_14']['_use'][0]['_use'],
        interview['sections']['sec_10']['_15']['_use'][0]['_use'],
        interview['sections']['sec_10']['_16']['_use'][0]['_use'],
        interview['sections']['sec_10']['_17']['_use'][0]['_use'],
        interview['sections']['sec_10']['_18']['_use'][0]['_use'],
        interview['sections']['sec_10']['_19']['_use'][0]['_use'],
        ];

      _otherListShow = [
        data1['_use'][0]['_use'][3], 
        data2['_use'][0]['_use'][3],
        data3['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_4']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_5']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_6']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_7']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_8']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_9']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_10']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_11']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_12']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_13']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_14']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_15']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_16']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_17']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_18']['_use'][0]['_use'][3],
        interview['sections']['sec_10']['_19']['_use'][0]['_use'][3],
        ];
      _1APController..text = data1['area_planted'];
      _1OtherController..text = data1['_use'][1]['other'];
      _2APController..text = data2['area_planted'];
      _2OtherController..text = data2['_use'][1]['other'];
      _3APController..text = data3['area_planted'];
      _3OtherController..text = data3['_use'][1]['other'];

      _4APController..text = interview['sections']['sec_10']['_4']['area_planted'];
      _4OtherController..text = interview['sections']['sec_10']['_4']['_use'][1]['other'];

      _5APController..text = interview['sections']['sec_10']['_5']['area_planted'];
      _5OtherController..text = interview['sections']['sec_10']['_5']['_use'][1]['other'];

      _6APController..text = interview['sections']['sec_10']['_6']['area_planted'];
      _6OtherController..text = interview['sections']['sec_10']['_6']['_use'][1]['other'];

      _7APController..text = interview['sections']['sec_10']['_7']['area_planted'];
      _7OtherController..text = interview['sections']['sec_10']['_7']['_use'][1]['other'];

      _8APController..text = interview['sections']['sec_10']['_8']['area_planted'];
      _8OtherController..text = interview['sections']['sec_10']['_8']['_use'][1]['other'];

      _9APController..text = interview['sections']['sec_10']['_9']['area_planted'];
      _9OtherController..text = interview['sections']['sec_10']['_9']['_use'][1]['other'];

      _10APController..text = interview['sections']['sec_10']['_10']['area_planted'];
      _10OtherController..text = interview['sections']['sec_10']['_10']['_use'][1]['other'];

      _11APController..text = interview['sections']['sec_10']['_11']['area_planted'];
      _11OtherController..text = interview['sections']['sec_10']['_11']['_use'][1]['other'];

      _12APController..text = interview['sections']['sec_10']['_12']['area_planted'];
      _12OtherController..text = interview['sections']['sec_10']['_12']['_use'][1]['other'];

      _13APController..text = interview['sections']['sec_10']['_13']['area_planted'];
      _13OtherController..text = interview['sections']['sec_10']['_13']['_use'][1]['other'];

      _14APController..text = interview['sections']['sec_10']['_14']['area_planted'];
      _14OtherController..text = interview['sections']['sec_10']['_14']['_use'][1]['other'];

      _15APController..text = interview['sections']['sec_10']['_15']['area_planted'];
      _15OtherController..text = interview['sections']['sec_10']['_15']['_use'][1]['other'];

      _16APController..text = interview['sections']['sec_10']['_16']['area_planted'];
      _16OtherController..text = interview['sections']['sec_10']['_16']['_use'][1]['other'];

      _17APController..text = interview['sections']['sec_10']['_17']['area_planted'];
      _17OtherController..text = interview['sections']['sec_10']['_17']['_use'][1]['other'];

      _18APController..text = interview['sections']['sec_10']['_18']['area_planted'];
      _18OtherController..text = interview['sections']['sec_10']['_18']['_use'][1]['other'];

      _19APController..text = interview['sections']['sec_10']['_19']['area_planted'];
      _19OtherController..text = interview['sections']['sec_10']['_19']['_use'][1]['other'];

      //_1OtherShow = _cropUseList[6] ? true : false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[9];
    _title = questions['title'];
    //q1 = questions['_1'][0];
    questionsList = questions['_questions'];
    otherControllersList = [_1OtherController,_2OtherController,_3OtherController,_4OtherController,_5OtherController,_6OtherController,_7OtherController,
                            _8OtherController,_9OtherController,_10OtherController,_11OtherController,_12OtherController,_13OtherController,_14OtherController,
                            _15OtherController,_16OtherController,_17OtherController,_18OtherController,_19OtherController];
    apControllersList = [_1APController,_2APController,_3APController,_4APController,_5APController,_6APController,_7APController,_8APController
                        ,_9APController,_10APController,_11APController,_12APController,_13APController
                        ,_14APController,_15APController,_16APController,_17APController,_18APController,_19APController];
    //_1options = questions['_1'][2];

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
                          children:  List.generate(questionsList.length, (int index ){
                            return Column(
                              children: <Widget>[
                                SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:<Widget>[
                              Text('${questionsList[index][0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                                      Checkbox(
                                          value: _cropChckList[index],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _cropChckList[index] = value;
                                              _cropChckListShow[index] = _cropChckList[index]?true:false;
                                            });
                                          },
                                        ),
                              ]),
                              Visibility(
                                visible: _cropChckListShow[index],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                  TextFormField(
                                    controller: apControllersList[index],
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                              labelText: "Area planted(Ha)",
                                            ),
                                    validator: (value) {
                                      if (value.isEmpty){return 'Field cannot be blank';}
                                      else{ return null; }
                                      },
                                  ), ),
                                   Row(
                                        children: List<Widget>.generate(
                                            questionsList[index][2].length, (int index2) {
                                      return Row(children: <Widget>[
                                        Checkbox(
                                          value: _cropUseList[index][index2],
                                          onChanged: (bool value) {
                                            setState(() {
                                              _cropUseList[index][index2] = value;
                                              _otherListShow[index] = _cropUseList[index][3]? true: false;
                                            });
                                          },
                                        ),
                                        Text(questionsList[index][2][index2]),
                                      ]);
                                    })
                                    ),
                                     Visibility(
                                      visible: _otherListShow[index],
                                      child: TextFormField(
                                        controller: otherControllersList[index],
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
                                ]
                                ),
                                    ),
                              ]);
                          })
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
        '_1': {'_planted':_cropChckList[0], 'area_planted':_1APController.text,'_use': [{'_use':_cropUseList[0]},{'other': _1OtherController.text}]},
        '_2': {'_planted':_cropChckList[1], 'area_planted':_2APController.text,'_use': [{'_use':_cropUseList[1]},{'other': _2OtherController.text}]},
        '_3': {'_planted':_cropChckList[2], 'area_planted':_3APController.text,'_use': [{'_use':_cropUseList[2]},{'other': _3OtherController.text}]},
        '_4': {'_planted':_cropChckList[3], 'area_planted':_4APController.text,'_use': [{'_use':_cropUseList[3]},{'other': _4OtherController.text}]},
        '_5': {'_planted':_cropChckList[4], 'area_planted':_5APController.text,'_use': [{'_use':_cropUseList[4]},{'other': _5OtherController.text}]},
        '_6': {'_planted':_cropChckList[5], 'area_planted':_6APController.text,'_use': [{'_use':_cropUseList[5]},{'other': _6OtherController.text}]},
        '_7': {'_planted':_cropChckList[6], 'area_planted':_7APController.text,'_use': [{'_use':_cropUseList[6]},{'other': _7OtherController.text}]},
        '_8': {'_planted':_cropChckList[7], 'area_planted':_8APController.text,'_use': [{'_use':_cropUseList[7]},{'other': _8OtherController.text}]},
        '_9': {'_planted':_cropChckList[8], 'area_planted':_9APController.text,'_use': [{'_use':_cropUseList[8]},{'other': _9OtherController.text}]},
        '_10': {'_planted':_cropChckList[9], 'area_planted':_10APController.text,'_use': [{'_use':_cropUseList[9]},{'other': _10OtherController.text}]},
        '_11': {'_planted':_cropChckList[10], 'area_planted':_11APController.text,'_use': [{'_use':_cropUseList[10]},{'other': _11OtherController.text}]},
        '_12': {'_planted':_cropChckList[11], 'area_planted':_12APController.text,'_use': [{'_use':_cropUseList[11]},{'other': _12OtherController.text}]},
        '_13': {'_planted':_cropChckList[12], 'area_planted':_13APController.text,'_use': [{'_use':_cropUseList[12]},{'other': _13OtherController.text}]},
        '_14': {'_planted':_cropChckList[13], 'area_planted':_14APController.text,'_use': [{'_use':_cropUseList[13]},{'other': _14OtherController.text}]},
        '_15': {'_planted':_cropChckList[14], 'area_planted':_15APController.text,'_use': [{'_use':_cropUseList[14]},{'other': _15OtherController.text}]},
        '_16': {'_planted':_cropChckList[15], 'area_planted':_16APController.text,'_use': [{'_use':_cropUseList[15]},{'other': _16OtherController.text}]},
        '_17': {'_planted':_cropChckList[16], 'area_planted':_17APController.text,'_use': [{'_use':_cropUseList[16]},{'other': _17OtherController.text}]},
        '_18': {'_planted':_cropChckList[17], 'area_planted':_18APController.text,'_use': [{'_use':_cropUseList[17]},{'other': _18OtherController.text}]},
        '_19': {'_planted':_cropChckList[18], 'area_planted':_19APController.text,'_use': [{'_use':_cropUseList[18]},{'other': _19OtherController.text}]},
      };

      states['sections']['sec_10'] = data;
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
    _1OtherController.dispose();
    super.dispose();
  }
}
