import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';
import 'main.dart';
import 'sign_in.dart';

class EventCreator extends StatelessWidget {
  //String selectedValue = "";
  final List<String> privacyList = ['Public event', 'Private event'];
  final List<String> ageList = ['18', '19', '20', '21'];
  final List<String> typeList = ['Vorspiel', 'Mittespiel', 'Nachspiel'];
  final List<String> placeList = ['Home', 'Locale'];

  String title, privacy, age, type, place, number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Spiel',
          style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget> [
          Positioned.fill(
            child: Image(
              image: AssetImage('images/planning.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 50),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.90),
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) { title = text; },
                  decoration: InputDecoration(
                    hintText: "Title of your event",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),

                DropdownBehavior(
                    dropdownList: privacyList,
                    selectedValue: (String val) {
                      privacy = val;
                    }
                ),

                DropdownBehavior(
                  dropdownList: ageList,
                    selectedValue: (String val) {
                      age = val;
                    }
                ),

                DropdownBehavior(
                  dropdownList: typeList,
                    selectedValue: (String val) {
                      type = val;
                    }
                ),

                DropdownBehavior(
                  dropdownList: placeList,
                    selectedValue: (String val) {
                      place = val;
                    }
                ),

                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) { number = text; },
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    hintText: "Max participants",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),

                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder:
                        (BuildContext context) => Schedule(title: title,
                          privacy: privacy, age: age, type: type,
                          place: place, number: number
                        )
                    ));
                  },
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule extends StatelessWidget {
  final String title, privacy, age, type, place, number;
  String description, ideas, rules;
  Schedule({Key key, @required this.title, @required this.privacy,
    this.age, this.type, this.place, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Spiel',
          style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('images/planning.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 50),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.90),
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) { description = text; },
                  decoration: InputDecoration(
                    hintText: "Describe and schedule your event loosely",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) { ideas = text; },
                  decoration: InputDecoration(
                    hintText: "Ideas for drinking games or other activities",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (text) { rules = text; },
                  decoration: InputDecoration(
                    hintText: "Fill in any rules you have for the event",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder:
                        (BuildContext context) => Attendance(description:
                        description, ideas: ideas, rules: rules)));
                  },
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: ListView(
                    children: [
                      Text(
                        title.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        privacy.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        type.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        place.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        number.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Attendance extends StatelessWidget {
  //String selectedValue = "";
  final String description, ideas, rules;
  final List<String> hostList = ['Solo-hosting', 'Multi-hosting'];
  String host, roles, members; // members = list, add sep. name-strings func.
  Attendance({Key key,
    this.description, this.ideas, this.rules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Spiel',
          style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('images/planning.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 50),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.90),
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownBehavior(
                  dropdownList: hostList,
                  selectedValue: (String val) {

                  }
                  //selectedValue: 'Solo-hosting',
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Describe the responsibility roles for the event",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Invite/enter all participants for the event",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 12,
                    ),
                  ),
                  //onSubmitted:
                ),

                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          backgroundColor: Colors.black,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(50, 0, 50, 50),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.90),
                              border: Border(
                                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                                right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                                bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF).withOpacity(0.25)),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Your event was created',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                RaisedButton(
                                    color: Colors.black,
                                    child: Text(
                                      'Back to home',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .popUntil((route) =>
                                          route.isFirst
                                      );
                                    }
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  },
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: ListView(
                    children: [
                      Text(
                        description.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ideas.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        rules.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Summarizer extends StatelessWidget {
  Widget build(BuildContext context) {
    return null;
  }
}

class DropdownBehavior extends StatefulWidget {
  //final String selectedValue;
  final List<String> dropdownList;
  //DropdownBehavior({Key key, this.dropdownList, this.selectedValue}) : super(key: key);
  DropdownBehavior({Key key, this.dropdownList, this.selectedValue}) : super(key: key);
  Function(String) selectedValue;

  @override
  //_DropdownBehavior createState() => _DropdownBehavior(dropdownList: dropdownList, selectedValue: selectedValue);
  //_DropdownBehavior createState() => _DropdownBehavior(dropdownList: dropdownList);
  _DropdownBehavior createState() => _DropdownBehavior();
}

class _DropdownBehavior extends State<DropdownBehavior> {
  //String selectedValue;
  //final List<String> dropdownList;
  //_DropdownBehavior({this.dropdownList});// : super();
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.black,
      underline: Container(
        height: 2,
        color: Colors.white10,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          widget.selectedValue(newValue);
        });
      },
      items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

}