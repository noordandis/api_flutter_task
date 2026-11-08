import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/customtextField.dart';

class Home extends StatefulWidget {
  Home({Key? Key}) : super(key: Key);
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("home"),),
       floatingActionButton:  FloatingActionButton(onPressed: (){},
          child: Icon(Icons.add),
        ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(

          children: [

            InkWell(
              onTap: (){},
              child: Card(
              child: Row(
                children: [
               Expanded(flex: 2,
                   child: ListTile(title: Text("title note"),
                 subtitle: Text("content"),
               ))
                ],
              ),
                        ),
            )],
        ),
      )
    );
  }
}
