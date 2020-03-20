import 'package:absapp/forms/create.dart';
import 'package:flutter/material.dart';

class NewInterview extends StatelessWidget {
  static const String id = "new_interview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Interview - ID")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: NewInterViewForm(),),
    );
  }
}