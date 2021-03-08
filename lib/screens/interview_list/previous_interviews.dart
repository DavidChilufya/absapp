import 'package:absapp/providers/interview.dart';
import 'package:absapp/resources/previous_data.dart';
import 'package:absapp/screens/interview/interview_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PreviousInterviews extends StatefulWidget {
  static const String id = 'previous_interviews';

  @override
  _PreviousInterviewsState createState() => _PreviousInterviewsState();
}

class _PreviousInterviewsState extends State<PreviousInterviews> {
  User _user;
  //IUploadToServer uploadToServer;
  bool loading;
  PreviousData previousData = PreviousData();
  List interviewList;

  @override
  void initState() {
    super.initState();
    interviewList = previousData.getPreviousData();
    //print(previousData.getPreviousData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Interview list'),
        ),
        body: listViewWidget());
  }

  Widget listViewWidget() {
    return ListView.builder(
      itemCount: interviewList.length,
      itemBuilder: (context, index) {
        // ProjectModel project = projectSnap.data[index];
        return GestureDetector(
          onTap: () async {
            
            //Navigator.pushNamed(context, SectionContainer.id, arguments: [interview, list[index]]);
            //print('project snapshot data is: ${interviewList[index]['interview_id']}sssssssssssssssss');
          },
          child: Container(
            child: Card(
                //                           <-- Card widget
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                //title:
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text('${index + 1}',
                            style:
                                Theme.of(context).textTheme.caption.copyWith()),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Padding(
                                padding: EdgeInsets.only(left: 10.5, right: 4),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          '${interviewList[index]['meta_data']['coop_union']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith()),
                                      Text(
                                          '${interviewList[index]['meta_data']['prime_coop']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith()),
                                    ]))),
                      ]),
                      Text('${interviewList[index]['meta_data']['date_']}',
                          style:
                              Theme.of(context).textTheme.caption.copyWith()),
                      Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: Text('${interviewList[index]['interview_id']}',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ]),
              ),
            ])),
          ),
        );
      },
    );
  }
}
