import 'dart:math';

import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.blueGrey ,
      child: Center(
          child:Text(
            // "Your Lucky Number is ${generateLuckyNumber()}",// data parameter
            //or
            generateLuckyNumber(),
            textDirection: TextDirection.ltr, // ltr means left to right as english is represented in ltr
            style: TextStyle(
              color:Colors.white,
              fontSize: 35.0,
            ),
          )
      ),
    );
    throw UnimplementedError();
  }
  String generateLuckyNumber(){
    var random = Random();
    int lucky = random.nextInt(10);
    return "Your Lucky Number is $lucky";
  }
}