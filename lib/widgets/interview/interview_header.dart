import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/screens/interview/bloc/interview_state.dart';
import 'package:absapp/screens/interview/bloc/interview_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterviewHeader extends StatelessWidget {
  final Map headerModel;
  InterviewHeader({this.headerModel});

  @override
  Widget build(BuildContext context) {
    final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    interviewBloc.add(LoadInterviewEvent(headerModel['interview_id']));

    return BlocBuilder<InterviewBloc, InterviewState>(
        builder: (context, state) {
      String year = state.getInterview['year_'];
      String previous_interviews =
          state.getInterview['meta_data']['first_interview'];
      String household_id = state.getInterview['household_id'];
      String interview_id = state.getInterview['interview_id'];
      String prim_coop = state.getInterview['meta_data']['prime_coop'];
      String coop_union = state.getInterview['meta_data']['coop_union'];
      String interview_status =
          state.getInterview['completed'] ? 'Complete' : 'Incomplete';

      return Container(
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
    });
  }
}
