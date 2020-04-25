import 'package:absapp/screens/welcome.dart';
import 'package:absapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:absapp/screens/griddashboard.dart';

class Home extends StatefulWidget {
  static const String id = 'home';
  final FirebaseUser _user;

  Home(this._user);
  _Home createState() => _Home(this._user);
}

class _Home extends State<Home>  {
  
  final FirebaseUser _user;
  _Home(this._user);
  //CreateInterview_DAO foo;
  @override
  void initState() {
    super.initState();
    // Obtaining the FruitBloc instance through BlocProvider which is an InheritedWidget
    
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    //_metaDataBloc.add(LoadInterviews());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 110,),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this._user.email,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
                      ),
                      SizedBox(height: 4,),
                      Text(this._user.uid,style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white))
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      _showSignOutDialog(context);
                    },
                  )
                ],
              ),
          ),
          SizedBox(height: 4,),
          GridDashboard()

        ],
      ),
    );
  }

}


void _showSignOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
     return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text("Confirm sign out?"),
          content: Text("Your Tabs will still be here next time you sign in"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              textColor: Colors.black87,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Sign Out"),
              textColor: Colors.red,
              onPressed: () {
                Auth.signOut();
                Navigator.pushReplacementNamed(context,Welcome.id);
              },
            ),
          ],
        );
        
    },
  );
}
