import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './canvas_widget.dart';

class GamePlay extends StatefulWidget {
  // final CollectionReference room;
  // final CollectionReference points;
  // String roomId;
  // GamePlay({required this.room,required this.roomId,required this.points});
  @override
  // State<GamePlay> createState() => _GamePlayState(room: room,roomId: roomId,points: points);
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  // final CollectionReference room;
  // final CollectionReference points;
  // String roomId;
  // _GamePlayState({required this.room,required this.roomId,required this.points});
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 80);
  int rounds = 3;
  int duration=80;
  int word_count=2;
  int hints=2;
  String word_choose='';
  final _formkey = GlobalKey<FormState>();

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  String setValue(){
    if(word_choose==''){
      return 'WAITING';
    }
    else{
      return word_choose;
    }
  }
  Future showDialogBox(){
    // showDialog(
    // context: context,
    // builder: (BuildContext context) {
    //   return AlertDialog(
    //   contentPadding: EdgeInsets.zero,
    //   content: SizedBox(
    //         height: 350,
    //         width: MediaQuery.of(context).size.width,
    //         child: Column(
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Center(
    //                   child: Text('Dialog Content'),
    //                 ),
    //               ),
    //             ),
    //             Container(
    //                 height: 50,
    //                 color: Colors.blue,
    //                 child: TextButton(
    //                   onPressed: () {
    //                       Navigator.of(context).pop();
    //                       },
    //                   child: Text('OK'),
    //
    //                 ),
    //           ),
    //           ],
    //           ),
    //           ),
    //           );
    //           },
    //           );
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return
          AlertDialog(
            backgroundColor: Colors.white12,
            content: SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      debugPrint("Got it");
                      word_choose = 'CAR';
                      Navigator.of(context).pop();
                    },
                    child: Text('CAR'),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint("Got it");
                      word_choose = 'BODY';
                      Navigator.of(context).pop();
                    },
                    child: Text('BODY'),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint("Got it");
                      word_choose = 'BLOOD';
                      Navigator.of(context).pop();
                    },
                    child: Text('BLOOD'),
                  ),
                ],
              ),
            ),
            title: Text('Choose A Word!'),
            // content: Text('This is the content of my dialog box.'),
            insetPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 470),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(80));
    // Future<void> getParameters() async {
    //   DocumentSnapshot snapshot =await room.doc('Parameters').get();
    //   rounds = snapshot.get('rounds');
    //   duration = snapshot.get('duration');
    //   word_count = snapshot.get('word_count');
    //   hints = snapshot.get('Hints');
    // }
    // getParameters();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white54,
      // ),
      body: Column(
        children: [
          //guess word and time
          PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.black,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 5,),
                  Text(
                    '$seconds',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                  ),
                  Text(
                      rounds.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                      setValue(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox(width: 20,),
                  TextButton.icon(
                    icon: Icon(Icons.settings),
                      onPressed: (){},
                      label: Text(''),
                  )
                  // SizedBox(width: 5,),
                  // ElevatedButton(
                  //   onPressed: startTimer,
                  //   child: Text(
                  //     'Start',
                  //     style: TextStyle(
                  //       fontSize: 30,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              // width: 100,
            ),
          ),
          //Drawing area
          SizedBox(
            height: 350,
            child: Container(
              // child: Draw(roomParticipants: room,roomId: roomId,points: points,),
              child: ElevatedButton(
                onPressed: () {
                  showDialogBox();
                },
                child: Text('Show Dialog Box'),
              ),
            ),
          ),
          Expanded(
          child:Row(
            children: [
              Expanded(
                // contestants list
                child: Container(
                  color: Colors.deepPurple,
                  // width: 100,
                ),
              ),
              // guessed words
              Expanded(
                child: Container(
                  color: Colors.green,
                  // width: 100,
                ),
              ),
            ],
            )
          ),
          PreferredSize(
              child: Container(
                height: 30,
                child: TextField(
                ),
              ),
              preferredSize: Size.fromHeight(kBottomNavigationBarHeight)
          )
        ],
      )
    );
  }
}

