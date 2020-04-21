import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterviewHeader extends StatelessWidget {
  final InterviewHeaderModel headerModel;

  InterviewHeader({this.headerModel});

  @override
  Widget build(BuildContext context) {
    String year = headerModel.year_;
    String previous_interviews = headerModel.previous_interviews;
    String household_id = headerModel.household_id;
    String interview_id = headerModel.interview_id;
    String prim_coop = headerModel.prime_coop;
    String coop_union = headerModel.coop_union;
    String interview_status = headerModel.status;

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
                      "Previous interview(s)",
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
            Divider(
              color: Colors.black
            ),
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

class InterviewHeaderModel{
  final String year_;
  final String previous_interviews;
  final String household_id;
  final String interview_id;
  final String coop_union;
  final String prime_coop;
  final String status;

  InterviewHeaderModel({
    @required this.year_,
    @required this.previous_interviews,
    @required this.household_id,
    @required this.interview_id,
    @required this.coop_union,
    @required this.prime_coop,
    @required this.status
  });
}
