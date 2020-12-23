import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


class Fifteen extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  Fifteen(this.interview_id, this.interview);

  @override
  _FifteenState createState() => _FifteenState(interview_id, interview);
}

class _FifteenState extends State<Fifteen> {
  _FifteenState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2,q3,q4,q5,q6,q7,q8;//Questions
  String q1_1,q1_2,q1_3,q1_4,q1_5,q1_6,q1_7,q1_8,q1_9;//Questions
  String q2_1,q2_2;//Questions
  String q3_1,q3_2;//Questions
  String q4_1,q4_2;//Questions
  String q5_1,q5_2;//Questions
  String q6_1;//Questions
  String q7_1,q7_2;//Questions
  String q8_1;//Questions

  List _inputOptions;
  String _input_answer;
  int _input_index = 0 ;
  final String interview_id;
  
  TextEditingController _1_1Controller = TextEditingController();
  //TextEditingController _1_2Controller = TextEditingController();
  TextEditingController _1_3Controller = TextEditingController();
  //TextEditingController _1_4Controller = TextEditingController();
  TextEditingController _1_5Controller = TextEditingController();
  TextEditingController _1_6Controller = TextEditingController();
  TextEditingController _1_7Controller = TextEditingController();
  TextEditingController _1_8Controller = TextEditingController();
  TextEditingController _1_9Controller = TextEditingController();

  TextEditingController _2_1OtherController = TextEditingController();
  TextEditingController _2_2OtherController = TextEditingController();
  TextEditingController _2_1AmountOtherController = TextEditingController();
  TextEditingController _2_2AmountOtherController = TextEditingController();

  TextEditingController _3_1Controller = TextEditingController();
  TextEditingController _3_2Controller = TextEditingController();

  TextEditingController _4_1Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();

  TextEditingController _5_1Controller = TextEditingController();
  TextEditingController _5_2Controller = TextEditingController();

  TextEditingController _6_1Controller = TextEditingController();

  TextEditingController _7_1Controller = TextEditingController();
  //TextEditingController _7_2Controller = TextEditingController();
  TextEditingController _7_3Controller = TextEditingController();

  TextEditingController _8_otherController = TextEditingController();
  TextEditingController _8_1Controller = TextEditingController();
  TextEditingController _8_2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values
  double  _1_total, _2_total,_3_total,_4_total,_5_total,_6_total,_7_total,_8_total,_total;
  String _stringTotal;

