import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LongButton extends StatelessWidget {
  final String hinttext;
  final String iconArrow;
  final Widget dest;
  final double width;

  LongButton(
      {required this.hinttext,
      required this.iconArrow,
      required this.dest,
      this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
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
            if (iconArrow == "None")
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
  //final TextEditingController controller;

  LongYellow({
    required this.semester,
    this.boxcolor = const Color(0xFFEDD113),
    required this.sks,
    required this.dest,
    //required this.controller,
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
  final double width;
  final double height;

  YellowInfo(
      {required this.poster,
      required this.namalomba,
      required this.penyelenggaralomba,
      required this.skalalomba,
      required this.tanggal,
      required this.harga,
      this.height = 550,
      this.width = 350});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      color: Colors.yellow,
                      height: height,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: Container(
          color: Colors.yellow,
          height: height - 420,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height - 450,
                  width: width - 275,
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
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String symbol;
  final Widget dest;

  RoundedButton({
    required this.symbol,
    required this.dest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (symbol == "Plus") Icon(Icons.add),
            if (symbol == "Store") Icon(Icons.store),
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

class InfoBottomAdmin extends StatelessWidget {
  final String hinttext;
  final String iconArrow;
  final Widget back;
  final Widget plus;
  final Widget store;

  InfoBottomAdmin({
    required this.hinttext,
    required this.iconArrow,
    required this.back,
    required this.plus,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 100,
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LongButton(
            dest: back,
            hinttext: hinttext,
            iconArrow: iconArrow,
          ),
          SizedBox(
            width: 70,
          ),
          RoundedButton(
            symbol: "Plus",
            dest: plus,
          ),
          RoundedButton(
            symbol: "Store",
            dest: store,
          ),
        ],
      ),
    );
  }
}
