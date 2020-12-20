import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InterviewHeader extends StatelessWidget {
  final Map headerModel;
  InterviewHeader({this.headerModel});

  @override
  Widget build(BuildContext context) {
    //final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    //interviewBloc.add(LoadInterviewEvent(headerModel['interview_id']));
    //print('**GGHEADER MODLE*** ${this.headerModel}');
    String year = this.headerModel['year_'];
    String previous_interviews = this.headerModel['previous_interviews'];
          //state.getInterview['meta_data']['first_interview'];
      String household_id = this.headerModel['household_id']; //state.getInterview['household_id'];
      String interview_id = this.headerModel['interview_id']; //state.getInterview['interview_id'];
      String prim_coop = this.headerModel['prime_coop']; //state.getInterview['meta_data']['prime_coop'];
      String coop_union = this.headerModel['coop_union']; //state.getInterview['meta_data']['coop_union'];
      String interview_status = this.headerModel['status'] ? 'Complete' : 'Incomplete';;
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
              Text(year,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold)),
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
}
