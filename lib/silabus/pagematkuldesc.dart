import 'package:dtk_database_tekkom/silabus/pagebanksoal.dart';
import 'package:dtk_database_tekkom/silabus/pagematkulsemester.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class DescMatkul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "DASAR PEMROGRAMAN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              PokokBahasan(),
              Pustaka(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LongButton(
                        hinttext: "Back",
                        iconArrow: "Left",
                        dest: PageMatkulSem()),
                    YellowButton(hinttext: "BANK\nSOAL", dest: BankSoal())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PokokBahasan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Container(
          color: Colors.yellow,
          height: 275,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "POKOK BAHASAN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 4,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.lightBlue,
                    ),
                    child: Text(
                      "BAHASA PEMROGRAMAN",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  );
                },
              ))
            ]),
          ),
        ));
  }
}

class Pustaka extends StatelessWidget {
  const Pustaka({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          color: Colors.yellow,
          height: 175,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PUSTAKA",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: 250,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.lightBlue,
                            ),
                            child: Text("JUDUL BUKU DAN PENGARANG"),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

List pokok = [
  'Sistem Bilangan',
  'Operator',
  'Algoritma Komputer',
  'Pengulangan',
  'Flowchart',
  'Bahasa C',
  'Array',
  'Fungsi',
  'Tipe Data',
];

List pustaka = [
  'Discovering Computers Fundamentals 8th Edition',
  'Introduction to Algorithms 3th Edition',
  'The C Programming Language',
];
