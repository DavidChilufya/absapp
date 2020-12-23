import 'package:absapp/providers/interview.dart';
import 'package:absapp/providers/interviewListModel.dart';
import 'package:absapp/screens/home.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:absapp/screens/interview_list/interview_list.dart';
import 'package:absapp/screens/login.dart';
import 'package:absapp/screens/questionaire/metaData/meta_data_screen.dart';
import 'package:absapp/screens/questionaire/sections/section_container.dart';
import 'package:absapp/screens/welcome.dart';
import 'package:absapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final Color primaryColor = Color(0xff03da9d);
  final Color accentColor = Colors.orangeAccent; //Color(0xff333333);
  //final Color primaryColor2 = Color(0xffba0206);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<InterviewModel>(
            create: (context) => InterviewModel(),
          ),
          ChangeNotifierProvider<InterviewListModel>(
            create: (context) => InterviewListModel(),
          )
        ],
        child: MaterialApp(
          title: 'ABS Data Collection',
          theme: ThemeData(
            primaryColor: primaryColor,
            accentColor: accentColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: primaryColor),
            primarySwatch: Colors.green,
            fontFamily: 'Rubik',
            textTheme: TextTheme(
              headline4:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              headline3: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              button: TextStyle(color: Colors.white),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: primaryColor,
              textTheme: ButtonTextTheme.normal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.all(8),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          routes: {
            Welcome.id: (context) => Welcome(),
            Login.id: (context) => Login(),
            InterviewMetaData.id: (context) => InterviewMetaData(),
            Interview.id: (context) => Interview(),
            SectionContainer.id: (context) => SectionContainer(),
            InterviewList.id: (context) => InterviewList()
          },
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<FirebaseUser>(
            future: Auth.getCurrentUser(),
            builder: (context, AsyncSnapshot<FirebaseUser> userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.done) {
                if (userSnapshot.error != null) {
                  print("error");
                  return Text(userSnapshot.error.toString());
                }
                return userSnapshot.hasData
                    ? Home(userSnapshot.data)
                    : Welcome();
              } else {
                return Text(
                  "ABS APP",
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            },
          ),
        ));
  }
}
