import 'dart:core';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int questionNumber = 0;
  List<String> questions =["Beasr-Pani cures Covid", "Buddha was born in Nepal", "Mount everest is the tallest mountain in the world", "Nepal is the second richest in water resources",];
  List<bool> answer = [false,true,true,false];
  List<Widget> getTrackedWidget=[];
  int score = 0;



  void nextQuestion(BuildContext context){
    if(questionNumber==questions.length-1){
      alert(context, title: Text('Quiz Finished your score:$score'));
      questionNumber = 0;
      setState(() {
        questionNumber =0;
        getTrackedWidget = [];
        score =0;
      });

    }
    else {
      setState(() {
        questionNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image1.jpg'), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Container(
                        child: Text(
                          questions[questionNumber],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      onPressed: () {

                        if(answer[questionNumber]==true){
                          score++;
                          setState(() {
                            getTrackedWidget.add(Icon(Icons.check, color: Colors.green, size: 44,),);
                          });
                        }
                        else{
                          setState(() {
                            getTrackedWidget.add(Icon(Icons.close, color: Colors.red, size: 44,),);
                          });
                        }

                        nextQuestion(context);
                        }, color: Colors.green, child: Text('True')),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      onPressed: () {
                        if(answer[questionNumber]==false){
                          score++;
                          setState(() {
                            getTrackedWidget.add(Icon(Icons.check, color: Colors.green, size: 44,),);
                          });
                        }
                        else{
                          setState(() {
                            getTrackedWidget.add(Icon(Icons.close, color: Colors.red, size: 44,),);
                          });
                        }
                        nextQuestion(context);}, color: Colors.red, child: Text('False')),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: getTrackedWidget,),
              ],
            )),
      ),
    );
  }
}
