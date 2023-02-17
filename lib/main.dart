import "package:flutter/material.dart";
import "./app_resources/first_screen.dart";
void main(){
  // Inflates the widget and show it on app screen
  runApp(MyFlutterApp());
}
// or
/***
  void main() => runApp(MyFlutterApp());
 */
class MyFlutterApp extends StatelessWidget{
  // the flutter frameworks call this function when the widget MaterialApp is used in our screen
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "My First app",
        home: Scaffold(
          appBar: AppBar(title: Text("Cool Da Bro!"),),
          body: FirstScreen()
        )
    );
    throw UnimplementedError();
  }
  
}