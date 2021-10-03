import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String hinttext;
  final String iconArrow;
  final Widget dest;

  LongButton({
    required this.hinttext,
    required this.iconArrow,
    required this.dest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30),
      child: Container(
        height: 55,
        width: 105,
        color: Colors.lightBlue,
        child: ElevatedButton(
          child: Row(
            children: [
              if (iconArrow == "Left") Icon(Icons.arrow_left),
              Text(hinttext),
              if (iconArrow == "Right") Icon(Icons.arrow_right),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => dest));
          },
        ),
      ),
    );
  }
}

class YellowButton extends StatelessWidget {
  final String hinttext;
  final Color textcolor;
  final Widget dest;

  YellowButton(
      {required this.hinttext,
      this.textcolor = Colors.yellow,
      required this.dest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        color: textcolor,
        child: ElevatedButton(
          child: Text(
            hinttext,
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => dest));
          },
        ),
      ),
    );
  }
}
