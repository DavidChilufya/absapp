import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MetaDataForm extends StatefulWidget {
  final String interview_id;

  MetaDataForm({this.interview_id});

  @override
  _MetaDataFormState createState() => _MetaDataFormState(interview_id);
}

class _MetaDataFormState extends State<MetaDataForm> {
  
  _MetaDataFormState(this.interview_id);
  var year = DateTime.now().year;
  final String interview_id;
  String coop_union = 'Select';
  String prime_coop = 'Select';
  String householdId;
  String firstInterview;
  String latitude;
  String longitude;
  
  int _3_index = 1;
  TextEditingController  _householdIdController = TextEditingController();
  TextEditingController  _latitudeController = TextEditingController();
  TextEditingController  _longitudeController = TextEditingController();
  TextEditingController  _dateController = TextEditingController();
  TextEditingController  _timeController = TextEditingController();

  InterviewDao _metaDataDao = InterviewDao();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //Initial values
  
  

  @override
  Widget build(BuildContext context) {
    
    DateTime now = DateTime.now(); 
    _dateController.text = DateFormat('dd/MM/yyyy').format(now);
    _timeController.text = DateFormat('kk:mm').format(now);
    
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
                            firstInterview = questions['_3'][1][index];
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
                  controller: _householdIdController,
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
                        controller: _latitudeController,
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
                        controller: _longitudeController,
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
                        controller: _dateController,
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
                        controller: _timeController,
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

  void _submitForm() async {
    
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      String year_ = DateTime.now().year.toString();
      

      Map metaData =  { 'interview_id': interview_id,'houshold_id': _householdIdController.text,
                        'coop_union': coop_union,'prime_coop': prime_coop,'first_interview': firstInterview,
                        'latitude': _latitudeController.text,'longitude': _longitudeController.text,
                        'date_': _dateController.text,'time_': _timeController.text,'year': year_,'test': false };
                                  
      InterviewModel interview = InterviewModel(interview_id: interview_id, household_id: _householdIdController.text,user_email: 'null', user_id: 'null', 
                                                    question_number: '0', year_: year_,completed: false,test: false, meta_data: metaData, sections: [{}]);
        await _metaDataDao.insert(interview).then((value) => {
          Navigator.pushNamed(
            context, 
            Interview.id,
            arguments: interview
          )
        });
      
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _householdIdController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }


}
