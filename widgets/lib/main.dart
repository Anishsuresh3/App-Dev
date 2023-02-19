import "package:flutter/material.dart";
import './app_screens/list_view.dart';
import './app_screens/home.dart';
import './app_screens/long_list_view.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UI Widgets",
      // home: Home(),
      home: Scaffold(
        appBar: AppBar(title: Text("List View"),),
        body: long_list(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint("U clicked it!");
          },
          child: Icon(Icons.add),
          tooltip: "Add one more item",
        ),
      ),
    )
  );
}
