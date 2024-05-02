import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/my_them.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        SizedBox(height: 70),
        Text(AppLocalizations.of(context)!.radio,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.primaryLightColor)
                : Theme.of(context).textTheme.titleMedium),
        SizedBox(
          height: 60,
        ),
        Center(child: Image.asset("assets/images/radio.png")),
        SizedBox(
          height: 50,
        ),
        Text(AppLocalizations.of(context)!.aza3a,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.primaryLightColor)
                : Theme.of(context).textTheme.titleMedium),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {},
                child: Icon(
                  Icons.skip_previous,
                  color: MyTheme.primaryLightColor,
                  size: 50,
                )),
            InkWell(
                onTap: () {},
                child: Icon(
                  Icons.play_arrow,
                  color: MyTheme.primaryLightColor,
                  size: 50,
                )),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.skip_next,
                color: MyTheme.primaryLightColor,
                size: 50,
              ),
            ),
          ],
        )
      ],
    );
  }
}
