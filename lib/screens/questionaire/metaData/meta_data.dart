import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InterviewMetaData extends StatelessWidget{
  static const String id = "metaData";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Interview - ID")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text('Hello worlsd'),),
    );
  }

}