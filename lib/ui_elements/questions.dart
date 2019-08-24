import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testprep1/Services/questions.dart';
import 'package:testprep1/ui_elements/resultsummary.dart';


Timer _timer;
var respArray = [];

class Questionspage extends StatefulWidget {
  final String _classValue;
  final String _subjectValue;
  final selectedRespArray = [],
      //bookmarkArray = [],
      timeArray = [],
      respArray = [];
  int _questionindex;
  List<dynamic> questions;
  Questionspage(this.questions, this._classValue, this._subjectValue);
 List<dynamic> optionSplit = [];

  _QuestionsState createState() => _QuestionsState();
}

@override
class _QuestionsState extends State<Questionspage> {
  int _start = 120;
  int timeleft = 0;

  int get timeSpent {
    return (120 - timeleft);
  }

  void initState() {
    super.initState();
    widget._questionindex = 0;
    for (var i = 0; i < widget.questions.length; i++) {
      widget.selectedRespArray.add(0);
    }
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var input = widget.questions[widget._questionindex]['fields']['options'];
    widget.optionSplit = input.toString().split("|");
    // TODO: implement build
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
        ],
      ),
      body: ListView(
        children: <Widget>[

          //upper part ui
          Container(
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [Colors.red, Colors.deepOrange.shade300])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("IMQ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("INTRNATIONAL",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("MATH QUALIFIER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Sample text, class-8",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text("03/10",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Icon(Icons.watch, color: Colors.white),
                          Text(timeleft.toString(),
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          
          ////////////////////////question and options//////////
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                    " ${widget.questions[widget._questionindex]['fields']['question_text']}",
                    style: TextStyle(fontSize: 15)),
                Image.network(
                  widget.questions[widget._questionindex]['fields']
                      ['question_image_url'],
                  width: 150,
                  height: 150,
                ),

          // option card
              optionCard(1,"a"),
              optionCard(2,"b"),
              optionCard(3,"c"),
              optionCard(4,"d"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _previousButton(),
                    SizedBox(
                      width: 40,
                    ),
                     _nextiousButton(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  //option card
  Widget optionCard(int selectedoption, String option)
  {
      return  Card(
                  elevation: widget.selectedRespArray
                              .elementAt(widget._questionindex) ==
                          selectedoption
                      ? 2
                      : 0,
                  shape: RoundedRectangleBorder(
                      side: new BorderSide(
                          color: widget.selectedRespArray
                                      .elementAt(widget._questionindex) ==
                                 selectedoption
                              ? Colors.red
                              : Colors.white,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      //isThreeLine: true,
                      leading: Text(
                        "$option.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      title: Text(widget.optionSplit[2]),
                      onTap: () {
                        if (widget.selectedRespArray
                                .elementAt(widget._questionindex) !=
                            selectedoption) {
                          setState(() {
                            widget.selectedRespArray
                                .insert(widget._questionindex, selectedoption);
                          });
                        }
                      },
                    ),
                  ),
                );
  }

  //next button 
   Widget _nextiousButton() {
    return RaisedButton(
                      onPressed: () {
                        if (widget._questionindex <
                            widget.questions.length - 1) {
                          setState(() {
                            widget._questionindex++;
                            print(widget.questions.length);
                            print(widget._questionindex);
                          });
                        } else {
                          checkAnswer();
                          quit();
                        }
                      },
                      color: Colors.green,
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
  }

//previous butoon, vissible after one next press.
  Widget _previousButton() {
    return widget._questionindex > 0
        ? RaisedButton(
            onPressed: () {
              if (widget._questionindex < widget.questions.length - 1) {
                setState(() {
                  widget._questionindex--;
                  print(widget.questions.length);
                  print(widget._questionindex);
                });
              }
            },
            color: Colors.redAccent,
            child: Text(
              "Previous",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        : Container();
  }

// Starting the timer .
  void startTimer() {
    {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
              () {
                if (_start < 1) {
                  timer.cancel();
                } else {
                  timeleft = _start - 1;
                  _start--;
                  print(timeSpent.toString());
                }
              },
            ),
      );
    }
  }

// After taking all the responses from the user, checking each option whether it is correct, incorrect or skipped.
// And stroring the response in resArray.
  void checkAnswer() {
    for (var i = 0; i < widget.questions.length; i++) {
      if (widget.selectedRespArray[i] ==
          widget.questions[i]['fields']['correct_answer']) {
        print("correct");
        widget.respArray.insert(i, 1);
      } else if (widget.selectedRespArray[i] == 0) {
        print("no response");
        widget.respArray.insert(i, 0);
      } else {
        print("incorrect");
        widget.respArray.insert(i, -1);
      }
    }
  }

 // After all questions of the test finishes , this method is called 
  void quit() {
    print(widget.respArray);
    int correct = 0, incorrect = 0, notattempted = 0, skipped = 0;
    for (var i = 0; i < widget.respArray.length; i++) {
      if (widget.respArray[i] == 99)
        skipped++;
      else if (widget.respArray[i] == -1)
        incorrect++;
      else if (widget.respArray[i] == 0)
        notattempted++;
      else if (widget.respArray[i] == 1) {
        correct++;
      }
    }

//moving to the result page
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => ResultSummary(
            correct, incorrect, notattempted, skipped, timeSpent)));

// saving responses to the server 
    ApiService.saveResponse(widget._classValue, widget._subjectValue,
        widget.questions, widget.selectedRespArray, widget.respArray);
  }
}
