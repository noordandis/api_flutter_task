import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/curd.dart';

import '../../component/customtextField.dart';
import '../../constant/linkapi.dart';

class Signup extends StatefulWidget {
  Signup({Key? Key}) : super(key: Key);
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Crud _crud=Crud();
  signUp()async{
    var response=await _crud.postRequest(signuplink, {
      "username":username.text,
      "email":email.text,
      "password":password.text
    });
    if (response['status'] == 'success') {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route)=>false);
    }else{
      print("signup fail");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                CustomTextFormAuth(
                  hinttext: 'username',
                  labeltext: '',
                  mycontroller: username,
                ),
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
                  onPressed: () async{await signUp();},
                  child: Text("signup"),
                ),
                InkWell(child: Text("login"),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("login");
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
