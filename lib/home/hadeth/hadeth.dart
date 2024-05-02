import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/home/hadeth/item_hadeth_details_screen.dart';
import 'package:provider/provider.dart';

import '../../my_them.dart';
import '../../provider/app_provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> HadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    if (HadethList.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Center(child: Image.asset("assets/images/hadeth.png")),
        Divider(
          color: MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white)
              : Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: MyTheme.primaryLightColor,
          thickness: 3,
        ),
        if (HadethList.isEmpty)
          Center(
              child: CircularProgressIndicator(
            color: MyTheme.primaryLightColor,
          ))
        else
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyTheme.primaryLightColor,
                    thickness: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return HadethItem(
                    title: HadethList[index].title,
                    index: index,
                  );
                },
                itemCount: HadethList.length),
          )
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = hadethContent.split("\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      HadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
