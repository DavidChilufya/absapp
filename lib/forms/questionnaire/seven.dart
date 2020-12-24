import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interview.dart';
import 'package:absapp/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Seven extends StatefulWidget {
  final String interview_id;
  final Interview interview;

  Seven(this.interview_id, this.interview);

  @override
  _SevenState createState() => _SevenState(interview_id, interview);
}

class _SevenState extends State<Seven> {
  _SevenState(this.interview_id, this.interview);
  Interview interview;

  Questionaire questionaire = Questionaire();
  Map questions ;

  String _title,q1,q2;//Questions
  List _1options;
  int _1_index ;
  String _1answer;
  bool _2show = false;

  final String interview_id;
  
  TextEditingController _2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool dataExist = false;
  String submitBtnTxt;
  //Initial values

  @override
  void initState() {
    if(interview.sections['sec_7'] != null ){
      
      dataExist = true;
        _1answer = interview.sections['sec_7']['_1'][0];
        _1_index = interview.sections['sec_7']['_1'][1];
        _2Controller..text = interview.sections['sec_7']['_2'];
        _2show = (interview.sections['sec_7']['_1'][0]) == 'No'? true:false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questions = questionaire.getSections()[6];
    _title = questions['title'];
    q1 = questions['_1'][0];
    q2 = questions['_2'][0];
    _1options = questions['_1'][2];
    
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
                                          _1_index = selected ? index : null;
                                          _2show = _1answer=='No'?true:false;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),  
                              
                              SizedBox(height: 12),
                               Visibility(
                                visible:_2show,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${q2}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith()),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4, 
                                      child: TextFormField(
                                        controller: _2Controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                                  labelText: "km",
                                                ),
                                        validator: (value) {
                                          if (value.isEmpty){return 'Field cannot be blank';}
                                          else{ return null; }
                                          },
                                      ),)
                                ]) ,), 
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
        '_1': [_1answer, _1_index],
        '_2': _2Controller.text,
      };

      states.sections['sec_7'] = data;
         
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
    _2Controller.dispose();
    super.dispose();
  }
}
