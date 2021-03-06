import 'package:dtk_database_tekkom/mainpage/loginpage.dart';
import 'package:dtk_database_tekkom/infowebinar/pageinfowebinar.dart';
import 'package:dtk_database_tekkom/infoworkshop/pageinfoworkshop.dart';
import 'package:dtk_database_tekkom/prestasianaktk/pageprestasi.dart';
import 'package:dtk_database_tekkom/silabus/pagesemester.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TopMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: 155,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45))),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(160),
              child: Image.asset('assets/images/logotekkom.png', scale: 4),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MUHAMMAD FACHRUL RIVALDY",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "07211940000032",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "SEMESTER 5",
                  style: TextStyle(fontSize: 14),
                )
              ],
            )
          ])),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopMainMenu(),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (YellowButton(
                      dest: PageSemester(),
                      hinttext: "SILABUS\n& BANK SOAL",
                    )),
                    SizedBox(
                      width: 50,
                    ),
                    YellowButton(hinttext: "INFO LOMBA", dest: InfoLomba())
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (YellowButton(
                      dest: InfoWebinar(),
                      hinttext: "INFO\nWEBINAR",
                      sizefont: 17,
                    )),
                    SizedBox(
                      width: 50,
                    ),
                    YellowButton(
                      hinttext: "INFO\nWORKSHOP",
                      dest: InfoWorkshop(),
                      sizefont: 14,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (YellowButton(
                      dest: PrestasiATK(),
                      hinttext: "PRESTASI ANAK TK",
                      sizefont: 16,
                    )),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 105,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_left),
                          Text("Logout"),
                        ],
                      ),
                      onPressed: () async {
                        await signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (error) {}

    print("Signed Out");
  }
}
