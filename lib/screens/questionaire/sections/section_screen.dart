import 'package:absapp/forms/questionnaire/eight.dart';
import 'package:absapp/forms/questionnaire/eighteen.dart';
import 'package:absapp/forms/questionnaire/eleven.dart';
import 'package:absapp/forms/questionnaire/fifteen.dart';
import 'package:absapp/forms/questionnaire/five.dart';
import 'package:absapp/forms/questionnaire/four.dart';
import 'package:absapp/forms/questionnaire/fourteen.dart';
import 'package:absapp/forms/questionnaire/nine.dart';
import 'package:absapp/forms/questionnaire/nineteen.dart';
import 'package:absapp/forms/questionnaire/one.dart';
import 'package:absapp/forms/questionnaire/seventeen.dart';
import 'package:absapp/forms/questionnaire/six.dart';
import 'package:absapp/forms/questionnaire/sixteen.dart';
import 'package:absapp/forms/questionnaire/ten.dart';
import 'package:absapp/forms/questionnaire/thirteen.dart';
import 'package:absapp/forms/questionnaire/thirty.dart';
import 'package:absapp/forms/questionnaire/thirty_four.dart';
import 'package:absapp/forms/questionnaire/thirty_one.dart';
import 'package:absapp/forms/questionnaire/thirty_two.dart';
import 'package:absapp/forms/questionnaire/tweent_three.dart';
import 'package:absapp/forms/questionnaire/tweenty.dart';
import 'package:absapp/forms/questionnaire/tweenty_eight.dart';
import 'package:absapp/forms/questionnaire/tweenty_five.dart';
import 'package:absapp/forms/questionnaire/tweenty_four.dart';
import 'package:absapp/forms/questionnaire/tweenty_nine.dart';
import 'package:absapp/forms/questionnaire/tweenty_one.dart';
import 'package:absapp/forms/questionnaire/tweenty_seven.dart';
import 'package:absapp/forms/questionnaire/tweenty_two.dart';
import 'package:absapp/forms/questionnaire/two.dart';
import 'package:absapp/providers/interview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:absapp/models/interview.dart' as interview_item;

class Section extends StatefulWidget {
  final String interview_id;
  final int secNo;
  final FirebaseUser user;

  Section(this.interview_id, this.secNo, this.user);

  @override
  _SectionState createState() => _SectionState(this.interview_id, this.secNo, this.user);
}

class _SectionState extends State<Section> {
  bool loading = true;
  //int pageIndex = 1;
  int sectionNo;
  PageController _pageViewController; //= PageController(initialPage: 0,);
  String interview_id;
  final FirebaseUser user;
  _SectionState(this.interview_id, this.sectionNo, this.user);
  //InterviewBloc _interviewBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List routeData = ModalRoute.of(context).settings.arguments;
    interview_item.Interview interview =
        Provider.of<InterviewModel>(context, listen: false).getInterview();

    var section = routeData[1];

    String interviewId = 'wewewe';
    String year_ = '2020';

    int pageIndex = 1;
    _pageViewController = PageController(
      initialPage: sectionNo - 1,
    );
    //if(state.getInterview != null){
    //loading = false;
    //}

    // _interviewBloc.add(LoadInterviewEvent(interview_id));
    //interview = state.getInterview;

    var questionFour;
    if (interview.meta_data['first_interview'] == 'Yes') {
      questionFour = Four(interview_id, interview);
    } else {
      questionFour = Center(
        child: Text('Question 4 is not active',
            style: Theme.of(context).textTheme.headline5.copyWith()),
      );
    }

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
          child: PageView(
            controller: _pageViewController,
            children: [
              One(interview_id, interview),

              Two(interview_id, interview),
              Center(
                child: Text('Question 3 is not active',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
              ),
              questionFour,
              Five(interview_id, interview, this.user),

              Six(interview_id, interview),
              Center(
                child: Text('Question 7 is not active',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
              ),
              //Seven(interview_id,interview),
              Eight(interview_id, interview),
              Nine(interview_id, interview),
              Ten(interview_id, interview),
              Eleven(interview_id, interview),
              Center(
                child: Text('Question 12 is not active',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
              ),
              Thirteen(interview_id, interview),
              Fourteen(interview_id, interview),
              Fifteen(interview_id, interview),
              Sixteen(interview_id, interview),
              Seventeen(interview_id, interview),
              Eighteen(interview_id, interview),
              Nineteen(interview_id, interview),
              Tweenty(interview_id, interview),
              TweentyOne(interview_id, interview),
              TweentyTwo(interview_id, interview),
              TweentyThree(interview_id, interview),
              TweentyFour(interview_id, interview),
              TweentyFive(interview_id, interview),
              Center(
                child: Text('Question 26 is not active',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
              ),
              TweentySeven(interview_id, interview),
              TweentyEight(interview_id, interview),
              TweentyNine(interview_id, interview),
              Thirty(interview_id, interview),
              ThirtyOne(interview_id, interview),
              ThirtyTwo(interview_id, interview),
              //ThirtyThree(interview_id, interview),
              Center(
                child: Text('Question 33 is not active',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
              ),
              ThirtyFour(interview_id, interview, this.user)
            ],
          )),
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }
}
