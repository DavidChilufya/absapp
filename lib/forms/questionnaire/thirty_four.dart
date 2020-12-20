import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThirtyFour extends StatefulWidget {
  final String interview_id;
  final Map interview;

  ThirtyFour(this.interview_id, this.interview);

  @override
  _ThirtyFourState createState() => _ThirtyFourState(interview_id, interview);
}

class _ThirtyFourState extends State<ThirtyFour> {
  _ThirtyFourState(this.interview_id, this.interview);
  Map interview;
  InterviewDao _interviewDao = InterviewDao();

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1;//Questions
  List q2,q3,q3b,q4,q5;
  List _1options;
  int _1_index ,_3_index;
  String _1answer,_3answer;
  String _2_1advice_answer,_2_2advice_answer,_2_3advice_answer,_2_4advice_answer,
        _2_5advice_answer,_2_6advice_answer,_2_7advice_answer,_2_8advice_answer;
  String _3b_1delivered_answer,_3b_2delivered_answer,_3b_3delivered_answer,_3b_4delivered_answer,
        _3b_5delivered_answer,_3b_6delivered_answer,_3b_7delivered_answer,_3b_8delivered_answer;      
  bool _2show = false;
  bool _3bshow = false;

  List<bool> _5isChckList;

  bool _2_1otherOgranisationShow = false;
  bool _2_2otherOgranisationShow = false;
  bool _2_3otherOgranisationShow = false;
  bool _2_4otherOgranisationShow = false;
  bool _2_5otherOgranisationShow = false;
  bool _2_6otherOgranisationShow = false;
  bool _2_7otherOgranisationShow = false;
  bool _2_8otherOgranisationShow = false;

  bool _3b_1otherOgranisationShow = false;
  bool _3b_2otherOgranisationShow = false;
  bool _3b_3otherOgranisationShow = false;
  bool _3b_4otherOgranisationShow = false;
  bool _3b_5otherOgranisationShow = false;
  bool _3b_6otherOgranisationShow = false;
  bool _3b_7otherOgranisationShow = false;
  bool _3b_8otherOgranisationShow = false;

  final String interview_id;
  
  TextEditingController _2_1Controller = TextEditingController();
  TextEditingController _2_2Controller = TextEditingController();
  TextEditingController _2_3Controller = TextEditingController();
  TextEditingController _2_4Controller = TextEditingController();
  TextEditingController _2_5Controller = TextEditingController();
  TextEditingController _2_6Controller = TextEditingController();
  TextEditingController _2_7Controller = TextEditingController();
  TextEditingController _2_8Controller = TextEditingController();
  TextEditingController _2_1otherController = TextEditingController();
  TextEditingController _2_2otherController = TextEditingController();
  TextEditingController _2_3otherController = TextEditingController();
  TextEditingController _2_4otherController = TextEditingController();
  TextEditingController _2_5otherController = TextEditingController();
  TextEditingController _2_6otherController = TextEditingController();
  TextEditingController _2_7otherController = TextEditingController();
  TextEditingController _2_8otherController = TextEditingController();

  TextEditingController _3b_1Controller = TextEditingController();
  TextEditingController _3b_2Controller = TextEditingController();
  TextEditingController _3b_3Controller = TextEditingController();
  TextEditingController _3b_4Controller = TextEditingController();
  TextEditingController _3b_5Controller = TextEditingController();
  TextEditingController _3b_6Controller = TextEditingController();
  TextEditingController _3b_7Controller = TextEditingController();
  TextEditingController _3b_8Controller = TextEditingController();
  TextEditingController _3bComment_1Controller = TextEditingController();
  TextEditingController _3bComment_2Controller = TextEditingController();
  TextEditingController _3bComment_3Controller = TextEditingController();
  TextEditingController _3bComment_4Controller = TextEditingController();
  TextEditingController _3bComment_5Controller = TextEditingController();
  TextEditingController _3bComment_6Controller = TextEditingController();
  TextEditingController _3bComment_7Controller = TextEditingController();
  TextEditingController _3bComment_8Controller = TextEditingController();
  TextEditingController _3b_1otherController = TextEditingController();
  TextEditingController _3b_2otherController = TextEditingController();
  TextEditingController _3b_3otherController = TextEditingController();
  TextEditingController _3b_4otherController = TextEditingController();
  TextEditingController _3b_5otherController = TextEditingController();
  TextEditingController _3b_6otherController = TextEditingController();
  TextEditingController _3b_7otherController = TextEditingController();
  TextEditingController _3b_8otherController = TextEditingController();

