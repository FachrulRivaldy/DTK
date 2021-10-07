import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
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
                    YellowButton(hinttext: "BANK\nSOAL", dest: MainMenu())
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
          child: Column(children: [
            Padding(padding: EdgeInsets.all(8.0)),
            Text(
              "POKOK BAHASAN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 4,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.lightBlue,
                  child: Text(
                    "ARSITEKTUR DAN ORGANISASI SISTEM KOMPUTER",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                );
              },
            ))

            /*Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(15),
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                shrinkWrap: true,
                childAspectRatio: 4,
                children: [
                  Container(
                    color: Colors.red,
                    child: Text(
                      "ARSITEKTUR DAN ORGANISASI SISTEM KOMPUTER",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                ],
              ),
            )*/
          ]),
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
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                "PUSTAKA",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
