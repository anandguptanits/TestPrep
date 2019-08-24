import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testprep1/Services/questions.dart';
import 'package:testprep1/ui_elements/drawer/home_drawer.dart';
import 'package:testprep1/ui_elements/textinstruc.dart';


class FreeSamplePaper extends StatefulWidget {
  // final String user_id;
  //FreeSamplePaper(this.user_id);

  @override
  _FreeSampleState createState() => _FreeSampleState();
}

class _FreeSampleState extends State<FreeSamplePaper> {
  bool _isLoading = false;
  String _classValue = "1";
  String _subjectValue = "GK";

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text(
          "Free Sample Papers",
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
            height: 600,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'lib/assets/pen scale.png',
                      width: 50,
                      height: 50,
                    ),
                    Text("Free Sample Papers",
                        style: TextStyle(color: Colors.black, fontSize: 16))
                  ],
                ),
                SizedBox(height: 4.0),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "CONGRATULATIONS!",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                      ),
                      Text(
                        "Enjoy the uninterrupted acess to our",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text("Specially designed Sample Papers",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text(
                        "This paper will be helpful for your school",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text(
                        " exams, olympiad & and other national ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text(
                        "levels entrance exams.",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                      ),
                      Text(
                        "Sample Text For",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Center(
                          child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            height: 40,
                            width: 230,
                            padding: EdgeInsets.all(5),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _classValue,
                              iconSize: 30,
                              elevation: 5,
                              hint: Text(
                                "Select your class",
                                style: TextStyle(fontSize: 18),
                              ),
                              items: <String>[
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                                '8',
                                '9',
                                '10',
                                '11',
                                '12'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _classValue = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            width: 230,
                            padding: EdgeInsets.all(5),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _subjectValue,
                              iconSize: 30,
                              elevation: 5,
                              hint: Text(
                                "Select your Subject",
                                style: TextStyle(fontSize: 18),
                              ),
                              items: <String>[
                                'GK',
                                'APTITUDE',
                                'ENGLISH',
                                'SCIENCE',
                                'MATH'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _subjectValue = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _isLoading
                              ? Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 28,
                                  width: 28,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ))
                              : Container(
                                  height: 40,
                                  child: RaisedButton(
                                    elevation: 0,
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      final questions =
                                          await ApiService.getQuestion(
                                              _classValue, _subjectValue);

                                      setState(() {
                                        _isLoading = false;
                                      });
                                      if (questions == null) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    "Check your internet connection"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                        return;
                                      } else {
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => TextInstruct(
                                                      questions,
                                                      _classValue,
                                                      _subjectValue)));
                                        }
                                      }
                                    },
                                    color: Colors.red,
                                    child: Text(
                                      "Go",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                )
                        ],
                      )),
                    ],
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
