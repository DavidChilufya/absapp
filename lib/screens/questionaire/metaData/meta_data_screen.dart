import 'dart:math';
import 'package:absapp/forms/questionnaire/meta_data.dart';
//import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_bloc/flutter_bloc.dart' as bbc;

class InterviewMetaData extends StatelessWidget {
  static const String id = "metaData";
 
  final String _interview_id = InterviewMetaData.randomString(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Interview - ${_interview_id}')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: FutureBuilder<String>(
              future: callAsyncFetch(),
                builder: (context, AsyncSnapshot<String> snapshot) {
              return !snapshot.hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitThreeBounce(
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Preparing Questionnaire...')
                      ],
                    )
                  : MetaDataForm(
                      interview_id: _interview_id,
                      user: ModalRoute.of(context).settings.arguments);
            })));
  }

  
  Future<String> callAsyncFetch() =>  
      Future.delayed(Duration(seconds: 2), () => "Loaded");

  
  static String randomString(int strlen) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
    

}