  @override
  void initState() {
    _8_otherController..text = '0';
    _8_2Controller..text = '0';
    questions = questionaire.getSections()[14];
    _input_answer = questions['_input'][2][0];
    _title = questions['title'];
    _inputOptions = questions['_input'][2];

    _2_2AmountOtherController..text = '0.0';
    _2_1AmountOtherController..text = '0.0';
    _8_2Controller..text = '0.0';
    _total = 0.0;
    _stringTotal = '0.0';
    _1_total = 0.0; _2_total = 0.0;_3_total = 0.0;_4_total = 0.0;_5_total = 0.0;_6_total = 0.0;_7_total = 0.0;_8_total = 0.0;

    if(interview.sections['sec_15'] != null ){
      
      dataExist = true;
        _input_answer = interview.sections['sec_15']['_input'][0];
        _input_index = interview.sections['sec_15']['_input'][1];
        
        _1_1Controller..text = interview.sections['sec_15']['_1']['_1'];
        //_1_2Controller..text = interview.sections['sec_15']['_1']['_2'];
        _1_3Controller..text = interview.sections['sec_15']['_1']['_3'];
        //_1_4Controller..text = interview.sections['sec_15']['_1']['_4'];
        _1_5Controller..text = interview.sections['sec_15']['_1']['_5'];
        _1_6Controller..text = interview.sections['sec_15']['_1']['_6'];
        _1_7Controller..text = interview.sections['sec_15']['_1']['_7'];
        _1_8Controller..text = interview.sections['sec_15']['_1']['_8'];
        _1_9Controller..text = interview.sections['sec_15']['_1']['_9'];

        _2_1OtherController..text = interview.sections['sec_15']['_2']['_1'][0];
        _2_2OtherController..text = interview.sections['sec_15']['_2']['_2'][0];
        _2_1AmountOtherController..text = interview.sections['sec_15']['_2']['_1'][1];
        _2_2AmountOtherController..text = interview.sections['sec_15']['_2']['_2'][1];

        _3_1Controller..text = interview.sections['sec_15']['_3']['_1'];
        _3_2Controller..text = interview.sections['sec_15']['_3']['_2'];

        _4_1Controller..text = interview.sections['sec_15']['_4']['_1'];
        _4_2Controller..text = interview.sections['sec_15']['_4']['_2'];

        _5_1Controller..text = interview.sections['sec_15']['_5']['_1'];
        _5_2Controller..text = interview.sections['sec_15']['_5']['_2'];

        _6_1Controller..text = interview.sections['sec_15']['_6']['_1'];

        _7_1Controller..text = interview.sections['sec_15']['_7']['_1'];
        //_7_2Controller..text = interview.sections['sec_15']['_7']['_2'];
        //_7_3Controller..text = interview.sections['sec_15']['_7']['_3'];

        _8_otherController..text = interview.sections['sec_15']['_8']['_2'][0];
        _8_1Controller..text = interview.sections['sec_15']['_8']['_1'];
        _8_2Controller..text = interview.sections['sec_15']['_8']['_2'][1];
        
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    q1 = questions['_1'][0]['_1'];
    q2 = questions['_2'][0]['_2'];
    q3 = questions['_3'][0]['_3'];
    q4 = questions['_4'][0]['_4'];
    q5 = questions['_5'][0]['_5'];
    q6 = questions['_6'][0]['_6'];
    q7 = questions['_7'][0]['_7'];
    q8 = questions['_8'][0]['_8'];

    q1_1 = questions['_1'][0]['_1options'][0];
    //q1_2 = questions['_1'][0]['_1options'][1];
    q1_3 = questions['_1'][0]['_1options'][2];
    //q1_4 = questions['_1'][0]['_1options'][3];
    q1_5 = questions['_1'][0]['_1options'][4];
    q1_6 = questions['_1'][0]['_1options'][5];
    q1_7 = questions['_1'][0]['_1options'][6];
    q1_8 = questions['_1'][0]['_1options'][7];
    q1_9 = questions['_1'][0]['_1options'][8];

    q3_1 = questions['_3'][0]['_3options'][0];
    q3_2 = questions['_3'][0]['_3options'][1];

    q4_1 = questions['_4'][0]['_4options'][0];
    q4_2 = questions['_4'][0]['_4options'][1];

    q5_1 = questions['_5'][0]['_5options'][0];
    q5_2 = questions['_5'][0]['_5options'][1];

    q6_1 = questions['_6'][0]['_6options'][0];

    q7_1 = questions['_7'][0]['_7options'][0];
    //q7_2 = questions['_7'][0]['_7options'][1];

    q8_1 = questions['_8'][0]['_8options'][0];

    submitBtnTxt = dataExist?'Edit':'Submit';
   
      return Stack(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
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
                              Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  _inputOptions.length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(_inputOptions[index]),
                                      selected: _input_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _input_answer = _inputOptions[index];
                                          _input_index = selected ? index : null;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),  
                              SizedBox(height: 12),
                              Text('${q1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q1_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                   /* Text('${q1_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12), */
                                     Text('${q1_3}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_3Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    /*
                                     Text('${q1_4}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_4Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    */
                                     Text('${q1_5}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_5Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                     Text('${q1_6}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_6Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                     Text('${q1_7}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_7Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                     Text('${q1_8}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_8Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                     Text('${q1_9}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),    
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _1_9Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                ]),
                              ),
                              SizedBox(height: 12),
                              Text('${q2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    TextFormField(
                                        controller: _2_1OtherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: 'Other',
                                                ),
                                      ),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _2_1AmountOtherController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                      ), ),
                                    SizedBox(height: 12),
                                    TextFormField(
                                        controller: _2_2OtherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: 'Other',
                                                ),
                                      ),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _2_2AmountOtherController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                      ), ),
                                    SizedBox(height: 12)
                                    ])
                              ),
                               SizedBox(height: 12),
                              Text('${q3}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q3_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _3_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    Text('${q3_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _3_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    ]
                                    )
                                    ),
                                     SizedBox(height: 12),
                              Text('${q4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q4_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _4_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    Text('${q4_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _4_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    ]
                                    )
                                    ),
                                     SizedBox(height: 12),
                              Text('${q5}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q5_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _5_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    Text('${q5_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _5_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    ]
                                    )
                                    ),
                                     SizedBox(height: 12),
                              Text('${q6}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q6_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _6_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                   
                                    SizedBox(height: 12),
                                    ]
                                    )
                                    ),
                                     SizedBox(height: 12),
                              Text('${q7}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q7_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _7_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    /*
                                    Text('${q7_2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _7_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12), */
                                    ]
                                    )
                                    ),
                                     SizedBox(height: 12),
                              Text('${q8}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${q8_1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _8_1Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    TextFormField(
                                        controller: _8_otherController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                                  labelText: 'Other',
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ),
                                    SizedBox(height: 6),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                                      TextFormField(
                                        controller: _8_2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: _input_answer,
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ), ),
                                    SizedBox(height: 12),
                                    ]
                                    )
                                    ),
                                    Divider(color: Colors.grey.shade700),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q1} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_1_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q2} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_2_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q3} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_3_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q4} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_4_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q5} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_5_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q6} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_6_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q7} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_7_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                        Divider(color: Colors.grey.shade400),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('${q8} : ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_8_total.toStringAsFixed(2)} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                      Divider(color: Colors.grey.shade400),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.6, 
                                              child: Text('Total / ${_input_answer}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            .copyWith()),
                                              ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.2, 
                                              child: Text('${_stringTotal} ',
                                                          style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith()),
                                              ),  
                                        ]),
                                          
                                          RaisedButton(

                                              child: Text('Total',style: TextStyle(color: Colors.white)),
                                              onPressed: () => _totalInput(),
                                            ),        
                                            ],
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

  _totalInput() {
    if (_formKey.currentState.validate()) {
      _1_total  = double.parse(_1_1Controller.text) + double.parse(_1_3Controller.text)+double.parse(_1_5Controller.text) + double.parse(_1_6Controller.text)+
          double.parse(_1_7Controller.text) + double.parse(_1_8Controller.text)+double.parse(_1_9Controller.text);
      _2_total  = double.parse(_2_2AmountOtherController.text) + double.parse(_2_1AmountOtherController.text);  
      _3_total  = double.parse(_3_1Controller.text) + double.parse(_3_2Controller.text); 
      _4_total  = double.parse(_4_1Controller.text) + double.parse(_4_2Controller.text); 
      _5_total  = double.parse(_5_1Controller.text) + double.parse(_5_2Controller.text);
      _6_total  = double.parse(_6_1Controller.text);
      _7_total  = double.parse(_7_1Controller.text);

      _8_total  = double.parse(_8_1Controller.text) + double.parse(_8_2Controller.text);  

          setState(() {
            _total = (_1_total +_2_total+_3_total+_4_total+_5_total+_6_total+_7_total+_8_total);
            _stringTotal = _total.toStringAsFixed(2);
          }); 
    }else{
      Fluttertoast.showToast(
        msg: "Some inputs are blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
    }
  }

  void _submitForm(Interview states) async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
     
      Map data = {
        '_input': [_input_answer, _input_index],
        '_1': {
          '_1':_1_1Controller.text,
          //'_2':_1_2Controller.text,
          '_3':_1_3Controller.text,
          //'_4':_1_4Controller.text,
          '_5':_1_5Controller.text,
          '_6':_1_6Controller.text,
          '_7':_1_7Controller.text,
          '_8':_1_8Controller.text,
          '_9':_1_9Controller.text,
          },
        '_2': {
            '_1':[_2_1OtherController.text,_2_1AmountOtherController.text],
            '_2':[_2_2OtherController.text,_2_2AmountOtherController.text],
          },  
          '_3': {
            '_1': _3_1Controller.text,
            '_2': _3_2Controller.text,
          }, 
          '_4': {
            '_1': _4_1Controller.text,
            '_2': _4_2Controller.text,
          },
          '_5': {
            '_1': _5_1Controller.text,
            '_2': _5_2Controller.text,
          },
          '_6': {
            '_1': _6_1Controller.text,
          },
          '_7': {
            '_1': _7_1Controller.text,
            //'_2': _7_2Controller.text,
            //'_3': _7_3Controller.text,
          },
          '_8': {
            '_1': _8_1Controller.text,
            '_2':[_8_otherController.text,_8_2Controller.text],
          },
      
      };

      states.sections['sec_15'] = data;
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
    _1_1Controller.dispose();
    //_1_2Controller.dispose();
    _1_5Controller.dispose();
    super.dispose();
  }
}
