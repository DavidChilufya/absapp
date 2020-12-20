
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview_list/interview_list.dart';
import 'package:absapp/screens/questionaire/metaData/meta_data_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GridDashboard extends StatefulWidget {
  final FirebaseUser _user;
  GridDashboard(this._user);
  static const String id = 'grid_dashboard';
  _GridDashboardState createState() => _GridDashboardState(this._user);
}

class _GridDashboardState extends State<GridDashboard> {
  final FirebaseUser _user;
  _GridDashboardState(this._user);
  final InterviewDao _interviewDao = InterviewDao();
  List<Map> myList = [
    {
      'title': "New",
      'total': "",
      'img': "assets/graphics/new_interview.png"
    },
    {
      'title': "Drafts",
      'total': "200",
      'img': "assets/graphics/draft_interview.png"
    },
    {
      'title': "Tests",
      'total': "0",
      'img': "assets/graphics/test_interview.png"
    },
    {
      'title': "Upload",
      'total': "0",
      'img': "assets/pending_upload.png"
    },{
      'title': "Uploaded",
      'total': "",
      'img': "assets/uploaded.png"
    },{
      'title': "All",
      'total': "0",
      'img': "assets/todo.png"
    },
  ];
  

  @override
  Widget build(BuildContext context) {
    //myList[1]['total'] = getInterviews().length.toString() ;
    //print('${getInterviews()}');
    var color = Theme.of(context).accentColor.withAlpha(30);
    return FutureBuilder(
      future: _interviewDao.getAllInterviews(),
      builder: (context, dataSnap) {
      if(dataSnap.connectionState == ConnectionState.waiting){

        return Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).accentColor,
                size: 50.0,
                ),
            );
            
       }
      else if(dataSnap.connectionState == ConnectionState.done){
      return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 8, right: 8),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList.map((data) {
            myList[1]['total'] = getInterviewsDrafts(dataSnap.data, 'completed').length.toString();
            myList[3]['total'] = getInterviews(dataSnap.data,'completed').length.toString();
            myList[2]['total'] = getInterviews(dataSnap.data,'test').length.toString();

            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(data['img'],width: 42,),
                    SizedBox( height: 14, ),
                    Text(
                      data['title'],
                      style: Theme.of(context).textTheme.headline5.copyWith(),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      data['total'],
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                   navigate(context, data);
              },
            );
          }).toList()),
    );
    }

    return Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).accentColor,
                size: 50.0,
                ),
            );

    }
    );
  } 

  void navigate(BuildContext context, Map data){
    if(data['title'] == 'New'){
                     Navigator.pushNamed(context, InterviewMetaData.id,arguments: _user);
                  }else if(data['title'] == 'Drafts')
                  {
                    Navigator.pushNamed(context, InterviewList.id,arguments: [_user, 'Drafts']);
                  }else if(data['title'] == 'Tests')
                  {
                    Navigator.pushNamed(context, InterviewList.id,arguments: [_user, 'Tests']);
                  }else if(data['title'] == 'Upload')
                  {
                    Navigator.pushNamed(context, InterviewList.id,arguments: [_user, 'Upload']);
                  }
  }

  List getInterviews(List allInterviews, String listType) {
    List newList = [];
    for (var i=0; i<allInterviews.length; i++) {
      if(allInterviews[i][listType]){
        newList.add(allInterviews[i]);

        //print(allInterviews[i]);
      }
    }
    return newList;
  } 

  List getInterviewsDrafts(List allInterviews, String listType) {
    List newList = [];
    for (var i=0; i<allInterviews.length; i++) {
      if(!allInterviews[i][listType]){
        newList.add(allInterviews[i]);

        //print(allInterviews[i]);
      }
    }

    return newList;
  }
  

}

