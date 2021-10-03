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
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)))),
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
    );
  }
}

class YellowButton extends StatelessWidget {
  final String hinttext;
  final Color boxcolor;
  final Widget dest;
  final double sizefont;

  YellowButton(
      {required this.hinttext,
      this.boxcolor = const Color(0xFFEDD113),
      this.sizefont = 18,
      required this.dest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        width: 110,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: boxcolor,
          ),
          child: Text(
            hinttext,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: sizefont),
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

class LongYellow extends StatelessWidget {
  final String semester;
  final Color boxcolor;
  final Widget dest;

  LongYellow(
      {required this.semester,
      this.boxcolor = const Color(0xFFEDD113),
      required this.dest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 325,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: boxcolor,
          ),
          child: Text(
            semester,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
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
