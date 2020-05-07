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
  final String interview_id;
  
  TextEditingController _1APController = TextEditingController();
  TextEditingController _1OtherController = TextEditingController();
  TextEditingController _2APController = TextEditingController();
  TextEditingController _2OtherController = TextEditingController();
  TextEditingController _3APController = TextEditingController();
  TextEditingController _3OtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
   
    _cropUseList = [list1,list2,list3];
    _cropChckList = [false, false,false];
    _cropChckListShow = [false, false,false];
    _otherListShow = [false, false, false, false, false, false, false];
    if (interview['sections']['sec_10'] != null) {
      dataExist = true;
      Map data1 = interview['sections']['sec_10']['_1'];
      Map data2 = interview['sections']['sec_10']['_2'];
      Map data3 = interview['sections']['sec_10']['_3'];
      _cropChckList = [
          data1['_planted'],
          data2['_planted'],
          data3['_planted'],
          ];
      _cropChckListShow = [
        data1['_planted'],
        data2['_planted'],
        data3['_planted'],
        ];
      _cropUseList = [
        data1['_use'][0]['_use'],
        data2['_use'][0]['_use'],
        data3['_use'][0]['_use'],
        ];

      _otherListShow = [
        data1['_use'][0]['_use'][3], 
        data2['_use'][0]['_use'][3],
        data3['_use'][0]['_use'][3],
        ];
      _1APController..text = data1['area_planted'];
      _1OtherController..text = data1['_use'][1]['other'];
      _2APController..text = data2['area_planted'];
      _2OtherController..text = data2['_use'][1]['other'];
      _3APController..text = data3['area_planted'];
      _3OtherController..text = data3['_use'][1]['other'];
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
    otherControllersList = [_1OtherController,_2OtherController,_3OtherController];
    apControllersList = [_1APController,_2APController,_3APController];
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
    _1OtherController.dispose();
    super.dispose();
  }
}
