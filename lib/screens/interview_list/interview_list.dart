import 'package:absapp/resources/create_json.dart';
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InterviewList extends StatefulWidget {
  static const String id = 'interview_list';
  
  InterviewList();
  

   @override
  _InterviewListState createState() => _InterviewListState();
}

class _InterviewListState extends State<InterviewList> {
  final InterviewDao _interviewDao = InterviewDao();
  final CreateJson _createJson = CreateJson();

  
  List list = [];
  List listRouteArguments;
  bool loading;
  String interviewListType;
  List interviewList;

  @override
  void initState() {
    //loading = false;
    listRouteArguments = [];
    interviewListType = 'Drafts';
    interviewList = [];
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    listRouteArguments = ModalRoute.of(context).settings.arguments;
    interviewListType = listRouteArguments[1];
    return Scaffold(
          //appBar: AppBar(title: Text('New Interview - ${_interview_id}')),
          body:   listViewWidget());
   
  }

  Widget listViewWidget() {
  return FutureBuilder(
    future:  _interviewDao.getAllInterviews(),
    builder: (context, dataSnap) {
      if (dataSnap.connectionState == ConnectionState.none &&
          dataSnap.hasData == null) {
        
        return Center(
              child: Text('No connection',
                      style: Theme.of(context).textTheme.headline5.copyWith())
            );
      }else if(dataSnap.connectionState == ConnectionState.done &&
          (dataSnap.data.length) == 0 ){
            return Center(
              child: Text('No Data',
                      style: Theme.of(context).textTheme.headline5.copyWith())
            );
      }else if(dataSnap.connectionState == ConnectionState.waiting){
        return Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).primaryColor,
                size: 50.0,
                ),
            );
      
      }else if(dataSnap.connectionState == ConnectionState.done){
        if(interviewListType == 'Drafts'){
          interviewList = getInterviewsDrafts(dataSnap.data,'completed');
        }else if(interviewListType == 'Pending'){
          interviewList = getInterviews(dataSnap.data,'completed');
        }else if(interviewListType == 'Tests'){
          interviewList = getInterviews(dataSnap.data,'test');
        }
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                //height: MediaQuery.of(context).size.height * 0.9, 
                child: ListView.builder(
                  itemCount: interviewList.length,
                  itemBuilder: (context, index) {
                  // ProjectModel project = projectSnap.data[index];
                    return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Interview.id, arguments: interviewList[index]);
                      //Navigator.pushNamed(context, SectionContainer.id, arguments: [interview, list[index]]);
                        //print('project snapshot data is: ${dataSnap.data[index]}sssssssssssssssss');
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
                                    Row(children:<Widget>[
                                      Text(
                                      '${index+1}',
                                      style: Theme.of(context).textTheme.caption.copyWith()),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.3, child:
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.5, right: 4),
                                        child: Column (
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:<Widget>[
                                            Text(
                                                  '${dataSnap.data[index]['meta_data']['coop_union'] }',
                                              style: Theme.of(context).textTheme.subtitle2.copyWith()),
                                            Text(
                                                  '${dataSnap.data[index]['meta_data']['prime_coop'] }',
                                              style: Theme.of(context).textTheme.subtitle1.copyWith()),  
                                        ]) )),
                                    ]),
                                  Text(
                                      '${dataSnap.data[index]['meta_data']['date_']}',
                                      style: Theme.of(context).textTheme.caption.copyWith()),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.18, child: Text(
                                                  '${dataSnap.data[index]['interview_id'] }',
                                              style: TextStyle(color: Colors.green)),
                                  ),
                                ]),
                              ),
                      ])),
                    ),
                );
                  },
                )
              ),
              Visibility(
                visible: interviewListType == 'Pending',
                child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 500,
                  child: RaisedButton(
                    child: Text('Process For Upload'),
                    //color: dataExist?Theme.of(context).accentColor:Theme.of(context).primaryColor,
                    onPressed: () => _createJson.writeToFile(dataSnap.data),
                  ),
                )
              ))
              ,

            
          ]); 
      }

      return Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).primaryColor,
                size: 50.0,
                ),
            );
    },
  );
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
