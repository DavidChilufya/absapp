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
  List list = [];
  bool loading;

  @override
  void initState() {
    //loading = false;
   
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          //appBar: AppBar(title: Text('New Interview - ${_interview_id}')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: listViewWidget())//_myListView(context, list) )
        );
   
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
        
        return ListView.builder(
          itemCount: dataSnap.data.length,
          itemBuilder: (context, index) {
          // ProjectModel project = projectSnap.data[index];
            return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Interview.id, arguments: dataSnap.data[index]);
              //Navigator.pushNamed(context, SectionContainer.id, arguments: [interview, list[index]]);
                print('project snapshot data is: ${dataSnap.data[index]}sssssssssssssssss');
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
        );
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
}
