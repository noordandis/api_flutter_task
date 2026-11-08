import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
 final void Function()? onPressed;
  const CustomButtonLang({Key? Key, required this.textbutton, this.onPressed}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(onPressed:onPressed,
         padding: EdgeInsets.symmetric(horizontal: 80),
        textColor: Colors.white,
        color: AppColor.primarycolor,
        child: Text(textbutton,style: TextStyle(fontWeight: FontWeight.bold),),
      ),);
  }}