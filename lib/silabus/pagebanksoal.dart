import 'package:dtk_database_tekkom/silabus/pagematkulsemester.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class BankSoal extends StatelessWidget {
  const BankSoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              SizedBox(
                height: 15,
              ),
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
                      "BANK SOAL DASAR PEMROGRAMAN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      color: Colors.yellow,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(8.0)),
                        Expanded(
                            child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
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
                      ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LongButton(
                          hinttext: "Back",
                          iconArrow: "Left",
                          dest: PageMatkulSem()),
                      SizedBox(
                        width: 100,
                      ),
                      RoundedButton(symbol: "Plus", dest: BankSoal())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
