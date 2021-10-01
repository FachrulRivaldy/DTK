import 'package:flutter/material.dart';

class Formnya extends StatelessWidget {
  final String hinttext;
  final bool isobscure;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontweight;

  const Formnya({
    required this.controller,
    this.hinttext = '',
    this.isobscure = false,
    this.fontsize = 14,
    this.textcolor = Colors.black,
    this.fontweight = FontWeight.normal,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: TextStyle(
            color: textcolor, fontSize: fontsize, fontWeight: fontweight),
        controller: controller,
        obscureText: isobscure,
        maxLines: 1,
        decoration: InputDecoration(hintText: hinttext),
      ),
    );
  }
}
