import 'package:flutter/material.dart';

class MetaDataForm extends StatefulWidget {
  @override
  _MetaDataFormState createState() => _MetaDataFormState();
}

class _MetaDataFormState extends State<MetaDataForm> {
  
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

    void _submitForm() async {
      if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
    }

  @override
  Widget build(BuildContext context) {
     
    return SafeArea(child: Column(
      children: <Widget>[
        Form(
          key  : _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 500,
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: _submitForm,
                ),
              )
            ],)
        )
      ],
    ));
        
  }

}