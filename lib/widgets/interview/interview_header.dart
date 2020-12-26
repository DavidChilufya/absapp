import 'package:absapp/models/interview.dart';
import 'package:absapp/providers/interviewListModel.dart';
import 'package:absapp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class InterviewHeader extends StatelessWidget {
  final Interview interview;
  final int item_key;
  final FirebaseUser user;

  InterviewHeader({this.interview, this.item_key, this.user});

  @override
  Widget build(BuildContext context) {
    String year = interview.year_;
    String previous_interviews = interview.meta_data['first_interview'];
    //state.getInterview['meta_data']['first_interview'];
    String household_id = interview.household_id;
    String interview_id = interview.interview_id;
    String prim_coop = interview.meta_data[
        'prime_coop']; //state.getInterview['meta_data']['prime_coop'];
    String coop_union = interview.meta_data[
        'coop_union']; //state.getInterview['meta_data']['coop_union'];
    String interview_status = interview.completed ? 'Complete' : 'Incomplete';
    ;
    //state.getInterview['completed'] ? 'Complete' : 'Incomplete';

    //state.getInterview['year_'];

    return year == null
        ? Center(
            child: SpinKitDoubleBounce(
              color: Theme.of(context).accentColor,
              size: 50.0,
            ),
          )
        : Container(
            height: 170,
            margin: EdgeInsets.only(left: 18, right: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: [
                      Text(year,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold)),
                      Spacer(),
                      GestureDetector(
                          child: Icon(Icons.delete_outline_rounded,
                              color: Colors.red),
                          onTap: () => showDeletDialog(context, this.item_key))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text(
                            "First interview",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "${previous_interviews}",
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ]),
                        Column(children: <Widget>[
                          Text(
                            "Household ID",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "${household_id}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ]),
                        Column(children: <Widget>[
                          Text(
                            "Interview ID",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "${interview_id}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Text(
                          "Cooperative Union",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "${coop_union}",
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ]),
                      Column(children: <Widget>[
                        Text(
                          "Primary Cooperative",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "${prim_coop}",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ]),
                      Column(children: <Widget>[
                        Text(
                          "Status",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "${interview_status}",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  void showDeletDialog(BuildContext context, int key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(child: Text('Delete Interview ? ')),
          content: Container(
            height:MediaQuery.of(context).size.height * 0.1,
            child: Center(child: Text("Once you delete this item, it will not be recovered"))),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Theme.of(context).accentColor)),
              textColor: Colors.black87,
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
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home(user)),
                  ModalRoute.withName("/"));;
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
