import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Myinsertpage extends StatefulWidget {
  const Myinsertpage({Key? key}) : super(key: key);

  @override
  State<Myinsertpage> createState() => _MyinsertpageState();
}

class _MyinsertpageState extends State<Myinsertpage> {
  Future<void> insertdata() async{
    try{
      String uri="http://localhost/phpservice/insertmydata.php";
      var req = await http.post(Uri.parse(uri), body: {'empcode': 2, 'name': 'riju','age':24});
      var response=jsonDecode(req.body);
      if(response['status']==true)
        {
          print("success");
        }
      else
        {
          print("fail");
        }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [TextField(decoration: InputDecoration(label: Text("Empcode")))],),
      Row(children: [TextField(decoration: InputDecoration(label: Text("Name")))]),
        Row(children: [TextField(decoration: InputDecoration(label: Text("Age")))]),
      Row(children: [ElevatedButton(onPressed: () {
insertdata();
      }, child: Text("save"))],)
    );
  }
}
