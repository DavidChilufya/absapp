import 'package:absapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatefulWidget {
  static const String id = "welcome";

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).primaryColor,
                size: 50.0,
                ),
            )
          : Stack(
              fit: StackFit.expand ,
              children: <Widget>[
                SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "ABS",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            "Offline Data Collection App.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 50),
                          Image(
                            image: AssetImage(
                              'assets/graphics/transfer.png',
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                RaisedButton(
                                  child: Text(
                                    "Sign In",
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, Login.id);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                )
              ],
      )
    );
  }
}