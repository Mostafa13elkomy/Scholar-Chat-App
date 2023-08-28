import 'package:flutter/material.dart';

class CustomFormTextFeild extends StatelessWidget {
  CustomFormTextFeild({this.hintText, this.onChanged,this.obscureText =false});
  String? hintText;
  bool? obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'feild is required';
          }
        },
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(22),
            )),
      ),
    );
  }
}
