import 'package:flutter/material.dart';
import 'package:islami2/home/quran/sura_details.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class QuranItem extends StatelessWidget {
  String name;
  int index;

  QuranItem({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetails.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: provider.isDarkMode()
            ? Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white)
            : Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
