import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytask/models/notes.dart';
import 'package:mytask/widgets/addnotes.dart';
import 'package:mytask/utils/db_helper.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper = DbHelper();
  Note note;
  void update() {

  }
  
  @override
  void initState() {
    super.initState();
  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: 140,
                width: 450,
                decoration: BoxDecoration(
                    color: Color(0xffEA7773),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My notes. ',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                                letterSpacing: 3.0,
                                color: Colors.white),
                          ),
                          Text(
                            'Sunday 27, 8:15 PM',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                                letterSpacing: 1.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text("dsa",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 45,
                          color: Colors.white60,
                          letterSpacing: 1.0,
                        ))
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new note.",
        onPressed: () {
          navigateToNoteDetail(Note('','',2,''), "Add note");
        },
        backgroundColor: Color(0xffEA7773),
        child: Icon(Icons.note_add),
      ),
    );
  }

  void navigateToNoteDetail(Note note, String title)  async {
   bool result = await  Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddNote(note, title);
    }));
    if (result){
      update();
    }
  }
}
