import 'package:flutter/material.dart';
import 'package:islami2/my_them.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String name;
  int index;

  ItemSuraDetails({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Text(
      "$name{${index + 1}}",
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: provider.isDarkMode()
          ? Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: MyTheme.yellowDarkColor)
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
