import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.inputType, this.onChanged , this.obscureText =false});
  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText!,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
