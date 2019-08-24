import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultSummary extends StatelessWidget {

  final int correct, incorrect, notattempted, skipped, timeSpent;
  ResultSummary(this.correct,this.incorrect, this.notattempted, this.skipped, this.timeSpent);

   get accuracy{
     return (((correct / incorrect)*(100)).toStringAsFixed(2));
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Icon(Icons.menu, color: Colors.white),
          title: Text(
            "IMQ Sample Text",
          ),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            Image.asset("lib/assets/nof icon.png", width: 50, height: 50)
            // Image.asset("lib/assets/main-icon.png"),
          ],
        ),
        body: ListView(children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [Colors.red, Colors.deepOrange.shade300])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "lib/assets/congo.png",
                  height: 120,
                  width: 120,
                ),
                Text(
                  "CONGRATULATIONS!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  "You have completed the text",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "IMQ",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
                Text(
                  "INTERNATIONAL MATH QUALIFIER",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                ),
                SizedBox(height: 5),
                Text(
                  "Result Summary",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(height: 5),
                Image.asset(
                  "lib/assets/percentage.png",
                  height: 120,
                  width: 120,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              ClipOval(
                                  child: Container(
                                width: 30,
                                height: 30,
                                color: Colors.lightGreen,
                                child: Center(
                                  child: Text(
                                    correct.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                              Text("Correct"),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              ClipOval(
                                  child: Container(
                                width: 30,
                                height: 30,
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    incorrect.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                              Text("Incorrect"),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              ClipOval(
                                  child: Container(
                                width: 30,
                                height: 30,
                                color: Colors.blueGrey,
                                child: Center(
                                  child: Text(
                                    skipped.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                              Text("Skipped"),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
                  color: Colors.white70,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Total Marks",
                      ),
                      Text(
                        (correct*2).toString(),
                        style:
                            TextStyle(fontSize: 18, color: Colors.lightGreen),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Accuracy"),
                      Text(
                        "${accuracy.toString()}%",
                        style:
                            TextStyle(fontSize: 18, color: Colors.lightGreen),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Time Spent"),
                      Text(
                        "${timeSpent.toString()} sec",
                        style:
                            TextStyle(fontSize: 18, color: Colors.lightGreen),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                 padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.lightBlue),
                  padding: const EdgeInsets.only(top:10, bottom: 10, right: 30, left: 30),
                  child: const Text('View Detail Analysiss',
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: 240,
                  color: Colors.white,
                
                 padding: const EdgeInsets.only(top:5, bottom: 5, right: 5, left: 5),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    
                    Image.asset("lib/assets/share.png", height: 30, width: 30,),
                      SizedBox(width: 15,),
                    Text('Share with your friend',
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue)),
                  ],) 
                ),
              ),
              
            ]),
          ),
          SizedBox(height: 20,),
        ]));
  }
}
