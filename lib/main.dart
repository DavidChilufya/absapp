import 'package:absapp/screens/create.dart';
import 'package:absapp/screens/home.dart';
import 'package:absapp/screens/login.dart';
import 'package:absapp/screens/settings.dart';
import 'package:absapp/screens/welcome.dart';
import 'package:absapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  final Color primaryColor = Color(0xff03da9d);
  final Color accentColor = Color(0xff333333);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Settings(),
      child: MaterialApp(
        title: 'ABS Data Collection',
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: accentColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white),
          fontFamily: 'Rubik',
          textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.black87, 
              fontWeight: FontWeight.bold
              ),
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
            
            
            /*enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ), */
          ),
        ),
        routes: {
          Welcome.id: (context) => Welcome(),
          Login.id  : (context) => Login(),
          NewInterview.id : (context) => NewInterview(),
        },
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
                  "Tabs",
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            },
        ),
      ),
    );
  }

}

