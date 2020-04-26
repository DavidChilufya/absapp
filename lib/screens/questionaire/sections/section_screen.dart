import 'package:absapp/forms/questionnaire/one.dart';
import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/screens/interview/bloc/interview_state.dart';
import 'package:absapp/screens/interview/bloc/interview_event.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Section extends StatefulWidget {
  final String interview_id;

  Section(this.interview_id);

  @override
  _SectionState createState() => _SectionState(this.interview_id);
}

class _SectionState extends State<Section> {
  String interview_id;

  _SectionState(this.interview_id);
  InterviewBloc _interviewBloc;

  @override
  void initState() {
    // TODO: implement initState
    //final interviewBloc = BlocProvider.of<InterviewBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('sd');
    List routeData = ModalRoute.of(context).settings.arguments;
    Map interview ;
    final interviewBloc = BlocProvider.of<InterviewBloc>(context);
    interviewBloc.add(LoadInterviewEvent(interview_id));

    var section = routeData[1];

    String sectionNo = '1';
    String interviewId = 'wewewe';
    String year_ = '2020';

    int pageIndex = 1;
    PageController _pageViewController = PageController(
      initialPage: int.parse(sectionNo) - 1,
    );

    return BlocBuilder<InterviewBloc, InterviewState>(
        builder: (context, state) {
          //interviewBloc.add(LoadInterviewEvent(interview_id));
        interview = state.getInterview;
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: PageView(
                  controller: _pageViewController,
                  children: [
                    One(interview_id),
                    Center(child: Text('Page 2')),
                    Center(child: Text('Page 3')),
                    Center(child: Text('Page 4')),
                  ],
                )),
        
            );
      });
  }

  void foo(pageIndex, interview,_pageViewController,endFloat) {
       //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 26, right: 50),
                child: RaisedButton(
                  child: Text(pageIndex == 0 ? "Cancel" : "Sections list"),
                  color: Colors.grey,
                  onPressed: () {
                    _interviewBloc.add(LoadInterviewEvent(interview_id));
                    if (pageIndex == 0) {
                      Navigator.pushNamed(context, Interview.id);
                    } else {
                      Navigator.pushNamed(context, Interview.id,
                          arguments: interview);
                    }
                  },
                ),
              )),
              Expanded(
                child: RaisedButton(
                    child: Text("Next"),
                    onPressed: () async {
                      await _pageViewController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                      FocusScope.of(context).unfocus();
                    }),
              )
            ],
          );
  }

  @override
  void dispose() {
    //_pageViewController.dispose();
    super.dispose();
  }
}
