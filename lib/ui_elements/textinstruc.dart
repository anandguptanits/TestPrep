import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testprep1/ui_elements/questions.dart';

class TextInstruct extends StatelessWidget {
  final String _classValue;
  final String _subjectValue;

 final  List<dynamic> questions;

  TextInstruct(this.questions, this._classValue, this._subjectValue);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text(
          "IMQ Text Instructions",
        ),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 215,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 0.9],
                    colors: [Colors.red, Colors.deepOrange.shade300])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: CircleAvatar(
                        minRadius: 55,
                        backgroundColor: Colors.deepOrange.shade300,
                        backgroundImage: AssetImage('lib/assets/main-icon.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "IMQ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "INTERNATIONAL",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Text("MATH QUALIFIER",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Sample Text Instructions",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    "lib/assets/total time.png",
                    width: 42,
                    height: 42,
                  ),
                  title: Text("Total time 45 minutes",
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
                SizedBox(height: 4.0),
                ListTile(
                  leading: Image.asset(
                    "lib/assets/MCQ.png",
                    width: 42,
                    height: 42,
                  ),
                  title: Text("The test has 10 MCQ",
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
                SizedBox(height: 4.0),
                ListTile(
                  leading: Image.asset(
                    "lib/assets/Negative marking.png",
                    width: 42,
                    height: 42,
                  ),
                  title: Text(
                    "There is no negative marking",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => Questionspage(
                            questions, _classValue, _subjectValue)));
                  },
                  color: Colors.red,
                  child: Text(
                    "Go",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
