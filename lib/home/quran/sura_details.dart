import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami2/home/quran/item_sura_details_screen.dart';
import 'package:islami2/my_them.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) loadFiles(args.index);
    return Stack(children: [
      Image.asset("assets/images/bg.png",
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.name}",
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.primaryLightColor)
                : Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: MyTheme.primaryLightColor,
              ))
            : Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.06,
                    vertical: MediaQuery.of(context).size.width * 0.05),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? MyTheme.primaryDarkColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(35)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      name: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    ]);
  }

  void loadFiles(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
