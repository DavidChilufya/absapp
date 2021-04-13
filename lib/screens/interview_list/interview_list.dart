import 'package:absapp/providers/interview.dart';
import 'package:absapp/providers/interviewListModel.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:absapp/helpers/data_upload/data_upload.dart';
import 'package:absapp/services/upload_to_server_firebase.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class InterviewList extends StatefulWidget {
  static const String id = 'interview_list';

  InterviewList();

  @override
  _InterviewListState createState() => _InterviewListState();
}

class _InterviewListState extends State<InterviewList> with DataUpload {
  User _user;
  //IUploadToServer uploadToServer;
  int _totalUploaded;
  List list = [];
  List listRouteArguments;
  bool loading;
  String interviewListType;
  List interviewList;
  bool show_delete_buttons, show_delete_dialog;

  @override
  void initState() {
    super.initState();
    uploadToServer = UploadToServerFirebase();
    _totalUploaded = 0;
    //loading = false;
    listRouteArguments = [];
    interviewListType = 'Drafts';
    interviewList = [];
    show_delete_buttons = false;
    show_delete_dialog = true;
  }

  @override
  Widget build(BuildContext context) {
    //print(ModalRoute.of(context).settings.arguments);
    listRouteArguments = ModalRoute.of(context).settings.arguments;
    interviewListType = listRouteArguments[1];
    if (interviewListType == "Upload") {
      uploadToServer.confirmConnectionStatus();
    }
    _user = listRouteArguments[0];
    return Scaffold(
        appBar: AppBar(
          title: Text('Interview list'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete, color: Colors.black45),
                onPressed: () => showDeleteButton(context))
          ],
        ),
        body: listViewWidget());
  }

  Widget listViewWidget() {
    return Consumer<InterviewListModel>(
      builder: (context, state, child) {
        //print('INTERVIEW LIST ${state.interviewList}');
        if (interviewListType == 'Drafts') {
          interviewList = state.drafts;
        } else if (interviewListType == 'Upload') {
          interviewList = state.pending_upload;
        } else if (interviewListType == 'Uploaded') {
          interviewList = state.uploaded_interviews;
        } else if (interviewListType == 'Tests') {
          interviewList = state.tests;
        }

        return state.data_loading
            ? Center(
                child: SpinKitDoubleBounce(
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                ),
              )
            : Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                Widget>[
                Visibility(
                  visible: interviewList.isEmpty,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Image.asset("assets/not_found.png"),
                        Text(
                          "No Data",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                    //height: MediaQuery.of(context).size.height * 0.9,
                    child: ListView.builder(
                  itemCount: interviewList.length,
                  itemBuilder: (context, index) {
                    // ProjectModel project = projectSnap.data[index];
                    return GestureDetector(
                      onTap: () async {
                        await Provider.of<InterviewModel>(context,
                                listen: false)
                            .setInterviewByID(
                                interviewList[index]['item']['interview_id'],
                                interviewList[index]['key']);
                        await Navigator.pushNamed(context, Interview.id,
                            arguments: this._user);
                        //Navigator.pushNamed(context, SectionContainer.id, arguments: [interview, list[index]]);
                        //print('project snapshot data is: ${interviewList[index]['interview_id']}sssssssssssssssss');
                      },
                      onLongPress: () {
                        if (show_delete_dialog) {
                          showDeletDialog(context, interviewList[index]['item'],
                              interviewList[index]['key']);
                        } else {
                          deleteInterview(context, interviewList[index]['key']);
                        }
                      },
                      child: Container(
                        child: Card(
                            //                           <-- Card widget
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                              ListTile(
                                //title:
                                subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text('${index + 1}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                .copyWith()),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.5, right: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          '${interviewList[index]['item']['meta_data']['coop_union']}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2
                                                                  .copyWith()),
                                                      Text(
                                                          '${interviewList[index]['item']['meta_data']['prime_coop']}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith()),
                                                    ]))),
                                      ]),
                                      Text(
                                          '${interviewList[index]['item']['meta_data']['date_']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith()),
                                      Spacer(),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        child: Text(
                                            '${interviewList[index]['item']['interview_id']}',
                                            style:
                                                TextStyle(color: Colors.green)),
                                      ),
                                      this.show_delete_buttons
                                          ? RaisedButton(
                                              onPressed: () =>
                                                  this.show_delete_dialog
                                                      ? showDeletDialog(
                                                          context,
                                                          interviewList[index]
                                                              ['item'],
                                                          interviewList[index]
                                                              ['key'])
                                                      : deleteInterview(
                                                          context,
                                                          interviewList[index]
                                                              ['key']),
                                              child: Text('Delete',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .copyWith(
                                                          color: Colors
                                                              .redAccent
                                                              .shade200)))
                                          : Container()
                                    ]),
                              ),
                            ])),
                      ),
                    );
                  },
                )),
                Visibility(
                  visible: _totalUploaded > 0,
                  child: Text("${_totalUploaded} / ${interviewList.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).primaryColor)),
                ),
                Visibility(
                    visible: interviewListType == 'Upload' &&
                        interviewList.isNotEmpty,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 500,
                          child: RaisedButton(
                            child: Text('Upload to server'),
                            //color: dataExist?Theme.of(context).accentColor:Theme.of(context).primaryColor,
                            //onPressed: () => _createJson.writeToFile(dataSnap.data),
                            onPressed: () => postToServer(interviewList),
                          ),
                        ))),
                SizedBox(height: 10.0)
              ]);
      },
    );
  }

  Future streamSubmit(Stream<int> stream) async {
    int total_uploaded = 0;
    await for (var value in stream) {
      total_uploaded += value;
      print("Uploaded : ${total_uploaded} : ${value}");
    }

    setState(() {
      this._totalUploaded = total_uploaded;
      print("State Upload : ${this._totalUploaded} : }");
    });

    //return total_uploaded;
  }

  void postToServer(data) async {
    if (uploadToServer.getConnectionStatus()) {
      await streamSubmit(this.uploadToServer.upload(data));
      if (this._totalUploaded + 1 == data.length) {
        dataUploadedToast();
      }
    } else {
      noNetToast();
    }

    //print(_newList);
    /*
    try {
      final result = await InternetAddress.lookup('abs.chilufyamedia.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _createJson.postToServer(_newList, _user.uid);
        dataUploadedToast();
      }
    } on SocketException catch (_) {
      noNetToast();
    }
    */
  }

  void noNetToast() {
    Fluttertoast.showToast(
        msg: "No Internet connectiion",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  void dataUploadedToast() {
    Fluttertoast.showToast(
        msg: "Uploading complete",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  showDeleteButton(BuildContext context) {
    setState(() {
      this.show_delete_buttons = true;
    });
  }

  dontShowDeleteDialog(BuildContext context) {
    setState(() {
      this.show_delete_dialog = false;
    });
  }

  void showDeletDialog(BuildContext context, Map data, int key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String user_name = data['sections']['sec_1'] == null
            ? 'No name'
            : data['sections']['sec_1']['_1'];
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(
              child: Text('${user_name} - ${data['meta_data']['coop_union']}')),
          content: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                  child: Text(
                      "Once you delete this item, it will not be recovered"))),
          actions: <Widget>[
            FlatButton(
              child: Text("Dont show again",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey)),
              onPressed: () {
                dontShowDeleteDialog(context);
              },
            ),
            FlatButton(
              child: Text("Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Theme.of(context).accentColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: Colors.redAccent,
              child: Text("Delete",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white70)),
              onPressed: () {
                deleteInterview(context, key);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteInterview(BuildContext context, int key) async {
    print(key);
    await Provider.of<InterviewListModel>(context, listen: false)
        .deleteInterview(key: key);
  }
}
