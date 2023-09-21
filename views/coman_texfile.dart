import 'package:flutter/material.dart';

class CommonTex extends StatelessWidget {
  final prefixicon;
  final controller;
  final VoidCallback ontap;
  final String? Function(String?)? validator;
  const CommonTex(
      {Key? key,
      this.prefixicon,
      this.controller,
      required this.ontap,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: ontap,
      decoration: InputDecoration(
          hintText: "Enter Email",
          filled: true,
          fillColor: Colors.white24,
          focusColor: Colors.black,
          prefixIcon: prefixicon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
