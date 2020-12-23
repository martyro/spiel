import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';
import 'main.dart';
import 'sign_in.dart';
import 'event_creator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spiel',
          style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image(
                image: AssetImage('images/nightclub.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EventCreator()));
                  },
                  color: Colors.purple,
                  child: Text(
                    "Create event",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.indigo,
                  child: Text(
                    'Find event',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    'Market',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  color: Colors.amber,
                  child: Text(
                    "Sign out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}