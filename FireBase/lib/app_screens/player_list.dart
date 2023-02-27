import 'package:flutter/material.dart';

class player_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return players();
  }
}
class players extends State<player_list>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skadoodle!"),
      ),
      body: getLongListView(),
    );
  }
  Widget getLongListView(){
    ListPlayers t1 = ListPlayers();
    t1.add('Anish', 355, 1);
    t1.add('Rahul',245,2);
    var listview = ListView.builder(
        itemBuilder: (context,index){
          return ListTile(
            leading: Icon(Icons.face),
            title: Text("Person"),
            subtitle: Text("call"),
            trailing: Icon(Icons.phone),
          );
        }
    );
    return listview;
  }
}
class Node{
  String name='';
  dynamic points=0;
  int rank=0;
  Node? next;
  Node? prev;
  Node(this.name,this.points,this.rank){
    this.next=null;
    this.prev=null;
  }
}
class ListPlayers{
  Node? _head;
  Node? _tail;
  ListPlayers(){
    _head=null;
    _tail=null;
  }
  bool get isEmpty => _head==null;
  void add(String name,dynamic points,int rank){
    Node? t= Node(name,points,rank);
    if(isEmpty){
      _head = _tail = t;
      _head!.next = _head!.prev;
    }
    _tail!.next = t;
    t.prev = _tail;
    t.next = _head;
    _tail = _tail!.next;
  }
}