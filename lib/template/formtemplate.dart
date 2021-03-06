import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Formnya extends StatelessWidget {
  final String hinttext;
  final bool isobscure;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontweight;
  final double height;

  Formnya({
    required this.controller,
    this.hinttext = '',
    this.isobscure = false,
    this.fontsize = 14,
    this.textcolor = Colors.black,
    this.fontweight = FontWeight.normal,
    this.height = 50,
  });

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textcolor,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
      controller: controller,
      obscureText: isobscure,
      maxLines: 1,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: hinttext,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50))),
    ); //,
    //);
  }
}

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 75,
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: Colors.black,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      ),
    );
  }
}
