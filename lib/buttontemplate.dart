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
    return Container(
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
    );
  }
}
