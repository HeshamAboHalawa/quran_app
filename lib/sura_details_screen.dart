import 'package:assignment3/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String RouteName = "SuraDetailds";
   SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if(verses.isEmpty){
      loadSuraFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage("assets/images/default_bg.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            model.name,
            style: GoogleFonts.elMessiri(
                fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
          return Text(verses[index], style: GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.bold),);
      },
      itemCount: verses.length,
      ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index+1}.txt");
    List<String> suraLines = sura.split("\n");
    verses= suraLines;
    print(suraLines);
    setState(() {

    });
  }
}
