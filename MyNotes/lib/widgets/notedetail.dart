import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetail extends StatefulWidget {
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xffEA7773),
      ),
      body: Container(
        color: Color(0xffffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text("Make todo app",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
              child: Text(
                  "Make todo app kjdis lkokm lkopola p[ao-kod [;lpko0j polkdna78 okdoskao kjasd0o9m kamodkj dakj admjia daoi jd ji",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 15,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffEA7773),
        child: Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
