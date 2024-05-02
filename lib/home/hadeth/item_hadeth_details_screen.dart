import 'package:flutter/material.dart';
import 'package:islami2/my_them.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class HadethItem extends StatelessWidget {
  String title;
  int index;

  HadethItem({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(SuraDetails.routeName,
        //     arguments: SuraDetailsArgs(name: title, index: index)
        // );
      },
      child: Text(title,
          textAlign: TextAlign.center,
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MyTheme.yellowDarkColor)
              : Theme.of(context).textTheme.titleSmall),
    );
  }
}
