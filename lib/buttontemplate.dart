import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      alignment: Alignment.center,
      width: 100,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
  final int sks;
  final Color boxcolor;
  final Widget dest;
  //final Widget destadmin;

  LongYellow({
    required this.semester,
    this.boxcolor = const Color(0xFFEDD113),
    required this.sks,
    required this.dest,
    //required this.destadmin
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: Container(
        height: 50,
        width: 325,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: boxcolor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    semester,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Text(
                    sks.toString() + " SKS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => dest));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              )
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

class YellowInfo extends StatelessWidget {
  final String poster;
  final String namalomba;
  final String penyelenggaralomba;
  final String tanggal;
  final String skalalomba;
  final int harga;
  final harganya = new NumberFormat.simpleCurrency(locale: 'id_ID');

  YellowInfo(
      {required this.poster,
      required this.namalomba,
      required this.penyelenggaralomba,
      required this.skalalomba,
      required this.tanggal,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Container(
        color: Colors.yellow,
        height: 130,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 75,
                color: Colors.blue,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama : " + namalomba),
                  Text("Penyelenggara : " + penyelenggaralomba),
                  Text("Skala : " + skalalomba),
                  Text("Tanggal : " + tanggal),
                  Text("Harga : " + harganya.format(harga))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBottom extends StatelessWidget {
  final String hinttext;
  final String iconArrow;
  final Widget dest;

  InfoBottom({
    required this.hinttext,
    required this.iconArrow,
    required this.dest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: LongButton(
        dest: dest,
        hinttext: hinttext,
        iconArrow: iconArrow,
      ),
    );
  }
}
