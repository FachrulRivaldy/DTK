import 'package:flutter/material.dart';

class InfoLombaTop extends StatelessWidget {
  const InfoLombaTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(160),
            child: Image.asset('assets/images/logotekkom.png', scale: 8),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "MUHAMAMD FACHRUL RIVALDY",
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    "MAHASISWA",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Text(
                "07211940000032",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                "SEMESTER 5",
                style: TextStyle(fontSize: 11),
              )
            ],
          )
        ]));
  }
}

class InfoLomba extends StatelessWidget {
  const InfoLomba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: InfoLombaTop()),
    );
  }
}

class InfoLombaBot extends StatelessWidget {
  const InfoLombaBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