  TextEditingController _4_1Controller = TextEditingController();
  TextEditingController _4_2Controller = TextEditingController();
  TextEditingController _4_3Controller = TextEditingController();
  TextEditingController _4_4Controller = TextEditingController();
  TextEditingController _4_5Controller = TextEditingController();
  TextEditingController _4_6Controller = TextEditingController();
  TextEditingController _4_7Controller = TextEditingController();
  TextEditingController _4_8Controller = TextEditingController();
  TextEditingController _4_1benefitsController = TextEditingController();
  TextEditingController _4_2benefitsController = TextEditingController();
  TextEditingController _4_3benefitsController = TextEditingController();
  TextEditingController _4_4benefitsController = TextEditingController();
  TextEditingController _4_5benefitsController = TextEditingController();
  TextEditingController _4_6benefitsController = TextEditingController();
  TextEditingController _4_7benefitsController = TextEditingController();
  TextEditingController _4_8benefitsController = TextEditingController();

  TextEditingController _commenOsuggestionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {

    _5isChckList = [false, false, false, false, false, false, false, false, false];
    _2_1advice_answer = 'Select Organisation';_2_2advice_answer = 'Select Organisation';_2_3advice_answer = 'Select Organisation';_2_4advice_answer = 'Select Organisation';
        _2_5advice_answer = 'Select Organisation';_2_6advice_answer = 'Select Organisation';_2_7advice_answer = 'Select Organisation';_2_8advice_answer = 'Select Organisation';
    
    _3b_1delivered_answer = 'Who delivered';_3b_2delivered_answer = 'Who delivered';_3b_3delivered_answer = 'Who delivered';_3b_4delivered_answer = 'Who delivered';
        _3b_5delivered_answer = 'Who delivered';_3b_6delivered_answer = 'Who delivered';_3b_7delivered_answer = 'Who delivered';_3b_8delivered_answer= 'Who delivered'; 

    if(interview['sections']['sec_34'] != null ){
      
      dataExist = true;
        _1answer = interview['sections']['sec_34']['_1'][0];
        _1_index = interview['sections']['sec_34']['_1'][1];
        _2show = (interview['sections']['sec_34']['_1'][0]) == 'Yes'? true:false;

        _2_1Controller..text = interview['sections']['sec_34']['_2'][0][0]['advice'];
        _2_1advice_answer =  interview['sections']['sec_34']['_2'][0][1][0]['organisation'];
        _2_1otherController..text = interview['sections']['sec_34']['_2'][0][1][1]['organisation_other'];
        _2_1otherOgranisationShow = interview['sections']['sec_34']['_2'][0][1][0]['organisation'] == 'Other'?true:false;

        _2_2Controller..text = interview['sections']['sec_34']['_2'][1][0]['advice'];
        _2_2advice_answer =  interview['sections']['sec_34']['_2'][1][1][0]['organisation'];
        _2_2otherController..text = interview['sections']['sec_34']['_2'][1][1][1]['organisation_other'];
        _2_2otherOgranisationShow = interview['sections']['sec_34']['_2'][1][1][0]['organisation'] == 'Other'?true:false;

        _2_3Controller..text = interview['sections']['sec_34']['_2'][2][0]['advice'];
        _2_3advice_answer =  interview['sections']['sec_34']['_2'][2][1][0]['organisation'];
        _2_3otherController..text = interview['sections']['sec_34']['_2'][2][1][1]['organisation_other'];
        _2_3otherOgranisationShow = interview['sections']['sec_34']['_2'][2][1][0]['organisation'] == 'Other'?true:false;

        _2_4Controller..text = interview['sections']['sec_34']['_2'][3][0]['advice'];
        _2_4advice_answer =  interview['sections']['sec_34']['_2'][3][1][0]['organisation'];
        _2_4otherController..text = interview['sections']['sec_34']['_2'][3][1][1]['organisation_other'];
        _2_4otherOgranisationShow = interview['sections']['sec_34']['_2'][3][1][0]['organisation'] == 'Other'?true:false;

        _2_5Controller..text = interview['sections']['sec_34']['_2'][4][0]['advice'];
        _2_5advice_answer =  interview['sections']['sec_34']['_2'][4][1][0]['organisation'];
        _2_5otherController..text = interview['sections']['sec_34']['_2'][4][1][1]['organisation_other'];
        _2_5otherOgranisationShow = interview['sections']['sec_34']['_2'][4][1][0]['organisation'] == 'Other'?true:false;

        _2_6Controller..text = interview['sections']['sec_34']['_2'][5][0]['advice'];
        _2_6advice_answer =  interview['sections']['sec_34']['_2'][5][1][0]['organisation'];
        _2_6otherController..text = interview['sections']['sec_34']['_2'][5][1][1]['organisation_other'];
        _2_6otherOgranisationShow = interview['sections']['sec_34']['_2'][5][1][0]['organisation'] == 'Other'?true:false;

        _2_7Controller..text = interview['sections']['sec_34']['_2'][6][0]['advice'];
        _2_7advice_answer =  interview['sections']['sec_34']['_2'][6][1][0]['organisation'];
        _2_7otherController..text = interview['sections']['sec_34']['_2'][6][1][1]['organisation_other'];
        _2_7otherOgranisationShow = interview['sections']['sec_34']['_2'][6][1][0]['organisation'] == 'Other'?true:false;

        _2_8Controller..text = interview['sections']['sec_34']['_2'][7][0]['advice'];
        _2_8advice_answer =  interview['sections']['sec_34']['_2'][7][1][0]['organisation'];
        _2_8otherController..text = interview['sections']['sec_34']['_2'][7][1][1]['organisation_other'];
        _2_8otherOgranisationShow = interview['sections']['sec_34']['_2'][7][1][0]['organisation'] == 'Other'?true:false;


        _3answer = interview['sections']['sec_34']['_3'][0];
        _3_index = interview['sections']['sec_34']['_3'][1];
        _3bshow = (interview['sections']['sec_34']['_3'][0]) == 'Yes'? true:false;

        _3b_1Controller..text = interview['sections']['sec_34']['_3_1'][0][0]['when'];
        _3b_1delivered_answer = interview['sections']['sec_34']['_3_1'][0][1][0]['organisation'];
        _3b_1otherController..text = interview['sections']['sec_34']['_3_1'][0][1][1]['organisation_other'];
        _3bComment_1Controller..text = interview['sections']['sec_34']['_3_1'][0][2]['comment'];
       _3b_1otherOgranisationShow = _3b_1delivered_answer == 'Other'?true:false;

       _3b_2Controller..text = interview['sections']['sec_34']['_3_1'][1][0]['when'];
        _3b_2delivered_answer = interview['sections']['sec_34']['_3_1'][1][1][0]['organisation'];
        _3b_2otherController..text = interview['sections']['sec_34']['_3_1'][1][1][1]['organisation_other'];
        _3bComment_2Controller..text = interview['sections']['sec_34']['_3_1'][1][2]['comment'];
       _3b_2otherOgranisationShow = _3b_2delivered_answer == 'Other'?true:false;

        _3b_3Controller..text = interview['sections']['sec_34']['_3_1'][2][0]['when'];
        _3b_3delivered_answer = interview['sections']['sec_34']['_3_1'][2][1][0]['organisation'];
        _3b_3otherController..text = interview['sections']['sec_34']['_3_1'][2][1][1]['organisation_other'];
        _3bComment_3Controller..text = interview['sections']['sec_34']['_3_1'][2][2]['comment'];
        _3b_3otherOgranisationShow = _3b_3delivered_answer == 'Other'?true:false;

        _3b_4Controller..text = interview['sections']['sec_34']['_3_1'][3][0]['when'];
        _3b_4delivered_answer = interview['sections']['sec_34']['_3_1'][3][1][0]['organisation'];
        _3b_4otherController..text = interview['sections']['sec_34']['_3_1'][3][1][1]['organisation_other'];
        _3bComment_4Controller..text = interview['sections']['sec_34']['_3_1'][3][2]['comment'];
        _3b_4otherOgranisationShow = _3b_4delivered_answer == 'Other'?true:false;

        _3b_5Controller..text = interview['sections']['sec_34']['_3_1'][4][0]['when'];
        _3b_5delivered_answer = interview['sections']['sec_34']['_3_1'][4][1][0]['organisation'];
        _3b_5otherController..text = interview['sections']['sec_34']['_3_1'][4][1][1]['organisation_other'];
        _3bComment_5Controller..text = interview['sections']['sec_34']['_3_1'][4][2]['comment'];
        _3b_5otherOgranisationShow = _3b_5delivered_answer == 'Other'?true:false;

        _3b_6Controller..text = interview['sections']['sec_34']['_3_1'][5][0]['when'];
        _3b_6delivered_answer = interview['sections']['sec_34']['_3_1'][5][1][0]['organisation'];
        _3b_6otherController..text = interview['sections']['sec_34']['_3_1'][5][1][1]['organisation_other'];
        _3bComment_6Controller..text = interview['sections']['sec_34']['_3_1'][5][2]['comment'];
        _3b_6otherOgranisationShow = _3b_6delivered_answer == 'Other'?true:false;

        _3b_7Controller..text = interview['sections']['sec_34']['_3_1'][6][0]['when'];
        _3b_7delivered_answer = interview['sections']['sec_34']['_3_1'][6][1][0]['organisation'];
        _3b_7otherController..text = interview['sections']['sec_34']['_3_1'][6][1][1]['organisation_other'];
        _3bComment_7Controller..text = interview['sections']['sec_34']['_3_1'][6][2]['comment'];
        _3b_7otherOgranisationShow = _3b_7delivered_answer == 'Other'?true:false;

        _3b_8Controller..text = interview['sections']['sec_34']['_3_1'][7][0]['when'];
        _3b_8delivered_answer = interview['sections']['sec_34']['_3_1'][7][1][0]['organisation'];
        _3b_8otherController..text = interview['sections']['sec_34']['_3_1'][7][1][1]['organisation_other'];
        _3bComment_8Controller..text = interview['sections']['sec_34']['_3_1'][7][2]['comment'];
        _3b_8otherOgranisationShow = _3b_8delivered_answer == 'Other'?true:false;

        _4_1Controller..text = interview['sections']['sec_34']['_4'][0][0]['applying'];
        _4_1benefitsController..text = interview['sections']['sec_34']['_4'][0][1]['benefits'];

        _4_2Controller..text = interview['sections']['sec_34']['_4'][1][0]['applying'];
        _4_2benefitsController..text = interview['sections']['sec_34']['_4'][1][1]['benefits'];

        _4_3Controller..text = interview['sections']['sec_34']['_4'][2][0]['applying'];
        _4_3benefitsController..text = interview['sections']['sec_34']['_4'][2][1]['benefits'];

        _4_4Controller..text = interview['sections']['sec_34']['_4'][3][0]['applying'];
        _4_4benefitsController..text = interview['sections']['sec_34']['_4'][3][1]['benefits'];

        _4_5Controller..text = interview['sections']['sec_34']['_4'][4][0]['applying'];
        _4_5benefitsController..text = interview['sections']['sec_34']['_4'][4][1]['benefits'];

        _4_6Controller..text = interview['sections']['sec_34']['_4'][5][0]['applying'];
        _4_6benefitsController..text = interview['sections']['sec_34']['_4'][5][1]['benefits'];

        _4_7Controller..text = interview['sections']['sec_34']['_4'][6][0]['applying'];
        _4_7benefitsController..text = interview['sections']['sec_34']['_4'][6][1]['benefits'];

        _4_8Controller..text = interview['sections']['sec_34']['_4'][6][0]['applying'];
        _4_8benefitsController..text = interview['sections']['sec_34']['_4'][6][1]['benefits'];

        _5isChckList = interview['sections']['sec_34']['_5'];

        _commenOsuggestionController..text = interview['sections']['sec_34']['comment'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[33];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'];
    q3 = questions['_3'];
    q3b = questions['_3_1'];
    q4 = questions['_4'];
    q5 = questions['_5'];

    _1options = questions['_1'][2];
    
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
                              Text('${q1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                               Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  _1options.length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(_1options[index]),
                                      selected: _1_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _1answer = _1options[index];
                                          _1_index = selected?index : null;
                                          _2show = _1answer=='Yes'?true:false;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),  
                              
                              SizedBox(height: 10),
                               Visibility(
                                visible:_2show,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q2[0]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][0]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_1Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_1advice_answer,
                                          items: q2[2][0]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_1advice_answer = newValue;
                                              _2_1otherOgranisationShow = _2_1advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_1otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_1otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),


                                    
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][1]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_2Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_2advice_answer,
                                          items: q2[2][1]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_2advice_answer = newValue;
                                              _2_2otherOgranisationShow = _2_2advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_2otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_2otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),


                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][2]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_3Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_3advice_answer,
                                          items: q2[2][2]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_3advice_answer = newValue;
                                              _2_3otherOgranisationShow = _2_3advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_3otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_3otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),


                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][3]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_4Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_4advice_answer,
                                          items: q2[2][3]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_4advice_answer = newValue;
                                              _2_4otherOgranisationShow = _2_4advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_4otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_4otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),


                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][4]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_5Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_5advice_answer,
                                          items: q2[2][4]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_5advice_answer = newValue;
                                              _2_5otherOgranisationShow = _2_5advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_5otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_5otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),



                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][5]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_6Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_6advice_answer,
                                          items: q2[2][5]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_6advice_answer = newValue;
                                              _2_6otherOgranisationShow = _2_6advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_6otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_6otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),



                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][6]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_7Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_7advice_answer,
                                          items: q2[2][6]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_7advice_answer = newValue;
                                              _2_7otherOgranisationShow = _2_7advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_7otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_7otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),



                                      Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q2[2][7]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _2_8Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                                    labelText: "Advice",
                                                  ),
                                         
                                        ),
                                        DropdownButton(
                                          value: _2_8advice_answer,
                                          items: q2[2][7]['organisation']
                                              .map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _2_8advice_answer = newValue;
                                              _2_8otherOgranisationShow = _2_8advice_answer=='Other'?true:false;
                                            });
                                          },
                                          underline: SizedBox(),
                                        //isExpanded: true,
                                        ),
                                        Visibility(
                                          visible: _2_8otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _2_8otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                           
                                          ),
                                        
                                        ),

                                        ]
                                      ),),
                                      SizedBox(height: 6),
                                   
                                ]) ,), 

                              SizedBox(height: 12),
                              Text('${q3[0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith()),
                              SizedBox(height: 6),
                               Wrap(
                                spacing: 8,
                                children: List<Widget>.generate(
                                  q3[2].length,
                                  (int index) {
                                    return ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      label: Text(q3[2][index]),
                                      selected: _3_index == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _3answer = q3[2][index];
                                          _3_index = selected?index : null;
                                          _3bshow = _3answer=='Yes'?true:false;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ), 


                               SizedBox(height: 6),
                               Visibility(
                                visible:_3bshow,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][0]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_1Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_1delivered_answer,
                                                  items: q3b[2][0]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_1delivered_answer = newValue;
                                                      _3b_1otherOgranisationShow = _3b_1delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_1otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_1otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_1Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),



                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][1]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_2Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_2delivered_answer,
                                                  items: q3b[2][1]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_2delivered_answer = newValue;
                                                      _3b_2otherOgranisationShow = _3b_2delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_2otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_2otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_2Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),


                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][2]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_3Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_3delivered_answer,
                                                  items: q3b[2][2]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_3delivered_answer = newValue;
                                                      _3b_3otherOgranisationShow = _3b_3delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_3otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_3otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_3Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),


                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][3]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_4Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_4delivered_answer,
                                                  items: q3b[2][3]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_4delivered_answer = newValue;
                                                      _3b_4otherOgranisationShow = _3b_4delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_4otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_4otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_4Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),


                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][4]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_5Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_5delivered_answer,
                                                  items: q3b[2][4]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_5delivered_answer = newValue;
                                                      _3b_5otherOgranisationShow = _3b_5delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_5otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_5otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_5Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),



                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][5]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_6Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_6delivered_answer,
                                                  items: q3b[2][5]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_6delivered_answer = newValue;
                                                      _3b_6otherOgranisationShow = _3b_6delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_6otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_6otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_6Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),


                                     
                                     
                                     SizedBox(height: 6),
                                     Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][6]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_7Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_7delivered_answer,
                                                  items: q3b[2][6]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_7delivered_answer = newValue;
                                                      _3b_7otherOgranisationShow = _3b_7delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_7otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_7otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_7Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),



                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                        Text('${q3b[2][7]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                               SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                                  TextFormField(
                                                  controller: _3b_8Controller,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                            labelText: "When received",
                                                          ),
                                                  
                                                ),
                                               ),
                                                DropdownButton(
                                                  value: _3b_8delivered_answer,
                                                  items: q3b[2][7]['organisation']
                                                      .map<DropdownMenuItem<String>>((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _3b_8delivered_answer = newValue;
                                                      _3b_8otherOgranisationShow = _3b_8delivered_answer=='Other'?true:false;
                                                    });
                                                  },
                                                  underline: SizedBox(),
                                                //isExpanded: true,
                                                ),
                                            ],
                                          ),
                                        SizedBox(height:6.0),
                                        Visibility(
                                          visible: _3b_8otherOgranisationShow,
                                          child: TextFormField(
                                            controller: _3b_8otherController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                      labelText: "Other",
                                                    ),
                                            
                                          ),
                                        
                                        ),
                                        SizedBox(height:6.0),
                                        TextFormField(
                                                  controller: _3bComment_8Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Comment",
                                                          ),
                                                  
                                                ),

                                        ]
                                      ),),
                                    SizedBox(height: 6),

                                    ]) ,
                              
                                    ),

                                Visibility(
                                visible:_3bshow,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q4[0]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    Padding(
                                      padding: const EdgeInsets.only(left:32.0),
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:<Widget>[
                                          Text('${q4[2][0]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_1Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                                 SizedBox(height: 6), 
                                          TextFormField(
                                                  controller: _4_1benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10), 

                                          Text('${q4[2][1]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_2Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_2benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),  


                                          Text('${q4[2][2]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_3Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_3benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),  


                                          Text('${q4[2][3]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_4Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_4benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),  


                                          Text('${q4[2][4]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_5Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_5benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),



                                          Text('${q4[2][5]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_6Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_6benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),



                                          Text('${q4[2][6]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_7Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_7benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),



                                          Text('${q4[2][7]['topic']}',style: Theme.of(context).textTheme.headline6
                                          .copyWith(fontWeight: FontWeight.bold)),

                                          TextFormField(
                                                  controller: _4_8Controller,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "How Applying",
                                                          ),
                                                ),
                                           SizedBox(height: 6),       
                                          TextFormField(
                                                  controller: _4_8benefitsController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "Benefits Seen",
                                                          ),
                                                ),  
                                          SizedBox(height: 10),


                                      ])) 
                                      ]) 
                                ),

                                Text('${q5[0]}',style: Theme.of(context).textTheme.headline5
                                          .copyWith()),      


                                SizedBox(height: 6),
                                Wrap(
                                            children: List<Widget>.generate(
                                                q5[2].length, (int index) {
                                          return Row(children: <Widget>[
                                            Checkbox(
                                              value: _5isChckList[index],
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _5isChckList[index] = value;
                                                  
                                                });
                                              },
                                            ),
                                            Text(q5[2][index]),
                                          ]);
                                        })),
                                Text('Any other comment or suggestion',style: Theme.of(context).textTheme.headline5
                                          .copyWith()),
                                TextFormField(
                                                  controller: _commenOsuggestionController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                            labelText: "",
                                                          ),
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
        '_1': [_1answer, _1_index],
        '_2': [
          [{'advice':_2_1Controller.text},[{'organisation':_2_1advice_answer},{'organisation_other':_2_1otherController.text}]],
          [{'advice':_2_2Controller.text},[{'organisation':_2_2advice_answer},{'organisation_other':_2_2otherController.text}]],
          [{'advice':_2_3Controller.text},[{'organisation':_2_3advice_answer},{'organisation_other':_2_3otherController.text}]],
          [{'advice':_2_4Controller.text},[{'organisation':_2_4advice_answer},{'organisation_other':_2_4otherController.text}]],
          [{'advice':_2_5Controller.text},[{'organisation':_2_5advice_answer},{'organisation_other':_2_5otherController.text}]],
          [{'advice':_2_6Controller.text},[{'organisation':_2_6advice_answer},{'organisation_other':_2_6otherController.text}]],
          [{'advice':_2_7Controller.text},[{'organisation':_2_7advice_answer},{'organisation_other':_2_7otherController.text}]],
          [{'advice':_2_8Controller.text},[{'organisation':_2_8advice_answer},{'organisation_other':_2_8otherController.text}]],
          ],
        '_3':[_3answer, _3_index],
        '_3_1': [
          [{'when':_3b_1Controller.text},[{'organisation':_3b_1delivered_answer},{'organisation_other':_3b_1otherController.text}],{'comment':_3bComment_1Controller.text}],
          [{'when':_3b_2Controller.text},[{'organisation':_3b_2delivered_answer},{'organisation_other':_3b_2otherController.text}],{'comment':_3bComment_2Controller.text}],
          [{'when':_3b_3Controller.text},[{'organisation':_3b_3delivered_answer},{'organisation_other':_3b_3otherController.text}],{'comment':_3bComment_3Controller.text}],
          [{'when':_3b_4Controller.text},[{'organisation':_3b_4delivered_answer},{'organisation_other':_3b_4otherController.text}],{'comment':_3bComment_4Controller.text}],
          [{'when':_3b_5Controller.text},[{'organisation':_3b_5delivered_answer},{'organisation_other':_3b_5otherController.text}],{'comment':_3bComment_5Controller.text}],
          [{'when':_3b_6Controller.text},[{'organisation':_3b_6delivered_answer},{'organisation_other':_3b_6otherController.text}],{'comment':_3bComment_6Controller.text}],
          [{'when':_3b_7Controller.text},[{'organisation':_3b_7delivered_answer},{'organisation_other':_3b_7otherController.text}],{'comment':_3bComment_7Controller.text}],
          [{'when':_3b_8Controller.text},[{'organisation':_3b_8delivered_answer},{'organisation_other':_3b_8otherController.text}],{'comment':_3bComment_8Controller.text}]
          ], 
        '_4':[
          [{'applying':_4_1Controller.text},{'benefits':_4_1benefitsController.text}],
          [{'applying':_4_2Controller.text},{'benefits':_4_2benefitsController.text}],
          [{'applying':_4_3Controller.text},{'benefits':_4_3benefitsController.text}],
          [{'applying':_4_4Controller.text},{'benefits':_4_4benefitsController.text}],
          [{'applying':_4_5Controller.text},{'benefits':_4_5benefitsController.text}],
          [{'applying':_4_6Controller.text},{'benefits':_4_6benefitsController.text}],
          [{'applying':_4_7Controller.text},{'benefits':_4_7benefitsController.text}],
          [{'applying':_4_8Controller.text},{'benefits':_4_8benefitsController.text}],
        ],
        '_5': _5isChckList,
        'comment': _commenOsuggestionController.text
      };

      states['sections']['sec_34'] = data;
      if(!states['completed']) {
        states['question_number'] = '34';
        states['completed'] = true;
      }
      print('22222222222222222222222${states}444444444444444444444444444444444');
          
      await _interviewDao.updateHive(states, interview_id)
      .then((value){
        dataExist?showTopShortToast():finishInterviewToast();
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

  void finishInterviewToast() {
    Fluttertoast.showToast(
        msg: "Interview Complete, Thank you very much for your time",
        toastLength: Toast.LENGTH_LONG,
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
