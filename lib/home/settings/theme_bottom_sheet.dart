import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/my_them.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottom extends StatefulWidget {
  @override
  State<ThemeBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<ThemeBottom> {
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.darkmood)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.darkmood)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDarkMode()
                  ? getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.lightmood)
                  : getSelectedItemWidget(
                      AppLocalizations.of(context)!.lightmood)),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.primaryLightColor)),
        Icon(
          Icons.check,
          color: MyTheme.primaryLightColor,
          size: 35,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
