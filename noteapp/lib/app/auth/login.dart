import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/customtextField.dart';

class Login extends StatefulWidget {
  Login({Key? Key}) : super(key: Key);
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                CustomTextFormAuth(
                  hinttext: 'email',
                  labeltext: '',
                  mycontroller: email,
                ),
                CustomTextFormAuth(
                  hinttext: 'password',
                  labeltext: '',
                  mycontroller: password,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  onPressed: () {
                    Navigator.of(context).pushNamed("home");
                  },
                  child: Text("Login"),
                ),
                InkWell(child: Text("signup"),
                  onTap: () {
                    Navigator.of(context).pushNamed("signup");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
