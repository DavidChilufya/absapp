import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class NewInterViewForm extends StatefulWidget {
  @override
  _NewInterviewFormState createState() => _NewInterviewFormState();
}

class _NewInterviewFormState extends State<NewInterViewForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'q1': null, 'q2': null};
  final _q1 = TextEditingController();
  final _q2 = TextEditingController();
  bool loading = false;
 
  Widget _buildQ1Field() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) return 'Please enter some text';
        return null;
      },
      controller: _q1,
      //decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget _buildQ2Field() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) return 'Please enter some text';
        return null;
      },
      controller: _q2,
      //decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: _submitForm,
    );
  }

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      formData['q1'] = _q1.text;
      formData['q2'] = _q2.text;
      print(formData);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Processing Data ' + formData['q1'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name of the Dairy Corperative Union you belong to',style: Theme.of(context).textTheme.headline5.copyWith(),),
                _buildQ1Field(),
                SizedBox(height: 5),
                Text('Name of the Dairy Corpaskas',style: Theme.of(context).textTheme.headline5.copyWith(),),
                _buildQ2Field(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 500,
                      child: _buildSubmitButton(),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
