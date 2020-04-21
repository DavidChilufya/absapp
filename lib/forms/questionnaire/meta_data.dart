import 'dart:math';

import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';

class MetaDataForm extends StatefulWidget {
  @override
  _MetaDataFormState createState() => _MetaDataFormState();
}

class _MetaDataFormState extends State<MetaDataForm> {
  String _interview_id;
  String coop_union = 'Select';
  String prime_coop = 'Select';
  int _3_index = 1;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  InterviewDao _metaDataDao = InterviewDao();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
    Map metaData =  { 'interview_id': 'sdsdsd','houshold_id': 'sdsdsd','coop_union': 'sdsdsd','prime_coop': 'sdsdsd',
                              'first_interview': false,'latitude': 'sdsdsd','longitude': 'sdsdsd','date_': 'sdsdsd','time_': 'sdsdsd',
                                 'year': 'sdsdsd','test': false };
    InterviewModel interview = InterviewModel(interview_id: 'qqqqqqqqqqqqqqqqqqqqq2', household_id: 'sdsdsd',user_email: 'null', user_id: 'null', 
                                                   question_number: 'null', completed: false,test: false, meta_data: metaData);
      await _metaDataDao.insert(interview);
      await Navigator.pushNamed(
        context, 
        Interview.id,
        arguments: interview
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    Map questions = Questionaire.questionnaire[0];
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Text('START INTERVIEW',
            style:
                Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 26)),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 12),
                Text('${questions['_1'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                DropdownButton(
                  value: coop_union,
                  items: questions['_1'][1]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      coop_union = newValue;
                    });
                  },
                  underline: SizedBox(),
                  //isExpanded: true,
                ),
                Text('${questions['_2'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                DropdownButton(
                  value: prime_coop,
                  items: questions['_2'][1][0]['Balaka']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      prime_coop = newValue;
                    });
                  },
                  underline: SizedBox(),
                  //isExpanded: true,
                ),
                Text('${questions['_3'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: List<Widget>.generate(
                    questions['_3'][1].length,
                    (int index) {
                      return ChoiceChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        label: Text(questions['_3'][1][index]),
                        selected: _3_index == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _3_index = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 12),
                Text('${questions['_4'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) return 'Field cannot be blank';
                    return null;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Latitude",
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Longitude",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Date",
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Time",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(height: 14),
        SizedBox(
          width: 500,
          child: RaisedButton(
            child: Text("Submit"),
            onPressed: _submitForm,
          ),
        )
      ],
    )));
  }

}
